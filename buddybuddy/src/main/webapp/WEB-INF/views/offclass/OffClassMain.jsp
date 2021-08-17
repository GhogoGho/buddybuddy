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
<!-- font-awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
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
				<div class="row">
					<div class="col-md-12">
						<h3 class="text-left">
							<b>오프라인 클래스</b>
						</h3>
						<hr>
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
									<a href="${contextPath}/offclass/2/${list.classNo}?cp=${pagination.currentPage}${searchStr}">
										<div class="card">
											<c:choose>
												<c:when
													test="${ empty list.atList || list.atList[0].fileLevel != 0}">
													<img src="${contextPath}/resources/images/noimage.png"
														class="card-img-top" alt="..." style="width:214px;height:214px; display:block; margin:auto;margin-top:10px;">
												</c:when>
												<c:otherwise>
													<img
														src="${contextPath}/${list.atList[0].filePath}${list.atList[0].fileName}"
														class="card-img-top" alt="..." style="width:214px;height:214px; display:block; margin:auto;margin-top:10px;">
												</c:otherwise>
											</c:choose>
											<div class="card-body">
												<h5 class="card-title">${list.categoryName}</h5>
												<p class="card-text">${list.classTitle }</p>
												
											</div>
											<div class="card-footer">
											<c:choose>
												<c:when
													test="${list.memberProfile eq '(null)'}">
													<img alt="Bootstrap"
									src="${contextPath}/resources/images/noimage.png"
									width="25px" height="25px" class="rounded-circle"/>
												</c:when>
												<c:otherwise>
													<img alt="Bootstrap Image Preview"
									src="${contextPath}/${list.memberProfile}"
									width="25px" height="25px" class="rounded-circle"/>
												</c:otherwise>
											</c:choose>
												<script type="text/javascript">
													console.log("${list.memberProfile}");
												</script>
												<h5 class="card-title" style="display:inline">${list.memberNickName}</h5>
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
							<form action="list" method="get" id="searchForm">
								<select
									name="sk" aria-label="Default select example"
									style="margin-left: 35%;">

					
									
									<option value="title" selected>제목</option>
									<option value="content">내용</option>
									<option value="titcont">제목+내용</option>
									<option value="creater">크리에이터</option>

								</select> <input name="sv" type="search">
								<button id="searchbtn" class="but-style">검색</button>

							</form>
						</div>
					</div>
				</div>
				<c:if test="${loginMember.memberGrade eq 'C'}">
				 <div class="row">
                    <div class="col-md-12" style="text-align: right;">
                        <a href="insert"><button class="btn btn-primary">클래스 작성</button></a>
                    </div>
                </div>
				
				</c:if>
				
				
			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
		crossorigin="anonymous"></script>
</body>

</html>