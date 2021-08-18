<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 배포된 웹 애플리케이션의 최상위 주소를 간단히 얻어올 수 있도록 
     application 범위로 변수를 하나 생성 --%>
<c:set var="contextPath" scope="application"
	value="${pageContext.servletContext.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>버디버디:재능을 선물하세요!</title>

<!-- Fontfaces CSS-->
<link href="${contextPath}/resources/admin/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
<link href="${contextPath}/resources/admin/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">

<!-- Bootstrap CSS-->
<link href="${contextPath}/resources/admin/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

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

<style>
.navbar>.container, .navbar>.container-fluid, .navbar>.container-lg,
	.navbar>.container-md, .navbar>.container-sm, .navbar>.container-xl,
	.navbar>.container-xxl {
	display: block;
}

ul.navbar-nav li.active a {
	text-decoration: none;
}

ul.navbar-nav li a {
	text-decoration: none;
}

.header-section {
	display: block;
	width: 100%;
	padding: 20px 0;
	position: relative;
	transition: all 1s;
	background: #fff;
}

.header-section .navbar .navbar-brand {
	font-size: 30px;
	font-weight: 540;
	text-transform: uppercase;
	color: #555252;
}

header.header-section.fixed {
	position: fixed;
	display: block;
	width: 100%;
	top: 0;
	background: #fff;
	z-index: 99999;
	border-bottom: 1px solid #1abc9c;
	padding: 10px 0;
	transition: all 1s;
}

.header-section .navbar .navbar-brand b {
	color: #1abc9c;
}

ul.navbar-nav {
	background: transparent;
	margin: 0 auto;
	margin-bottom: -5px;
	display: inline-block;
	float: none;
}

.navbar-default .navbar-collapse, .navbar-default .navbar-form {
	text-align: center;
	padding: 0 !important;
	background: transparent !important;
}

.nav-menu {
	color: #1abc9c;
	font-weight: bolder;
}

.nav-menu:hover {
	color: #515151;
}

a {
	color: #555252;
	text-decoration: none;
	padding: 10px;
	font-weight: bold;
}

a:hover {
	color: #70c5c0;
	text-decoration: none;
}

.mem {
	color: #1abc9c;
	font-weight: bolder;
	font-size: 20px;
}

.dropdown{
	display: inline-block;
	float: right;
}

.navbar-brand{
	display: inline-block;
}

textarea{
	resize: none;
}
</style>

</head>

