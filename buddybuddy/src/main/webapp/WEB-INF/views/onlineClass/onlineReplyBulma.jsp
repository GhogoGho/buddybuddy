<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	/* .add-comment-area{
		display : none;
	} */
	
	.editCommentArea .editComment{ /* 대댓글 수정창 */
		display : none;
		list-style-type: none;
	}
	
	.addCommentArea { /* 대댓글 작성창 */
		display : none;
		list-style-type: none;
	}
	
	.editReplyArea { /* 댓글 수정창 */
		display : none;
		list-style-type: none;
	}
</style>
<button onclick="selectReplyList()">목록갱신</button>

<!-- 댓글1 -->
<div id="replyListArea">
	<c:forEach items="${rList}" var="reply">
	<article class="media">
	  <figure class="media-left">
	    <p class="image is-64x64">
	    	<c:choose>
	    	<c:when test="${!empty review.memberProfile }">
	      <img src="${contextPath}/${reply.memberProfile}">
	      </c:when>
       	<c:otherwise>
				<img src="${contextPath}/resources/images/noimage.png">
     		</c:otherwise>
	    	</c:choose>
	    </p>
	  </figure>
	  <div class="media-content">
	    <div class="content">
	      <p>
        	<strong>${reply.memberNickName}</strong>
	        <br>
	        <div id="notice-con">${reply.replyContent }</div>
	        <br>
	        <small>
	        	<c:if test="${reply.memberNo == sessionScope.loginMember.memberNo}">
          	<button class="button is-danger" id="deleteReply" onclick="deleteReply(${reply.replyNo})">문의 삭제</button>
	        	</c:if>
	        </small>
          <small>
         		<fmt:formatDate value="${reply.replyDate}" pattern="yyyy년 MM월 dd일 HH:mm"/>
          </small>
	      </p>
	    </div>
	    <!-- 댓글 수정 -->
	    <c:if test="${reply.memberNo == sessionScope.loginMember.memberNo}">
	    <button class="button is-primary is-rounded showUpdateReply">문의 수정</button>
	    </c:if>
	    <div id="editReplyArea" class="editReplyArea">
	    	<textarea class="textarea is-success"></textarea>
	    	<button class="button is-primary is-fullwidth" onclick="updateReply(${reply.replyNo}, this)">수정</button>
	    </div>
	    <!-- 대댓글 작성 -->
	    <c:if test="${reply.nestedReply == null }">
	    <button class="button is-dark showAddComment">답글 작성</button>
	    </c:if>
	    <div id="addCommentArea" class="addCommentArea">
	    	<textarea class="textarea is-dark"></textarea>
	    	<button class="button is-dark is-fullwidth" onclick="addComment(${reply.replyNo}, this)">답글 작성</button>
	    </div>
	    <c:if test="${reply.nestedReply != null }">
			<!-- 대댓글1 -->
	    <article class="media">
	      <figure class="media-left">
	        <p class="image is-48x48">
	          <img src="https://images.unsplash.com/photo-1596496356933-e55641d98edf?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nzl8fGNsYXNzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60">
	        </p>
	      </figure>
	      <div class="media-content">
	        <div class="content">
	          <p>
	            <strong>클래스장</strong>
	            <br>
	            <div id="notice-con">
	            	${reply.nestedReply }
	            </div>
	            <br>
	            <small>
								<%-- <c:if test="${online.memberNo == sessionScope.loginMember.memberNo}"> --%>
		          	<button class="button is-danger" onclick="deleteComment(${reply.replyNo}, this)">답글 삭제</button>
			        	<%-- </c:if> --%>
	            </small>
              <small>
              	<fmt:formatDate value="${reply.replyDate}" pattern="yyyy년 MM월 dd일 HH:mm" />
              </small>
	          </p>
	        </div>
					<!-- 대댓글 수정 -->
					<button class="button is-warning is-rounded showEditComment" id="showEditComment">답글 수정</button>
					<div class="editCommentArea">
						<div class="editComment">
							<textarea class="textarea is-warning"></textarea>
							<button class="button is-warning is-fullwidth" onclick="updateComment(${reply.replyNo}, this)">수정</button>
						</div>
					</div>
					
	      </div>
	    </article>
			<!-- 대댓글1 끝-->
	    </c:if>
	    
	  </div>
	</article>
	</c:forEach>
	
</div>

