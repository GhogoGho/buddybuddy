<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>온라인 클래스 메인페이지</title>

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
		<%-- <jsp:include page="../common/header.jsp"/> --%>

<style>
.online-category {
	background-color: #50b8b3;
	height: 210px;
	width: 210px;
	text-align: center;
	line-height: 200px;
}

.main-img {
	height: 700px;
	width: 1166px;
}

.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: #50b8b3;
    border-color: #50b8b3;
}

.page-link {
    position: relative;
    display: block;
    color: #50b8b3;
    text-decoration: none;
    background-color: #fff;
    border: 1px solid #dee2e6;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}

</style>

		<div class="container">
			<div class="row">
				<div class="col-md-10">
					<h1 class="h3 mb-3">${memberNickName}의 클래스</h1>
				</div>
				<div class="col-md-2 mt-4">

					<div class="control has-icons-left">
						<div class="select is-large is-rounded">
							<select>
								<option selected>최신순</option>
								<option value="1">인기순</option>
								<option value="2">행복은</option>
								<option value="3">성적순</option>
							</select>
						</div>
						<span class="icon is-large is-left"> 
						<i class="fas fa-th-list"></i>
						</span>
					</div>

				</div>
				<hr>
			</div>
			<!-- 클래스 목록 -->
			<div class="row row-cols-1 row-cols-md-4 g-4">
				<c:choose>
					<c:when test="${empty individualList}">
						<p class="h3">클래스 목록X</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${individualList}" var="online">
							<div class="col">
								<div class="card h-100">
									<div class="ratio ratio-1x1">
										<c:choose>
											<c:when
												test="${ empty online.atList || online.atList[0].fileLevel != 0}">
												<img src="${contextPath}/resources/images/noimage.png">
											</c:when>
											<c:otherwise>
												<img
													src="${contextPath}/${online.atList[0].filePath}${online.atList[0].fileName}"
													class="card-img-top">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="card-body">
										<a href="${online.classNo}?cp=${pagination.currentPage}${searchStr}">
											<h6 class="card-subtitle">${online.categoryName }</h6>
											<h5 class="card-title">${online.classTitle }</h5>
										</a>
									</div>
									<div class="card-footer">
										<!-- Product reviews-->
										<div class="d-flex justify-content-center large text-warning my-1">
											<i class="fas fa-star"></i> 
											<i class="fas fa-star"></i> 
											<i class="fas fa-star"></i> 
											<i class="fas fa-star"></i> 
											<i class="fas fa-star"></i>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- 클래스 목록 끝-->


			<!-- 페이지네이션 -->
			<c:set var="pageURL" value="list"  />
			
			<c:set var="prev" value="${pageURL}?cp=${pagination.prevPage}${searchStr}" />
			<c:set var="next" value="${pageURL}?cp=${pagination.nextPage}${searchStr}" />
			
			<div class="row">
				<div class="col-md-12 mt-4">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
						
							<%-- 현재 페이지가 10페이지 초과 --%>
							<c:if test="${pagination.currentPage > pagination.pageSize }">
							<li class="page-item">
								<a class="page-link" href="${prev}" aria-label="Previous"> 
									<span aria-hidden="true">&laquo;&laquo;</span>
								</a>
							</li>
							</c:if>
							
							<%-- 현재 페이지가 2페이지 초과 --%>
							<c:if test="${pagination.currentPage > 2 }">
							<li class="page-item" >
								<a class="page-link" href="${pageURL}?cp=${pagination.currentPage - 1}${searchStr}" aria-label="Previous"> 
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
							</c:if>
							
							<%-- 페이지 목록 --%>
							<c:forEach var="p" begin="${pagination.startPage}" end="${pagination.endPage}">
								<c:choose>
									<c:when test="${p == pagination.currentPage }">
										<li class="page-item active"><a class="page-link">${p}</a></li>
									</c:when>
									
									<c:otherwise>
									<li class="page-item"><a class="page-link" href="${pageURL}?cp=${p}${searchStr}">${p}</a></li>
									</c:otherwise>
								</c:choose>		
							</c:forEach>
							
							<%-- 현재 페이지가 마지막 페이지 미만 --%>
							<c:if test="${pagination.currentPage < pagination.maxPage }">
							<li class="page-item">
								<a class="page-link" href="${pageURL}?cp=${pagination.currentPage + 1}${searchStr}" aria-label="Next"> 
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
							</c:if>
							
							<%-- 현재 페이지가 마지막 페이지가 아닌 경우 --%>
							<c:if test="${pagination.currentPage - pagination.maxPage + pagination.pageSize < 0}">
							<li class="page-item">
								<a class="page-link" href="${next}" aria-label="Next"> 
									<span aria-hidden="true">&raquo;&raquo;</span>
								</a>
							</li>
							</c:if>
							
						</ul>
					</nav>
				</div>
			</div>
			
			<!-- 검색부분 -->
			<div class="row mt-1">
				<form action="list" method="GET" id="searchForm">
					<div class="col-md-3 offset-md-9">

						<div class="control has-icons-left mb-1">
							<div class="select">
								<select name="sk">
									<option value="all" selected>검색조건</option>
									<option value="title">제목</option>
									<option value="content">내용</option>
									<option value="titcont">제목+내용</option>
									<option value="creater">크리에이터</option>
								</select>
							</div>
							<span class="icon is-large is-left"> <i
								class="fas fa-th-list"></i>
							</span>
						</div>
	
						<div class="d-flex">
							<input name="sv" class="form-control me-1" type="search" placeholder="클래스 검색" aria-label="Search">
							<button class="btn btn-danger" type="submit">Search</button>
						</div>
						
					</div>
				</form>

			</div>
		
		<div class="row">
			<a href="insert">클래스 작성</a>
		</div>
		
		<div class="row">
			<a href="write">썸머노트 작성</a>
		</div>
		
		</div>


		<!-- 하단부 -->
		<%-- <jsp:include page="../common/footer.jsp"/> --%>

</body>
</html>