<body>

	<header class="header-section">
		<nav class="navbar navbar-default">
			<div class="container">

				<div>
					<a class="navbar-brand" href="${contextPath}/main"><b>B</b>uddy</a>
					
						<div class="dropdown" id="dropdownbox">
							<a class="btn btn-white dropdown-toggle" href="#"
								role="button" id="dropdownMenuLink" data-bs-toggle="dropdown"
								aria-expanded="false">고객지원</a>

							<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
								<li><a class="dropdown-item"
									href="${contextPath}/board/1/list">공지사항</a></li>
								<li><a class="dropdown-item"
									href="${contextPath}/board/2/list">FAQ</a></li>
									
									<c:if test="${ !empty loginMember}">
										<li><a class="dropdown-item"
											href="#modal-container-1" data-toggle="modal">1:1문의</a></li>
										<li><a class="dropdown-item"
												href="${contextPath}/admin/qnaListCheck" 
												onclick="window.open(this.href,'QnA','width=1100, height=700'); return false;">문의내역</a></li>
									</c:if>
								
								<c:if test="${ loginMember.memberGrade == 'A' }">
								<li><a class="dropdown-item"
									href="${contextPath}/admin/main">관리자페이지</a></li>
								</c:if>
							</ul>
						</div>
						

					<ul class="nav justify-content-center">
						<li class="active"><a class="nav-menu"
							href="${contextPath}/main">Home</a></li>
						<li><a href="${contextPath}/class/1/list">온라인 클래스</a></li>

						

						<li><a href="${contextPath}/offclass/2/list">오프라인 클래스 </a></li>


						<%-- 로그인을 했는지, 안 했는지 구분하는 방법 == session에 loginMember 유무 --%>
						<c:choose>

							<c:when test="${ empty loginMember}">
								
								<li><a href="${contextPath}/member/login" tabindex="-1">Login</a>
								</li>

							</c:when>

							<c:otherwise>
								<%-- 로그인이 되었을 때 --%>
								<li><a href="${contextPath}/member/myPage">마이페이지 </a></li>
								<li><a class="mem" href="${contextPath}/member/info">${loginMember.memberNickname }</a></li>
								<li><a href="${contextPath}/member/logout">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>

			</div>
		</nav>
	</header>
	
	<%-- Q&A 문의 Modal --%>	
	<div class="modal fade" id="modal-container-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="card">
					<div class="card-header">
						<strong>Q&A</strong> 1:1문의
					</div>
					<div class="card-body card-block">
						<form action="${contextPath}/admin/qnaSubmit" method="post"
							class="form-horizontal">
							<div class="row form-group">
								<div class="col col-md-3">
									<label class=" form-control-label">작성자</label>
								</div>
								<div class="col-12 col-md-9">
									<p class="form-control-static">${loginMember.memberNickname}</p>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="text-input" class=" form-control-label">제목</label>
								</div>
								<div class="col-12 col-md-9">
									<input type="text" id="text-input" name="queTitle"
										placeholder="제목을 입력해주세요." class="form-control" required>
								</div>
							</div>
							<div class="row form-group">
								<div class="col col-md-3">
									<label for="textarea-input" class=" form-control-label">내용</label>
								</div>
								<div class="col-12 col-md-9">
									<textarea name="queContent" id="textarea-input" rows="9"
										placeholder="문의내용을 입력해주세요." class="form-control" required></textarea>
									<small class="form-text text-muted">* 해당 문의 내용은 관리자에게만
										전달됩니다</small>
								</div>
							</div>
							<div class="card-footer">
								<button type="submit" class="btn btn-primary btn-sm">
									<i class="fa fa-dot-circle-o"></i> 문의 접수
								</button>
								<button type="reset" class="btn btn-danger btn-sm">
									<i class="fa fa-ban"></i> 내용 지우기
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- 로그인 실패와 같은 메세지가 서버로부터 전달되어 온 경우 출력 --%>
	<c:if test="${!empty title}">
		<script>
			swal({
				"icon" : "${icon}",
				"title" : "${title}",
				"text" : "${text}"
			});
		</script>

	</c:if>

	<script>
		// 로그인 수행 시 아이디 / 비밀번호가 작성되었는지 확인하는 유효성 검사 
		function loginValidate() {
			// Validate : 유효한지 확인하다 

			// 아이디가 입력되지 않았을 경우
			// "아이디를 입력해주세요" 경고창을 띄우고 로그인 수행 X
			if ($("#memberId").val().trim().length == 0) {
				//$("#memberId") : 아이디 속성값이 memberId인 input 태그 선택
				// .val() : input 태그에 작성된 값을 얻어옴
				// .trim() : 얻어온 값 양쪽에 작성된 공백문자를 제거
				// .length: 공백 제거 후 값의 길이 

				swal({
					"icon" : "warning",
					"title" : "아이디를 입력해주세요"
				}).then(function() {
					// 아이디 입력창으로 포커스 이동
					$("#memberId").focus();
				});

				return false;
			}

			// 비밀번호가 입력되지 않았을 경우
			// "비밀번호를 입력해주세요" 경고창을 띄우고 로그인 수행 X

			// return false; -> submit 기본 이벤트 제거
			// return true; 또는 아무것도 반환하지 않으면 submit 수행 

			if ($("#memberPw").val().trim().length == 0) {
				//$("#memberId") : 아이디 속성값이 memberId인 input 태그 선택
				// .val() : input 태그에 작성된 값을 얻어옴
				// .trim() : 얻어온 값 양쪽에 작성된 공백문자를 제거
				// .length: 공백 제거 후 값의 길이 

				swal({
					"icon" : "warning",
					"title" : "비밀번호를 입력해주세요"
				}).then(function() {
					// 비밀번호 입력창으로 포커스 이동
					$("#memberPw").focus();
				});

				return false;
			}
		}
	</script>
</body>

</html>