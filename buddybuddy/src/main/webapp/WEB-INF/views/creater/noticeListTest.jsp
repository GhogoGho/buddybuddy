<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
    .online-notice-content .updateArea {
      display: none;
      list-style-type: none;
    }
</style>

<div class="noticeList">
  <ul class="online-notice-content list-group col-md-12" id="noticeListArea">
  <c:forEach items="${nList}" var="notice">
    <li class="list-group-item">
      <div class="d-flex justify-content-between align-items-center">
        <div class="ms-2 me-auto">
          <div class="fw-bold">
          ${notice.noticeTitle}
          </div>
        </div>
        <p class="date me-2">작성일 : <fmt:formatDate value="${notice.noticeDate}" pattern="yyyy년 MM월 dd일 HH:mm" /></p>
        <ul class="notice-action noticeBtnArea list-inline me-2">
          <li class="list-inline-item">
            <button class="button is-danger is-small ml-1" id="deleteNotice" onclick="deleteNotice(${notice.noticeNo})">삭제</button><button class="button is-link is-small is-rounded ml-1 showUpdateNotice" id="showUpdateNotice">수정</button>
          </li>
        </ul>
      </div>
      <div class="ms-2">${notice.noticeContent }</div>
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
				<input class="input mb-3" type="text" placeholder="제목을 입력해 주세요.">
        <textarea class="edit-notice form-control" rows="3"></textarea>
        <button class="button is-link is-fullwidth" onclick="updateNotice(${notice.noticeNo}, this)">수정</button>
      </div>
    </li>
  </c:forEach>
	</ul>
</div>
<hr>

		

<script>
const loginMemberNo = "${loginMember.memberNo}";

//-----------------------------------------------------------------------------------------
//공지사항 목록 조회
function selectNoticeList(){
    $.ajax({ 
     url : "${contextPath}/onNotice/myList",
     data : {"memberNo" : loginMemberNo},
     type : "POST",
     dataType : "JSON",  
     success : function(nList){
       /* console.log(nList); */
       
            $("#noticeListArea").html(""); 
            
            
            $.each(nList, function(index, item){
            	
    
              var li = $("<li>").addClass("list-group-item");
    
              var div1 = $("<div>").addClass("d-flex justify-content-between align-items-center");
              var lastDiv = $("<div>").addClass("ms-2").html(item.noticeContent);
              var div2 = $("<div>").addClass("ms-2 me-auto");
    
              var div3 = $("<div>").addClass("fw-bold");
              div2.append(div3);
    
              div3.append(item.noticeTitle);
    
              var rDate = $("<p>").addClass("date me-2").text("작성일 : "+item.noticeDate);
    
    
							var ul = $("<ul>").addClass("notice-action noticeBtnArea list-inline me-2");
							
							var childLi1 = $("<li>").addClass("list-inline-item");
							var deleteNotice = $("<button>").addClass("button is-danger is-small ml-1").text("삭제").attr("id", "deleteNotice").attr("onclick", "deleteNotice("+item.noticeNo+")");
							var showUpdate = $("<button>").addClass("button is-link is-small is-rounded ml-1 showUpdateNotice").text("수정").attr("id", "showUpdateNotice");
							childLi1.append(deleteNotice).append(showUpdate);
							
							ul.append(childLi1);
    
              div1.append(div2).append(rDate).append(ul);
    
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
              
              var uDivBottom = $("<div>").addClass("input-group ms-2 my-2");
              var noTitleInput = $("<input>").addClass("input mb-3").attr("type", "text").attr("placeholder", "제목을 입력해 주세요.");
              var uTextarea = $("<textarea>").addClass("form-control").attr("id", "edit-notice").attr("rows","5");
              var uButton = $("<button>").addClass("button is-link is-fullwidth").text("수정").attr("onclick", "updateNotice(" + item.noticeNo + ", this)");
              uDivBottom.append(noTitleInput).append(uTextarea).append(uButton);
              
              //수정창 마무리
              updateLi.append(uDivTop).append(uDivBottom);
            //수정창 끝-------------------------------------------------------------------------------------------
              
              $("#noticeListArea").append(li).append(updateLi);
              
            });
       
     },
     
     error : function(){
       console.log("댓글 목록 조회 실패");
     }
     
    });
}
// ---------------------------
// 공지사항 수정창 여닫
$(document).on("click", ".showUpdateNotice", function(){ // 동적 요소가 적용된 후에도 동작함
	
 	if($(this).parent().parent().parent().parent().next(".updateArea").css("display") == "none" ){
       $(this).parent().parent().parent().parent().siblings("li.updateArea").slideUp(200);
       $(this).parent().parent().parent().parent().next(".updateArea").slideDown(200);
	$(this).text("닫기");
	 }else{
   $(this).parent().parent().parent().parent().next(".updateArea").slideUp(200); 
   $(this).text("수정");
 	}

}); 
// ---------------------------
// 공지사항 수정 기능
function updateNotice(noticeNo, el){
	const noticeTitle = $(el).prev().prev().val();
	const noticeContent = $(el).prev().val();
	
	$.ajax({
		url : "${contextPath}/onNotice/updateNotice",
		type : "POST",
		data : {"noticeNo" : noticeNo,
				"noticeTitle" : noticeTitle,
				"noticeContent" : noticeContent},
		success : function(result){
			if(result > 0 ){
				swal({"icon" : "success" , "title" : "공지사항 수정 성공"});
				selectNoticeList();
			}
		},
		error : function(){
			console.log("공지사항 수정 실패");
		}
	});
}
// ---------------------------
// 공지사항 삭제 기능
function deleteNotice(noticeNo){
	if(confirm("공지사항을 삭제하시겠습니까?")){
  		
        $.ajax({
          url :"${contextPath}/onNotice/deleteNotice",
          type : "POST",
          data : {"noticeNo" : noticeNo},
          success : function(result){
            if(result > 0){
            	swal({"icon" : "success" , "title" : "공지사항 삭제 성공"});
              selectNoticeList();
            }
          },
          error : function(){
            console.log("공지사항 삭제 실패");
          }
    	});
	}
}


</script>

