<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>기본페이지</title>
</head> -->
<!-- <body>
	<main> -->
		
		<div class="col-md-12">
			<div class="row">
			  <p class="h3 my-4" id="class-notice">공지사항</p>
			  <hr>
			</div>
		  <div class="row">
			  <div class="list-group mb-3" id="noticeListArea">
			  
					<c:forEach items="${nList }" var="notice">
					<a href="#" class="list-group-item list-group-item-action">
					  <div class="d-flex w-100 justify-content-between">
					    <h5 class="mb-1">${notice.noticeTitle}</h5>
					    <small class="text-muted"><fmt:formatDate value="${notice.noticeDate}" pattern="yyyy년 MM월 dd일 HH:mm" /></small>
					  </div>
					  <p class="mb-1">${notice.noticeContent}</p>
					</a>
					<div class="row mt-3">
						<div class="col offset-11">
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
		
	<!-- </main>
</body> -->



<script>
	

const loginMemberNo = "${loginMember.memberNo}";
const noClassNo = ${notice.classNo};
const noticeNo = ${notice.noticeNo};

//===============================================
// 공지사항 목록 조회

function selectNoticeList(){
	$.ajax({
		url : "${contextPath}/onNotice/list",
		data : {"classNo" : classNo},
		type : "POST",
		dataType : "JSON",
		success : function(nList){
			
			$("#noticeListArea").html("");
			
			$.each(nList, function(index, item){
				
				var a = $("<a>").addClass("list-group-item").addClass("list-group-item-action");
				var div = $("<div>").addClass("d-flex").addClass("w-100").addClass("justify-content-between");
				var conH5 = $("<h5>").addClass("mb-1").text(item.noticeTitle);
				var small = $("<small>").addClass("text-muted").text(item.noticeDate);
				var p = $("<p>").addClass("mb-1").text(item.noticeContent);
				
				div.append(conH5).append(small);
				a.append(div).append(p);

				$("#noticeListArea").append.(a);
				
			});
			
		},
		error : funtion(){
			console.log("공지사항 목록 조회 실패");
		}
	});
}
//===============================================
//공지사항 목록 수정
	const noticeTitle = $(el).prev().val();
	const noticeContent = $(el).prev().val();
	

//===============================================
//공지사항 목록 삭제
function deleteNotice(noticeNo){
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


</script>

<!-- </html> -->