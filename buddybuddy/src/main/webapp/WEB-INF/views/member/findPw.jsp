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
<title>Find PW</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
	<!-- jQuery -->	
<script src="http://code.jquery.com/jquery-latest.js"></script>
	
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

 .findId-form {
            width: 400px;
            margin: 0 auto;
            padding: 30px 0;
            margin-bottom: 20px;
        }

        .findId-form h2 {
            color: #333;
            margin: 0 0 30px 0;
            display: inline-block;
            padding: 0 30px 10px 0;
            border-bottom: 3px solid #50b8b3;
        }

        .findId-form form {
            color: rgb(148, 148, 148);
            border-radius: 3px;
            margin-bottom: 15px;
            background: #fff;
            padding: 30px;
        }

        .findId-form .form-group {
            margin-bottom: 20px;
        }

        .findId-form label {
            font-weight: normal;
            font-size: 13px;
            line-height: 40px;
        }

        .findId-form input[type="checkbox"] {
            margin-top: 2px;
        }

        .findId-form .btn {
            font-size: 16px;
            font-weight: bold;
            background: #50b8b3;
            border: none;
            margin-top: 20px;
            min-width: 140px;
        }

        .findId-form .btn:hover,
        .findId-form .btn:focus {
            background: #50b8b3;
            outline: none !important;
        }

        .findId-form-form a {
            color: #50b8b3;
            text-decoration: none;
        }

        .findId-form a:hover {
            text-decoration: none;
        }

        .findId-form form a {
            color: #50b8b3;
            font-weight: bold;
            text-decoration: none;
            margin-top: 20px;
        }

        .findId-form form a:hover {
            text-decoration: none;
        }

        .findid {
            margin-top: 16px;
        }

        .form-control {
            display: block;
            width: 100%;
            padding: .375rem .75rem;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #212529;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border-radius: .25rem;
            transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
        }

        .text-center a {
            color: rgb(148, 148, 148);
        }

        .text-center a:hover {
            color: #50b8b3;
        }
</style>


</head>

<body>
	<header class="header-section">
		<nav class="navbar navbar-default">
			<div class="container">

				<div>
					<a class="navbar-brand" href="${contextPath}/main"><b>B</b>uddy</a>

					<ul class="nav justify-content-center">
						<li class="active"><a class="nav-menu" href="${contextPath}/main">Home</a></li>
						<li><a href="${contextPath}/class/1/list">온라인 클래스</a></li>
						<li><a href="#">오프라인 클래스 </a></li>
						 <li>
                            <a href="${contextPath}/member/myPage">마이페이지 </a>
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

	<!-- 컨테이너 입력 부분 -->
	<!-- ID 찾기 -->
    <div class="findId-form">
        <form action="findPw" method="post" class="form-horizontal">
            <div class="col-xs-8 col-xs-offset-4">
                <h2>PW 찾기</h2>
            </div>

            <div class="form-group">
                <label class="control-label col-xs-4">Email</label>
                <div class="col-xs-8">
                    <input type="text" class="form-control" name="findEmail"  id="findEmail" required="required" placeholder="Email을 입력해주세요.">
                </div>
            </div>
            
            <div class="form-group">
                <label class="control-label col-xs-4">닉네임</label>
                <div class="col-xs-8">
                    <input type="text" class="form-control" name="findNickname" id="findNickname" required="required" placeholder="닉네임을 입력해주세요.">
                </div>
            </div>


            <div class="form-group">
                <div class="col-xs-8 col-xs-offset-4">
                    <button type="button" id="findBtn" class="btn btn-primary btn-lg" >PW 찾기</button>
                </div>
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
		// 비밀번호가 작성되었는지 확인하는 유효성 검사 
		function loginValidate() {
			

			if ($("#memberPw").val().trim().length == 0) {
				
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
		
		$(function(){
			$("#findBtn").click(function(){
				$.ajax({
					url : "${contextPath}/member/findPw",
					type : "POST",
					data : {
						findEmail : $("#findEmail").val(),
						findNickname : $("#findNickname").val()
					},
					success : function(result) {
						alert(result);
					},
				})
			});
		})
	</script>
</body>
</html>