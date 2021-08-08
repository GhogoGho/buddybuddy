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
           <li class="nav-item" role="presentation">
             <button class="nav-link" id="pills-notice-tab" data-bs-toggle="pill" data-bs-target="#pills-notice"
               type="button" role="tab" aria-controls="pills-notice" aria-selected="false">공지사항</button>
           </li>
           <!-- <li class="nav-item" role="presentation">
             <button class="nav-link" id="pills-reply-tab" data-bs-toggle="pill" data-bs-target="#pills-reply"
               type="button" role="tab" aria-controls="pills-reply" aria-selected="false">댓글</button>
           </li>
           <li class="nav-item" role="presentation">
             <button class="nav-link" id="pills-tete-tab" data-bs-toggle="pill" data-bs-target="#pills-tete"
               type="button" role="tab" aria-controls="pills-tete" aria-selected="false">수강후기</button>
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
                   <!-- <div class="d-flex justify-content-between align-items-center"> -->
                   <div class="row">
                     <div class="col-md-3">
                       <video src="${video1}" type="video/mp4" width="200" height="200" class="user-image me-2">
                     </div>
                     <div class="col-md-9">
                       <p class="h5 fw-bold">01. 프롤로그</p>
                       <p class="h6">안녕하세요. 일상의 소소한 모습들을 그리고 적어봅시다.</p>
                     </div>
                   </div>
                   <div class="row ">
                     <div class="mb-2 d-grid gap-2 d-md-flex justify-content-md-end">
                       <button class="btn btn-success btn-lg" id="btn-play1">
                         재생
                       </button>
                     </div>
                     <div class="progress">
                       <div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25"
                         aria-valuemin="0" aria-valuemax="100"></div>
                     </div>
                   </div>
                   <!-- </div> -->
                 </li>
                 </c:if>
                 <c:if test="${!empty video2}">
                 <li class="list-group-item">
                   <div class="row">
                     <div class="col-md-3">
                     	<video src="${video2}" type="video/mp4" width="200" height="200" class="user-image me-2">
                     </div>
                     <div class="col-md-9">
                       <p class="h5 fw-bold">02. 재료와 도구</p>
                       <p class="h6">아이패드와 프로크리에이트 앱 소개하며 기본기를 다져볼까요?</p>
                     </div>
                   </div>
                   <div class="row">
                     <div class="mb-2 d-grid gap-2 d-md-flex justify-content-md-end">
                       <button class="btn btn-success btn-lg" id="btn-play2">
                         재생
                       </button>
                     </div>
                     <div class="progress">
                       <div class="progress-bar bg-success" role="progressbar" style="width: 50%" aria-valuenow="25"
                         aria-valuemin="0" aria-valuemax="100"></div>
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
                       <p class="h5 fw-bold">03. 완성과 마무리</p>
                       <p class="h6">완성 단계까지 오신 것을 환영합니다.</p>
                     </div>
                   </div>
                   <div class="row">
                     <div class="mb-2 d-grid gap-2 d-md-flex justify-content-md-end">
                       <button class="btn btn-success btn-lg" id="btn-play3">
                         재생
                       </button>
                     </div>
                     <div class="progress">
                       <div class="progress-bar bg-success" role="progressbar" style="width: 50%" aria-valuenow="25"
                         aria-valuemin="0" aria-valuemax="100"></div>
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



           <!-- 댓글 시작 -->
           <div class="tab-pane fade" id="pills-reply" role="tabpanel" aria-labelledby="pills-reply-tab">
             <div class="col-md-12">
               <p class="h3 my-4" id="class-reply">댓글</p>
               <hr>
               <ul class="class-reply-content list-group col-md-12">
                 <li class="list-group-item">
                   <div class="d-flex justify-content-between align-items-center">
                     <div class="ms-2 me-auto">
                       <div class="fw-bold">
                         <img
                           src="https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDF8fHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
                           width="30" height="30" class="user-image rounded-circle me-2">${memberNickName}
                       </div>
                     </div>
                     <span class="date me-2">0000년 00월 00일 00:00</span>
                     <ul class="reply-action list-inline me-2">
                       <li class="list-inline-item">
                         <a href="#" class="btn btn-outline-success">수정</a>
                         <a href="#" class="btn btn-outline-secondary">삭제</a>
                       </li>
                     </ul>
                   </div>
                   <div class="ms-2">가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를
                     가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게
                     살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며
                     예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 위하여 천하를
                     철환하였는가? 밥을 위하여서 옷을 위하여서 미인을 구하기 위하여서 그리하였는가?
                     아니다 그들은 커다란 이상 곧 만천하의
                   </div>
                 </li>
                 <li class="list-group-item">
                   <div class="d-flex justify-content-between align-items-center">
                     <div class="ms-2 me-auto">
                       <div class="fw-bold">
                         <img
                           src="https://images.unsplash.com/flagged/photo-1578074611062-4387baa90b42?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTE3fHxwcm9maWxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
                           width="30" height="30" class="user-image rounded-circle me-2">${memberNickName}
                       </div>
                     </div>
                     <span class="date me-2">0000년 00월 00일 00:00</span>
                     <ul class="reply-action list-inline me-2">
                       <li class="list-inline-item">
                         <a href="#" class="btn btn-outline-success">수정</a>
                         <a href="#" class="btn btn-outline-secondary">삭제</a>
                       </li>
                     </ul>
                   </div>
                   <div class="ms-2">가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를
                     가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게
                     살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며
                     예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 위하여 천하를
                     철환하였는가? 밥을 위하여서 옷을 위하여서 미인을 구하기 위하여서 그리하였는가?
                     아니다 그들은 커다란 이상 곧 만천하의
                   </div>
                 </li>
                 <li class="list-group-item">
                   <div class="d-flex justify-content-between align-items-center">
                     <div class="ms-2 me-auto">
                       <div class="fw-bold"><img
                           src="https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDF8fHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
                           width="30" height="30" class="user-image rounded-circle me-2">${memberNickName}</div>
                     </div>
                   </div>
                   <div class="input-group ms-2 my-2">
                     <textarea class="form-control" id="edit-reply" rows="2">수정 내용</textarea>
                     <button class="btn btn-outline-success">수정</button>
                   </div>
                 </li>
               </ul>
               <hr>
               <div class="col-md-12">
                 <p class="h5">댓글 작성</p>
                 <div class="input-group my-2">
                   <textarea class="form-control" id="edit-reply" rows="2"></textarea>
                   <button class="btn btn-outline-success">작성</button>
                 </div>
               </div>
             </div>
           </div>



           <!-- bulma 테스트 -->
           <div class="tab-pane fade" id="pills-tete" role="tabpanel" aria-labelledby="pills-tete-tab">
             <p class="h3 my-4" id="class-reply">수강후기</p>
             <hr>
             <article class="media">
               <figure class="media-left">
                 <p class="image is-64x64">
                   <img
                     src="https://images.unsplash.com/photo-1627889701110-cc04941c8208?ixid=MnwxMjA3fDB8MHxwcm9maWxlLXBhZ2V8Mnx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60">
                 </p>
               </figure>
               <div class="media-content">
                 <div class="content">
                   <p>
                     <strong>Barbara Middleton</strong>
                     <br>
                     <div id="notice-con">
                       나의 무엇인지 나는 불러 오는 토끼, 것은 버리었습니다. 위에 사랑과 어머님, 밤이 걱정도 까닭입니다. 멀리 언덕 별이 마디씩 그리워 때 피어나듯이 듯합니다. 내 그리워 언덕 언덕 피어나듯이 소학교 릴케 이름과, 못 거외다. 패, 이런 별 이름을 묻힌 속의 있습니다.
                     </div>
                     <br>
                     <small>
                       <a>
                         <button class="button is-success is-small is-rounded">수정</button>
                       </a>
                       <a><button class="button is-danger is-small is-rounded">삭제</button>
                       </a>
                       0000년 00월 00일 00:00
                     </small>
                   </p>
                 </div>

                 <article class="media">
                   <figure class="media-left">
                     <p class="image is-48x48">
                       <img
                         src="https://images.unsplash.com/photo-1627828940313-e62fee6fd02d?ixid=MnwxMjA3fDB8MHxwcm9maWxlLXBhZ2V8Nnx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60">
                     </p>
                   </figure>
                   <div class="media-content">
                     <div class="content">
                       <p>
                         <strong>Sean Brown</strong>
                         <br>
                         <div id="notice-con">
                           언덕 다 새겨지는 프랑시스 하늘에는 있습니다. 아름다운 묻힌 어머니, 것은 이름과, 버리었습니다. 이제 밤이 그리워 별 써 이네들은 그리고 계절이 계십니다. 같이 가난한 마리아 잔디가 쓸쓸함과 계십니다. 새겨지는 오면 별 이름과, 마디씩 있습니다.
                         </div>
                         <br>
                         <small>
                           <a>
                             <button class="button is-success is-small is-rounded">수정</button>
                           </a>
                           <a><button class="button is-danger is-small is-rounded">삭제</button>
                           </a>
                           0000년 00월 00일 00:00
                         </small>
                       </p>
                     </div>

                     <article class="media">
                       이상은 청춘을 청춘의 인도하겠다는 인생의 때에, 것이다. 가치를 커다란 품었기 속잎나고, 그러므로 피에 있으랴? 눈이 길지 꽃 충분히 남는 듣기만 끝까지 운다.
                     </article>

                     <article class="media">
                       풀이 피부가 그들의 품에 길을 새 만물은 듣는다. 싸인 우리 청춘을 얼마나 쓸쓸하랴? 고동을 바이며, 얼마나 무엇을 위하여서 바로 간에 그들을 모래뿐일 아니다. 이상의 가는 얼음에 그들은 청춘 그러므로 듣는다.
                     </article>
                   </div>
                 </article>

                 <article class="media">
                   <figure class="media-left">
                     <p class="image is-48x48">
                       <img
                         src="https://images.unsplash.com/photo-1627828939428-66f34bdf3bbf?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMDF8fHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60">
                     </p>
                   </figure>
                   <div class="media-content">
                     <div class="content">
                       <p>
                         <strong>Kayli Eunice </strong>
                         <br>
                         <div id="notice-con">
                           이런 어머니 이국 다 벌레는 아이들의 봅니다. 위에도 피어나듯이 흙으로 밤이 벌레는 자랑처럼 아직 있습니다. 시와 별에도 나의 책상을 하나에 라이너 거외다. 했던 아무 지나가는 계십니다. 다 이름자 너무나 오는 듯합니다. 이름과 쉬이 이름자를 아침이 써 나는 이런 속의 있습니다. 마디씩 애기 멀듯이, 새겨지는 까닭입니다.
                         </div>
                         <br>
                         <small>
                           <a>
                             <button class="button is-success is-small is-rounded">수정</button>
                           </a>
                           <a><button class="button is-danger is-small is-rounded">삭제</button>
                           </a>
                           0000년 00월 00일 00:00
                         </small>
                       </p>
                     </div>
                   </div>
                 </article>
               </div>
             </article>

             <article class="media">
               <figure class="media-left">
                 <p class="image is-64x64">
                   <img src="https://bulma.io/images/placeholders/128x128.png">
                 </p>
               </figure>
               <div class="media-content">
                 <div class="field">
                   <p class="control">
                     <textarea class="textarea" placeholder="수강후기를 작성해 주세요."></textarea>
                   </p>
                 </div>
                 <div class="field">
                   <p class="control">
                     <button class="button is-success is-medium">작성</button>
                   </p>
                 </div>
               </div>
             </article>
           </div>
         </div>
       </div>
     </div>
   </div>
	
	
	<!-- 하단부 -->
	<jsp:include page="../common/footer.jsp"/>
</body>

<script>
$(document).on("click", "#btn-play1", function(){
	 let video = $('#class-video');
     let videoDom = video.get(0);
     let button = $('#btn-play1');
     if(videoDom.paused){
	      video.attr({ 'src': '${video1}' });
	      videoDom.play();
	      
	      button.attr({'class':'btn btn-danger btn-lg'});
	      button.text('일시정지');
	      
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
	      button.text('일시정지');
	      
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
	      button.text('일시정지');
	      
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