<!-- 댓글 작성 -->
<hr>
<article class="media">
  <figure class="media-left">
    <p class="image is-64x64">
      <img src="https://bulma.io/images/placeholders/128x128.png">
    </p>
  </figure>
  <div class="media-content">
    <div class="field">
      <p class="control">
        <textarea class="textarea" id="replyContent" placeholder="수강문의를 작성해 주세요."></textarea>
      </p>
    </div>
    <div class="field">
      <p class="control">
        <button class="button is-link is-medium is-fullwidth" id="addReply" onclick="addReply();">작성</button>
      </p>
    </div>
  </div>
</article>
${online.memberNo}
${loginMember.memberNo}
<script>

const onlineMemberNickName = "${online.memberNickName}"; // ""null 값 대비를 위해 꼭...
const onlineMemberNo = "${online.memberNo}"; // 클래스 크리에이터 회원 번호
/* const loginMemberNo = "${loginMember.memberNo}";
const classNo = ${online.classNo}; */

//-----------------------------------------------------------------------------------------
//수강문의 등록
function addReply() {
	const replyContent = $("#replyContent").val();
    if(loginMemberNo == ""){
    	swal("로그인 후 이용해 주세요.");
    }else{
     if(replyContent.trim() == ""){ 
       swal("수강문의 작성 후 클릭해 주세요.");
     }else{
    	 
       $.ajax({ 
         url : "${contextPath}/onReply/insertReply", 
         type : "POST",
         data : {"memberNo" : loginMemberNo,
             "classNo" : classNo,
             "replyContent" : replyContent },
         success : function(result){
           if(result > 0){ 
        	 		swal({"icon" : "success" ,"title" : "수강문의 등록 성공"});
             $("#replyContent").val(""); 
             
             selectReplyList(); 
           }
         },
         error : function(){
           console.log("수강문의 등록 실패");
         }
       });
     }
  }
} 
//-----------------------------------------------------------------------------------------
//해당 클래스 수강문의 목록 조회
/* const memberNo = 6; */
function selectReplyList(){
	$.ajax({ 
		url : "${contextPath}/onReply/list",
		data : {"classNo" : classNo},
		type : "POST",
		dataType : "JSON",  
		success : function(rList){
		  
			$("#replyListArea").html(""); //최상단
			
			$.each(rList, function(index, item){ // 재생성 부분
		  	
				var topArticle = $("<article>").addClass("media");
				var topFigure = $("<figure>").addClass("media-left");
				var topP = $("<p>").addClass("image is-64x64");
				if(item.memberProfile != null){
					var topImg = $("<img>").attr("src", "${contextPath}"+"/"+item.memberProfile);
				}else{
					var topImg = $("<img>").attr("src","${contextPath}"+"/"+"resources"+"/"+"images"+"/"+"noimage.png"); 
				}
				
				topP.append(topImg);
				topFigure.append(topP);
				topArticle.append(topFigure);
				
				var firstDiv = $("<div>").addClass("media-content");
				var secondDiv = $("<div>").addClass("content");
				var contentP = $("<p>");
				var strong = $("<strong>").text(item.memberNickName);
				var firstBr = $("<br>");
				var contentDiv = $("<div>").attr("id", "notice-con").html(item.replyContent);
				var secondBr = $("<br>");
				
				var small = $("<small>");
				if (item.memberNo == loginMemberNo) {
					var deleteBtn = $("<button>").addClass("button is-danger").text("문의 삭제").attr("id", "deleteReply").attr("onclick", "deleteReply("+item.replyNo+")");
					small.append(deleteBtn);
				}
				
				var smallDate = $("<small>").text(item.replyDate);
				
				
				contentP.append(strong).append(firstBr).append(contentDiv).append(secondBr).append(small).append(smallDate);
				secondDiv.append(contentP);
				
				// 댓글 수정창
				if (item.memberNo == loginMemberNo) {
				var editBtn = $("<button>").addClass("button is-primary is-rounded showUpdateReply").text("문의 수정");
					
				}
				var editReplyArea = $("<div>").attr("id", "editReplyArea").addClass("editReplyArea");
				var editReplyCon = $("<textarea>").addClass("textarea is-success");
				var editReplyBtn = $("<button>").addClass("button is-primary is-fullwidth").text("수정").attr("onclick", "updateReply(" + item.replyNo + ", this)");
				editReplyArea.append(editReplyCon).append(editReplyBtn);
				
				// 대댓글 작성창
				if(item.nestedReply == null){
					var addToggleBtn = $("<button>").addClass("button is-dark showAddComment").text("답글 작성");
				}
				var addCommentArea = $("<div>").attr("id", "addCommentArea").addClass("addCommentArea");
				var addCommentCon = $("<textarea>").addClass("textarea is-dark");
				var addCommentBtn = $("<button>").addClass("button is-dark is-fullwidth").text("답글 작성").attr("onclick", "addComment(" + item.replyNo + ", this)");
				addCommentArea.append(addCommentCon).append(addCommentBtn);
				
					
				
				/////////////////////////////////////////////////////////////////////////////////////////////
				/////////////////////////////////////////////////////////////////////////////////////////////
				// 대댓글 시작
				var commentArti = $("<article>").addClass("media");
				var cTopFigure = $("<figure>").addClass("media-left");
				var cTopP = $("<p>").addClass("image is-48x48");
				/* if(item.memberProfile != null){ */
					var cTopImg = $("<img>").attr("src", "https://images.unsplash.com/photo-1596496356933-e55641d98edf?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nzl8fGNsYXNzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60");
				/* }else{
					var cTopImg = $("<img>").attr("src","${contextPath}"+"/"+"resources"+"/"+"images"+"/"+"noimage.png"); 
				} */
				
				cTopP.append(cTopImg);
				cTopFigure.append(cTopP);
				commentArti.append(cTopFigure);
				
				var cFirstDiv = $("<div>").addClass("media-content");
				var cSecondDiv = $("<div>").addClass("content");
				var cContentP = $("<p>");
				var cStrong = $("<strong>").append(item.memberNickName).text("클래스장");
				var cFirstBr = $("<br>");
				var cContentDiv = $("<div>").attr("id", "notice-con").html(item.nestedReply);
				var cSecondBr = $("<br>");
				
				var cSmall = $("<small>");
				/* if (item.MemberNo == loginMemberNo) { */
					var cDeleteBtn = $("<button>").addClass("button is-danger").text("답글 삭제").attr("onclick", "deleteComment(" + item.replyNo + ", this)");
					cSmall.append(cDeleteBtn).append(cEditBtn);
				/* } */
				var cSmallDate = $("<small>").text(item.replyDate);
				
				cContentP.append(cStrong).append(cFirstBr).append(cContentDiv).append(cSecondBr).append(cSmall).append(cSmallDate);
				cSecondDiv.append(cContentP);
				
				// 대댓글 수정창
				if(item.nestedReply != null){
					var cEditBtn = $("<button>").addClass("button is-warning is-rounded showEditComment").attr("id", "showEditComment").text("답글 수정");
					var editCommentArea = $("<div>").addClass("editCommentArea");
					var editComment = $("<div>").addClass("editComment");
					var editCommentCon = $("<textarea>").addClass("textarea is-warning");
					var editCommentBtn = $("<button>").addClass("button is-warning is-fullwidth").text("수정").attr("onclick", "updateComment(" + item.replyNo + ", this)");
					editComment.append(editCommentCon).append(editCommentBtn);
					editCommentArea.append(editComment);
				}
				
				
				// 대댓글 마지막
				//commentArti.append(cTopFigure).append(cFirstDiv);
				cFirstDiv.append(cSecondDiv).append(cEditBtn).append(editCommentArea);
				commentArti.append(cFirstDiv);
				
				//댓글 마지막 및 대댓글 부분 붙는 곳
				if(item.nestedReply == null){ // 대댓글이 없다면 작성창 O
					firstDiv.append(secondDiv).append(editBtn).append(editReplyArea).append(addToggleBtn).append(addCommentArea);
				}else{
					firstDiv.append(secondDiv).append(editBtn).append(editReplyArea).append(commentArti);
				}
				topArticle.append(firstDiv);
				$("#replyListArea").append(topArticle);
				
			});
			
		},
			
		error : function(){
		  console.log("수강문의 목록 조회 실패");
		}

		});
}
//---------------------------
//수강문의 답글창 여닫
$(document).on("click", ".showAddComment", function(){
	if( $(this).next(".addCommentArea").css("display") == "none" ){
		$(".addCommentArea").slideUp();
		$(this).next(".addCommentArea").slideDown();
		$(".showAddComment").text("답글 작성");
		$(this).text("닫기");
	}else{
		$(this).next(".addCommentArea").slideUp();
		$(this).text("답글 작성");
	}
	
}); 
// ------------------------------------
// 수강문의 수정창 여닫
$(document).on("click", ".showUpdateReply", function(){
	if( $(this).next(".editReplyArea").css("display") == "none" ){
		$(".editReplyArea").slideUp();
		$(this).next(".editReplyArea").slideDown();
		$(".showUpdateReply").text("문의 수정");
		$(this).text("닫기");
	}else{
		$(this).next(".editReplyArea").slideUp();
		$(this).text("문의 수정");
	}
	
});


