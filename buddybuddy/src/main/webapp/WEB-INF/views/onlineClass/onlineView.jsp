<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>온라인 클래스 소개 페이지</title>


<!-- bulma -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css"
	integrity="sha512-IgmDkwzs96t4SrChW29No3NXBIBv8baW490zk5aXvhCD8vuZM3yUSkbyTBcXohkySecyzIrUwiF/qV0cuPcL3Q=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- font-awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
#online-like{
 color: #dc3545; 
 background: none;

}
</style>
</head>
<body>
		<!-- 상단부 -->
		<jsp:include page="../common/header.jsp"/>

	
		<div class="container">
		<c:forEach items="${online.atList}" var="at">
						<c:choose>
							<c:when test="${at.fileLevel == 0 && !empty at.fileName}">
								<c:set var="video0" value="${contextPath}/${at.filePath}${at.fileName}"/>
							</c:when>
							<c:when test="${at.fileLevel == 1 && !empty at.fileName}">
								<c:set var="video1" value="${contextPath}/${at.filePath}${at.fileName}"/>
							</c:when>
							<c:when test="${at.fileLevel == 2 && !empty at.fileName}">
								<c:set var="video2" value="${contextPath}/${at.filePath}${at.fileName}"/>
							</c:when>
							<c:when test="${at.fileLevel == 3 && !empty at.fileName}">
								<c:set var="video3" value="${contextPath}/${at.filePath}${at.fileName}"/>
							</c:when>
						</c:choose>
					</c:forEach>
      <div class="row">
        <!-- 동영상,클래스목차 -->
        <div class="col-md-7">
          <div class="row">
          	<c:if test="${!empty video0 }">
            <video src="${video0}" controls>
              동영상
            </video>
          	</c:if>
          </div>
          <hr>
          <!-- 네이게이션 메뉴 -->
          <table class="table table-borderless text-center">
            <tr>
              <td>
                <a href="#class-introduce" class="btn">클래스 소개</a>
              </td>
              <td>
                <a href="#class-review" class="btn">수강 후기</a>
              </td>
              <td>
                <a href="#class-reply" class="btn">수강 문의</a>
              </td>
              <td>
                <a href="#class-refund" class="btn">환불 정책</a>
              </td>
            </tr>
          </table>
          <hr>
        </div>
        <!-- 클래스 구매 -->
        <div class="col-md-5 sticky-md-top">
          <div class="card border-dark mb-3" id="payment-class" style="max-width: 30rem; height: 25rem;">
            <div class="card-header bg-transparent border-dark">
            <c:choose>
            	<c:when test="${!empty online.memberProfile }">
              <img src="${online.memberProfile }" width="30" height="30" class="rounded-1 float-start me-2">
            	</c:when>
            	<c:otherwise>
              <img src="${contextPath}/resources/images/noimage.png" width="30" height="30" class="rounded-1 float-start me-2">
            	</c:otherwise>
            </c:choose>
              <%-- <a href="${contextPath}/class/1/${online.memberNo}/individualList" style="text-decoration: none;">${online.memberNickName}</a> --%>
              <a href="${contextPath}/class/1/${online.memberNo}/individualList" style="text-decoration: none; pointer-events: none;">${online.memberNickName}</a>
            </div>
            <div class="card-body text-dark">
              <div class="row">
                <div class="col-md-9">
                  <h6 class="card-subtitle">${categoryName}</h6>
                  <h5 class="card-title">${className}</h5>
                </div>
                <div class="col-md-3 text-end mb-1">
                  <button type="button" class="btn btn-light btn-sm" id="online-like-btn">
                    <i class="fas fa-heart-broken" id="online-like"> 찜하기</i>
                    <%-- <span id="online-like-count">${online.onlineLike }</span> --%>
                  </button>
                </div>
              </div>
              <table class="table table-striped text-center">
                <tr>
                  <td>수강 시작일</td>
                  <td>준비물</td>
                </tr>
                <tr>
                  <td>신청 즉시</td>
                  <td>있음</td>
                </tr>
              </table>
              <p class="card-text" style="display: inline;">
                <video style="width:142px; height:80px;" src="${video1}">
              </p>
              <p class="card-text" style="display: inline;">
                <video style="width:142px; height:80px;" src="${video2}">
              </p>
              <p class="card-text" style="display: inline;">
                <video style="width:142px; height:80px;" src="${video3}">
              </p>
            </div>
            <div class="card-footer bg-transparent border-dark text-center">
            <c:choose>
            <c:when test="${a == 0}">
							<button type="button" class="button is-medium is-fullwidth is-danger is-rounded">수강신청</button>
						</c:when>	
						<c:otherwise>
							<button type="button" id="videoBtn" class="button is-medium is-fullwidth is-dark is-rounded" onclick="fnRequest('video');">수강하기</button>
						</c:otherwise>
            </c:choose>
            </div>
          </div>
        </div>
        <!-- 클래스 구매 끝 -->
        <!-- 클래스 소개 시작 -->
        <div class="row">
          <div class="col-md-7">
            <p class="h3" id="class-introduce">클래스 소개</p>
            <p>${online.classContent }</p>
          </div>
        </div>


        <!-- 수강후기 시작 -->
        <div class="col-md-7">
          <p class="h3 my-4" id="class-review">수강 후기</p>
          <hr>
          <jsp:include page="onlineReview.jsp"/>
        </div>
        <!-- 수강문의 시작 -->
        <div class="col-md-7">
          <p class="h3 my-4" id="class-reply">수강 문의</p>
          <hr>
         	<%-- <jsp:include page="onlineReply.jsp"/> --%>
         	<jsp:include page="onlineReplyBulma.jsp"/>
        </div>

        <div class="row">
          <div class="col-md-7">
            <p class="h2" id="class-refund">취소 및 환불 정책</p>
            <hr>
          </div>
        </div>
        <div class="row mt-6">
          <div class="col-md-7">
            <table class="table table-light table-striped">
              <thead>
                <tr>
                  <th scope="col">환불 기간</th>
                  <th scope="col">환불 금액</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td scope="row">클래스 5일 전 취소 시</td>
                  <td>100% 환불</td>
                </tr>
                <tr>
                  <td scope="row">클래스 4일 전 취소 시</td>
                  <td>클래스 금액의 5% 차감 후 환불</td>
                </tr>
                <tr>
                  <td scope="row">클래스 3일 전 취소 시</td>
                  <td>클래스 금액의 10% 차감 후 환불</td>
                </tr>
                <tr>
                  <td scope="row">클래스 2일 전 취소 시</td>
                  <td>클래스 금액의 20% 차감 후 환불</td>
                </tr>
                <tr>
                  <td scope="row">클래스 1일 전 취소 시</td>
                  <td>클래스 금액의 30% 차감 후 환불</td>
                </tr>
                <tr>
                  <td scope="row">클래스 당일 취소나 불참 시</td>
                  <td>환불 불가</td>
                </tr>
                <tr>
                  <td scope="row">예약 당일 밤 12시 이전 취소 시</td>
                  <td>100% 환불</td>
                </tr>
              </tbody>
            </table>
            <p>단, 이런저런 경우 환불이 불가능합니다...</p>
            <c:if test="${online.memberNo == sessionScope.loginMember.memberNo}">
            <!-- <button id="updateBtn" class="button is-large is-fullwidth is-link is-rounded" onclick="fnRequest('updateForm');">수정</button> -->
            <button id="updateBtn" class="button is-large is-fullwidth is-link is-rounded" onclick="fnRequest('updateSF');">클래스 수정</button>
            <button id="deleteBtn" class="button is-large is-fullwidth is-dark is-rounded" onclick="fnRequest('delete');">삭제</button>
            </c:if>
          </div>
        </div>
      </div>
    </div>	
	
	
		<!-- 하단부 -->
		<jsp:include page="../common/footer.jsp"/>
	<form action="#" method="POST" name="requestForm">
		<input type="hidden" name="classNo" value="${online.classNo}">
		<input type="hidden" name="cp" value="${param.cp}">
	</form>
	
	
	
	
