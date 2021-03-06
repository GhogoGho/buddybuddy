<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
    .online-reply-content .updateArea {
      display: none;
      list-style-type: none;
    }
</style>

<div class="replyList">
   <ul class="online-reply-content list-group col-md-12" id="replyListArea">
   <c:forEach items="${rList}" var="reply">
     <li class="list-group-item">
       <div class="d-flex justify-content-between align-items-center">
         <div class="ms-2 me-auto">
           <div class="fw-bold">
             <img src="${contextPath}/${reply.memberProfile}" class="user-image rounded-circle me-2">${reply.memberNickName}
           </div>
         </div>
         <p class="date me-2">작성일 : <fmt:formatDate value="${reply.replyDate}" pattern="yyyy년 MM월 dd일 HH:mm" /></p>
         <c:if test="${reply.memberNo == sessionScope.loginMember.memberNo}">
         <ul class="reply-action replyBtnArea list-inline me-2">
           <li class="list-inline-item">
             <button class="button is-danger is-small ml-1" id="deleteReply" onclick="deleteReply(${reply.replyNo})">삭제</button><button class="button is-link is-small is-rounded ml-1 showUpdateReply" id="showUpdateReply">수정</button>
           </li>
         </ul>
         </c:if>
         <%-- <button class="btn btn-outline-secondary btn-sm" id="reply-like-btn">
           <%-- <i class="bi bi-heart" id="reply-like"><span id="reply-like-count">${reply.replyLike }</span></i> 
           <i class="bi bi-heart" id="reply-like">${reply.replyLike }</i>
         </button>--%>
       </div>
       <div class="ms-2">${reply.replyContent }</div>
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
         <textarea class="edit-reply form-control" rows="3"></textarea>
         <button class="button is-link is-fullwidth" onclick="updateReply(${reply.replyNo}, this)">수정</button>
       </div>
     </li>
   </c:forEach>
 </ul>
</div>
<hr>
 <div class="replyWrite col-md-12">
 <h4 class="h5">수강 문의 작성</h4>
 <div class="input-group my-2" id="replyContentArea">
		<textarea class="form-control" id="replyContent" rows="3"></textarea>
		<button class="button is-success is-outlined is-large is-fullwidth" id="addReply" onclick="addReply();">
			<span class="icon is-small">
      <i class="fas fa-check"></i>
	    </span>
	    <span>작성</span>
		</button>
 </div>
</div>

		

<script>
/* const loginMemberNo = "${loginMember.memberNo}";
const classNo = ${online.classNo}; */

let beforeReplyRow; 
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
//해당 게시글 수강문의 목록 조회
function selectReplyList(){
    $.ajax({ 
     url : "${contextPath}/onReply/list",
     data : {"classNo" : classNo},
     type : "POST",
     dataType : "JSON",  
     success : function(rList){
       /* console.log(rList); */
       
            //$("#replyListArea").html(""); 1
            $("#replyListArea").html(""); 
            
            
            $.each(rList, function(index, item){
            	
              // console.log(item.userNickname); 
              //var topDiv = $("<div>").addClass("replyList mt-5 pt-2");
          	  //var topUl = $("<ul>").addClass("qna-reply-content list-group col-md-9").attr("id", "replyListArea");
    
              var li = $("<li>").addClass("list-group-item");
    
              var div1 = $("<div>").addClass("d-flex justify-content-between align-items-center");
              var lastDiv = $("<div>").addClass("ms-2").html(item.replyContent);
              var div2 = $("<div>").addClass("ms-2 me-auto");
    
              var div3 = $("<div>").addClass("fw-bold");
              div2.append(div3);
    
              var rWriter = $("<img>").attr("src","${contextPath}"+"/"+item.memberProfile).addClass("user-image rounded-circle me-2"); 
              div3.append(rWriter).append(item.memberNickName);
    
              var rDate = $("<p>").addClass("date me-2").text("작성일 : "+item.replyDate);
    
               if (item.memberNo == loginMemberNo) { 
    
                 var ul = $("<ul>").addClass("reply-action replyBtnArea list-inline me-2");
      
                 var childLi1 = $("<li>").addClass("list-inline-item");
                 var deleteReply = $("<button>").addClass("button is-danger is-small ml-1").text("삭제").attr("id", "deleteReply").attr("onclick", "deleteReply("+item.replyNo+")");
                 var showUpdate = $("<button>").addClass("button is-link is-small is-rounded ml-1 showUpdateReply").text("수정").attr("id", "showUpdateReply");
                 childLi1.append(deleteReply).append(showUpdate);
      
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
              var uTextarea = $("<textarea>").addClass("form-control").attr("id", "edit-reply").attr("rows","5");
              var uButton = $("<button>").addClass("button is-link is-fullwidth").text("수정").attr("onclick", "updateReply(" + item.replyNo + ", this)");
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
              
              $("#replyListArea").append(li).append(updateLi);
              
            });
       
     },
     
     error : function(){
       console.log("댓글 목록 조회 실패");
     }
     
    });
}
// ---------------------------
// 수강문의 수정창 여닫
$(document).on("click", ".showUpdateReply", function(){ // 동적 요소가 적용된 후에도 동작함
	
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


</script>

