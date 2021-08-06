<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
    .online-review-content .updateArea {
      display: none;
      list-style-type: none;
    }
</style>

${reviewList }
<div class="reviewList">
  <ul class="online-review-content list-group col-md-12" id="reviewListArea">
  <c:forEach items="${reviewList}" var="review">
    <li class="list-group-item">
      <div class="d-flex justify-content-between align-items-center">
        <div class="ms-2 me-auto">
          <div class="fw-bold">
            <img src="#" class="user-image rounded-circle me-2">${review.memberNickName}
          </div>
        </div>
        <p class="date me-2">작성일 : ${review.reviewDate}</p>
        <c:if test="${review.memberNo == sessionScope.loginMember.memberNo}">
        <ul class="review-action reviewBtnArea list-inline me-2">
          <li class="list-inline-item">
            <button class="btn btn-danger btn-sm ml-1" id="deleteReview" onclick="deleteReview(${review.reviewNo})">삭제</button><button class="btn btn-success btn-sm ml-1 showUpdateReview" id="showUpdateReview">수정</button>
          </li>
        </ul>
        </c:if>
        <%-- <button class="btn btn-outline-secondary btn-sm" id="reply-like-btn">
          <%-- <i class="bi bi-heart" id="reply-like"><span id="reply-like-count">${reply.replyLike }</span></i> 
          <i class="bi bi-heart" id="reply-like">${reply.replyLike }</i>
        </button>--%>
      </div>
      <div class="ms-2">${review.reviewContent }</div>
    </li>
    <li class="list-group-item updateArea">
      <div class="d-flex justify-content-between align-items-center">
        <div class="ms-2 me-auto">
          <div class="fw-bold">
            <pre>수정할 내용</pre>
          </div>
        </div>
      </div>
      <div class="input-group ms-2 my-2">
        <textarea class="edit-review form-control" rows="5"></textarea>
        <button class="btn btn-outline-success" onclick="updateReview(${review.reviewNo}, this)">수정</button>
      </div>
    </li>
  </c:forEach>
	</ul>
</div>
<hr>
<div class="reviewWrite col-md-12">
	<h4 class="h5">수강 후기 작성</h4>
	<div class="input-group my-2" id="reviewContentArea">
		<textarea class="form-control" id="reviewContent" rows="5"></textarea>
		<button class="btn btn-outline-success" id="addReview" onclick="addReview();">작성</button>
	</div>
</div>
		
		

<script>

const loginMemberNo = "${loginMember.memberNo}";

const classNo = ${online.classNo};

let beforeReviewRow; 
//-----------------------------------------------------------------------------------------
//수강후기 등록
function addReview() {
	const reviewContent = $("#reviewContent").val();
    if(loginMemberNo == ""){
    	swal("로그인 필요");
    }else{
     if(reviewContent.trim() == ""){ 
    	 swal("수강후기 작성 후 클릭해 주세요.");
     }else{
    	 
       $.ajax({ 
         url : "${contextPath}/onReview/insertReview", 
         type : "POST",
         data : {"memberNo" : loginMemberNo,
             "classNo" : classNo,
             "reviewContent" : reviewContent },
         success : function(result){
           if(result > 0){ 
						swal({"icon" : "success" , "title" : "수강후기 등록 성공"});
						$("#reviewContent").val(""); 
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
//해당 게시글 댓글 목록 조회
function selectReviewList(){
    $.ajax({ 
     url : "${contextPath}/onReview/list",
     data : {"classNo" : classNo},
     type : "POST",
     dataType : "JSON",  
     success : function(reviewList){
       /* console.log(rList); */
       
            //$("#replyListArea").html(""); 1
            $("#reviewListArea").html(""); 
            
            
            $.each(reviewList, function(index, item){
            	
              // console.log(item.userNickname); 
              //var topDiv = $("<div>").addClass("replyList mt-5 pt-2");
          	  //var topUl = $("<ul>").addClass("qna-reply-content list-group col-md-9").attr("id", "replyListArea");
    
              var li = $("<li>").addClass("list-group-item");
    
              var div1 = $("<div>").addClass("d-flex justify-content-between align-items-center");
              var lastDiv = $("<div>").addClass("ms-2").html(item.reviewContent);
              var div2 = $("<div>").addClass("ms-2 me-auto");
    
              var div3 = $("<div>").addClass("fw-bold");
              div2.append(div3);
    
              var rWriter = $("<img>").attr("src","${contextPath}"+"/"+item.memberProfile).addClass("user-image rounded-circle me-2"); 
              div3.append(rWriter).append(item.memberNickName);
    
              var rDate = $("<p>").addClass("date me-2").text("작성일 : "+item.reviewDate);
    
               if (item.memberNo == loginMemberNo) { 
    
                 var ul = $("<ul>").addClass("review-action reviewBtnArea list-inline me-2");
      
                 var childLi1 = $("<li>").addClass("list-inline-item");
                 var deleteReview = $("<button>").addClass("btn btn-danger btn-sm ml-1").text("삭제").attr("id", "deleteReview").attr("onclick", "deleteReview("+item.reviewNo+")");
                 var showUpdate = $("<button>").addClass("btn btn-success btn-sm ml-1 showUpdateReview").text("수정").attr("id", "showUpdateReview");
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
              
              li.append(div1).append(lastDiv);
              
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
              var uDivBottom = $("<div>").addClass("input-group ms-2 my-2");
              var uTextarea = $("<textarea>").addClass("form-control").attr("id", "edit-review").attr("rows","5");
              var uButton = $("<button>").addClass("btn btn-outline-success").text("수정").attr("onclick", "updateReview(" + item.reviewNo + ", this)");
              uDivBottom.append(uTextarea).append(uButton);
              
              //수정창 마무리
              updateLi.append(uDivTop).append(uDivBottom);
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
        $(this).parent().parent().parent().parent().siblings("li.updateArea").slideUp(200);
        $(this).parent().parent().parent().parent().next(".updateArea").slideDown(200);
		$(this).text("닫기");
 	 }else{
	   $(this).parent().parent().parent().parent().next(".updateArea").slideUp(200); 
	   $(this).text("수정");
  	}
 /*  }); */

}); 
// ---------------------------
// 수강후기 수정 기능
function updateReview(reviewNo, el){
	
	const reviewContent = $(el).prev().val();
	
	$.ajax({
		url : "${contextPath}/onReview/updateReview",
		type : "POST",
		data : {"reviewNo" : reviewNo,
						"reviewContent" : reviewContent},
		success : function(result){
			if(result > 0 ){
				swal({"icon" : "success" , "title" : "수강후기 수정 성공"});
				selectReviewList();
			}
		},
		error : function(){
			console.log("수강후기 수정 실패");
		}
	});
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

