<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>


</head>


<body>
${nList }
		
<div class="col-md-12">
	<div class="row">
	  <p class="h3 my-4" id="class-notice">공지사항</p>
	  <hr>
	</div>
  <div class="row">
	  <div class="list-group mb-3" id="noticeListArea">
	  
			<c:forEach items="${nList }" var="notice">
		  <div class="d-flex w-100 justify-content-between">
		    <h5 class="mb-1">${notice.noticeTitle}</h5>
		    <small class="text-muted"><fmt:formatDate value="${notice.noticeDate}" pattern="yyyy년 MM월 dd일 HH:mm" /></small>
		  </div>
		  <p class="mb-1">${notice.noticeContent}</p>
			<div class="row">
				<div class="col offset-11 mb-1">
					<button class="button is-danger" onclick="deleteNotice(${notice.noticeNo}, this)">삭제</button>
				</div>
				<div class="col">
					<textarea class="textarea is-success"></textarea>
   				<button class="button is-primary is-fullwidth" onclick="updateNotice(${notice.noticeNo}, this)">수정</button>
				</div>
			</div>
			<hr>
			</c:forEach>
	    
	  </div>
  	<hr>
  </div>
</div>
		



<script type="text/javascript">
	

/* const loginMemberNo = "${loginMember.memberNo}"; */


//===============================================
//공지사항 목록 삭제
function deleteNotice(noticeNo) {
	console.log("삭제누름");
	if(confirm("공지사항을 삭제하시겠습니까?")){
		$.ajax({
			url : "${contextPath}/create/1/deleteNotice",
			type : "POST",
			data : {"noticeNo" : noticeNo,
							"memberNo" : loginMemberNo},
			success : function(result){
				if(result > ){
					swal({"icon" : "success" , "title" : "공지사항 삭제 성공"});
				}
			},
			error : function(){
				console.log("공지사항 삭제 실패");
			}
			
		});
	}
}

 
//===============================================
// 공지사항 목록 조회

function selectNoticeList(){
	$.ajax({
		url : "${contextPath}/onNotice/myList",
		data : {"memberNo" : loginMemberNo},
		type : "POST",
		dataType : "JSON",
		success : function(nList){
			
			$("#noticeListArea").html("");
			
			$.each(nList, function(index, item){
				
				var topDiv = $("<div>").addClass("d-flex w-100 justify-content-between");
				var titleH5 = $("<h5>").addClass("mb-1").text(item.noticeTitle);
				var dateSmall = $("<small>").addClass("text-muted").text(item.noticeDate);
				topDiv.append(titleH5).append(dateSmall);
				
				var contentP = $("<p>").addClass("mb-1").text(item.noticeContent);
				
				var btnDiv = $("<div>").addClass("row");
				var deleteDiv = $("<div>").addClass("col offset-11 mb-1");
				var deleteBtn = $("<button>").addClass("button is-danger").text("삭제").attr("onclick", "deleteNotice(" + item.noticeNo + ", this)");
				deleteDiv.append(deleteBtn);
				var updateDiv = $("<div>").addClass("col");
				var updateText = $("<textarea>").addClass("textarea is-success");
				var updateBtn = $("<button>").addClass("button is-primary is-fullwidth").text("수정").attr("onclick", "updateNotice(" + item.noticeNo + ", this)");
				updateDiv.append(updateText).append(updateBtn);
				btnDiv.append(deleteDiv).append(updateDiv);
				
				var endHr = $("<hr>");
				
				
				$("#noticeListArea").append(topDiv).append(contentP).append(btnDiv).append(endHr);
				
			});
			
		},
		error : funtion(){
			console.log("공지사항 목록 조회 실패");
		}
	});
}
//===============================================
//공지사항 목록 수정




</script>

<!-- 인디케이터 : Indicator (Progress Bar) --> 
<script type="text/javascript" src="https://rawcdn.githack.com/mburakerman/prognroll/0feda211643153bce2c69de32ea1b39cdc64ffbe/src/prognroll.js"></script> 
<script type="text/javascript"> 
	$(function() { 
		$("body").prognroll({ 
			height: 10, 
			color: "#50b8b3" 
		}); 
		$(".content").prognroll({ 
			custom: true 
			}); 
		}); 
	
</script>	

</body>
</html>
