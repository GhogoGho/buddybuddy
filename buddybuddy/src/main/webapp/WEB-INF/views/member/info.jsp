<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- 배포된 웹 애플리케이션의 최상위 주소를 간단히 얻어올 수 있도록 
     application 범위로 변수를 하나 생성 --%>
<c:set var="contextPath" scope="application"
	value="${pageContext.servletContext.contextPath}" />

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>main</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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
}

/* 회원정보 수정 폼 */
.form-control {
	min-height: 41px;
	background: #fff;
	box-shadow: none !important;
	border-color: #e3e3e3;
}

.form-control-id {
	min-height: 41px;
	background: #fff;
	border-color: #e3e3e3;
	width: 70%;
}

.form-control-id:focus {
	border-color: #70c5c0;
}

.form-control-id, .btn {
	border-radius: 2px;
}

.form-control:focus {
	border-color: #70c5c0;
}

.form-control, .btn {
	border-radius: 2px;
}

.info-form {
	width: 350px;
	margin: 0 auto;
	padding: 100px 0 30px;
	font-family: 'ELAND_Choice_M';
}

.info-form form {
	color: #7a7a7a;
	border-radius: 2px;
	margin-bottom: 15px;
	font-size: 13px;
	background: #ececec;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
	position: relative;
}

.info-form h2 {
	font-size: 22px;
	margin: 15px 0 10px;
}

.info-form .avatar {
	position: absolute;
	margin: 0 auto;
	left: 0;
	right: 0;
	top: -50px;
	width: 95px;
	height: 95px;
	border-radius: 50%;
	z-index: 9;
	background: #70c5c0;
	padding: 15px;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
}

.info-form .avatar img {
	width: 100%;
}

.profile {
	background-color: #ececec;
	border: none;
	margin-top: 20px;
	margin-left: 58px;
	width: 250px;
}

.info-form .btn {
	font-size: 16px;
	font-weight: bold;
	background: #70c5c0;
	border: none;
	margin-top: 30px;
}

.info-form .btn:hover, .info-form .btn:focus {
	background: #50b8b3;
	outline: none !important;
}

.info-form a {
	color: #fff;
	text-decoration: underline;
}

.info-form a:hover {
	text-decoration: none;
}

.info-form form a {
	color: #7a7a7a;
	text-decoration: none;
}

.info-form form a:hover {
	text-decoration: none;
}

.info-form .clearfix {
	margin-top: 30px;
	margin-bottom: 0px;
}

.info-form .clearfix:hover {
	font-weight: bold;
	text-decoration: none;
}

.info-form .clearfix-signUp a {
	color: #50b8b3;
	font-weight: bold;
	font-size: 15px;
}

.info-form .clearfix-signUp a:hover {
	color: black;
	text-decoration: none;
}

.info-form .form-profile {
	margin-top: 50px;
	margin-left: 50px;
}

.info-form h4 {
	color: #50b8b3;
}

@font-face {
	font-family: 'ELAND_Choice_M';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/ELAND_Choice_M.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

/* FOOTER */
.footer {
	display: block;
	text-align: center;
	background: #ffffff;
	padding: 20px 0;
	color: rgb(0, 0, 0);
}

.footer p {
	padding: 0;
	margin: 0;
	font-size: 13px;
	font-weight: 400;
	color: rgb(0, 0, 0);
	text-align: center;
}

.mem {
	color: #1abc9c;
	font-weight: bolder;
	font-size: 20px;
}
</style>


</head>



<body>
	<header class="header-section">
		<nav class="navbar">
			<div class="container">

				<div>
					<a class="navbar-brand" href="${contextPath}/main"><b>B</b>uddy</a>

					<ul class="nav justify-content-center">
						<li class="active"><a class="nav-menu"
							href="${contextPath}/main">Home</a></li>
						<li><a href="${contextPath}/class/1/list">온라인 클래스</a></li>
						<li><a href="#">오프라인 클래스 </a></li>
						<li><a href="${contextPath}/member/myPage">마이페이지 </a></li>

						<%-- 로그인을 했는지, 안 했는지 구분하는 방법 == session에 loginMember 유무 --%>
						<c:choose>

							<c:when test="${ empty loginMember}">
								<li><a href="${contextPath}/member/login" tabindex="-1">Login</a>
								</li>

							</c:when>

							<c:otherwise>
								<%-- 로그인이 되었을 때 --%>
								<li><a class="mem" href="${contextPath}/member/info">${loginMember.memberNickname }</a></li>
								<li><a href="${contextPath}/member/logout">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>

			</div>
		</nav>
	</header>


	<!-- 로그인 -->
	<div class="info-form">

		<form action="info" method="POST" enctype="multipart/form-data">

			<div class="avatar">
				<img src="${contextPath}/${loginMember.memberProfile}" width="70px"
					height="70px" id="img">
			</div>

			<div class="text-center">
				<div class="mb-3">
					<button type="button" class="profile form-control" id="btn">파일 선택</button>
					<input class="profile form-control" type="file" name="formFile" id="formFile" style="display:none;">
				</div>
			</div>
			<h2 class="text-center">Info</h2>

			<h4 class="text-center">일반 회원</h4>

			<div class="form-group">
				닉네임 <input type="text" class="form-control" name="inputNickname"
					placeholder="닉네임을 입력해주세요" required="required"
					value="${loginMember.memberNickname}">
			</div>

			<div class="form-group">
				Email <input type="text" class="form-control" name="inputEmail"
					placeholder="이메일을 입력해주세요" required="required"
					value="${loginMember.memberEmail}">
			</div>

			<div class="form-group">
				현재 비밀번호 <input type="password" class="form-control" id="currentPwd" name="currentPwd">
			</div>


			<div class="form-group">
				새 비밀번호 <input type="password" class="form-control" id="newPwd1"
					name="newPwd1" placeholder="비밀번호를 입력해주세요" required="required">
				<div class="col-md-12">
					<span id="checkPwd3">&nbsp;</span>
				</div>
			</div>

			<div class="form-group">
				새 비밀번호 확인 <input type="password" class="form-control" id="newPwd2"
					name="newPwd2" placeholder="비밀번호를 재입력해주세요" required="required">
				<div class="col-md-12">
					<span id="checkPwd4">&nbsp;</span>
				</div>
			</div>




			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-lg btn-block">수정
					완료</button>
			</div>

			<div class="clearfix">
				<a href="${contextPath}/member/secession" class="pull-right">회원탈퇴</a>
			</div>
		</form>

	</div>



	<footer class="footer">

		<div class="footer">
			<p class="copyright">
				(주) 버디버디 대표이사 : 도동개 서울특별시 마포구 동교로 19길 12 사업자 등록번호 : 107-87-83297<br>
				버디버디는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 버디버디는 상품 거래정보 및 거래에 대하여 책임을 지지
				않습니다.
			</p>
		</div>

	</footer>


	<script src="${contextPath}/resources/js/info.js"></script>


</body>

</html>