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
    <title>main</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <style>
        .navbar>.container,
        .navbar>.container-fluid,
        .navbar>.container-lg,
        .navbar>.container-md,
        .navbar>.container-sm,
        .navbar>.container-xl,
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

        .navbar-default .navbar-collapse,
        .navbar-default .navbar-form {
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

         /* 회원정보 폼 */

         .avatar {
            position: center;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background: #70c5c0;
            padding: 15px;
            margin: auto;
        }

        .nick-nm {
            font-size: 30px;
            font-weight: bolder;
            margin-top: 30px;
        }

        .mem-grade {
            font-size: 15px;
            font-weight: bolder;
            color: #50b8b3;
            margin-top: 20px;
        }

        /* 사이드바 */
        .mypage-section {
            margin-left: 10%;
            padding: 20px;
        }

        .side {
            border-right: 1px black;
        }

        .mypage-menu .mymenu {
            margin-top: 5px;
            margin-bottom: 40px;
        }

        .mypage-menu .mymenu li {
            font-weight: 300;
            position: relative;
            display: block;
            margin-top: 30px;
            text-decoration: none;
        }

        .mypage-menu .mymenu li a {
            text-decoration: none;
        }

        .mypage-menu .mymenu p {
            font-size: 25px;
            color: #50b8b3;
            font-weight: bold;
            margin: 20px;
        }

        .mypage-menu .mymenu li a {
            color: black;
            font-weight: bold;
            font-size: 15px;
            position: relative;
            display: block;
        }

        .mypage-menu .mymenu li a:hover {
            color: #50b8b3;
            font-weight: 300;
        }

        /* 마이페이지 버튼 */
        .class-btn {
            width: 600px;
            font-size: 15px;
            font-weight: bolder;
            margin-top: 20px;
        }

        .class-btn1 {
            width: 600px;
            font-size: 15px;
            font-weight: bolder;
            color: #50b8b3;
            margin-top: 20px;
        }

        .class-btn:hover {
            color: black;
            font-weight: bolder;

        }

        .class-btn1:hover {
            color: #50b8b3;
            border-color: #fff;
        }

        .class-btn1:active {
            color: #50b8b3;
        }

        .vl {
            border-right: 1px black;
            height: 500px;
        }

        /* 마이페이지 본문 */
        .class-list {
            margin-left: 15px;
        }

        .class-list .class-img {
            margin-left: 35px;
            margin-top: 20px;
        }

        .class-list .class-cate a {
            color: #50b8b3;
            font-weight: bolder;
            font-size: 15px;
            text-decoration: none;
            margin-top: 20px;
            line-height: 100px;
        }

        .class-list .class-nm a {
            color: black;
            font-weight: bolder;
            font-size: 15px;
            text-decoration: none;
            margin-top: 20px;
            line-height: 100px;
        }

        .class-list .class-dt {
            color: black;
            font-weight: bolder;
            font-size: 15px;
            margin-top: 20px;
            line-height: 70px;
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
	font-weight : bolder;
	font-size : 20px;
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
                        <li class="active">
                            <a class="nav-menu" href="${contextPath}/main">Home</a>
                        </li>
                        <li>
                            <a href="${contextPath}/class/1/list">온라인 클래스</a>
                        </li>
                        <li>
                            <a href="${contextPath}/offclass/2/list">오프라인 클래스 </a>
                        </li>
                         
                        
                      <%-- 로그인을 했는지, 안 했는지 구분하는 방법 == session에 loginMember 유무 --%>
						<c:choose>

							<c:when test="${ empty loginMember}">
								<li><a href="${contextPath}/member/login" tabindex="-1">Login</a>
								</li>

							</c:when>
							
							<c:otherwise>
							<%-- 로그인이 되었을 때 --%>
							<li><a class="mem" href="${contextPath}/member/info">${loginMember.memberNickname }</a></li>
							<li><a 	href="${contextPath}/member/logout">로그아웃</a></li>
						</c:otherwise> 
					</c:choose>
                    </ul>
                    
                </div>

            </div>
        </nav>
    </header>

<!-- 마이페이지 컨테이너 부분 -->
<section class="mypage-section">
    <div class="row">
        <!-- 마이페이지 회원 정보-->
        <div class="row">
            <div class="avatar"></div>
            <p class="nick-nm text-center">${loginMember.memberNickname }</p>
            <p class="mem-grade text-center">일반 회원</p>
        </div>

        <div class="row">
            <!-- 마이페이지 사이드바 -->
            <div class="side col-sm-2">
                <div class="mypage-menu">
                    <ul class="mymenu">
                        <p>클래스</p>
                        <li><a href="${contextPath}/member/myPage/1/joinClass">클래스 수강내역</a></li>
							

							<li><a href="${contextPath}/member/myPage/1/reserveOffline">오프라인 클래스예약 내역</a></li>
                    </ul>
                    <hr>
                    <ul class="mymenu">
                        <p>구매 후기</p>
                        <li><a href="${contextPath}/member/myPage/1/review">내가 쓴 문의</a></li>
                        <li><a href="${contextPath}/member/myPage/1/reply">내가 쓴 후기</a></li>
                    </ul>
                    <hr>
                    <ul class="mymenu">
                        <p>관심리스트</p>
                        <li><a href="${contextPath}/member/myPage/1/choice">찜 목록</a></li>
                        <li><a href="#">QnA 목록</a></li>
                    </ul>

                </div>
            </div>




        

               

					


           



        
   
</section>

    <footer class="footer">

        <div class="footer">
            <p class="copyright">(주) 버디버디 대표이사 : 도동개 서울특별시 마포구 동교로 19길 12 사업자 등록번호 : 107-87-83297<br>
                버디버디는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 버디버디는 상품 거래정보 및 거래에 대하여 책임을 지지 않습니다.</p>
        </div>

    </footer>
</body>

</html>