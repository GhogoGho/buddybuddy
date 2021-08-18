<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>공지사항 게시판 관리</title>
    
    <link href="${contextPath}/resources/admin/css/styles.css" rel="stylesheet" />
    
	<link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" type="text/css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css" type="text/css" rel="stylesheet">
    
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/css/dataTables.responsive.css"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.js"></script>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    
    <style type="text/css">

	table{
		text-align: center;
		line-height: 45px;
		width: 100%;
	}
	
	a{
		text-decoration: none;
		color: black;
	}
	
	td > a{
		text-decoration: none;
		color: white;
	}
	
	td > a:hover{
		color: #50b8b3;
	}
	
	ul{
		list-style: none;
		text-align: left;
	}
	
	body{
		font-family: 'Gowun Dodum', sans-serif;
	}

	</style>

</head>

<body class="sb-nav-fixed">

	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="${contextPath}/admin/main">BUDDY BUDDY</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0"></form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="${contextPath}/admin/adminlogout">Logout</a></li>
				</ul>
			</li>
		</ul>
	</nav>

	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">시작</div>
						<a class="nav-link" href="${contextPath}/admin/main">
							<div class="sb-nav-link-icon">
								<i class="fas fa-location-arrow"></i>
							</div> 메인페이지
						</a>
						<div class="sb-sidenav-menu-heading">회원</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#member" aria-expanded="false"
							aria-controls="member"> 회원관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="member" aria-labelledby="headingOne"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${contextPath}/admin/memberSearch">회원목록조회</a>
								<a class="nav-link" href="${contextPath}/admin/memberSecession">회원탈퇴</a>
								<a class="nav-link" href="${contextPath}/admin/memberCreator">크리에이터 승인</a>
							</nav>
						</div>

						<div class="sb-sidenav-menu-heading">게시판</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#border" aria-expanded="false"
							aria-controls="border"> 게시판 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="border" aria-labelledby="headingOne"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${contextPath}/admin/notiBoard">공지사항</a> 
								<a class="nav-link" href="${contextPath}/admin/faqBoard">FAQ</a>
							</nav>
						</div>

						<div class="sb-sidenav-menu-heading">신고</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#report" aria-expanded="false"
							aria-controls="report"> 신고 접수
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="report" aria-labelledby="headingOne"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${contextPath}/admin/boardReport">클래스</a>
							</nav>
						</div>

						<div class="sb-sidenav-menu-heading">문의사항</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#question" aria-expanded="false"
							aria-controls="question"> 문의사항
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="question" aria-labelledby="headingOne"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${contextPath}/admin/qnaList">문의사항 내역 조회</a>
							</nav>
						</div>
					</div>
				</div>
			</nav>
		</div>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">클래스</h1>
					<ol class="breadcrumb mb-4"></ol>
				
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 클래스 신고내역 관리
						</div>
						<div class="card-body">
							<table id="datatablesSimple"  class="table table-dark table-hover">
								<thead>
									<tr>
										<th>신고번호</th>
										<th>신고자</th>
										<th>신고내용</th>
										<th>신고일</th>
										<th>클래스번호</th>
										<th>클래스명</th>
										<th>상태</th>
										<th></th>
									</tr>
								</thead>
								
								<%-- 목록 출력 --%>
								<tbody>

									<c:forEach items="${classReportList}" var="report">
										<tr>
											<%-- 신고자 --%>
											<%-- <td><a href="${contextPath}/board/1/${board.notiNo}"> ${board.notiTitle}</a></td> --%>
											
											<%-- 신고 번호 --%>
											<td>${report.reportNo}</td>

											<%-- 신고자 --%>
											<td>${report.memberNickname}</td>
											
											<%-- 신고내용 --%>
											<td>${report.reportContent}</td>
											
											<%-- 신고일 --%>
											<td><fmt:formatDate var="reportDate"
													value="${report.reportDate}" pattern="yyyy-MM-dd" />
												${reportDate}</td>
												
											<%-- 클래스 번호 --%>
											<td>${report.classNo}</td>
											
											<%-- 클래스명 --%>
											<c:choose>
												<c:when test="${ report.classTypeNo == 1 }">
													<td><a href="${contextPath}/class/${report.classTypeNo}/${report.classNo}">[온라인]${report.classTitle}</a></td>
												</c:when>
												<c:otherwise>
													<td><a href="${contextPath}/offclass/${report.classTypeNo}/${report.classNo}">[오프라인]${report.classTitle}</a></td>
												</c:otherwise>
											</c:choose>
											<%-- 게시상태 --%>
											<c:choose>
												<c:when test="${ report.classStatus == 'Y' }">
													<td>
														<button type="button" class="btn btn-info btn-sm">게시 중</button>
													</td>
												</c:when>
												<c:otherwise>
													<td>
														<button type="button" class="btn btn-secondary btn-sm">게시 종료</button>
													</td>
												</c:otherwise>
											</c:choose>

											<%-- 내용 --%>
											<td>
												<button type="button" class="btn btn-danger" value="${report.classNo}" onclick="classDown(this);">내리기</button>
												<button type="button" class="btn btn-success" value="${report.classNo}" onclick="classRB(this);">복구</button>
											</td>
											
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; BuddyBuddy</div>
						<div>
							<a href="#">위로</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
    
  
    
    <script>
    
	 function classDown(e){
	    	
	    	console.log($(e).val());
	    	
	    	const classNo = $(e).val();
	    	
	    	 $.ajax({
	    	      url : "${contextPath}/admin/classStatusUpdate",
	    	      type : "POST",
	    	      data : {"classNo" : classNo},
	    	      success : function(result){
	    	         
	    	         if(result > 0){
	    	            location.href = "${contextPath}/admin/boardReport";
	    	         }
	    	      },
	    	      
	    	      error : function(){
	    	      }
	    	   });
	    	
	    }
	 
	 function classRB(e){
	    	
	    	console.log($(e).val());
	    	
	    	const classNo = $(e).val();
	    	
	    	 $.ajax({
	    	      url : "${contextPath}/admin/classStatusUpdate2",
	    	      type : "POST",
	    	      data : {"classNo" : classNo},
	    	      success : function(result){
	    	         
	    	         if(result > 0){
	    	            location.href = "${contextPath}/admin/boardReport";
	    	         }
	    	      },
	    	      
	    	      error : function(){
	    	      }
	    	   });
	    	
	    }
 
        var table = $('#datatablesSimple').DataTable({
           /*  responsive: true, */
            "language": {
                "emptyTable": "데이터가 없습니다.",
                "lengthMenu": "_MENU_ 개씩 보기",
                "info": "현재 _START_ - _END_ / 총 _TOTAL_건 조회됨",
                "infoEmpty": "데이터 없음",
                "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
                "search": "&nbsp;에서 검색: ",
                "zeroRecords": "일치하는 데이터가 없습니다.",
                "loadingRecords": "로딩중...",
                "processing":     "잠시만 기다려 주세요...",
                "paginate": {
                    "next": "다음",
                    "previous": "이전"
                }
            },
        });
        
        /* Column별 검색기능 추가 */
        $('#datatablesSimple_filter').prepend('<select id="select"></select>');
        $('#datatablesSimple > thead > tr').children().each(function (indexInArray, valueOfElement) { 
            $('#select').append('<option>'+valueOfElement.innerHTML+'</option>');
        });

        $('.dataTables_filter input').unbind().bind('keyup', function () {
            var colIndex = document.querySelector('#select').selectedIndex;
            table.column(colIndex).search(this.value).draw();
        });


	</script>
    
    
</body>

</html>