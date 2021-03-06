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

         /* ???????????? ??? */

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

        /* ???????????? */
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

        /* ??????????????? ?????? */
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

        /* ??????????????? ?????? */
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
                            <a href="${contextPath}/class/1/list">????????? ?????????</a>
                        </li>
                        <li>
                            <a href="${contextPath}/offclass/2/list">???????????? ????????? </a>
                        </li>
                         
                        
                      <%-- ???????????? ?????????, ??? ????????? ???????????? ?????? == session??? loginMember ?????? --%>
						<c:choose>

							<c:when test="${ empty loginMember}">
								<li><a href="${contextPath}/member/login" tabindex="-1">Login</a>
								</li>

							</c:when>
							
							<c:otherwise>
							<%-- ???????????? ????????? ??? --%>
							<li><a class="mem" href="${contextPath}/member/info">${loginMember.memberNickname }</a></li>
							<li><a 	href="${contextPath}/member/logout">????????????</a></li>
						</c:otherwise> 
					</c:choose>
                    </ul>
                    
                </div>

            </div>
        </nav>
    </header>

<!-- ??????????????? ???????????? ?????? -->
<section class="mypage-section">
    <div class="row">
        <!-- ??????????????? ?????? ??????-->
        <div class="row">
            <div class="avatar"></div>
            <p class="nick-nm text-center">${loginMember.memberNickname }</p>
            <p class="mem-grade text-center">?????? ??????</p>
        </div>

        <div class="row">
            <!-- ??????????????? ???????????? -->
            <div class="side col-sm-2">
                <div class="mypage-menu">
                    <ul class="mymenu">
                        <p>?????????</p>
                        <li><a href="${contextPath}/member/myPage/1/joinClass">????????? ????????????</a></li>
							

							<li><a href="${contextPath}/member/myPage/1/reserveOffline">???????????? ??????????????? ??????</a></li>
                    </ul>
                    <hr>
                    <ul class="mymenu">
                        <p>?????? ??????</p>
                        <li><a href="${contextPath}/member/myPage/1/review">?????? ??? ??????</a></li>
                        <li><a href="${contextPath}/member/myPage/1/reply">?????? ??? ??????</a></li>
                    </ul>
                    <hr>
                    <ul class="mymenu">
                        <p>???????????????</p>
                        <li><a href="${contextPath}/member/myPage/1/choice">??? ??????</a></li>
                    </ul>

                </div>
            </div>




        

               

					


           



        
   
</section>

    <footer class="footer">

        <div class="footer">
            <p class="copyright">(???) ???????????? ???????????? : ????????? ??????????????? ????????? ????????? 19??? 12 ????????? ???????????? : 107-87-83297<br>
                ??????????????? ??????????????????????????? ??????????????? ???????????? ????????????. ????????? ??????????????? ?????? ???????????? ??? ????????? ????????? ????????? ?????? ????????????.</p>
        </div>

    </footer>
</body>

</html>