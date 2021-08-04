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
    <title>myPage</title>
    <link rel="stylesheet" href="css/main.css">
    
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>



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
    </style>

</head>

<body>
    <header class="header-section">
        <nav class="navbar navbar-default">
            <div class="container">

                <div class="navbar-header">
                    <a class="navbar-brand" href="${contextPath}/main"><b>B</b>uddy</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="${contextPath}/main">Home</a></li>
                        <li><a href="#">온라인 클래스</a></li>
                        <li><a href="#">오프라인 클래스</a></li>
                        <li><a href="#">Login</a></li>
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
                            <li><a href="#">클래스 내역</a></li>
                            <li><a href="#">클래스예약 내역</a></li>
                        </ul>
                        <hr>
                        <ul class="mymenu">
                            <p>구매 후기</p>
                            <li><a href="#">후기 작성</a></li>
                            <li><a href="#">내가 쓴 후기</a></li>
                        </ul>
                        <hr>
                        <ul class="mymenu">
                            <p>관심리스트</p>
                            <li><a href="#">찜 목록</a></li>
                            <li><a href="#">QnA 목록</a></li>
                        </ul>

                    </div>
                </div>


                <!-- 마이페이지 본문 버튼-->
                <div class="col-sm-9">
                    <div class="row">
                        <nav>
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <div class="row">

                                    <button class="class-btn nav-link active col-6" id="nav-home-tab"
                                        data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab"
                                        aria-controls="nav-home" aria-selected="true">클래스 내역</button>
                                    <button class="class-btn1 nav-link col-6" id="nav-profile-tab" data-bs-toggle="tab"
                                        data-bs-target="#nav-profile" type="button" role="tab"
                                        aria-controls="nav-profile" aria-selected="false">클래스 예약 내역</button>
                                </div>

                            </div>
                        </nav>
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel"
                                aria-labelledby="nav-home-tab">...</div>
                            <div class="tab-pane fade" id="nav-profile" role="tabpanel"
                                aria-labelledby="nav-profile-tab">...</div>

                        </div>
                    </div>


                    <!-- 마이페이지 본문 본문 -->
                    <div class="row">
                        <div class="row">
                            <div class="class-list">
                                <div class="class-img col-sm-2"><img src="https://via.placeholder.com/150" width="70"
                                        height="70" class="rounded-3 float-start me-2" alt="">
                                </div>
                                <div class="class-cate col-sm-2"><a href="#">카테고리</a></div>
                                <div class="class-nm col-sm-5"><a href="#">클래스 제목</a></div>
                                <div class="class-dt col-sm-2">21/07/26</div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="class-list">
                                <div class="class-img col-sm-2"><img src="https://via.placeholder.com/150" width="70"
                                        height="70" class="rounded-3 float-start me-2" alt="" href="#">
                                </div>
                                <div class="class-cate col-sm-2"><a href="#">카테고리</a></div>
                                <div class="class-nm col-sm-5"><a href="#">클래스 제목</a></div>
                                <div class="class-dt col-sm-2">21/07/26</div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="class-list">
                                <div class="class-img col-sm-2"><img src="https://via.placeholder.com/150" width="70"
                                        height="70" class="rounded-3 float-start me-2" alt="">
                                </div>
                                <div class="class-cate col-sm-2"><a href="#">카테고리</a></div>
                                <div class="class-nm col-sm-5"><a href="#">클래스 제목</a></div>
                                <div class="class-dt col-sm-2">21/07/26</div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="class-list">
                                <div class="class-img col-sm-2"><img src="https://via.placeholder.com/150" width="70"
                                        height="70" class="rounded-3 float-start me-2" alt="">
                                </div>
                                <div class="class-cate col-sm-2"><a href="#">카테고리</a></div>
                                <div class="class-nm col-sm-5"><a href="#">클래스 제목</a></div>
                                <div class="class-dt col-sm-2">21/07/26</div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="class-list">
                                <div class="class-img col-sm-2"><img src="https://via.placeholder.com/150" width="70"
                                        height="70" class="rounded-3 float-start me-2" alt="">
                                </div>
                                <div class="class-cate col-sm-2"><a href="#">카테고리</a></div>
                                <div class="class-nm col-sm-5"><a href="#">클래스 제목</a></div>
                                <div class="class-dt col-sm-2">21/07/26</div>
                            </div>
                        </div>

                    </div>

                    <!-- 페이지네이션 -->
                    <nav class="text-center" aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item active" aria-current="page">
                                <a class="page-link" href="#">2</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>
                        </ul>
                    </nav>


                </div>



            </div>
        </div>
    </section>



    <footer class="footer">
        <footer>
            <div class="container">
                <h5 class="copyright">(주) 버디버디 대표이사 : 도동개 서울특별시 마포구 동교로 19길 12 사업자 등록번호 : 107-87-83297<br>
                    버디버디는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 버디버디는 상품 거래정보 및 거래에 대하여 책임을 지지 않습니다.</h5>
            </div>
        </footer>
    </footer>
</body>

</html>