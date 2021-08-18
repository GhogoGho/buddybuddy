<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>온라인 클래스 수강 페이지</title>

 

<!-- font-awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- bulma -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css"
	integrity="sha512-IgmDkwzs96t4SrChW29No3NXBIBv8baW490zk5aXvhCD8vuZM3yUSkbyTBcXohkySecyzIrUwiF/qV0cuPcL3Q=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- bootstrap -->	
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>


</head>
<body>
	<!-- 상단부 -->
	<jsp:include page="../common/header.jsp"/>
<style>
    /* nav 버튼 */
    .nav-pills .nav-link.active,
    .nav-pills .show>.nav-link {
      color: #fff;
      background-color: #50b8b3;
    }

    /* nav 글자 */
    .nav-link {
      display: block;
      padding: .5rem 1rem;
      
      color: #000;
      font-weight: bold;
      text-decoration: none;
      transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out;
    }
    /* nav 글자 hover */
		.nav-link:hover {
		color: #50b8b3;
		}

    /* 공지사항 */
    .list-group-item.active {
      z-index: 2;
      color: #fff;
      background-color: #198754;
      border-color: #198754;
    }
    /* 재생버튼 */
    .btn-success {
	    color: #50b8b3;
	    background-color: #fff;
	    border-color: #50b8b3;
		}
    .btn-success:hover {
	    color: #fff;
	    background-color: #50b8b3;
	    border-color: #50b8b3;
		}
    .btn-success:focus {
	    color: #fff;
	    background-color: #50b8b3;
	    border-color: #50b8b3;
		}
		/* 재생 프로그래스바 */
		.bg-success {
    	background-color: #50b8b3!important;
		}
    
   /*  a {
      color: #198754;
      text-decoration: underline;
    } */
</style>
	
	
	<c:forEach items="${online.atList}" var="at">
		<c:choose>
			<c:when test="${at.fileLevel == 0 && !empty at.fileName}">
				<c:set var="video0" value="${contextPath}/${at.filePath}${at.fileName}"/>
			</c:when>
			<c:when test="${at.fileLevel == 1 && !empty at.fileName}">
				<c:set var="video1" value="${contextPath}/${at.filePath}${at.fileName}"/>
			</c:when>
			<c:when test="${at.fileLevel == 2 && !empty at.fileName}">
				<c:set var="video2" value="${contextPath}/${at.filePath}${at.fileName}"/>
			</c:when>
			<c:when test="${at.fileLevel == 3 && !empty at.fileName}">
				<c:set var="video3" value="${contextPath}/${at.filePath}${at.fileName}"/>
			</c:when>
		</c:choose>
	</c:forEach>
	
	<div class="container">
     <div class="row justify-content-center">
       <div class="col-md-12">
       <c:if test="${!empty video0}">
         <video id="class-video"
           src="${video0}"
           type="video/mp4" style="width: 80rem; height: 30rem;" controlslist="nodownload" controls muted>
           동영상
         </video>
       </c:if>
         <hr>
         <!-- 네이게이션 메뉴 -->
         <ul class="nav nav-pills nav-fill mb-3 justify-content-center" id="pills-tab" role="tablist">
           <li class="nav-item" role="presentation">
             <button class="nav-link active" id="pills-list-tab" data-bs-toggle="pill" data-bs-target="#pills-list"
               type="button" role="tab" aria-controls="pills-list" aria-selected="true">클래스 진행과정</button>
           </li>
           <!-- <li class="nav-item" role="presentation">
             <button class="nav-link" id="pills-notice-tab" data-bs-toggle="pill" data-bs-target="#pills-notice"
               type="button" role="tab" aria-controls="pills-notice" aria-selected="false">공지사항</button>
           </li> -->
         </ul>
         
         <hr>
         <div class="tab-content" id="pills-tabContent">
           <!-- 클래스 진행과정 시작 -->
           <div class="tab-pane fade show active" id="pills-list" role="tabpanel" aria-labelledby="pills-list-tab">
             <div class="col-md-12">
               <p class="h3 my-4" id="class-list">${online.memberNickName}의 강좌</p>
               <hr>
               <ul class="class-list-content list-group col-md-12">
               <c:if test="${!empty video1}">
                 <li class="list-group-item">
                   <div class="row">
                     <div class="col-md-3">
                       <video src="${video1}" type="video/mp4" width="200" height="200" class="user-image me-2" id="playVideo">
                     </div>
                     <div class="col-md-9">
                       <p class="h3 fw-bold">01. 강의</p>
                       <p class="h6"></p>
                     </div>
                   </div>
                   <div class="row ">
                     <div class="mb-2 d-grid gap-2 d-md-flex justify-content-md-end">
                       <button class="btn btn-success btn-lg" id="btn-play1">
                         재생
                       </button>
                     </div>
                   </div>
                 </li>
                 </c:if>
                 <c:if test="${!empty video2}">
                 <li class="list-group-item">
                   <div class="row">
                     <div class="col-md-3">
                     	<video src="${video2}" type="video/mp4" width="200" height="200" class="user-image me-2">
                     </div>
                     <div class="col-md-9">
                       <p class="h3 fw-bold">02. 강의</p>
                       <p class="h6"></p>
                     </div>
                   </div>
                   <div class="row">
                     <div class="mb-2 d-grid gap-2 d-md-flex justify-content-md-end">
                       <button class="btn btn-success btn-lg" id="btn-play2">
                         재생
                       </button>
                     </div>
                   </div>
                 </li>
                 </c:if>
                 <c:if test="${!empty video3}">
                 <li class="list-group-item">
                   <div class="row">
                     <div class="col-md-3">
                     	<video src="${video3}" type="video/mp4" width="200" height="200" class="user-image me-2">
                     </div>
                     <div class="col-md-9">
                       <p class="h3 fw-bold">03. 강의</p>
                       <p class="h6"></p>
                     </div>
                   </div>
                   <div class="row">
                     <div class="mb-2 d-grid gap-2 d-md-flex justify-content-md-end">
                       <button class="btn btn-success btn-lg" id="btn-play3">
                         재생
                       </button>
                     </div>
                   </div>
                 </li>
                 </c:if>
               </ul>
               <hr>
             </div>
           </div>


           <!-- 공지사항 -->
           <div class="tab-pane fade" id="pills-notice" role="tabpanel" aria-labelledby="pills-notice-tab">
             <jsp:include page="../creater/noticeList.jsp"/>
           </div>

         </div>
       </div>
     </div>
   </div>
	
	
	<!-- 하단부 -->
	<jsp:include page="../common/footer.jsp"/>