<script>
function fnRequest(addr){
	document.requestForm.action = addr;
	document.requestForm.submit();
}
	
/* 찜하기 */
const loginMemberNo = "${loginMember.memberNo}";
const classNo = ${online.classNo};
/* let onlineLike = ${online.onlineLike}; */

onlineLikeCheck(); // 찜하기 체크(페이지가 로드되면서 작동)

/* 찜하기 체크 */
function onlineLikeCheck(){ 
	
	let flag = false;
	$.ajax({
		url : "${contextPath}/onLike/onlineLikeCheck",
		data : {"classNo" : classNo},
		type : "POST",
		dataType : "JSON",
		
		success : function(mList){
			$.each(mList, function(index, item){
				
				if(item.memberNo == loginMemberNo){
					flag = true;
				}
			});
			if(flag){
				$("#online-like-btn").html("");
				var i = $("<i>").addClass("fas fa-heartbeat").attr("id", "online-like").text(" 찜하기");
				/* var span = $("<span>").attr("id", "online-like-count").text(onlineLike); */
				
				/* $("#online-like-btn").append(i).append(span); */
				$("#online-like-btn").append(i);
			}
		},
		error : function(e){
			console.log(e);
		}
	});
}

$("#online-like-btn").on("click", function(){
	
	//console.log("작동?");
	
	$.ajax({
		url : "${contextPath}/onLike/onlineLike",
		data : {"classNo" : classNo},
		type : "POST",
		success : function(onLike){
		console.log(onLike); // 객체 값 확인용
			if(onLike == ""){ // null 대신 빈문자열을 반환하므로
				$("#online-like-btn").html("");
				var i = $("<i>").addClass("fas fa-heartbeat").attr("id", "online-like").text(" 찜하기");
				/* var span = $("<span>").attr("id", "online-like-count").text(onlineLike); */
				
				/* $("#online-like-btn").append(i).append(span); */
				$("#online-like-btn").append(i);
				
			}else { 
				$("#online-like-btn").html("");
				var i = $("<i>").addClass("fas fa-heart-broken").attr("id", "online-like").text(" 찜하기");
				/* var span = $("<span>").attr("id", "online-like-count").text(onlineLike); */
				
				/* $("#online-like-btn").append(i).append(span); */
				$("#online-like-btn").append(i);
			}
			/* onlineLikeCount(); */ //찜하기 수 카운트용
		},
		error : function(e){
			console.log(e);
		}
	});
});

// 찜하기 수 카운트용
/*
function onlineLikeCount(){
	
	$.ajax({
		url : "${contextPath}/onLike/onlineLikeCount",
		data : {"classNo" : classNo},
		type : "POST",
		
		success : function(result){
			$("#online-like-count").text(result);
		},
		error : function(e){
			console.log(e);
		}
	});
}
*/

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