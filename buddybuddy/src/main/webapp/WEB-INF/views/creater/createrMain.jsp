<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>크리에이터 페이지</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>

  <!-- bulma -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">

  <!-- fontAwesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

  <!-- 썸머노트 API -->
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
    crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
  <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

  <style>
    /* nav 버튼 */
    .nav-pills .nav-link.active,
    .nav-pills .show>.nav-link {
      color: #fff;
      background-color: #198754;
    }

    /* nav 글자 */
    .nav-link {
      display: block;
      padding: .5rem 1rem;
      color: #000;
      text-decoration: none;
      transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out;
    }

    .list-group-item.active {
      z-index: 2;
      color: #fff;
      background-color: #198754;
      border-color: #198754;
    }
  </style>


</head>
<body>
	<main>
		<!-- 상단부 -->
		<jsp:include page="../common/header.jsp"/>
		
		<div class="container">
      <div class="row">
        <div class="col-2">
          <div class="list-group" id="list-tab" role="tablist">
            <a class="list-group-item list-group-item-action active" id="list-home-list" data-bs-toggle="list"
              href="#list-home" role="tab" aria-controls="list-home">클래스 공지 목록</a>
            <a class="list-group-item list-group-item-action" id="list-profile-list" data-bs-toggle="list"
              href="#list-profile" role="tab" aria-controls="list-profile">클래스 공지 작성</a>
            <a class="list-group-item list-group-item-action" id="list-messages-list" data-bs-toggle="list"
              href="#list-messages" role="tab" aria-controls="list-messages">내 클래스 목록</a>
            <a class="list-group-item list-group-item-action" id="list-cwrite-list" data-bs-toggle="list"
              href="#list-cwrite" role="tab" aria-controls="list-cwrite">내 클래스 작성</a>
            <a class="list-group-item list-group-item-action" id="list-settings-list" data-bs-toggle="list"
              href="#list-settings" role="tab" aria-controls="list-settings">예약 회원 관리</a>
            <a class="list-group-item list-group-item-action" id="list-fmember-list" data-bs-toggle="list"
              href="#list-fmember" role="tab" aria-controls="list-fmember">환불 회원 관리</a>
          </div>
        </div>
        <div class="col-10">
          <div class="tab-content" id="nav-tabContent">
            <!-- 클래스공지 목록 start-->
            <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
              <jsp:include page="noticeList.jsp"/>
            </div>
            <!-- 클래스공지 목록 end-->
            
            <!-- 클래스공지 작성 start -->
            <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
              <jsp:include page="noticeWrite.jsp"/>
            </div>
            <!-- 클래스공지 작성 end -->
            
            <!-- 내 클래스 목록 start -->
            <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">
              <jsp:include page="createrClassList.jsp"/>
            </div>
            <!-- 내 클래스 목록 end -->
            
            <!-- 내 클래스 작성 start -->
            <div class="tab-pane fade" id="list-cwrite" role="tabpanel" aria-labelledby="list-cwrite-list">
              <jsp:include page="createrClassWrite.jsp"/>
            </div>
            <!-- 내 클래스 작성 end -->
            
            <!-- 예약 회원 관리 start -->
            <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">
              <jsp:include page="reserveList.jsp"/>
            </div>
            <!-- 예약 회원 관리 end -->
            
            <!-- 환불 회원 관리 start -->
            <div class="tab-pane fade" id="list-fmember" role="tabpanel" aria-labelledby="list-fmember-list">
              <jsp:include page="refundList.jsp"/>
            </div>
            <!-- 환불 회원 관리 end -->
          </div>
        </div>
      </div>
    </div>
		
		
		<!-- 하단부 -->
		<jsp:include page="../common/footer.jsp"/>
	</main>
</body>
</html>