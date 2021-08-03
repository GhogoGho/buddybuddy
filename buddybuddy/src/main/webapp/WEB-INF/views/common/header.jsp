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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>버디버디:재능을 선물하세요!</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">



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
        
</style>

</head>

<body>

	    <header class="header-section">
        <nav class="navbar navbar-default">
            <div class="container">

                <div>
                    <a class="navbar-brand" href="#"><b>B</b>uddy</a>

                    <ul class="nav justify-content-center">
                        <li class="active">
                            <a class="nav-menu" href="#">Home</a>
                        </li>
                        <li>
                            <a href="#">온라인 클래스</a>
                        </li>
                        <li>
                            <a href="#">오프라인 클래스 </a>
                        </li>
                        <li>
                            <a href="#" tabindex="-1">Login</a>
                        </li>
                    </ul>
                </div>

            </div>
        </nav>
    </header>

</body>

</html>
