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



<!-- font-awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- bulma -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css"
	integrity="sha512-IgmDkwzs96t4SrChW29No3NXBIBv8baW490zk5aXvhCD8vuZM3yUSkbyTBcXohkySecyzIrUwiF/qV0cuPcL3Q=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
		<!-- 상단부 -->
		<jsp:include page="../common/header.jsp"/>
	
	
		<div class="container">
      <div class="row">
        <!-- 동영상,클래스목차 -->
        <!-- <div class="row"> -->
        <div class="col-md-7">
          <div class="row">
            <video
              src="https://cdn.videvo.net/videvo_files/video/premium/video0234/large_watermarked/02_Selo_zakat_II_43_girl_run_hd_slow_preview.mp4"
              type="video/mp4" controls>
              동영상
            </video>
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
                <a href="#class-reply" class="btn">댓글</a>
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
              <img src="https://via.placeholder.com/150" width="30" height="30" class="rounded-1 float-start me-2">
              <a href="#" style="text-decoration: none;">크리에이터명</a>
            </div>
            <div class="card-body text-dark">
              <div class="row">
                <div class="col-md-9">
                  <h6 class="card-subtitle">${categoryName}</h6>
                  <h5 class="card-title">${className}</h5>
                </div>
                <div class="col-md-3 text-end">
                  <button type="button" class="btn btn-light btn-sm">
                    <i class="fas fa-heartbeat"> 찜하기</i>
                  </button>
                </div>
              </div>
              <table class="table table-striped text-center">
                <tr>
                  <td>수강 시작일</td>
                  <td>난이도</td>
                  <td>준비물</td>
                </tr>
                <tr>
                  <td>신청 즉시</td>
                  <td>쉬움</td>
                  <td>있음</td>
                </tr>
              </table>
              <p class="card-text">
                클래스 간단 소개?
                구매 옵션?
              </p>
            </div>
            <div class="card-footer bg-transparent border-dark text-center">
              <div class="row">
                <button type="button" class="btn btn-success btn-lg">수강신청</button>
              </div>
              <div class="row">
								<%-- <a href="${contextPath}/class/video">수강하기 임시</a> --%>
								<a href="${online.classNo}?cp=${pagination.currentPage}${searchStr}/video">수강하기 임시</a>
							</div>
            </div>
          </div>
        </div>
        <!-- 클래스 구매 끝 -->
        <!-- </div> -->
        <!-- </div> -->
        <!-- 클래스 소개 시작 -->
        <!-- <div class="container"> -->
        <div class="row">
          <div class="col-md-7">
            <p class="h3" id="class-introduce">클래스 소개</p>
            <p>${online.classContent }</p>
          </div>
        </div>
        <!-- </div> -->


        <!-- 수강후기 시작 -->
        <!-- <div class="container"> -->
        <div class="col-md-7">
          <p class="h3 my-4" id="class-review">수강 후기</p>
          <hr>
          <jsp:include page="onlineReview.jsp"/>
        </div>
        <!-- </div> -->
        <!-- 수강문의 시작 -->
        <!-- <div class="container mt-5"> -->
        <div class="col-md-7">
          <p class="h3 my-4" id="class-reply">수강 문의</p>
          <hr>
         	<jsp:include page="onlineReply.jsp"/>
        </div>
        <!-- </div> -->

        <!-- <div class="container mt-5"> -->
        <div class="row">
          <div class="col-md-7">
            <p class="h2" id="class-refund">취소 및 환불 정책</p>
            <hr>
          </div>
        </div>
        <div class="row mt-6">
          <div class="col-md-7">
            <table class="table table-success table-striped">
              <thead>
                <tr>
                  <th scope="col"></th>
                  <th scope="col">클래스 영상 시청 전</th>
                  <th scope="col">클래스 영상 시청 후</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td scope="row">클래스 신청 후, 7일 이내</td>
                  <td>전액 환불</td>
                  <td>사용일수에 따른.....어쩌구</td>
                </tr>
                <tr>
                  <td scope="row">클래스 신청 후, 7일 이후</td>
                  <td>이용권 판매금액에서 10% 수수료 차감 후,</td>
                  <td>환불 불가</td>
                </tr>
              </tbody>
            </table>
            <p>단, 이런저런 경우 환불이 불가능합니다...</p>
            <button id="updateBtn" class="btn btn-primary float-right mr-2" onclick="fnRequest('updateForm');">수정</button>
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
		
	</script>
	
</body>
</html>