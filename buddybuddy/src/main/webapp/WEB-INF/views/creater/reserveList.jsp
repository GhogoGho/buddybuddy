<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약 회원 목록</title>
</head>
<body>
	<main>
	
	<div class="row">
	  <div class="col-md-7">
	    <p class="h3">예약 회원 목록</p>
	  </div>
	  <div class="col-md-5 mb-5">
	    <div class="container-fluid">
	      <form class="d-flex">
	        <input class="form-control me-2" type="search" placeholder="회원 조회" aria-label="Search">
	        <button class="btn btn-success" type="submit">Search</button>
	      </form>
	    </div>
	  </div>
	</div>
	<hr>
	
	
	<div class="row">
	  <table class="table table-sm">
	    <thead>
	      <tr>
	        <th scope="col">예약번호</th>
	        <th scope="col">고객명</th>
	        <th scope="col">예약일</th>
	        <th scope="col">예약인원</th>
	        <th scope="col">결제금액</th>
	        <th scope="col">상태</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <th scope="row">${reserveNo}</th>
	        <td>${memberNickName}</td>
	        <td>${reserveDate}</td>
	        <td>${reserveLimit}</td>
	        <td>${paymentAmount}</td>
	        <td>확정</td>
	      </tr>
	      <tr>
	        <th scope="row">2</th>
	        <td>우유저</td>
	        <td>2021년4월30일</td>
	        <td>3명</td>
	        <td>20,000원</td>
	        <td>확정</td>
	      </tr>
	      <tr>
	        <th scope="row">3</th>
	        <td>박댕댕</td>
	        <td>2021년4월30일</td>
	        <td>10명</td>
	        <td>10,000원</td>
	        <td>취소</td>
	      </tr>
	    </tbody>
	  </table>
	</div>
	
	
	</main>
</body>
</html>