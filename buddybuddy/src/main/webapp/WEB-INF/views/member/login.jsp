<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"
	value="${pageContext.servletContext.contextPath}" scope="application" />
		
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

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
}

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

/* 로그인 섹션 */
.form-control {
	border-color: #eee;
	min-height: 41px;
	box-shadow: none !important;
}

.form-control:focus {
	border-color: #50b8b3;
}

.form-control, .btn {
	border-radius: 3px;
}

.login-form {
	width: 400px;
	margin: 0 auto;
	padding: 30px 0;
	margin-bottom: 20px;
}

.login-form h2 {
	color: #333;
	margin: 0 0 30px 0;
	display: inline-block;
	padding: 0 30px 10px 0;
	border-bottom: 3px solid #50b8b3;
}

.login-form form {
	color: rgb(148, 148, 148);
	border-radius: 3px;
	margin-bottom: 15px;
	background: #fff;
	padding: 30px;
}

.login-form .form-group {
	margin-bottom: 20px;
}

.login-form label {
	font-weight: normal;
	font-size: 13px;
	line-height: 40px;
}

.login-form input[type="checkbox"] {
	margin-top: 2px;
}

.login-form .btn {
	font-size: 16px;
	font-weight: bold;
	background: #50b8b3;
	border: none;
	margin-top: 20px;
	min-width: 180px;
	margin-left: 80px;
}

.login-form .btn:hover, .login-form .btn:focus {
	background: #50b8b3;
	outline: none !important;
}

.login-form-form a {
	color: #50b8b3;
	text-decoration: none;
}

.login-form a:hover {
	text-decoration: none;
}

.login-form form a {
	color: #50b8b3;
	font-weight: bold;
	text-decoration: none;
	margin-top: 20px;
}

.login-form form a:hover {
	text-decoration: none;
}

.text-center a {
	color: rgb(148, 148, 148);
}

.text-center a:hover {
	color: #50b8b3;
}

.mem-signUp {
	text-align: left;
}

.cre-signUp {
	text-align: right;
}

.findId {
	color: rgb(148, 148, 148);
	font-size: 15px;
}

.findPw {
	color: rgb(148, 148, 148);
	font-size: 15px;
}

#kakaoimg {
	margin-left: 53px;
}
</style>


</head>

<body>
	<header class="header-section">
		<nav class="navbar navbar-default">
			<div class="container">

				<div>
					<a class="navbar-brand" href="#"><b>B</b>uddy</a>

					<ul class="nav justify-content-center">
						<li class="active"><a class="nav-menu" href="#">Home</a></li>
						<li><a href="#">온라인 클래스</a></li>
						<li><a href="#">오프라인 클래스 </a></li>
						<li><a href="#" tabindex="-1">Login</a></li>
					</ul>
				</div>

			</div>
		</nav>
	</header>

	<!-- 컨테이너 입력 부분 -->

	<!-- 로그인 -->
	<div class="login-form">
		<form action="${contextPath}/member/login" method="POST" onsubmit="return loginValidate();"
			class="form-horizontal">
			<div class="col-xs-8 col-xs-offset-4">
				<h2>Login</h2>
			</div>

			<div class="form-group">
				<label class="control-label col-xs-4">ID</label>
				<div class="col-xs-8">
					<input type="id" class="form-control" name="memberEmail" required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-4">Password</label>
				<div class="col-xs-8">
					<input type="password" class="form-control" name="memberPw"
						required="required">
				</div>
			</div>

			<div class="form-group">
				<div class="col-xs-8 col-xs-offset-4">
					<p>
						<label class="checkbox-inline"><input type="checkbox"
							required="required"> ID 저장하기</label>
					</p>
					<button type="submit" class="btn btn-primary btn-lg">Login</button>
					<div class="login_kakao">
						<!--  <a href="#"><img src="resources/images/kakao_login_medium_narrow.png"
							id="kakaoimg" class="btn-lg login-btn">-->
					</div>
					</a>
				</div>
			</div>

			<div class="clearfix-signUp">
				<div class="row">
					<div class="mem-signUp col-sm-6">
						<a href="${contextPath}/member/signUp"> 회원가입 </a>
					</div>

					<div class="cre-signUp col-sm-6">
						<a href="#"> 크리에이터 </a>
					</div>
				</div>
			</div>

		</form>
		<hr>
		<p class="text-right">
			<a class="findId" href="#">ID 찾기</a><b class="findPw" href="#">PW
				찾기</b>
		</p>
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
			if ($("#memberEmail").val().trim().length == 0) {
				//$("#memberId") : 아이디 속성값이 memberId인 input 태그 선택
				// .val() : input 태그에 작성된 값을 얻어옴
				// .trim() : 얻어온 값 양쪽에 작성된 공백문자를 제거
				// .length: 공백 제거 후 값의 길이 

				swal({
					"icon" : "warning",
					"title" : "이메일을 입력해주세요"
				}).then(function() {
					// 아이디 입력창으로 포커스 이동
					$("#memberEmail").focus();
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