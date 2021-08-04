<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"
	value="${pageContext.servletContext.contextPath}" scope="application" />
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>signUp</title>
<!-- Bootstrap core JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


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

/*
    HEADER SECTION
 */
.header-section {
	display: block;
	width: 100%;
	padding: 20px 0;
	position: relative;
	transition: all 1s;
	background: #fff;
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

.header-section .navbar {
	height: auto;
	min-height: none;
	margin-bottom: 0;
	border-radius: 0;
	border: none;
	background: transparent !important
}

.header-section .navbar .navbar-brand {
	font-size: 30px;
	font-weight: 540;
	text-transform: uppercase;
	color: #555252;
}

.header-section .navbar .navbar-brand b {
	color: #1abc9c;
}

.navbar-default .navbar-collapse, .navbar-default .navbar-form {
	text-align: center;
	padding: 0 !important;
	background: transparent !important;
}

ul.navbar-nav {
	background: transparent;
	margin: 0 auto;
	margin-bottom: -5px;
	display: inline-block;
	float: none;
}

ul.navbar-nav li {
	
}

ul.navbar-nav li a {
	font-size: 14px;
	font-weight: 700;
	color: #0f0101 !important;
	background: transparent !important;
	text-transform: uppercase;
}

ul.navbar-nav li.active a, ul.navbar-nav li a:hover {
	color: #1abc9c !important;
}

ul.navbar-nav.cart-menu li a {
	padding-right: 0;
	color: #0f0101;
	font-weight: 700;
}

ul.navbar-nav.cart-menu li a .fa-search {
	margin-top: 6px;
	display: block;
}

/**/
body {
	color: #fff;
}

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

.form-profile {
	text-align: center;
	margin-left: 50px;
	margin-top: 30px;
}

.signup-form {
	width: 350px;
	margin: 0 auto;
	padding: 100px 0 30px;
	font-family: 'ELAND_Choice_M';
}

.signup-form form {
	color: #7a7a7a;
	border-radius: 2px;
	margin-bottom: 15px;
	font-size: 13px;
	background: #ececec;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
	position: relative;
}

.signup-form h2 {
	font-size: 22px;
	margin: 35px 0 25px;
}

.signup-form .avatar {
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

.signup-form .avatar img {
	width: 100%;
}

.signup-form input[type="checkbox"] {
	margin-top: 2px;
}

.signup-form .btn {
	font-size: 16px;
	font-weight: bold;
	background: #70c5c0;
	border: none;
	margin-top: 50px;
}

.signup-form .btn:hover, .signup-form .btn:focus {
	background: #50b8b3;
	outline: none !important;
}

.signup-form a {
	color: #fff;
	text-decoration: underline;
}

.signup-form a:hover {
	text-decoration: none;
}

.signup-form form a {
	color: #7a7a7a;
	text-decoration: none;
}

.signup-form form a:hover {
	text-decoration: underline;
}

.signup-form .clearfix {
	margin-bottom: 10px;
}

.signup-form .clearfix-signUp a {
	color: #50b8b3;
	font-weight: bold;
	font-size: 15px;
}

.signup-form .clearfix-signUp a:hover {
	color: black;
	text-decoration: none;
}

.signup-form .form-profile {
	margin-top: 50px;
	margin-left: 50px;
}

@font-face {
	font-family: 'ELAND_Choice_M';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/ELAND_Choice_M.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

/* 회원가입 약관 CSS */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box
}

body {
	background-color: #f7f7f7;
}

ul>li {
	list-style: none
}

a {
	text-decoration: none;
}

.clearfix::after {
	content: "";
	display: block;
	clear: both;
}

#joinForm {
	width: auto;
	margin: 0 auto;
}

ul.join_box {
	border: 1px solid #ddd;
	background-color: #fff;
}

.checkBox, .checkBox>ul {
	position: relative;
}

.checkBox>ul>li {
	float: left;
}

.checkBox>ul>li:first-child {
	width: 85%;
	padding: 15px;
	font-weight: 600;
	color: #888;
}

.checkBox>ul>li:nth-child(2) {
	position: absolute;
	top: 50%;
	right: 30px;
	margin-top: -12px;
}

.checkBox textarea {
	width: 96%;
	height: 90px;
	margin: 0 2%;
	background-color: #f7f7f7;
	color: #888;
	border: none;
}

.footBtwrap {
	margin-top: 15px;
}

.footBtwrap>li {
	float: left;
	width: 50%;
	height: 60px;
}

.footBtwrap>li>button {
	display: block;
	width: 100%;
	height: 80%;
	font-size: 20px;
	text-align: center;
	line-height: 50px;
	border: none;
}

.fpmgBt1 {
	background-color: #fff;
}

.fpmgBt2 {
	background-color: #50b8b3;
	color: #fff
}
</style>
</head>

<body>
	<!-- 헤더 -->
	<header class="header-section">
		<nav class="navbar navbar-default">
			<div class="container">

				<div class="navbar-header">
					<a class="navbar-brand" href="#"><b>B</b>uddy</a>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#">Home</a></li>
						<li><a href="#">온라인 클래스</a></li>
						<li><a href="#">오프라인 클래스</a></li>
						<li><a href="#">Login</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<!-- 회원가입 -->
	<div class="signup-form">

		<form action="signUp" method="POST" class="needs-validation"
			name="signUpForm" onsubmit="return validate();">
			<div class="avatar"></div>
			<div class="text-center">

				<input accept="image/*" class="form-profile" type="file"
					id="profile" name="profile" onchange="loadFile(event)">
			</div>
			<h2 class="text-center">Sign Up</h2>
			<div class="form-group">
				Email <input type="text" class="form-control" name="memberEmail"
					id="id" placeholder="이메일을 입력해주세요" autocomplete="off"
					required="required">

				<div class="col-md-12">
					<span id="checkId">&nbsp;</span>
				</div>
			</div>

			<div class="form-group">
				비밀번호 <input type="password" class="form-control" id="pwd1"
					name="memberPw" placeholder="비밀번호를 입력해주세요" maxlength="12"
					required="required">
			<div class="col-md-12">
				<span id="checkPwd1">&nbsp;</span>
			</div>
			</div>

			<div class="form-group">
				비밀번호 확인 <input type="password" class="form-control" id="pwd2"
					name="memberPwCk" placeholder="비밀번호를 재입력해주세요" required="required">
			<div class="col-md-12">
				<span id="checkPwd2">&nbsp;</span>
			</div>
			</div>

			<div class="form-group">
				닉네임 <input type="text" class="form-control" name="memberNickname"
					placeholder="닉네임을 입력해주세요" required="required">

			</div>

			<!-- 회원가입 약관 -->
			<div action="" id="joinForm">
				<ul class="join_box">
					<li class="checkBox check01">
						<ul class="clearfix">
							<li>이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내 메일 수신(선택)에 모두
								동의합니다.</li>
							<li class="checkAllBtn"><input type="checkbox" name="chkAll"
								id="chk" class="chkAll"></li>
						</ul>
					</li>
					<li class="checkBox check02">
						<ul class="clearfix">
							<li>이용약관 동의(필수)</li>
							<li class="checkBtn"><input type="checkbox" name="chk">
							</li>
						</ul> <textarea name="clear1" id="clear1"">여러분을 환영합니다.
    버디버디 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 버디버디 서비스의 이용과 관련하여 버디버디 서비스를 제공하는 버디버디 주식회사(이하 ‘버디버디’)와 이를 이용하는 버디버디 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 버디버디 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
           </textarea>
					</li>
					<li class="checkBox check03">
						<ul class="clearfix">
							<li>개인정보 수집 및 이용에 대한 안내(필수)</li>
							<li class="checkBtn"><input type="checkbox" name="chk">
							</li>
						</ul> <textarea name="clear2" id="clear2">여러분을 환영합니다.
    버디버디 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 버디버디 서비스의 이용과 관련하여 버디버디 서비스를 제공하는 버디버디 주식회사(이하 '버디버디')와 이를 이용하는 버디버디 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 버디버디 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
           </textarea>
					</li>
					<li class="checkBox check03">
						<ul class="clearfix">
							<li>위치정보 이용약관 동의(선택)</li>
							<li class="checkBtn"><input type="checkbox" name="chk">
							</li>
						</ul> <textarea name="clear3" id="clear3">여러분을 환영합니다.
    버디버디 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 버디버디 서비스의 이용과 관련하여 버디버디 서비스를 제공하는 버디버디 주식회사(이하 '버디버디')와 이를 이용하는 버디버디 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 버디버디 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
           </textarea>
					</li>

				</ul>
				<ul class="footBtwrap clearfix">
					<li><button class="fpmgBt1">비동의</button></li>
					<li><button class="fpmgBt2">동의</button></li>
				</ul>
			</div>


			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-lg btn-block">회원가입</button>
			</div>

		</form>

	</div>

	<!-- 회원가입 -->



	<!-- 풋터 -->
	<footer class="footer">
		<footer>
			<div class="container">
				<h5 class="copyright">
					(주) 버디버디 대표이사 : 도동개 서울특별시 마포구 동교로 19길 12 사업자 등록번호 : 107-87-83297<br>
					버디버디는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 버디버디는 상품 거래정보 및 거래에 대하여 책임을 지지
					않습니다.
				</h5>
			</div>
		</footer>
	</footer>

	<!-- 웹콘텐트 == 콘텍스패스 -->
	<script src="${contextPath}/resources/js/member.js"></script>



</body>

</html>