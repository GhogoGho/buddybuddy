<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>환불 회원 목록</title>
</head>
<body>
	<main>
	
	<div class="row">
	  <div class="col-md-7">
	    <p class="h3">환불 회원 목록</p>
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
	        <th scope="row">
	          <div class="form-check">
	            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
	            <label class="form-check-label" for="flexCheckDefault">
	              ${reserveNo}
	            </label>
	          </div>
	        </th>
	        <td>${memberNickName}</td>
	        <td>${reserveDate}</td>
	        <td>${reserveLimit}</td>
	        <td>${paymentAmount}</td>
	        <td>환불 완료</td>
	      </tr>
	      <tr>
	        <th scope="row">
	          <div class="form-check">
	            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
	            <label class="form-check-label" for="flexCheckDefault">
	              2${reserveNo}
	            </label>
	          </div>
	        </th>
	        <td>우유저</td>
	        <td>2021년4월30일</td>
	        <td>3명</td>
	        <td>20,000원</td>
	        <td>환불 요청</td>
	      </tr>
	      <tr>
	        <th scope="row">
	          <div class="form-check">
	            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
	            <label class="form-check-label" for="flexCheckDefault">
	              3${reserveNo}
	            </label>
	          </div>
	        </th>
	        <td>박댕댕</td>
	        <td>2021년4월30일</td>
	        <td>10명</td>
	        <td>10,000원</td>
	        <td>환불 요청</td>
	      </tr>
	    </tbody>
	  </table>
	</div>
	<div class="row mb-3">
	  <!-- Button trigger modal -->
	  <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
	    환불
	  </button>
	
	  <!-- Modal -->
	  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
	    aria-hidden="true">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="exampleModalLabel">환불</h5>
	          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	        </div>
	        <div class="modal-body">
	          ${memberNickName}님을 환불 처리하시겠습니까?
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	          <button type="button" class="btn btn-success">환불</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	</main>
</body>
</html>