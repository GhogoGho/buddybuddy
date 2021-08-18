<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>문의사항 관리</title>
    
    <link href="${contextPath}/resources/admin/css/styles.css" rel="stylesheet" />
    
	<link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" type="text/css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css" type="text/css" rel="stylesheet">
    
    <!-- Fontfaces CSS-->
	<link href="${contextPath}/resources/admin/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
	<link href="${contextPath}/resources/admin/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
	
	<!-- Bootstrap CSS-->
	<link href="${contextPath}/resources/admin/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
	
	
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
		crossorigin="anonymous">
	
	<!-- Bootstrap core JS -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
		crossorigin="anonymous"></script>
	
	<!-- sweetalert API 추가 -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    
	<style type="text/css">
	
	table{
	
		text-align: center;
		line-height: 45px;
	}
	
	a{
		text-decoration: none;
		color: black;
	}
	
	.mb-3{
		border: 1px solid #ced4da;
		padding: 10px;
		background-color: #e9ecef;
		border-radius: .25rem;
	}
	
  	textarea{
        resize: none;
    }
    
   	body{
		font-family: 'Gowun Dodum', sans-serif;
	}
	</style>
    
</head>

<body class="sb-nav-fixed">

	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="${contextPath}/admin/main">BUDDY BUDDY</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0"></form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">Logout</a></li>
				</ul>
			</li>
		</ul>
	</nav>

	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">시작</div>
						<a class="nav-link" href="${contextPath}/admin/main">
							<div class="sb-nav-link-icon">
								<i class="fas fa-location-arrow"></i>
							</div> 메인페이지
						</a>
						<div class="sb-sidenav-menu-heading">회원</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#member" aria-expanded="false"
							aria-controls="member"> 회원관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="member" aria-labelledby="headingOne"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${contextPath}/admin/memberSearch">회원목록조회</a>
								<a class="nav-link" href="${contextPath}/admin/memberSecession">회원탈퇴</a>
								<a class="nav-link" href="${contextPath}/admin/memberCreator">크리에이터 승인</a>
							</nav>
						</div>

						<div class="sb-sidenav-menu-heading">게시판</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#border" aria-expanded="false"
							aria-controls="border"> 게시판 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="border" aria-labelledby="headingOne"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${contextPath}/admin/notiBoard">공지사항</a> 
								<a class="nav-link" href="${contextPath}/admin/faqBoard">FAQ</a>
							</nav>
						</div>

