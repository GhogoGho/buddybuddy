<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>크리에이터 클래스 목록</title>
</head>
<body>
	<main>
		<!-- 클래스 부분 -->
			<div class="row">
				<div class="col-md-10">
					<h1 class="h3 mb-3">${member.memberNickName} ${pagination.className} 클래스</h1>
				</div>
				<div class="col-md-2 mt-4">

					<!-- <div class="control has-icons-left">
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
					</div> -->

				</div>
				<hr>
			</div>
			<!-- 클래스 목록 -->
			<div class="row row-cols-1 row-cols-md-5 g-3">
				<c:choose>
					<c:when test="${empty classList}">
						<p class="h3">클래스 목록이 없습니다.</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${classList}" var="classList">
							<div class="col">
								<div class="card h-100">
									<div class="ratio ratio-1x1">
										<c:choose>
											<c:when test="${ empty classList.atList || classList.atList[0].fileLevel != 0}">
												<img src="${contextPath}/resources/images/noimage.png">
											</c:when>
											<c:otherwise>
												<video
													src="${contextPath}/${classList.atList[0].filePath}${classList.atList[0].fileName}"
													class="card-img-top">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="card-body">
										<a href="${classList.classNo}?cp=${pagination.currentPage}${searchStr}">
											<h6 class="card-subtitle">${classList.categoryName }</h6>
											<h5 class="card-title">${classList.classTitle }</h5>
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
			<c:set var="pageURL" value="main"  />
			
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
							
							<%-- 현재 페이지가 1페이지 초과 --%>
							<c:if test="${pagination.currentPage > 1 }">
							<li class="page-item">
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
			<!--<div class="row mt-1">
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

			</div> -->

	</main>
</body>
</html>