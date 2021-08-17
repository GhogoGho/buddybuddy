<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
    .online-review-content .updateArea {
      display: none;
      list-style-type: none;
    }
    /* 별점 */
    .stars .far{
			cursor:pointer;
		}
		
		#reviewImg0{
			height:100px;
		}
		.member-image {
		width:30px;
		}
		
		.editPrint{
		display:none;
		}
</style>



<div class="reviewList">
  <ul class="online-review-content list-group col-md-12" id="reviewListArea">
  <c:forEach items="${reviewList}" var="review">
    <li class="list-group-item">
      <div class="d-flex justify-content-between align-items-center">
        <div class="ms-2 me-auto">
          <div class="fw-bold">
          	<c:choose>
          	<c:when test="${!empty review.memberProfile }">
	          <img src="${contextPath}/${review.memberProfile}" class="member-image rounded-circle me-2">${review.memberNickName}
          	</c:when>
          	<c:otherwise>
            <img src="${contextPath}/resources/images/noimage.png" class="member-image rounded-circle me-2">${review.memberNickName}
          	</c:otherwise>
          	</c:choose>
          </div>
        </div>
        <p class="date me-2">작성일 : <fmt:formatDate value="${review.reviewDate}" pattern="yyyy년 MM월 dd일 HH:mm" /></p>
        <c:if test="${review.memberNo == sessionScope.loginMember.memberNo}">
        <ul class="review-action reviewBtnArea list-inline me-2">
          <li class="list-inline-item">
            <button class="button is-danger is-small ml-1" id="deleteReview" onclick="deleteReview(${review.reviewNo})">삭제</button><button class="button is-link is-small is-rounded ml-1 showUpdateReview" id="showUpdateReview">수정</button>
          </li>
        </ul>
        </c:if>
        <!-- 이미지 불러오기 (두 번 선언되지 않으면 상세페이지로 넘어올 경우 이미지 변수 선언이 동작하지 않음)-->
				<c:forEach items="${review.atList}" var="at">
					<c:choose>
						<c:when test="${at.fileLevel == 0 && !empty at.fileName}">
							<c:set var="img0" value="${contextPath}/${at.filePath}${at.fileName}"/>
						</c:when>
						<c:when test="${at.fileLevel == 1 && !empty at.fileName}">
							<c:set var="img1" value="${contextPath}/${at.filePath}${at.fileName}"/>
						</c:when>
						<c:when test="${at.fileLevel == 2 && !empty at.fileName}">
							<c:set var="img2" value="${contextPath}/${at.filePath}${at.fileName}"/>
						</c:when>
						<c:when test="${at.fileLevel == 3 && !empty at.fileName}">
							<c:set var="img3" value="${contextPath}/${at.filePath}${at.fileName}"/>
						</c:when>
					</c:choose>
				</c:forEach>
        <%-- <button class="btn btn-outline-secondary btn-sm" id="reply-like-btn">
          <%-- <i class="bi bi-heart" id="reply-like"><span id="reply-like-count">${reply.replyLike }</span></i> 
          <i class="bi bi-heart" id="reply-like">${reply.replyLike }</i>
        </button>--%>
      </div>
      <div class="ms-2">
			<c:if test="${ !empty review.atList && review.atList[0].fileLevel == 0}">
      	<%-- <img id="reviewImg0" src="${contextPath}/${review.atList[0].filePath}${review.atList[0].fileName}"> --%>
      	<img id="reviewImg0" src="${img0}">
			</c:if>
				<div id="review-con">${review.reviewContent }</div>
      </div>
      <!-- 별점 출력 -->
	    <div class="star-area"> 
	   		<div class="star-rating">
					<div class="d-flex justify-content-left large text-warning stars">
	    		<c:if test= "${review.reviewRatings == 1 }">
						<i class="fas fa-star"></i>
	    		</c:if>
	    		<c:if test= "${review.reviewRatings == 2 }">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</c:if>
					<c:if test= "${review.reviewRatings == 3 }">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</c:if>
					<c:if test= "${review.reviewRatings == 4 }">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</c:if>
					<c:if test= "${review.reviewRatings == 5 }">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</c:if>
					</div>
				</div>
	    </div>
	    
    </li>
    <li class="list-group-item updateArea">
      <div class="d-flex justify-content-between align-items-center">
        <div class="ms-2 me-auto">
          <div class="fw-bold">
            <pre>수정할 내용</pre>
          </div>
        </div>
      </div>
      <!-- 수정 이미지 파일 -->
     	<input type="file" name="reviewImgs" id="editReviewImg" accept="image/*" multiple>
      <div class="input-group ms-2 my-2">
        <textarea class="edit-review form-control" rows="5"></textarea>
        <button class="button is-link is-fullwidth" onclick="updateReview(${review.reviewNo}, this)">수정</button>
        
        <!--수정 별점 -->
				<div class="star-rating mb-1">
				별점
					<div class="d-flex justify-content-center large text-warning stars" id="editStars">
					<c:if test= "${review.reviewRatings == 1 }">
						<i class="fas fa-star"></i>
						<i class="far fa-star"></i>
						<i class="far fa-star"></i>
						<i class="far fa-star"></i>
						<i class="far fa-star"></i>
    			</c:if>
	    			<c:if test= "${review.reviewRatings == 2 }">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="far fa-star"></i>
						<i class="far fa-star"></i>
						<i class="far fa-star"></i>
					</c:if>
					<c:if test= "${review.reviewRatings == 3 }">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="far fa-star"></i>
						<i class="far fa-star"></i>
					</c:if>
					<c:if test= "${review.reviewRatings == 4 }">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="far fa-star"></i>
					</c:if>
					<c:if test= "${review.reviewRatings == 5 }">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</c:if>
					</div>
				</div>
				<%-- <input id="editStarRatingVal" type="hidden" value="${review.reviewRatings}" required > --%>
				<div class="editPrint" style="display:none;">${review.reviewRatings}</div>
				<!--수정 별점 -->
      </div>
				
    </li>
  </c:forEach>
	</ul>
