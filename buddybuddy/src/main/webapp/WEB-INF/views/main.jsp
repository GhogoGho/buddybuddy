<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>버디버디:재능을 선물하세요!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <style>
        /* 컨테이너 */

        .titie-section {
            margin-bottom: 30px;
            display: block;
            position: relative;
        }

        .titie-section h1 {
            margin: 0;
            padding: 0;
            display: block;
            text-align: center;
            font-size: 48px;
            color: #515151;
            font-weight: 900;
            text-transform: uppercase;
        }

        .titie-section h1:before {
            content: "";
            width: 165px;
            display: block;
            height: 3px;
            background: #1abc9c;
            position: absolute;
            bottom: -16px;
            margin: 0 auto;
            left: 0;
            right: 0;
        }

        .titie-section h1:after {
            content: "";
            width: 165px;
            display: block;
            height: 3px;
            background: #1abc9c;
            position: absolute;
            bottom: -30px;
            margin: 0 auto;
            left: 0;
            right: 0;
        }

        .titie-section:after {
            content: "";
            width: 165px;
            display: block;
            height: 7px;
            background: #1abc9c;
            position: absolute;
            bottom: -25px;
            margin: 0 auto;
            left: 0;
            right: 0;
        }

        /* 클래스 섹션 */
        .recent-section {
            background: #e9f0fd;
            text-align: center;
            display: block;
            padding: 100px 0 80px;
        }

        .like-section {
            display: block;
            text-align: center;
            padding: 100px 0 80px;
        }

        .class-title {
            margin-top: 10px;
            margin-bottom: 5px;
        }

        .class-menu {
            font-size: 15px;
        }

        .class-menu:hover {
            color: #70c5c0;
            text-align: center;
        }


        /* 슬로건 */
        .offer-section {
            display: block;
            padding: 170px 0 130px;
            position: relative;
            width: 100%;
            background: url(../images/offer-bg.jpg) no-repeat;
            text-align: center;
            color: #fff;
        }

        .offer-section:before {
            content: "";
            width: 100%;
            height: 100%;
            position: absolute;
            display: block;
            top: 0;
            background: rgba(0, 0, 0, 0.5)
        }

        .offer-section h1 {
            font-size: 60px;
            font-weight: 900;
            color: #fff;
            display: block;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        .offer-section h3 {
            font-size: 38px;
            font-weight: 300;
            color: #fff;
            margin: 0;
            padding: 0;
        }
        
    </style>


</head>

<body>

	<jsp:include page="common/header.jsp"></jsp:include>

    <!-- 캐러셀 이미지-->

    <div class="text-center">
        <img src="https://via.placeholder.com/150" width="500px" height="250px" class="rounded" alt="...">
    </div>

    <!-- 컨테이너 -->
    <section class="like-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titie-section">
                        <h1>인기 Top 10 클래스</h1>
                    </div>
                </div>
            </div>
            <div class="row mt-5">
                <div class="col-md-3 col-sm-4">
                    <div class="class-list"></div>
                    <img src="https://via.placeholder.com/150" width="150" height="150" class="rounded-3 me-2" alt="">
                    <a class="class-menu" href="#">
                        <h3 class="class-title">클래스 제목입니다</h3>
                    </a>
                    <a class="class-menu" href="#">
                        어쩌구 저쩌구 클래스 들어주라
                    </a>
                    <a class="class-menu" href="#">
                        35,000원
                    </a>
                </div>


                <div class="col-md-3 col-sm-4">
                    <div class="class-list"></div>
                    <img src="https://via.placeholder.com/150" width="150" height="150" class="rounded-3 me-2" alt="">
                    <a class="class-menu" href="#">
                        <h3 class="class-title">클래스 제목입니다</h3>
                    </a>
                    <a class="class-menu" href="#">
                        어쩌구 저쩌구 클래스 들어주라
                    </a>
                    <a class="class-menu" href="#">
                        35,000원
                    </a>
                </div>

                <div class="col-md-3 col-sm-4">
                    <div class="class-list"></div>
                    <img src="https://via.placeholder.com/150" width="150" height="150" class="rounded-3 me-2" alt="">
                    <a class="class-menu" href="#">
                        <h3 class="class-title">클래스 제목입니다</h3>
                    </a>
                    <a class="class-menu" href="#">
                        어쩌구 저쩌구 클래스 들어주라
                    </a>
                    <a class="class-menu" href="#">
                        35,000원
                    </a>
                </div>

                <div class="col-md-3 col-sm-4">
                    <div class="class-list"></div>
                    <img src="https://via.placeholder.com/150" width="150" height="150" class="rounded-3 me-2" alt="">
                    <a class="class-menu" href="#">
                        <h3 class="class-title">클래스 제목입니다</h3>
                    </a>
                    <a class="class-menu" href="#">
                        어쩌구 저쩌구 클래스 들어주라
                    </a>
                    <a class="class-menu" href="#">
                        35,000원
                    </a>
                </div>
            </div>
        </div>


    </section>

    <section class="recent-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titie-section">
                        <h1>최근 Top 10 클래스</h1>
                    </div>
                </div>
            </div>
            <div class="row mt-5">
                <div class="col-md-3 col-sm-4">
                    <div class="class-list"></div>
                    <img src="https://via.placeholder.com/150" width="150" height="150" class="rounded-3 me-2" alt="">
                    <a class="class-menu" href="#">
                        <h3 class="class-title">클래스 제목입니다</h3>
                    </a>
                    <a class="class-menu" href="#">
                        어쩌구 저쩌구 클래스 들어주라
                    </a>
                    <a class="class-menu" href="#">
                        35,000원
                    </a>
                </div>


                <div class="col-md-3 col-sm-4">
                    <div class="class-list"></div>
                    <img src="https://via.placeholder.com/150" width="150" height="150" class="rounded-3 me-2" alt="">
                    <a class="class-menu" href="#">
                        <h3 class="class-title">클래스 제목입니다</h3>
                    </a>
                    <a class="class-menu" href="#">
                        어쩌구 저쩌구 클래스 들어주라
                    </a>
                    <a class="class-menu" href="#">
                        35,000원
                    </a>
                </div>

                <div class="col-md-3 col-sm-4">
                    <div class="class-list"></div>
                    <img src="https://via.placeholder.com/150" width="150" height="150" class="rounded-3 me-2" alt="">
                    <a class="class-menu" href="#">
                        <h3 class="class-title">클래스 제목입니다</h3>
                    </a>
                    <a class="class-menu" href="#">
                        어쩌구 저쩌구 클래스 들어주라
                    </a>
                    <a class="class-menu" href="#">
                        35,000원
                    </a>
                </div>

                <div class="col-md-3 col-sm-4">
                    <div class="class-list"></div>
                    <img src="https://via.placeholder.com/150" width="150" height="150" class="rounded-3 me-2" alt="">
                    <a class="class-menu" href="#">
                        <h3 class="class-title">클래스 제목입니다</h3>
                    </a>
                    <a class="class-menu" href="#">
                        어쩌구 저쩌구 클래스 들어주라
                    </a>
                    <a class="class-menu" href="#">
                        35,000원
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- 슬로건 -->
    <section class="offer-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="slogan">
                        <h1>SLOGAN</h1>
                        <h3>모두가 행복하고 재미있게 살아갈 수 있도록 능력을 선물하세요!</h3>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
	<jsp:include page="common/footer.jsp"></jsp:include>

</body>

</html>