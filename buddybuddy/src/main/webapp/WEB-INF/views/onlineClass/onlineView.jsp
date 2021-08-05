<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>온라인 클래스 소개 페이지</title>

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
  crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>


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

</head>
<body>
	<main>
		<!-- 상단부 -->
		<jsp:include page="../common/header.jsp"/>
	
	
		<div class="container">
      <div class="row">
        <!-- 동영상,클래스목차 -->
        <!-- <div class="row"> -->
        <div class="col-md-7">
          <div class="row">
            <video
              src="https://cdn.videvo.net/videvo_files/video/premium/video0234/large_watermarked/02_Selo_zakat_II_43_girl_run_hd_slow_preview.mp4"
              type="video/mp4" controls>
              동영상
            </video>
          </div>
          <hr>
          <!-- 네이게이션 메뉴 -->
          <table class="table table-borderless text-center">
            <tr>
              <td>
                <a href="#class-introduce" class="btn">클래스 소개</a>
              </td>
              <td>
                <a href="#class-review" class="btn">수강 후기</a>
              </td>
              <td>
                <a href="#class-reply" class="btn">댓글</a>
              </td>
              <td>
                <a href="#class-refund" class="btn">환불 정책</a>
              </td>
            </tr>
          </table>
          <hr>
        </div>
        <!-- 클래스 구매 -->
        <div class="col-md-5 sticky-md-top">
          <div class="card border-dark mb-3" id="payment-class" style="max-width: 30rem; height: 25rem;">
            <div class="card-header bg-transparent border-dark">
              <img src="https://via.placeholder.com/150" width="30" height="30" class="rounded-1 float-start me-2">
              <a href="#" style="text-decoration: none;">크리에이터명</a>
            </div>
            <div class="card-body text-dark">
              <div class="row">
                <div class="col-md-9">
                  <h6 class="card-subtitle">${categoryName}</h6>
                  <h5 class="card-title">${className}</h5>
                </div>
                <div class="col-md-3 text-end">
                  <button type="button" class="btn btn-light btn-sm">
                    <i class="fas fa-heartbeat"> 찜하기</i>
                  </button>
                </div>
              </div>
              <table class="table table-striped text-center">
                <tr>
                  <td>수강 시작일</td>
                  <td>난이도</td>
                  <td>준비물</td>
                </tr>
                <tr>
                  <td>신청 즉시</td>
                  <td>쉬움</td>
                  <td>있음</td>
                </tr>
              </table>
              <p class="card-text">
                클래스 간단 소개?
                구매 옵션?
              </p>
            </div>
            <div class="card-footer bg-transparent border-dark text-center">
              <div class="row">
                <button type="button" class="btn btn-success btn-lg">수강신청</button>
              </div>
              <div class="row">
								<%-- <a href="${contextPath}/class/video">수강하기 임시</a> --%>
								<a href="${online.classNo}?cp=${pagination.currentPage}${searchStr}/video">수강하기 임시</a>
							</div>
            </div>
          </div>
        </div>
        <!-- 클래스 구매 끝 -->
        <!-- </div> -->
        <!-- </div> -->
        <!-- 클래스 소개 시작 -->
        <!-- <div class="container"> -->
        <div class="row">
          <div class="col-md-7">
            <p class="h3" id="class-introduce">클래스 소개</p>
            <p>이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을
              위하여
              광야에서 방황하였으며 공자는 무엇을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여서 미인을 구하기 위하여서 그리하였는가? 아니다 그들은 커다란 이상 곧 만천하의 대중을 품에 안고
              그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으며 그들의 그림자는 천고에
              사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다

              용기가 있다 그러므로 그들은 이상의 보배를 능히 품으며 그들의 이상은 아름답고 소담스러운 열매를 맺어 우리 인생을 풍부하게 하는 것이다 보라 청춘을 ! 그들의 몸이 얼마나 튼튼하며 그들의
              피부가
              얼마나 생생하며 그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 귀는 생의 찬미를 듣는다 그것은 웅대한 관현악이며 미묘한 교향악이다 뼈 끝에 스며들어 가는 열락의
              소리다이것은 피어나기 전인 유소년에게서 구하지 못할 바이며 시들어 가는 노년에게서 구하지 못할 바이며 오직 우리 청춘에서만 구할 수 있는 것이다 청춘은 인생의 황금시대다 우리는 이 황금시대의
              가치를 충분히 발휘하기 위하여

              가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며
              예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여서 미인을 구하기 위하여서 그리하였는가? 아니다 그들은 커다란 이상 곧 만천하의
              대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으며 그들의
              그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도 창공에 반짝이는 뭇 별과 같이 산야에 피어나는 군영과 같이 이상은 실로 인간의
              부패를
              방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에</p>
          </div>
        </div>
        <!-- </div> -->


        <!-- 수강후기 시작 -->
        <!-- <div class="container"> -->
        <div class="col-md-7">
          <p class="h3 my-4" id="class-review">수강 후기</p>
          <hr>
          <ul class="qna-reply-content list-group col-md-12">
            <li class="list-group-item">
              <div class="d-flex justify-content-between align-items-center">
                <div class="ms-2 me-auto">
                  <div class="fw-bold">
                    <img src="https://github.com/mdo.png" width="30" height="30"
                      class="user-image rounded-circle me-2">${memberNickName}
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
                    <img src="https://github.com/mdo.png" width="30" height="30"
                      class="user-image rounded-circle me-2">${memberNickName}
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
                  <div class="fw-bold"><img src="https://github.com/mdo.png" width="30" height="30"
                      class="user-image rounded-circle me-2">${memberNickName}</div>
                </div>
              </div>
              <div class="input-group ms-2 my-2">
                <textarea class="form-control" id="edit-reply" rows="5">수정 내용</textarea>
                <button class="btn btn-outline-success">수정</button>
              </div>
            </li>
          </ul>
          <hr>
          <div class="col-md-12">
            <p class="h5">수강 후기 작성</p>
            <div class="input-group my-2">
              <textarea class="form-control" id="edit-reply" rows="5"></textarea>
              <button class="btn btn-outline-success">작성</button>
            </div>
          </div>
        </div>
        <!-- </div> -->
        <!-- 댓글 시작 -->
        <!-- <div class="container mt-5"> -->
        <div class="col-md-7">
          <p class="h3 my-4" id="class-reply">댓글</p>
          <hr>
          <ul class="qna-reply-content list-group col-md-12">
            <li class="list-group-item">
              <div class="d-flex justify-content-between align-items-center">
                <div class="ms-2 me-auto">
                  <div class="fw-bold">
                    <img src="https://github.com/mdo.png" width="30" height="30"
                      class="user-image rounded-circle me-2">${memberNickName}
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
                    <img src="https://github.com/mdo.png" width="30" height="30"
                      class="user-image rounded-circle me-2">${memberNickName}
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
                  <div class="fw-bold"><img src="https://github.com/mdo.png" width="30" height="30"
                      class="user-image rounded-circle me-2">${memberNickName}</div>
                </div>
              </div>
              <div class="input-group ms-2 my-2">
                <textarea class="form-control" id="edit-reply" rows="5">수정 내용</textarea>
                <button class="btn btn-outline-success">수정</button>
              </div>
            </li>
          </ul>
          <hr>
          <div class="col-md-12">
            <p class="h5">댓글 작성</p>
            <div class="input-group my-2">
              <textarea class="form-control" id="edit-reply" rows="5"></textarea>
              <button class="btn btn-outline-success">작성</button>
            </div>
          </div>
        </div>
        <!-- </div> -->

        <!-- <div class="container mt-5"> -->
        <div class="row">
          <div class="col-md-7">
            <p class="h2" id="class-refund">취소 및 환불 정책</p>
            <hr>
          </div>
        </div>
        <div class="row mt-6">
          <div class="col-md-7">
            <table class="table table-success table-striped">
              <thead>
                <tr>
                  <th scope="col"></th>
                  <th scope="col">클래스 영상 시청 전</th>
                  <th scope="col">클래스 영상 시청 후</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td scope="row">클래스 신청 후, 7일 이내</td>
                  <td>전액 환불</td>
                  <td>사용일수에 따른.....어쩌구</td>
                </tr>
                <tr>
                  <td scope="row">클래스 신청 후, 7일 이후</td>
                  <td>이용권 판매금액에서 10% 수수료 차감 후,</td>
                  <td>환불 불가</td>
                </tr>
              </tbody>
            </table>
            <p>단, 이런저런 경우 환불이 불가능합니다...</p>
          </div>
        </div>
      </div>
    </div>	
	
	
		<!-- 하단부 -->
		<jsp:include page="../common/footer.jsp"/>
	</main>
</body>
</html>