</div>
<hr>
<div class="reviewWrite col-md-12">
	<h4 class="h5">수강 후기 작성</h4>
	<div class="input-group my-2" id="reviewContentArea">
		<div class="col-md-12">
		<!-- 후기 사진 첨부 -->
			<input type="file" name="reviewImgs" id="addReviewImg" accept="image/*" multiple>
			<textarea class="form-control" id="reviewContent" rows="3"></textarea>
		</div>
		<!-- 별점 -->
		<div class="star-rating mb-1">
		별점
			<div class="d-flex justify-content-center large text-warning stars" id="addStars">
				<i class="far fa-star"></i>
				<i class="far fa-star"></i>
				<i class="far fa-star"></i>
				<i class="far fa-star"></i>
				<i class="far fa-star"></i>
			</div>
			
		</div>
		<!-- 별점 숫자로 출력하는 부분(값을 가져가기 위해)
				다른 방법으로는 input이 있음 val()로 가져감
		 -->
		<div class="print" style="display:none" id="starPri"></div>
		<!-- <div class="print"></div> -->
		<c:if test="${!empty payList }">
		<button class="button is-success is-outlined is-large is-fullwidth" id="addReview" onclick="addReview();">
			<span class="icon is-small">
	      <i class="fas fa-check"></i>
	    </span>
	    <span>작성</span>
		</button>
		</c:if>
	</div>
</div>
<!-- 이미지 불러오기 (자바스크립트에서 변수 사용을 위해 필요) 변수 미사용으로 필요 없어짐-->
<%-- <c:forEach items="${review.atList}" var="at">
	<c:choose>
		<c:when test="${at.fileLevel == 0 && !empty at.fileName}">
			<c:set var="img0" value="${contextPath}/${at.filePath}${at.fileName}"/>
		</c:when>
		<c:when test="${at.fileLevel == 1 && !empty at.fileName}">
			<c:set var="img1" value="${contextPath}/${at.filePath}${at.fileName}"/>
		</c:when>
		<c:when test="${at.fileLevel == 2 && !empty at.fileName}">
			<c:set var="img2" value="${contextPath}/${at.filePath}${at.fileName}"/>
		</c:when>
		<c:when test="${at.fileLevel == 3 && !empty at.fileName}">
			<c:set var="img3" value="${contextPath}/${at.filePath}${at.fileName}"/>
		</c:when>
	</c:choose>
</c:forEach> --%>
<script>

/* 
function addReviewImg()({
	if($("#reviewImg").val()!=''){ // 파일이 첨부가 된 경우
		var formData = new FormData();
		formData.append("file", $("input[name=reviewImg]")[0].files[0]);
		$.ajax({
			url : "${contextPath}/onReview/insertReviewImg",
			type : "POST",
			data : formData,
			processData : false,
			contentType : false,
			success : function(data){ // 업로드된 실제파일 이름을 전달 받기 
				$("#filename").val(data);
			},
			error : function(){ alert("error"); }
		});
	}else{ // 파일이 첨부되지 않은 경우
		
	}
})
 */


