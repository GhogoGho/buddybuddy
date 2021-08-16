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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>signUp</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous"></script>
	<!-- Bootstrap core JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
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
}

/* footer */
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

/* 회원탈퇴 폼 */
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

.secession-form {
	width: 400px;
	margin: 0 auto;
	padding: 30px 0;
	margin-bottom: 20px;
}

.secession-form h2 {
	color: #333;
	margin: 0 0 30px 0;
	display: inline-block;
	padding: 0 30px 10px 0;
	border-bottom: 3px solid #50b8b3;
}

.secession-form form {
	color: rgb(148, 148, 148);
	border-radius: 3px;
	margin-bottom: 15px;
	background: #fff;
	padding: 30px;
}

.secession-form .form-group {
	margin-bottom: 20px;
}

.secession-form label {
	font-weight: normal;
	font-size: 13px;
	line-height: 40px;
}

.secession-form input[type="checkbox"] {
	margin-top: 2px;
}

.secession-form .btn1 {
	font-size: 16px;
	font-weight: bold;
	background: #50b8b3;
	border: none;
	margin-top: 20px;
	min-width: 140px;
	margin-left: 100px;
	width: 100px;
	height: 40px;
	border-radius : 4px;
}

.secession-form .btn1:hover, .secession-form .btn1:focus {
	background: #50b8b3;
	outline: none !important;
}

.secession-form-form a {
	color: #50b8b3;
	text-decoration: none;
}

.secession-form a:hover {
	text-decoration: none;
}

.secession-form form a {
	color: #50b8b3;
	font-weight: bold;
	text-decoration: none;
	margin-top: 20px;
}

.secession-form form a:hover {
	text-decoration: none;
}

.text-center a {
	color: rgb(148, 148, 148);
}

.text-center a:hover {
	color: #50b8b3;
}

/* 탈퇴 약관 CSS*/
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box
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

ol, ul {
	padding-left: 0;
}
</style>


</head>

<body>
	<!-- header -->
	<header class="header-section">
		<nav class="navbar navbar-default">
			<div class="container">

				<div>
					<a class="navbar-brand" href="${contextPath}/main"><b>B</b>uddy</a>

					<ul class="nav justify-content-center">
						<li class="active"><a class="nav-menu"
							href="${contextPath}/main">Home</a></li>
						<li><a href="${contextPath}/class/1/list">온라인 클래스</a></li>
						<li><a href="#">오프라인 클래스 </a></li>
						

						<%-- 로그인을 했는지, 안 했는지 구분하는 방법 == session에 loginMember 유무 --%>
						<c:choose>

							<c:when test="${ empty loginMember}">
								<li><a href="${contextPath}/member/login" tabindex="-1">Login</a>
								</li>

							</c:when>

							<c:otherwise>
								<%-- 로그인이 되었을 때 --%>
								<li>
                            <a href="${contextPath}/member/myPage">마이페이지 </a>
                        </li>
								<li><a class="mem" href="${contextPath}/member/info">${loginMember.memberNickname }</a></li>
								<li><a href="${contextPath}/member/logout">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>

			</div>
		</nav>
	</header>

	<!-- 입력 부분 -->
	<!-- 탈퇴 -->
	<div class="secession-form">
		<form action="secession" method="POST" class="form-horizontal"
			onsubmit="return secessionValidate();"> 
			<div class="col-xs-8 col-xs-offset-4">
				<h2>회원 탈퇴</h2>
			</div>

			<div class="form-group">
				<label class="control-label col-xs-4">Password</label>
				<div class="col-xs-8">
					<input type="password" class="form-control" id="currentPwd"
						name="currentPwd">
				</div>
			</div>


			<div class="form-group">
				<div class="col-xs-8 col-xs-offset-4">
					<button type="button" class="btn1 btn-primary"
						data-bs-toggle="modal" data-bs-target="#exampleModal">회원
						탈퇴</button>
				</div>
			</div>
			
			<!-- Modal -->
		 
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">회원 탈퇴</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">탈퇴하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button class="btn btn-primary  btn-block" id="btn"
							type="submit">탈퇴하기</button>
					</div>
				</div>
			</div>
		</div>

		</form>

		<!-- 회원탈퇴 약관-->
		<div action="" id="joinForm">
			<ul class="join_box">

				<li class="checkBox check">
					<ul class="clearfix">
						<li for="agree">개인정보 수집 및 이용에 대한 안내(필수)</li>
						<li class="checkBtn"><input type="checkbox" name="agree"
							id="agree" class="form-check-input custom-control-input">
						</li>
					</ul> <textarea name="" id="">[제1조]
사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다. 탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.
                
                
[제2조]
회원탈퇴 후 회원정보 및 사이트 이용기록은 모두 삭제됩니다. 회원정보 및 사이트 이용기록은 최대 1개월 보관 후 모두 삭제되며 삭제된 데이터는 복구되지 않습니다.
</textarea>
				</li>


			</ul>

		</div>


		<!-- 회원탈퇴 모달창 -->


	
		
	</div>

	<!-- footer -->
	<footer class="footer">

		<div class="footer">
			<p class="copyright">
				(주) 버디버디 대표이사 : 도동개 서울특별시 마포구 동교로 19길 12 사업자 등록번호 : 107-87-83297<br>
				버디버디는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 버디버디는 상품 거래정보 및 거래에 대하여 책임을 지지
				않습니다.
			</p>
		</div>

	</footer>
	
	<script>
		// 약관 동의가 체크 되었을 때에만 탈퇴 진행
		function secessionValidate(){
			// script, filter, wrapper, servlet, service, dao, sql
			// 응답화면 제어
			
			// 방법1) 체크된 체크박스를 선택하는 : checked 선택자 사용 방법
			// $("#agree:checked") -> 아이디가 agree인 요소 중 check된 요소만을 선택
			// 체크된 요소가 있다면 length == 1, 없으면 0
		if($("#agree:checked").length == 0) {
				swal({"icon" : "info", "title" : "약관 동의를 체크해주세요."})
				return false;
			}
			
			return true;
		}
	</script>


</body>

</html>