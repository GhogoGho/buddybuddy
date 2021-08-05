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
		
		<form action="insert" method="POST">
		  <div class="row">
		    <div class="col-md-9">
		      <p class="h3 mb-3">클래스 공지</p>
		    </div>
		    <div class="col-md-3 mt-4">
		      <!-- 클래스 선택 -->
		      <div class="control has-icons-left">
		        <div class="select is-medium is-rounded">
		          <select>
		            <option selected>클래스 선택</option>
		            <option value="1">클래스1</option>
		            <option value="2">클래스2</option>
		            <option value="3">클래스3</option>
		            <option value="4">클래스4</option>
		          </select>
		        </div>
		        <span class="icon is-large is-left">
		          <i class="fas fa-th-list"></i>
		        </span>
		      </div>
		
		    </div>
		  </div>
		  <hr>
		  <div class="row mb-3">
		    <label class="form-label" for="boardTitle">제목</label>
		    <input class="input is-medium is-rounded" id="boardTitle" name="boardTitle" type="text"
		      placeholder="제목을 입력해 주세요.">
		  </div>
		  <div class="row">
		    <textarea class="textarea" name="class-content" id="boardContent" placeholder="공지사항 내용을 입력해 주세요."
		      rows="10"></textarea>
		  </div>
		  <div class="row my-2">
		    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
		      <button class="button is-success is-large">작성</button>
		      <button class="button is-light is-rounded is-large">취소</button>
		    </div>
		  </div>
		</form>
		
	</main>
</body>
</html>