<!-- 별점(수정용) -->
/* let starRate = $('.print').text(starNum); */
$(document).on("click", "#editStars > .far", function(){ // 별점이 비어있을 때
	if( $(this).attr("class") == "far fa-star" ){
		$(this).attr({"class": "fas fa-star"});
		$(this).prevAll().attr({"class": "fas fa-star"});
		$(this).nextAll().attr({"class": "far fa-star"});
	}
	
	let editNum = $(this).index();
	const editReviewRatings = editNum + 1;
	$('.editPrint').text(editReviewRatings);
	const editStarRate = $('.editPrint').val();
});

$(document).on("click", "#editStars > .fas", function(){ // 별점이 채워져 있을 때
	if( $(this).attr("class") == "fas fa-star" ){
		$(this).prevAll().attr({"class": "fas fa-star"});
		$(this).nextAll().attr({"class": "far fa-star"});
	}
	let editNum = $(this).index();
	const editReviewRatings = editNum + 1;
	$('.editPrint').text(editReviewRatings);
	const editStarRate = $('.editPrint').val();
});

<!-- 별점(입력용) -->
/* let starRate = $('.print').text(starNum); */
$(document).on("click", "#addStars > .far", function(){ // 별점이 비어있을 때
	if( $(this).attr("class") == "far fa-star" ){
		$(this).attr({"class": "fas fa-star"});
		$(this).prevAll().attr({"class": "fas fa-star"});
		$(this).nextAll().attr({"class": "far fa-star"});
	}
	
	let num = $(this).index();
	const reviewRatings = num + 1;
	$('.print').text(reviewRatings);
	const starRate = $('.print').val();
});

$(document).on("click", "#addStars > .fas", function(){ // 별점이 채워져 있을 때
	if( $(this).attr("class") == "fas fa-star" ){
		$(this).prevAll().attr({"class": "fas fa-star"});
		$(this).nextAll().attr({"class": "far fa-star"});
	}
	let num = $(this).index();
	const reviewRatings = num + 1;
	$('.print').text(reviewRatings);
	const starRate = $('.print').val();
});


