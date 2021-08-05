<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>기본페이지</title>
</head>
<body>
	<main>
		
		<div class="row">
		  <p class="h3 mb-3" id="class-notice">공지사항</p>
		  <hr>
		  <div class="list-group mb-3">
		    <a href="#" class="list-group-item list-group-item-action">
		      <div class="d-flex w-100 justify-content-between">
		        <h5 class="mb-1">공지사항 제목${noticeTitle}</h5>
		        <small class="text-muted">작성일${noticeDate}</small>
		      </div>
		      <p class="mb-1">공지사항 내용${noticeContext}</p>
		    </a>
		    <a href="#" class="list-group-item list-group-item-action">
		      <div class="d-flex w-100 justify-content-between">
		        <h5 class="mb-1">공지사항 제목${noticeTitle}</h5>
		        <small class="text-muted">작성일${noticeDate}</small>
		      </div>
		      <p class="mb-1">공지사항 내용${noticeContext}</p>
		    </a>
		    <hr>
		  </div>
		</div>
		
	</main>
</body>
</html>