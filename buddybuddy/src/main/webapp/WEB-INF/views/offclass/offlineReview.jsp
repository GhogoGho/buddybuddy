<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<%-- <div id="reply-area ">
	<!-- 댓글 작성 부분 -->
	<div class="replyWrite">
		<table align="center">
			<tr>
				<td id="replyContentArea">
					<textArea rows="3" id="replyContent"></textArea>
				</td>
				<td id="replyBtnArea">
					<button class="btn btn-primary" id="addReply" onclick="addReply();">
						댓글<br>등록
					</button>
				</td>
			</tr>
		</table>
	</div>


	<!-- 댓글 출력 부분 -->
	<div class="replyList mt-5 pt-2">
		<ul id="replyListArea">
			<c:forEach items="${rList}" var="reply">
				<li class="reply-row">
					<div>
						<p class="rWriter">${reply.memberName}</p>
						<p class="rDate">작성일 : <fmt:formatDate value="${reply.createDate }" pattern="yyyy년 MM월 dd일 HH:mm"/></p>
					</div>
	
					<p class="rContent">${reply.replyContent }</p>
					
					
					<c:if test="${reply.memberNo == loginMember.memberNo}">
						<div class="replyBtnArea">
							<button class="btn btn-primary btn-sm ml-1" id="updateReply" onclick="showUpdateReply(${reply.replyNo}, this)">수정</button>
							<button class="btn btn-primary btn-sm ml-1" id="deleteReply" onclick="deleteReply(${reply.replyNo})">삭제</button>
						</div>
					</c:if>
				</li>
			</c:forEach>
		</ul>
	</div>

</div> --%>

				<div  class="row"  style="overflow:scroll;height:370px">
					<div id="reviewListArea" class="col-md-12 mb-3">
						<c:forEach items="${reviewList}" var="review">
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-12" style="padding: 0;">

										<img alt="Image"
											src="${contextPath}/${review.memberProfile}"
											width="25px" height="25px" class="rounded-circle"
											style="float: left; margin-left: 20px; margin-right: 20px;" />
										<h3 style="float: left; margin: 0;">${review.memberNickName}</h3>
										<span style="float: right;">
										<c:forEach begin="1" end="${review.reviewRatings}">
										★
										</c:forEach>
										</span>
									</div>
								</div>
								<div class="row"  style="text-align: right;">
								<div>
								<fmt:formatDate value="${review.reviewDate}" pattern="yyyy년 MM월 dd일 HH:mm" />
								</div>
								</div>
								<div class="row" style="border: 1px solid black;">${review.reviewContent}</div>
								<c:if test="${loginMember.memberNo == review.memberNo }">
								<button class="btn main-btn-color" style="float: right;" onclick="showUpdateReply(${review.reviewNo}, this)">수정</button>
								<button class="btn main-btn-color" style="float: right;" onclick="deleteReply(${review.reviewNo})">삭제</button>								
								</c:if>
							</div>
						</div>						
						</c:forEach>
					</div>
				</div>
				<c:if test="${!empty loginMember }">
				<div class ="row">
				별점 : 
				<style>
				#star a{ text-decoration: none; color: gray; padding:3px} #star a.on{ color: yellow; }
				</style>

				<span id="star" style="margin:0; display:inline;float:right"> <!-- 부모 -->
	 				<a  value="1">★</a> <!-- 자식들-->
					<a  value="2">★</a> 
					<a  value="3">★</a> 
					<a  value="4">★</a> 
					<a  value="5">★</a> 
				</span>
				<input type="hidden" id="reviewRatings" name="reviewRatings"/>
				<script>
					$('#star a').click(function(){ 
					$(this).parent().children("a").removeClass("on"); 
					$(this).addClass("on").prevAll("a").addClass("on");
					$("#reviewRatings").val($(this).attr("value"));
					console.log("별"+$("#reviewRatings").val());
					console.log($(this).attr("value")); });
				
				</script>
				</div>
				<div class= "row">
					<div class="col-md-11" style="padding-right: 0px;">
						<div class="form-floating">
							<textarea class="form-control" id="reviewContent"
								style="height: 100px; resize: none;"></textarea>
							<label for="reviewContent">댓글</label>
						</div>
					</div>
					<div class="col-md-1" style="padding-left: 0px;">
						<button class="btn btn-success main-btn-color"
							style="width: 100%; height: 100%; text-align: center; padding: 0px;" onclick="addReply()">
							작성
						</button>
					</div>
				</div>
				
				</c:if>











