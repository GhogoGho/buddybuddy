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
<!-- 아임포트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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

		<!-- <p>
	    <p>아임 서포트 결제 모듈 테스트 해보기</p>
	    <button id="check_module" type="button">아임 서포트 결제 모듈 테스트 해보기</button>
		</p> -->

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
                  <td>클래스 금액</td>
                </tr>
                <tr>
                  <td>신청 즉시</td>
                  <td>있음</td>
                  <td>${online.classPrice }</td>
                </tr>
              </table>
              <c:choose>
              <c:when test="${empty online.atList}">
              <img class="ml-5" style="width:400px; height:100px;" src="https://initiate.alphacoders.com/images/772/cropped-2048-768-772726.jpg?1351">
              </c:when>
              <c:otherwise>
              <p class="card-text" style="display: inline;">
                <video style="width:142px; height:80px;" src="${video1}">
              </p>
              <p class="card-text" style="display: inline;">
                <video style="width:142px; height:80px;" src="${video2}">
              </p>
              <p class="card-text" style="display: inline;">
                <video style="width:142px; height:80px;" src="${video3}">
              </p>
              </c:otherwise>
              </c:choose>
            </div>
            <div class="card-footer bg-transparent border-dark text-center paymentArea" id="paymentArea">
            <c:choose>
            <c:when test="${empty payList}">
							<!-- <button type="button" class="button is-medium is-fullwidth is-danger is-rounded">수강신청</button> -->
							<button class="button is-medium is-fullwidth is-danger is-rounded" id="check_module" type="button">수강 신청</button>
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
            
            <c:if test="${online.memberNo == sessionScope.loginMember.memberNo}">
            <!-- <button id="updateBtn" class="button is-large is-fullwidth is-link is-rounded" onclick="fnRequest('updateForm');">수정</button> -->
            <button id="updateBtn" class="button is-large is-fullwidth is-link is-rounded" onclick="fnRequest('updateSF');">클래스 수정</button>
            <button id="deleteBtn" class="button is-large is-fullwidth is-dark is-rounded" onclick="fnRequest('delete');">삭제</button>
            </c:if>
          </div>
        </div>
      </div>
    </div>	
	
	<!-- 클래스 신고 -->
	<div class="row">
		<div class="col-md-12" style="text-align: right;">
			<!-- Button trigger modal -->
			<c:if test="${!empty loginMember }">
			<button type="button" class="btn btn-primary main-btn-color"
				data-bs-toggle="modal" data-bs-target="#exampleModal">클래스
				신고</button>
			</c:if>
	
			<!-- Modal -->
			<div class="modal" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">클래스 신고</h5>
							<button type="button" class="btn-close main-btn-color"
								data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body" style="height: 300px;">
							<div class="form-floating">
								<textarea id="sinClass" class="form-control h-25"
									placeholder="Leave a comment here" id="floatingTextarea2x"
									rows="10" style="height: 100px; resize: none;"></textarea>
								<label for="floatingTextarea2x">클래스 신고 내용</label>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary main-btn-color"
								data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary main-btn-color" onclick="sinClass()">신고</button>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
		
<!-- 클래스 신고 -->
<script>
function sinClass(){
	console.log("클래스 신고 동작")
	reportContent=$('#sinClass').val();
	sinMemberNo = "${online.memberNo}";
	sinClassNo = "${online.classNo}";
	$.ajax({
		url:"${contextPath}/reserve/sinClass",
		type:"POST",
		data:{"classNo": sinClassNo,
			  "reportContent": reportContent,
			  "memberNo" : sinMemberNo
		},
		success:function(result){
			if(result>0){
				swal({
					icon : "success",
					title: "클래스 신고 완료"
				});
			}
		},
		error:function(){
			console.log("ajax통신 실패");
		}
	});
}
</script>	
	
	
	
		<!-- 하단부 -->
		<jsp:include page="../common/footer.jsp"/>
	<form action="#" method="POST" name="requestForm">
		<input type="hidden" name="classNo" value="${online.classNo}">
		<input type="hidden" name="cp" value="${param.cp}">
	</form>

<!-- 아임포트 JS -->	
<script>
$("#check_module").click(function () {
var IMP = window.IMP; // 생략가능
IMP.init('imp55115856');
// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
IMP.request_pay({
pg: 'inicis', // version 1.1.0부터 지원.
/*
'kakao':카카오페이,
html5_inicis':이니시스(웹표준결제)
'nice':나이스페이
'jtnet':제이티넷
'uplus':LG유플러스
'danal':다날
'payco':페이코
'syrup':시럽페이
'paypal':페이팔
*/
pay_method: 'card',
/*
'samsung':삼성페이,
'card':신용카드,
'trans':실시간계좌이체,
'vbank':가상계좌,
'phone':휴대폰소액결제
*/
merchant_uid: 'merchant_' + new Date().getTime(),
/*
merchant_uid에 경우
https://docs.iamport.kr/implementation/payment
위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
참고하세요.
나중에 포스팅 해볼게요.
*/
name: '${online.classTitle}',
//결제창에서 보여질 이름
amount: ${online.classPrice},
//가격
buyer_email: '${loginMember.memberEmail}',
buyer_name: '${online.memberNickName}',
buyer_tel: '010-0000-0000',
buyer_addr: '서울특별시 강남구 삼성동',
buyer_postcode: '123-456',
m_redirect_url: 'https://www.yourdomain.com/payments/complete'
/*
모바일 결제시,
결제가 끝나고 랜딩되는 URL을 지정
(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
*/
}, function (rsp) {
console.log(rsp);
if (rsp.success) {
	$.ajax({
		url : "${contextPath}/summer/payment",
		type : "POST",
		data : {"classNo":${online.classNo},
						"memberNo":${loginMember.memberNo},
						"classPrice":${online.classPrice}
						},
		dataType : "JSON",
		success : function(result){
			console.log("결제 왔다리갔다리"+result);
			
			if(result>0){
				$("#paymentArea").html(""); // 비우기
				var videoPageBtn = $("<button>").attr("type", "button").attr("id", "videoBtn").addClass("button is-medium is-fullwidth is-dark is-rounded").attr("onclick", "fnRequest('video')").text("수강하기");
				$("#paymentArea").append(videoPageBtn);
				/* $.each(online, function(index, item){ */
				/* }); */
			}
			
			/* if(result>0){
				$.ajax({
					url : "${contextPath}/summer/paymentList",
					type : "POST",
					data : {"classNo" : ${classNo}
									
					},
					dataType : "JSON",
					success : function(onPayment){
						console.log("onPayment : "+onPayment);
						$("#paymentArea").html(""); // 비우기
						$.each(onPayment, function(index, item){
							var videoPageBtn = $("<button>").attr("type", "button").attr("id", "videoBtn").addClass("button is-medium is-fullwidth is-dark is-rounded").text("수강하기");
							$("#paymentArea").append(videoPageBtn);
						}
					}
				});
				
			} */
			
		},
		error : function(){
			console.log("구매 목록 조회 실패2");
		}
	});
	
	
	
var msg = '결제가 완료되었습니다.';
msg += '고유ID : ' + rsp.imp_uid;
msg += '상점 거래ID : ' + rsp.merchant_uid;
msg += '결제 금액 : ' + rsp.paid_amount;
msg += '카드 승인번호 : ' + rsp.apply_num;
} else {
var msg = '결제에 실패하였습니다.';
msg += '에러내용 : ' + rsp.error_msg;
}
alert(msg);
});
});
</script>

	
	
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