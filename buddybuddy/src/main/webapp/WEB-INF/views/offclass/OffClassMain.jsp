<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../common/header.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>main</title>


</head>

<body>

	<!-- 컨테이너 입력 부분 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div id="carouselExampleSlidesOnly" class="carousel slide"
					data-bs-ride="carousel" style="margin-bottom: 50px;">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="https://www.layoutit.com/img/sports-q-c-1600-500-1.jpg"
								class="d-block w-100" alt="...">
						</div>
					</div>
				</div>
				<div class="row" style="text-align: center; margin-bottom: 50px;">
					<div class="col-md-3">
						<a href="#"><img alt="Bootstrap Image Preview"
							src="${contextPath}/resources/images/cooking-5510047_640.png"
							width="140px" height="140" class="rounded-circle"
							style="border: 1px solid black;" /><br>요리</a>
					</div>
					<div class="col-md-3">
						<a href="#"><img alt="Bootstrap Image Preview"
							src="${contextPath}/resources/images/scissors-1332795_640.png"
							width="140px" height="140" class="rounded-circle"
							style="border: 1px solid black;" /><br>공예</a>
					</div>
					<div class="col-md-3">
						<a href="#"><img alt="Bootstrap Image Preview"
							src="${contextPath}/resources/images/paintbrush-5692621_640.png"
							width="140px" height="140" class="rounded-circle"
							style="border: 1px solid black;" /><br>미술</a>

					</div>
					<div class="col-md-3">
						<a href="#"><img alt="Bootstrap Image Preview"
							src="${contextPath}/resources/images/flower-5053686_640.png"
							width="140px" height="140" class="rounded-circle"
							style="border: 1px solid black;" /><br>플라워</a>

					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h3 class="text-left">
							<b>오프라인 클래스</b>
						</h3>
						<hr>
					</div>
				</div>
				<div class="row" style="margin-bottom: 50px;">
					<div class="col-md-12" style="text-align: right;">
						<select name="sk" aria-label="Default select example">

							<option value="number" selected>최신순</option>
							<option value="title">인기순</option>
							<option value="id">김상순</option>
							<option value="date">죽순</option>
						</select>
					</div>
				</div>
				<div class="row">
					<c:choose>
						<c:when test="${empty offList}">
							<div class="col-md-12"
								style="margin-bottom: 50px; text-align: center">게시글이 없습니다.
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${offList}" var="list">

								<div class="col-md-3" style="margin-bottom: 50px;">
									<a href="${contextPath}/offclass/2/${list.classNo}">
										<div class="card">
											<c:choose>
												<c:when
													test="${ empty list.atList || list.atList[0].fileLevel != 0}">
													<img src="${contextPath}/resources/images/noimage.png"
														class="card-img-top" alt="...">
												</c:when>
												<c:otherwise>
													<img
														src="${contextPath}/${list.atList[0].filePath}${list.atList[0].fileName}"
														class="card-img-top" alt="...">
												</c:otherwise>
											</c:choose>
											<div class="card-body">
												<h5 class="card-title">${list.categoryName}</h5>
												<p class="card-text">${list.classTitle }</p>
												<hr>
												별점 :
											</div>
										</div>
									</a>
								</div>
							</c:forEach>

						</c:otherwise>
					</c:choose>



				</div>
				<div class="row">
					<div class="col-md-12 align-items-center">
						<!-- 페이지네이션 -->
						<c:set var="pageURL" value="list" />

						<c:set var="prev"
							value="${pageURL}?cp=${pagination.prevPage}${searchStr}" />
						<c:set var="next"
							value="${pageURL}?cp=${pagination.nextPage}${searchStr}" />

						<div class="row">
							<div class="col-md-12 mt-4">
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">

										<%-- 현재 페이지가 10페이지 초과 --%>
										<c:if test="${pagination.currentPage > pagination.pageSize }">
											<li class="page-item"><a class="page-link"
												href="${prev}" aria-label="Previous"> <span
													aria-hidden="true">&laquo;&laquo;</span>
											</a></li>
										</c:if>

										<%-- 현재 페이지가 2페이지 초과 --%>
										<c:if test="${pagination.currentPage > 2 }">
											<li class="page-item"><a class="page-link"
												href="${pageURL}?cp=${pagination.currentPage - 1}${searchStr}"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
										</c:if>

										<%-- 페이지 목록 --%>
										<c:forEach var="p" begin="${pagination.startPage}"
											end="${pagination.endPage}">
											<c:choose>
												<c:when test="${p == pagination.currentPage }">
													<li class="page-item active"><a class="page-link">${p}</a></li>
												</c:when>

												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="${pageURL}?cp=${p}${searchStr}">${p}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<%-- 현재 페이지가 마지막 페이지 미만 --%>
										<c:if test="${pagination.currentPage < pagination.maxPage }">
											<li class="page-item"><a class="page-link"
												href="${pageURL}?cp=${pagination.currentPage + 1}${searchStr}"
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											</a></li>
										</c:if>

										<%-- 현재 페이지가 마지막 페이지가 아닌 경우 --%>
										<c:if
											test="${pagination.currentPage - pagination.maxPage + pagination.pageSize < 0}">
											<li class="page-item"><a class="page-link"
												href="${next}" aria-label="Next"> <span
													aria-hidden="true">&raquo;&raquo;</span>
											</a></li>
										</c:if>

									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div>
							<form action="#" method="GET" id="searchForm">
								<input type="hidden" name="type" value="2"> <select
									name="sk" aria-label="Default select example"
									style="margin-left: 35%;">

									<option value="number" selected>게시글 번호</option>
									<option value="title">게시글 제목</option>
									<option value="id">아이디</option>
									<option value="date">날짜</option>
									<option value="bl">블라인드 처리여부</option>

								</select> <input name="sv" type="search">
								<button id="searchbtn" class="but-style">검색</button>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
		crossorigin="anonymous"></script>
</body>

</html>