<script>

// 로그인한 회원의 회원 번호, 비로그인 시 "" (빈문자열)
const loginMemberNo = "${loginMember.memberNo}";

// 현재 게시글 번호
const classNo = ${offList.classNo};

// 수정 전 댓글 요소를 저장할 변수 (댓글 수정 시 사용)
let beforeReplyRow;

let reviewRatings = $("#reviewRatings").val();


//-----------------------------------------------------------------------------------------
// 댓글 등록
function addReply()	{
//작성된 댓글 내용 얻어오기
const replyContent = $('#reviewContent').val();
//로그인이 되어있지 않는 경우
if(loginMemberNo==""){
	swal("로그인 후 이용해주세요.");
}else{
	
	if(replyContent.trim()==""){ //작성된 댓글이 없을 경우
		swal("댓글 작성 후 클릭해 주세요.")		
	}
	else{
		//로그인O, 댓글 작성O
		
		$.ajax({
			url : "${contextPath}/offReview/insertReply",//필수 속성!1
			type : "POST",
			data : {"memberNo" : loginMemberNo,
					"classNo" : classNo,
					"reviewContent" : replyContent,
					"reviewRatings" : $("#reviewRatings").val()},
			success: function(result){
				if(result>0){
					swal({"icon" : "success" , "title" : "댓글 등록 성공"});
					$('#reviewContent').val("");//댓글 작성 내용 삭제
					selectReplyList();
				}
			},
			
			error: function(){
				console.log('댓글 삽입 실패');
			}
		});
		
	}
}
	
}	
	