<%-- 						<div class="sb-sidenav-menu-heading">신고</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#report" aria-expanded="false"
							aria-controls="report"> 신고 접수
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="report" aria-labelledby="headingOne"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${contextPath}/admin/boardRepot">게시글</a>
							</nav>
						</div> --%>

						<div class="sb-sidenav-menu-heading">문의사항</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#question" aria-expanded="false"
							aria-controls="question"> 문의사항
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="question" aria-labelledby="headingOne"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${contextPath}/admin/qnaList">문의사항 내역 조회</a>
							</nav>
						</div>
					</div>
				</div>
			</nav>
		</div>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">문의사항 내역 조회</h1>
					<ol class="breadcrumb mb-4"></ol>
				
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 문의사항 관리
						</div>
						<div class="card-body">
							<table id="datatablesSimple"  class="table table-dark table-hover" >
								<thead>
									<tr>
										<th>문의번호</th>
										<th>제목</th>
										<th>문의날짜</th>
										<th>회원번호</th>
										<th>닉네임</th>
										<th>상태(답변 전:N/후:Y)</th>
										<th>답변날짜</th>
										<th></th>
									</tr>
								</thead>
								<%-- 게시글 목록 출력 --%>
								<tbody>

									<c:forEach items="${qnaList}" var="qna" varStatus="status">
									
										<tr>
											
											<%-- 문의 번호 --%>
											<td>${qna.queNo}</td>

											<%-- 제목 --%>
											<td>${qna.queTitle}</td>

											<%-- 문의날짜 --%>
											<td><fmt:formatDate var="queCreateDate"
													value="${qna.queCreateDate}" pattern="yyyy-MM-dd" />
												${queCreateDate}</td>
												
											<%-- 회원번호 --%>
											<td>${qna.memberNo}</td>
											
											<%-- 닉네임 --%>
											<td>${qna.memberNickname}</td>

											<%-- 상태 --%>
											<td>${qna.queStatus}</td>
											
											<%-- 답변날짜 --%>
											<td><fmt:formatDate var="answerDate"
													value="${qna.answerDate}" pattern="yyyy-MM-dd" />
												${answerDate}</td>
											
											<td>
												<button type="button" class="btn btn-info" value="${qna.queNo}" data-toggle="modal" 
													href="#modal-container-${status.index}">답변
												</button> 
											</td>
											
										</tr>
										
																				
										<div class="modal fade" id="modal-container-${status.index}" role="dialog"
											aria-labelledby="myModalLabel" aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
									
													<div class="card">
														<div class="card-header">
															<strong>Q&A</strong> 1:1문의
														</div>
														<div class="card-body card-block">
															<form action="${contextPath}/admin/qnaAnswerUpdate" method="post"
																class="form-horizontal">
																<div class="row form-group">
																	<div class="col col-md-3">
																		<label class=" form-control-label">작성자</label>
																	</div>
																	<div class="col-12 col-md-9">
																		<p class="form-control-static">${qna.memberNickname}</p>
																	</div>
																</div>
																<div class="row form-group">
																	<div class="col col-md-3">
																		<label for="text-input" class=" form-control-label">제목</label>
																	</div>
																	<div class="col-12 col-md-9">
																		<input type="text" id="text-input"
																			class="form-control" readonly="readonly" value="${qna.queTitle}" />
																	</div>
																</div>
																<div class="row form-group">
																	<div class="col col-md-3">
																		<label for="textarea-input" class=" form-control-label">내용</label>
																	</div>
																	<div class="col-12 col-md-9">
																		<div class="mb-3"><pre>${qna.queContent}</pre></div>
																		<small class="form-text text-muted">* 해당 문의 내용은 관리자에게만
																			전달됩니다</small>
																	</div>
																</div>
																<c:choose>
																	<c:when test="${ empty qna.answerContent }">
																		<div class="row form-group">
																			<div class="col col-md-3">
																				<label for="textarea-input"
																					class=" form-control-label">답변</label>
																			</div>
																			<div class="col-12 col-md-9">
																				<textarea name="answerContent" id="textarea-input"
																					rows="9" placeholder="답변을 입력해주세요."
																					class="form-control" required="required"></textarea>
																			</div>
																		</div>
																		<div class="card-footer">
																			<input type="hidden" name="queNo" value="${qna.queNo}">

																			<button type="submit" class="btn btn-primary btn-sm">
																				답변하기
																			</button>
																			<button type="reset" class="btn btn-danger btn-sm">
																				내용 지우기
																			</button>
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="row form-group">
																			<div class="col col-md-3">
																				<label for="textarea-input"
																					class=" form-control-label">답변</label>
																			</div>
																			<div class="col-12 col-md-9">
																				<div class="mb-3">
																					<pre>${qna.answerContent}</pre>
																				</div>
																			</div>
																		</div>
																	</c:otherwise>
																</c:choose>

															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; BuddyBuddy</div>
						<div>
							<a href="#">위로</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	
    <script>
    
        var table = $('#datatablesSimple').DataTable({
            "language": {
                "emptyTable": "데이터가 없습니다.",
                "lengthMenu": "_MENU_ 개씩 보기",
                "info": "현재 _START_ - _END_ / 총 _TOTAL_건 조회됨",
                "infoEmpty": "데이터 없음",
                "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
                "search": "&nbsp;에서 검색: ",
                "zeroRecords": "일치하는 데이터가 없습니다.",
                "loadingRecords": "로딩중...",
                "processing":     "잠시만 기다려 주세요...",
                "paginate": {
                    "next": "다음",
                    "previous": "이전"
                }
            },
        });
        
        /* Column별 검색기능 추가 */
        $('#datatablesSimple_filter').prepend('<select id="select"></select>');
        $('#datatablesSimple > thead > tr').children().each(function (indexInArray, valueOfElement) { 
            $('#select').append('<option>'+valueOfElement.innerHTML+'</option>');
        });

        $('.dataTables_filter input').unbind().bind('keyup', function () {
            var colIndex = document.querySelector('#select').selectedIndex;
            table.column(colIndex).search(this.value).draw();
        });


	</script>
    
    
</body>

</html>