// ---------------------------
// 수강문의 대댓글 수정창 여닫
$(document).on("click", ".showEditComment", function(){
	if( $(this).next().children(".editComment").css("display") == "none" ){
		$(".editComment").slideUp();
		$(this).next().children(".editComment").slideDown();
		$(".showEditComment").text("답글 수정");
		$(this).text("닫기");
	}else {
		$(this).next().children(".editComment").slideUp();
		$(this).text("답글 수정");
	}
	
});
/* 오류의 흔적..
function showTest(){
	console.log("skdhlk");
	 if( $(".editCommentArea").css("display") != "none" ){
		console.log("이건?");
			$(".showTest").text("수정(테테)");
			$(".editCommentArea").slideUp();
	}else{
		
	} 
}
*/

// ---------------------------
// 수강문의 수정 기능
function updateReply(replyNo, el){
	
	const replyContent = $(el).prev().val();
	
	$.ajax({
		url : "${contextPath}/onReply/updateReply",
		type : "POST",
		data : {"replyNo" : replyNo,
				"replyContent" : replyContent},
		success : function(result){
			if(result > 0 ){
				swal({"icon" : "success" , "title" : "수강문의 수정 성공"});
				selectReplyList();
			}
		},
		error : function(){
			console.log("수강문의 수정 실패");
		}
	});
}
// ---------------------------
// 수강문의 삭제 기능
function deleteReply(replyNo){
	if(confirm("수강문의를 삭제하시겠습니까?")){
  		
        $.ajax({
          url :"${contextPath}/onReply/deleteReply",
          type : "POST",
          data : {"replyNo" : replyNo},
          success : function(result){
            if(result > 0){
            	swal({"icon" : "success" , "title" : "수강문의 삭제 성공"});
              selectReplyList();
            }
          },
          error : function(){
            console.log("수강문의 삭제 실패");
          }
    	});
	}
}
// 대댓글 부분
//---------------------------
//수강문의 대댓글 작성 기능
function addComment(replyNo, el){
	
	const commentContent = $(el).prev().val();
	
	$.ajax({
		url : "${contextPath}/onReply/insertComment",
		type : "POST",
		data : {"replyNo" : replyNo,
				"nestedReply" : commentContent},
		success : function(result){
			if(result > 0 ){
				swal({"icon" : "success" , "title" : "수강문의 답글 작성 성공"});
				selectReplyList();
			}
		},
		error : function(){
			console.log("수강문의 답글 작성 실패");
		}
	});
}
//---------------------------
//수강문의 대댓글 수정 기능
function updateComment(replyNo, el){
	
	const commentContent = $(el).prev().val();
	
	$.ajax({
		url : "${contextPath}/onReply/updateComment",
		type : "POST",
		data : {"replyNo" : replyNo,
				"nestedReply" : commentContent},
		success : function(result){
			if(result > 0 ){
				swal({"icon" : "success" , "title" : "수강문의 답글 수정 성공"});
				selectReplyList();
			}
		},
		error : function(){
			console.log("수강문의 수정 실패");
		}
	});
}

//---------------------------
//수강문의 대댓글 삭제 기능
function deleteComment(replyNo, el){
	
	const commentContent = null; // mapper에서 null값을 넣긴 때문에 없어도 동작은 한다.
	
	if(confirm("수강문의 답글을 삭제하시겠습니까?")){
		$.ajax({
			url : "${contextPath}/onReply/deleteComment",
			type : "POST",
			data : {"replyNo" : replyNo,
					"nestedReply" : commentContent},
			success : function(result){
				if(result > 0 ){
					swal({"icon" : "success" , "title" : "수강문의 답글 삭제 성공"});
					selectReplyList();
				}
			},
			error : function(){
				console.log("수강문의 수정 실패");
			}
		});
	}
}

</script>