//-----------------------------------------------------------------------------------------
//해당 게시글 댓글 목록 조회
function selectReplyList(){
 
	$.ajax({
		url: "${contextPath}/offReview/list",
		data : {"classNo":classNo},
		type : "POST",
		dataType : "JSON", // 응답 되는 데이터의 형식이 JSON임을 알려줌 - > 자바스크립트 객체로 변환됨
		success : function(rList){
			console.log(rList);
			
	          $("#reviewListArea").html(""); // 기존 정보 초기화
	        /*  //왜? 새로 읽어온 댓글 목록으로 다시 만들어서 출력하려고
	         $.each(rList, function(index, item){
	            //$.each():jQuery의 반복문
	            // rList : ajax 결과로 받은 댓글이 담겨있는 객체 배열
	            //index : 순차 접근 시 현재 인덱스
	            //item : 순차 적근시 현재 접근한 배열 요소(댓글 정보 하나)
	            var li = $("<li>").addClass("reply-row");
	         
	            // 작성자, 작성일, 수정일 영역 
	            var div = $("<div>");
	            var rWriter = $("<p>").addClass("rWriter").text(item.memberName);
	            var rDate = $("<p>").addClass("rDate").text("작성일 : " + item.createDate);
	            div.append(rWriter).append(rDate)
	            
	            
	            // 댓글 내용
	            var rContent = $("<p>").addClass("rContent").html(item.replyContent);
	            
	            
	            // 대댓글, 수정, 삭제 버튼 영역
	            var replyBtnArea = $("<div>").addClass("replyBtnArea");
	            
	            // 현재 댓글의 작성자와 로그인한 멤버의 아이디가 같을 때 버튼 추가
	            if(item.memberNo == loginMemberNo){
	               
	               // ** 추가되는 댓글에 onclick 이벤트를 부여하여 버튼 클릭 시 수정, 삭제를 수행할 수 있는 함수를 이벤트 핸들러로 추가함. 
	               var showUpdate = $("<button>").addClass("btn btn-primary btn-sm ml-1").text("수정").attr("onclick", "showUpdateReply("+item.replyNo+", this)");
	               var deleteReply = $("<button>").addClass("btn btn-primary btn-sm ml-1").text("삭제").attr("onclick", "deleteReply("+item.replyNo+")");
	               
	               replyBtnArea.append(showUpdate).append(deleteReply);
	            }
	            
	            
	            // 댓글 요소 하나로 합치기
	            li.append(div).append(rContent).append(replyBtnArea);
	            
	            
	            // 합쳐진 댓글을 화면에 배치
	            $("#replyListArea").append(li); 
	         }); */
	         
/* 	      	<c:forEach items="${reviewList}" var="review">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12" style="padding: 0;">

							<img alt="Image"
								src="${contextPath}/${review.memberProfile}"
								width="25px" height="25px" class="rounded-circle"
								style="float: left; margin-left: 20px; margin-right: 20px;" />
							<h3 style="float: left; margin: 0;">${review.memberNickName}</h3>
							<span style="float: right;">
							<c:forEach begin="1" end="${review.reviewRatings}">
							★
							</c:forEach>
							</span>
						</div>
					</div>
					<div class="row"  style="text-align: right;">
					<div>
					<fmt:formatDate value="${review.reviewDate}" pattern="yyyy년 MM월 dd일 HH:mm" />
					</div>
					</div>
					<div class="row" style="border: 1px solid black;">
						${review.reviewContent}
					</div>
					<c:if test="${loginMember.memberNo == review.memberNo }">
					<button class="btn main-btn-color" style="float: right;">수정</button>
					<button class="btn main-btn-color" style="float: right;" onclick="deleteReply(${review.reviewNo})">삭제</button>								
					</c:if>
				</div>
			</div>						
			</c:forEach> */
			$.each(rList, function(index, item){
				console.log(parseInt(item.reviewRatings,10));
				var Ratings = parseInt(item.reviewRatings,10);
				//제일큰 div
				var div1 = $("<div>").addClass("row");
				//2번째 담는 div
				var div2 = $("<div>").addClass("col-md-12");
				//아이디 프로필사진 별점을 담는 div의 div
				var div3 = $("<div>").addClass("row");				
				//아이디 프로필사진 별점을 담는 div
				var div4 = $("<div>").addClass("col-md-12").css("padding","0");
				//프로필 이미지
				var img = $('<img>', {
					src: "${contextPath}/"+item.memberProfile,
					width:"25px",
					height:"25px",
					class:"rounded-circle"
				}).css({
					float: "left",
					marginLeft:  '20px',
					marginRight: '20px'
				});
				//작성자 닉네임
				var Nick = $("<h3>").text(item.memberNickName).css({
					float: "left",
					margin: "0"
				});
				//별점
				var span = $("<span>").css({
					float: "right"
				});
				var star = "";
				for(var i=0; i<Ratings ;i++){
					star+="★"
				}
				span.text(star);
				//날짜 담는 div담는 div
				var div5 = $("<div>").addClass("row").css("text-align", "right");
				//날짜 담는 div에 날짜 담김
				var div6 = $("<div>").text(item.reviewDate);
				//리뷰 content 담은 div
				var div7 = $("<div>").addClass("row").text(item.reviewContent).css({
					border: "1px solid black"
				});
				//이미지 담는 div에 요소 담기
				div4.append(img).append(Nick).append(span);
				div3.append(div4);
				div5.append(div6);
				div2.append(div3).append(div5).append(div7);
				
				if(loginMemberNo==item.memberNo){
					var updateReview = $("<button>").addClass("btn main-btn-color").text("수정").attr("onclick", "showUpdateReply("+item.reviewNo+", this)").css({
						float: "right"
					});
					var deleteReview =$("<button>").addClass("btn main-btn-color").text("삭제").attr("onclick","deleteReply("+item.reviewNo+")").css({
						float: "right"
					});
					div2.append(updateReview).append(deleteReview);
				}
				div1.append(div2);
				$("#reviewListArea").append(div1);
				
			}); 
			
			
		},
		error : function(){
			console.log("댓글 목록 조회 실패");
		}
	});
}

