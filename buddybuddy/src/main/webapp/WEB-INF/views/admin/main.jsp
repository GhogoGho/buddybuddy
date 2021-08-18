<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>버디버디 관리자 페이지</title>
    <link href="${contextPath}/resources/admin/css/styles.css" rel="stylesheet" />
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
	
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
        crossorigin="anonymous"></script>
        
    <style type="text/css">
    
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

					<%-- 	<div class="sb-sidenav-menu-heading">신고</div>
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
					<h1 class="mt-4">버디버디 관리자 페이지</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active"></li>
					</ol>
					<div class="row">
						<div class="col-xl-3 col-md-6">
							<div class="card bg-primary text-white mb-4">
								<div class="card-body">버디버디 공식홈페이지</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="${contextPath}/main">바로가기</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-warning text-white mb-4">
								<div class="card-body">공지사항</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="${contextPath}/board/1/list">바로가기</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-success text-white mb-4">
								<div class="card-body">FAQ</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="${contextPath}/board/2/list">바로가기</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-danger text-white mb-4">
								<div class="card-body">문의사항</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="#">바로가기</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-area me-1"></i> 일일 방문자 수 통계
							</div>
							<div class="card-body">
								<canvas id="myAreaChart" width="100%" height="20"></canvas>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-calendar me-1"></i> Calendar
							</div>
							<div id="calendar"></div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/admin/js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/admin/assets/demo/chart-area-demo.js"></script>
    <script src="${contextPath}/resources/admin/assets/demo/chart-bar-demo.js"></script>
    <script src="${contextPath}/resources/admin/js/datatables-simple-demo.js"></script>

    <!-- fullcalender -->
    <link href="${contextPath}/resources/admin/full/lib/main.css" rel='stylesheet' />
    <script src="${contextPath}/resources/admin/full/lib/main.js"></script>
    <script>

        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth'
            });
            calendar.render();
        });

    </script>



</body>

</html>