/* 중복 변수 */
/* const loginMemberNo = "${loginMember.memberNo}";
const classNo = ${online.classNo}; */
//-----------------------------------------------------------------------------------------
//수강후기 등록
function addReview() {
	const reviewContent = $("#reviewContent").val();
	/* const reviewImg = $("#reviewImg").val();  */ 
	/* const reviewImgs = $("input[name='reviewImgs']").get(0).files[0]; */ // 수강후기에 목록이 생길경우 수정창에 같은 input이 존재하므로 오작동 함
	const reviewImgs = $("#addReviewImg").get(0).files[0];
	const reviewRatings = $('.print').text();
	console.log(reviewRatings);
	console.log(reviewImgs);
	var formData = new FormData();
	formData.append("memberNo", loginMemberNo);
	formData.append("classNo", classNo);
	formData.append("reviewContent", reviewContent);
	formData.append("reviewImgs", reviewImgs);
	formData.append("reviewRatings", reviewRatings);
	
    if(loginMemberNo == ""){
    	swal("로그인이 필요합니다.");
    }else{
     if(reviewContent.trim() == ""){ 
    	 swal("수강후기 작성 후 클릭해 주세요.");
     }else if(reviewRatings == ""){
    	 swal("별점을 입력해 주세요.");
     }else{
    	 
       $.ajax({ 
         url : "${contextPath}/onReview/insertReview", 
         type : "POST",
         enctype : "multipart/form-data",
         data : formData ,
         contentType: false,
         processData: false,
         success : function(result){
           if(result > 0){ 
						swal({"icon" : "success" , "title" : "수강후기 등록 성공"});
						$("#reviewContent").val(""); // 삽입 후 비우기
						$("#reviewImg").val(""); // 업로드 후 파일 지우기
						$(".print").text(""); // 별점 값 지우기
						$("#addStars").html(""); // 지우고 다시 생성
						var addFar1 = $("<i>").addClass("far fa-star");
						var addFar2 = $("<i>").addClass("far fa-star");
						var addFar3 = $("<i>").addClass("far fa-star");
						var addFar4 = $("<i>").addClass("far fa-star");
						var addFar5 = $("<i>").addClass("far fa-star");
						$("#addStars").append(addFar1).append(addFar2).append(addFar3).append(addFar4).append(addFar5);
						selectReviewList(); 
           }
         },
         error : function(){
           console.log("수강후기 등록 실패");
         }
       });
     }
  }
} 
//-----------------------------------------------------------------------------------------
//해당 클래스 수강후기 목록 조회
function selectReviewList(){
    $.ajax({ 
     url : "${contextPath}/onReview/list",
     data : {"classNo" : classNo},
     type : "POST",
     dataType : "JSON",  
     success : function(reviewList){
       
            $("#reviewListArea").html(""); 
            
            
            $.each(reviewList, function(index, item){
            	
    
              var li = $("<li>").addClass("list-group-item");
    
              var div1 = $("<div>").addClass("d-flex justify-content-between align-items-center");
              var lastDiv = $("<div>").addClass("ms-2");
      				if( item.atList != "" && item.atList[0].fileLevel == 0){ // 후기 사진 출력
	    					/* var img = $("<img>").attr("src", "${contextPath}"+"/"+item.atList[0].filePath).attr("id", "reviewImg0"); */
	    					/* var img = $("<img>").attr("src", "${img0}").attr("id", "reviewImg0"); */
	    					var img = $("<img>").attr("src", "${contextPath}"+"/"+item.atList[0].filePath+item.atList[0].fileName).attr("id", "reviewImg0");
      				}
      				var reviewCon = $("<div>").attr("id", "review-con").html(item.reviewContent);
    					/* 별점 만들기 후아~ */
    					var starArea = $("<div>").addClass("star-area");
    					var starRating = $("<div>").addClass("star-rating");
    					var stars = $("<div>").addClass("d-flex justify-content-left large text-warning stars");
    					if(item.reviewRatings == 1){
	    					var fas1 = $("<i>").addClass("fas fa-star");
	    					stars.append(fas1);
    					}else if(item.reviewRatings == "2"){
	    					var fas1 = $("<i>").addClass("fas fa-star");
	    					var fas2 = $("<i>").addClass("fas fa-star");
	    					stars.append(fas1).append(fas2);
    					}else if(item.reviewRatings == "3"){
	    					var fas1 = $("<i>").addClass("fas fa-star");
	    					var fas2 = $("<i>").addClass("fas fa-star");
	    					var fas3 = $("<i>").addClass("fas fa-star");
	    					stars.append(fas1).append(fas2).append(fas3);
    					}else if(item.reviewRatings == "4"){
	    					var fas1 = $("<i>").addClass("fas fa-star");
	    					var fas2 = $("<i>").addClass("fas fa-star");
	    					var fas3 = $("<i>").addClass("fas fa-star");
	    					var fas4 = $("<i>").addClass("fas fa-star");
	    					stars.append(fas1).append(fas2).append(fas3).append(fas4);
    					}else if(item.reviewRatings == "5"){
	    					var fas1 = $("<i>").addClass("fas fa-star");
	    					var fas2 = $("<i>").addClass("fas fa-star");
	    					var fas3 = $("<i>").addClass("fas fa-star");
	    					var fas4 = $("<i>").addClass("fas fa-star");
	    					var fas5 = $("<i>").addClass("fas fa-star");
	    					stars.append(fas1).append(fas2).append(fas3).append(fas4).append(fas5);
    					}
    					
    					starRating.append(stars);
    					starArea.append(starRating);
    					
    					
              var div2 = $("<div>").addClass("ms-2 me-auto");
    
              var div3 = $("<div>").addClass("fw-bold");
              div2.append(div3);
    					if(item.memberProfile != null){ // 프로필 사진 출력
              	var rWriter = $("<img>").attr("src","${contextPath}"+"/"+item.memberProfile).addClass("member-image rounded-circle me-2"); 
    					}else{
    						var rWriter = $("<img>").attr("src","${contextPath}"+"/"+"resources"+"/"+"images"+"/"+"noimage.png").addClass("member-image rounded-circle me-2"); 
    					}
              div3.append(rWriter).append(item.memberNickName);
              
              var rDate = $("<p>").addClass("date me-2").text("작성일 : "+item.reviewDate);
    
               if (item.memberNo == loginMemberNo) { // 삭제 수정 버튼 
    
                 var ul = $("<ul>").addClass("review-action reviewBtnArea list-inline me-2");
      
                 var childLi1 = $("<li>").addClass("list-inline-item");
                 var deleteReview = $("<button>").addClass("button is-danger is-small ml-1").text("삭제").attr("id", "deleteReview").attr("onclick", "deleteReview("+item.reviewNo+")");
                 var showUpdate = $("<button>").addClass("button is-link is-small is-rounded ml-1 showUpdateReview").text("수정").attr("id", "showUpdateReview");
                 childLi1.append(deleteReview).append(showUpdate);
      
                 //var childLi2 = $("<li>").addClass("list-inline-item");
                 //childLi2.append(deleteReply);
      
                 //ul.append(childLi1).append(childLi2);
                 ul.append(childLi1);
               } 
    
              //var button = $("<button>").addClass("btn btn-outline-secondary btn-sm").attr("id", "reply-like-btn");
              //var i = $("<i>").addClass("bi bi-heart").text((item.replyLike)).attr("id", "reply-like");
              //var span = $("<span>").attr("id", "reply-like-count").text("replyLike");
              //i.append(span);
              //button.append(i);
              //div1.append(div2).append(rDate).append(ul).append(button);
              div1.append(div2).append(rDate).append(ul);
    
              
              
              /* var listButton = $("<button>").addClass("btn btn-outline-primary").text("목록갱신(테스트용)").attr("onclick", "selectReplyList()"); */
		          /* if(item.atList == "" && item.atList[0].fileLevel == 0 ){
		         	} */
		         	
			        lastDiv.append(img).append(reviewCon);
              li.append(div1).append(lastDiv).append(starArea);
              
            //수정창 시작-----------------------------------------------------------------------------------------
              var updateLi = $("<li>").addClass("list-group-item updateArea");
              var uDivTop = $("<div>").addClass("d-flex justify-content-between align-items-center");
              var uDivch = $("<div>").addClass("ms-2 me-auto");
              uDivTop.append(uDivch);
              var uDivchch = $("<div>").addClass("fw-bold");
              uDivch.append(uDivchch); 
			
              var updateC = $("<pre>").text("수정할 내용");
              uDivchch.append(updateC);
              /* var uImg = $("<img>").attr("src","#").addClass("user-image rounded-circle me-2").text("닉네임 : ");
              uDivchch.append(uImg); */
              var editRevImg = $("<input>").attr("type", "file").attr("name", "reviewImgs").attr("id", "editReviewImg").attr("accept", "image"+"/"+"*");
              var uDivBottom = $("<div>").addClass("input-group ms-2 my-2");
              var uTextarea = $("<textarea>").addClass("form-control").attr("id", "edit-review").attr("rows","5");
              var uButton = $("<button>").addClass("button is-link is-fullwidth").text("수정").attr("onclick", "updateReview(" + item.reviewNo + ", this)");
              
              
              
              /* 별 파티 */
              var editStarRating = $("<div>").addClass("star-rating mb-1");
             /*  var editPriInput = $("<input>").attr("id", "editStarRatingVal").attr("type", "hidden").attr("value", item.reviewRatings).attr("required"); */
              var editPri = $("<div>").addClass("editPrint");
							var editStars = $("<div>").addClass("d-flex justify-content-center large text-warning stars").attr("id", "editStars");
							if(item.reviewRatings == "1"){
								var editFas1 = $("<i>").addClass("fas fa-star");
								var editFar1 = $("<i>").addClass("far fa-star");
								var editFar2 = $("<i>").addClass("far fa-star");
								var editFar3 = $("<i>").addClass("far fa-star");
								var editFar4 = $("<i>").addClass("far fa-star");
								editStars.append(editFas1).append(editFar1).append(editFar2).append(editFar3).append(editFar4);
							}else if(item.reviewRatings == "2"){
								var editFas1 = $("<i>").addClass("fas fa-star");
								var editFas2 = $("<i>").addClass("fas fa-star");
								var editFar1 = $("<i>").addClass("far fa-star");
								var editFar2 = $("<i>").addClass("far fa-star");
								var editFar3 = $("<i>").addClass("far fa-star");
								editStars.append(editFas1).append(editFas2).append(editFar1).append(editFar2).append(editFar3);
							}else if(item.reviewRatings == "3"){
								var editFas1 = $("<i>").addClass("fas fa-star");
								var editFas2 = $("<i>").addClass("fas fa-star");
								var editFas3 = $("<i>").addClass("fas fa-star");
								var editFar1 = $("<i>").addClass("far fa-star");
								var editFar2 = $("<i>").addClass("far fa-star");
								editStars.append(editFas1).append(editFas2).append(editFas3).append(editFar1).append(editFar2);
							}else if(item.reviewRatings == "4"){
								var editFas1 = $("<i>").addClass("fas fa-star");
								var editFas2 = $("<i>").addClass("fas fa-star");
								var editFas3 = $("<i>").addClass("fas fa-star");
								var editFas4 = $("<i>").addClass("fas fa-star");
								var editFar1 = $("<i>").addClass("far fa-star");
								editStars.append(editFas1).append(editFas2).append(editFas3).append(editFas4).append(editFar1);
							}else if(item.reviewRatings == "5"){
								var editFas1 = $("<i>").addClass("fas fa-star");
								var editFas2 = $("<i>").addClass("fas fa-star");
								var editFas3 = $("<i>").addClass("fas fa-star");
								var editFas4 = $("<i>").addClass("fas fa-star");
								var editFas5 = $("<i>").addClass("fas fa-star");
								editStars.append(editFas1).append(editFas2).append(editFas3).append(editFas4).append(editFas5);
							}
							editStarRating.append(editStars);
              /* 별 파티 끝! */
              
              uDivBottom.append(uTextarea).append(uButton).append(editStarRating).append(editPri);
              
              
              //수정창 마무리
              updateLi.append(uDivTop).append(editRevImg).append(uDivBottom);
            //수정창 끝-------------------------------------------------------------------------------------------
              //댓글 + 수정창
             //topUl.append(li).append(updateLi);
             // $("#replyListArea").append(li).append(updateLi);
    
              // 마지막 마무리
             // $(".replyList").append(topUl); 1
              //$("#replyListArea").append(topUl).append(listButton); // 목록 버튼
              
              $("#reviewListArea").append(li).append(updateLi);
              
            });
       
     },
     
     error : function(){
       console.log("수강후기 목록 조회 실패");
     }
     
    });
}
// ---------------------------
// 댓글 수정창 여닫
$(document).on("click", ".showUpdateReview", function(){ // 동적 요소가 적용된 후에도 동작함
	
/* $('.showUpdateReply').click(function(){ */ // 동적으로 요소가 생겼을 경우 동작하지 않는다.
  	if($(this).parent().parent().parent().parent().next(".updateArea").css("display") == "none" ){
        /* $(this).parent().parent().parent().parent().siblings("li.updateArea").hide(); */
        $("li.updateArea").hide();
        $(this).parent().parent().parent().parent().next(".updateArea").show();
        $(".showUpdateReview").text("수정");
		$(this).text("닫기");
 	 }else{
	   $(this).parent().parent().parent().parent().next(".updateArea").hide(); 
	   $(this).text("수정");
  	}
 /*  }); */

}); 
// ---------------------------
// 수강후기 수정 기능
function updateReview(reviewNo, el){
	
	const reviewContent = $(el).prev().val();
	const editReviewRatings = $(el).next().next(".editPrint").text();
	/* const editReviewRatings = $(el).next().next("#editStarRatingVal").val(); */
	const editReviewImgs = $(el).parent().prev("#editReviewImg").get(0).files[0];
	
	console.log(editReviewImgs);
	console.log(editReviewRatings)
	console.log(reviewContent)
	var formData = new FormData();
	formData.append("reviewContent", reviewContent);
	formData.append("reviewRatings", editReviewRatings);
	formData.append("reviewImgs", editReviewImgs);
	formData.append("reviewNo", reviewNo);
	
	if(reviewContent.trim() == ""){
		swal("수강후기 내용을 수정 후 클릭해 주세요.");
	}else{
		
		$.ajax({
			url : "${contextPath}/onReview/updateReview",
			type : "POST",
			enctype : "multipart/form-data",
			data : formData ,
			contentType : false,
			processData : false,
			/* data : {"reviewNo" : reviewNo,
							"reviewContent" : reviewContent}, */
			success : function(result){
				if(result > 0 ){
					swal({"icon" : "success" , "title" : "수강후기 수정 성공"});
					/* $("#editReviewImg").val(""); */
					selectReviewList();
				}
			},
			error : function(){
				console.log("수강후기 수정 실패");
			}
		});
	}// else 끝
}
// ---------------------------
// 수강후기 삭제 기능
function deleteReview(reviewNo){
	if(confirm("수강후기를 삭제하시겠습니까?")){
  		
        $.ajax({
          url :"${contextPath}/onReview/deleteReview",
          type : "POST",
          data : {"reviewNo" : reviewNo},
          success : function(result){
            if(result > 0){
            	swal({"icon" : "success" , "title" : "수강후기 삭제 성공"});
              selectReviewList();
            }
          },
          error : function(){
            console.log("수강후기 삭제 실패");
          }
    	});
	}
}


</script>