// -----------------------------------------------------------------------------------------
// 일정 시간마다 댓글 목록 갱신
/* const replyInterval =setInterval(function(){
	selectReplyList();
},5000); */


// -----------------------------------------------------------------------------------------
// 댓글 수정 폼

function showUpdateReply(replyNo, el){
	//el: 수정 버튼 클릭 이벤트가 발생한 요소
	
	// 이미 열려있는 댓글 수정 창이 있을 경우 닫아주기
	if($(".replyUpdateContent").length > 0){
		$(".replyUpdateContent").eq(0).parent().html(beforeReplyRow);
	}
	// 댓글 수정화면 출력 전 요소를 저장해둠.
	beforeReplyRow = $(el).parent().parent().html();

	// 작성되어있던 내용(수정 전 댓글 내용) 
	var beforeContent = $(el).prev().html();

	
	
	
	// 이전 댓글 내용의 크로스사이트 스크립트 처리 해제, 개행문자 변경
	// -> 자바스크립트에는 replaceAll() 메소드가 없으므로 정규 표현식을 이용하여 변경
	beforeContent = beforeContent.replace(/&amp;/g, "&");	
	beforeContent = beforeContent.replace(/&lt;/g, "<");	
	beforeContent = beforeContent.replace(/&gt;/g, ">");	
	beforeContent = beforeContent.replace(/&quot;/g, "\"");	
	
	beforeContent = beforeContent.replace(/<br>/g, "\n");	
	
	
	// 기존 댓글 영역을 삭제하고 textarea를 추가 
	$(el).parent().prev().remove();
	var textarea = $("<textarea>").addClass("replyUpdateContent").attr("rows", "3").val(beforeContent);
	$(el).parent().before(textarea);
	
	
	// 수정 버튼
	var updateReply = $("<button>").addClass("btn btn-primary btn-sm ml-1 mb-4").text("댓글 수정").attr("onclick", "updateReply(" + replyNo + ", this)");
	
	// 취소 버튼
	var cancelBtn = $("<button>").addClass("btn btn-primary btn-sm ml-1 mb-4").text("취소").attr("onclick", "updateCancel(this)");
	
	var replyBtnArea = $(el).parent();
	
	$(replyBtnArea).empty(); 
	$(replyBtnArea).append(updateReply); 
	$(replyBtnArea).append(cancelBtn);

}

//-----------------------------------------------------------------------------------------
//댓글 수정 취소 시 원래대로 돌아가기
function updateCancel(el){
	$(el).parent().parent().html(beforeReplyRow);
}


//-----------------------------------------------------------------------------------------
// 댓글 수정
function updateReply(replyNo, el){
	//수정된 댓글 내용
	const replyContent =$(el).parent().prev().val();
	
	$.ajax({
		url: "${contextPath}/reply/updateReply",
		type : "POST",
		data : {"replyNo":replyNo,
			"replyContent":replyContent},
		success: function(result){
			if(result>0){
				swal({"icon" : "success" , "title" : "댓글 수정 성공"});
				selectReplyList();
			}
		},
		error : function(){
			console.log("댓글 수정 실패");
			
		}
	});
}


//-----------------------------------------------------------------------------------------
//댓글 삭제
function deleteReply(replyNo){
	if(confirm("정말로 삭제하시겠습니까?")){
		var url = "${contextPath}/offReview/deleteReview";
		
		$.ajax({
			url : url,
			data : {"reviewNo" : replyNo},
			success : function(result){
				if(result > 0){
					selectReplyList(classNo);
					swal({"icon" : "success" , "title" : "댓글 삭제 성공"});
				}
				
			}, error : function(){
				console.log("ajax 통신 실패");
			}
		});
	}

}


</script>