</body>

<script>
let video = $('#class-video');
console.log(video.progress);

$(document).on("click", "#btn-play1", function(){
	 let video = $('#class-video');
   let videoDom = video.get(0);
   let button = $('#btn-play1');
   let cTime = video.attr("currentTime");
     if(videoDom.paused){
	      video.attr({ 'src': '${video1}' });
	      videoDom.play();
	      
	      button.attr({'class':'btn btn-danger btn-lg'});
	      $("#btn-play2").text("재생");
	      $("#btn-play2").attr({'class':'btn btn-success btn-lg'});
	      $("#btn-play3").text("재생");
	      $("#btn-play3").attr({'class':'btn btn-success btn-lg'});
	      $(this).text('일시정지');
	      /* button.text('일시정지'); */
	      console.log(cTime);
     }else{
   	  videoDom.pause();
   	  
   	  button.attr({'class':'btn btn-success btn-lg'});
   	  button.text('재생');
     }
});
$(document).on("click", "#btn-play2", function(){
	 let video = $('#class-video');
     let videoDom = video.get(0);
     let button = $('#btn-play2');
     if(videoDom.paused){
	      video.attr({ 'src': '${video2}' });
	      videoDom.play();
	      
	      button.attr({'class':'btn btn-danger btn-lg'});
	      $("#btn-play1").text("재생");
	      $("#btn-play1").attr({'class':'btn btn-success btn-lg'});
	      $("#btn-play3").text("재생");
	      $("#btn-play3").attr({'class':'btn btn-success btn-lg'});
	      $(this).text('일시정지');
	      /* button.text('일시정지'); */
	      
     }else{
   	  videoDom.pause();
   	  
   	  button.attr({'class':'btn btn-success btn-lg'});
   	  button.text('재생');
     }
});
$(document).on("click", "#btn-play3", function(){
	 let video = $('#class-video');
     let videoDom = video.get(0);
     let button = $('#btn-play3');
     if(videoDom.paused){
	      video.attr({ 'src': '${video3}' });
	      videoDom.play();
	      
	      button.attr({'class':'btn btn-danger btn-lg'});
	      $("#btn-play1").text("재생");
	      $("#btn-play1").attr({'class':'btn btn-success btn-lg'});
	      $("#btn-play2").text("재생");
	      $("#btn-play2").attr({'class':'btn btn-success btn-lg'});
	      $(this).text('일시정지');
	      /* button.text('일시정지'); */
	      
     }else{
   	  videoDom.pause();
   	  
   	  button.attr({'class':'btn btn-success btn-lg'});
   	  button.text('재생');
     }
});

 

</script>

<!-- 인디케이터 : Indicator (Progress Bar) --> 
<script type="text/javascript" src="https://rawcdn.githack.com/mburakerman/prognroll/0feda211643153bce2c69de32ea1b39cdc64ffbe/src/prognroll.js"></script> 
<script type="text/javascript"> 
	$(function() { 
		$("body").prognroll({ 
			height: 10, 
			color: "#50b8b3" 
		}); 
		$(".content").prognroll({ 
			custom: true 
			}); 
		}); 
</script>



</html>