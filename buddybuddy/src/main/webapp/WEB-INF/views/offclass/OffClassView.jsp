<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/header.jsp"></jsp:include>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>main</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<style>
.main-btn-color {
	background-color: #50b8b3;
}

td {
	width: 50px;
	height: 50px;
	text-align: center;
	font-size: 20px;
	font-family: 굴림;
	border: 2px;
	border-color: #3333FF;
	border-radius: 8px;
	/*모서리 둥글게*/
}

th {
	width: 50px;
	height: 50px;
	text-align: center;
	font-size: 20px;
	font-family: 굴림;
	border: 2px;
	border-color: #3333FF;
	border-radius: 8px;
	/*모서리 둥글게*/
}

.modal-backdrop {
	z-index: 1020;
	position: relative;
}

.pagination {
	margin: 20px 0;
	border-radius: 4px;
}

#xxx1 {
	position: absolute;
	top: 0px;
	bottom: 0px;
	left: 0;
	right: 0;
	margin: auto;
}

#re tr, th {
	border: 1px solid black;
}
</style>
<script type="text/javascript">
	var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
	var date = new Date();//today의 Date를 세어주는 역할
	function prevCalendar() {//이전 달
		// 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
		//today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
		//getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
		today = new Date(today.getFullYear(), today.getMonth() - 1, today
				.getDate());
		buildCalendar(); //달력 cell 만들어 출력 
	}

	function nextCalendar() {//다음 달
		// 다음 달을 today에 값을 저장하고 달력에 today 넣어줌
		//today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
		//getMonth()는 현재 달을 받아 오므로 다음달을 출력하려면 +1을 해줘야함
		today = new Date(today.getFullYear(), today.getMonth() + 1, today
				.getDate());
		buildCalendar();//달력 cell 만들어 출력
	}

	var currentYear;
	var currentMonth;

	function buildCalendar() {//현재 달 달력 만들기
		var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
		//이번 달의 첫째 날,
		//new를 쓰는 이유 : new를 쓰면 이번달의 로컬 월을 정확하게 받아온다.     
		//new를 쓰지 않았을때 이번달을 받아오려면 +1을 해줘야한다. 
		//왜냐면 getMonth()는 0~11을 반환하기 때문
		var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
		//이번 달의 마지막 날
		//new를 써주면 정확한 월을 가져옴, getMonth()+1을 해주면 다음달로 넘어가는데
		//day를 1부터 시작하는게 아니라 0부터 시작하기 때문에 
		//대로 된 다음달 시작일(1일)은 못가져오고 1 전인 0, 즉 전달 마지막일 을 가져오게 된다
		var tbCalendar = document.getElementById("calendar");
		//날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
		var tbCalendarYM = document.getElementById("tbCalendarYM");
		//테이블에 정확한 날짜 찍는 변수
		//innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
		//new를 찍지 않아서 month는 +1을 더해줘야 한다. 
		tbCalendarYM.innerHTML = today.getFullYear() + "년 "
				+ (today.getMonth() + 1) + "월";

		currentYear = today.getFullYear();
		currentMonth = today.getMonth() + 1;

		/*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
		while (tbCalendar.rows.length > 2) {
			//열을 지워줌
			//기본 열 크기는 body 부분에서 2로 고정되어 있다.
			tbCalendar.deleteRow(tbCalendar.rows.length - 1);
			//테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지 
			//30일 이후로 담을달에 순서대로 열이 계속 이어진다.
		}
		var row = null;
		row = tbCalendar.insertRow();
		//테이블에 새로운 열 삽입//즉, 초기화
		var cnt = 0;// count, 셀의 갯수를 세어주는 역할
		// 1일이 시작되는 칸을 맞추어 줌
		for (i = 0; i < doMonth.getDay(); i++) {
			/*이번달의 day만큼 돌림*/
			cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
			
			cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
		}
		/*달력 출력*/
		for (i = 1; i <= lastDate.getDate(); i++) {
			//1일부터 마지막 일까지 돌림
			cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
			cell.innerHTML = i;//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
			
			cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
			if (cnt % 7 == 1) {/*일요일 계산*/
				//1주일이 7일 이므로 일요일 구하기
				//월화수목금토일을 7로 나눴을때 나머지가 1이면 cnt가 1번째에 위치함을 의미한다
				cell.innerHTML = "<font color=#F79DC2>" + i
				//1번째의 cell에만 색칠
			}
			if (cnt % 7 == 0) {/* 1주일이 7일 이므로 토요일 구하기*/
				//월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
				cell.innerHTML = "<font color=skyblue>" + i
				//7번째의 cell에만 색칠
				row = calendar.insertRow();
				//토요일 다음에 올 셀을 추가
			}
			/*오늘의 날짜에 노란색 칠하기*/
			if (today.getFullYear() == date.getFullYear()
					&& today.getMonth() == date.getMonth()
					&& i == date.getDate()) {
				//달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
				cell.bgColor = "#FAF58C";//셀의 배경색을 노랑으로 
			}
		}
	}
</script>


</head>

<body>
<c:set var ="stop" value="false"/>
	<!-- 컨테이너 입력 부분 -->
	<div class="container-lg">
		<div class="row">
			<div class="col-md-6">
				<div class="row">
					<div class="col-md-12">
						<div id="carouselExampleSlidesOnly" class="carousel slide"
							data-bs-ride="carousel" style="margin-bottom: 10px;">
							<div class="carousel-inner">
								<div class="carousel-item active">
									<c:forEach items="${offList.atList}" var="list">
										<c:if test="${not stop}">
										<c:if test="${list.fileName == null}">
											<img id="sum"
												src="${contextPath}/resources/images/noimage.png"
												style="width: 100%; height: 400px;" class="d-block w-100"
												alt="...">
												<c:set var ="stop" value="true"/>
										</c:if>
										<c:if test="${list.fileName != null && list.fileLevel !=0 }">
											<img id="sum"
												src="${contextPath}/${list.filePath}${list.fileName}"
												style="width: 100%; height: 400px;" class="d-block w-100"
												alt="...">
												<c:set var ="stop" value="true"/>
										</c:if>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-md-12 text-center">

						<c:forEach items="${offList.atList}" var="at">
							<c:if test="${!empty offList && at.fileLevel !=0}">
								<img name="image" alt="Bootstrap Image Preview" width="50px"
									height="50px" src="${contextPath}/${at.filePath}${at.fileName}" />
							</c:if>
						</c:forEach>
						<script>
							$("img[name='image']").on("click", function() {
								const imgSrc = $(this).attr("src");
								$('#sum').attr("src", imgSrc);
							});
						</script>
					</div>
				</div>
				<div class="row sticky-md-top" style="top: 10px;">
					<div class="col-md-3" style="padding: 0;">
						<a href="#class-1">
							<button type="button" class="btn btn-success main-btn-color"
								style="width: 100%;">클래스 소개</button>
						</a>
					</div>
					<div class="col-md-3" style="padding: 0;">
						<a href="#class-2">
							<button type="button"
								class="btn btn-success  btn-block main-btn-color"
								style="width: 100%;">장소</button>
						</a>
					</div>
					<div class="col-md-3" style="padding: 0;">
						<a href="#class-3">
							<button type="button"
								class="btn btn-success  btn-block main-btn-color"
								style="width: 100%;">상품 후기</button>
						</a>
					</div>
					<div class="col-md-3" style="padding: 0;">
						<a href="#class-4">
							<button type="button"
								class="btn btn-success  btn-block main-btn-color"
								style="width: 100%;">상품 문의</button>
						</a>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h3 id="class-1">
							<b>클래스 소개</b>
						</h3>
						<hr>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">${offList.classContent}</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h3 id="class-2">
							<b>장소</b>
						</h3>
						<hr>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div id="map" style="width: 500px; height: 400px;"></div>
						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d202420dc3e0c4ac77a9bab393085e5c&libraries=services"></script>

						<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								center : new kakao.maps.LatLng(33.450701,
										126.570667), // 지도의 중심좌표
								level : 3
							// 지도의 확대 레벨
							};

							// 지도를 생성합니다    
							var map = new kakao.maps.Map(mapContainer,
									mapOption);

							// 주소-좌표 변환 객체를 생성합니다
							var geocoder = new kakao.maps.services.Geocoder();

							// 주소로 좌표를 검색합니다
							geocoder
									.addressSearch(
											'${offList.classArea}',
											function(result, status) {

												// 정상적으로 검색이 완료됐으면 
												if (status === kakao.maps.services.Status.OK) {

													var coords = new kakao.maps.LatLng(
															result[0].y,
															result[0].x);

													// 결과값으로 받은 위치를 마커로 표시합니다
													var marker = new kakao.maps.Marker(
															{
																map : map,
																position : coords
															});

													// 인포윈도우로 장소에 대한 설명을 표시합니다
													var infowindow = new kakao.maps.InfoWindow(
															{
																content : '<div style="width:150px;text-align:center;padding:6px 0;">클래스 열리는 지역</div>'
															});
													infowindow
															.open(map, marker);

													// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
													map.setCenter(coords);
												}
											});
						</script>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h3 id="class-3">
							<b>상품 후기</b>
						</h3>
						<hr>
					</div>
				</div>
				<jsp:include page="offlineReview.jsp"></jsp:include>
				<div class="row">
					<div class="col-md-12">
						<h3 id="class-4">
							<b>상품 문의</b>
						</h3>
						<hr>
					</div>
				</div>
				<div class="row"  style="overflow:scroll;height:370px">
					<div class="col-md-12 mb-3">
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-12" style="padding: 0;">

										<img alt="Bootstrap Image Preview"
											src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg"
											width="25px" height="25px" class="rounded-circle"
											style="float: left; margin-left: 20px; margin-right: 20px;" />
										<h3 style="float: left; margin: 0;">아이디</h3>
										<span style="float: right; margin-right: 50px;">★★★★</span>
									</div>
								</div>
								<div style="border: 1px solid black;">
									상품 문의 자리
								</div>
								<button class="btn main-btn-color" style="float: right;">수정</button>
								<button class="btn main-btn-color" style="float: right;">삭제</button>
							</div>
						</div>
					</div>
				</div>
				<c:if test="${!empty loginMember }">
				<div class= "row">
					<div class="col-md-11" style="padding-right: 0px;">
						<div class="form-floating">
							<textarea class="form-control" id="floatingTextarea1"
								style="height: 100px; resize: none;"></textarea>
							<label for="floatingTextarea2">댓글</label>
						</div>
					</div>
					<div class="col-md-1" style="padding-left: 0px;">
						<button class="btn btn-success main-btn-color"
							style="width: 100%; height: 100%; text-align: center; padding: 0px;">
							<b>작성</b>
						</button>
					</div>
				</div>
				
				</c:if>
				<div class="row" style="margin-top: 50px;">
					<div class="col-md-12">
						<table id="re" class="table-style column active"
							data-ui="tab-panel" data-panel-id="info-refund"
							style="border: 1px solid black; width: 100%;">
							<colgroup>
								<col width="30%">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th>클래스 5일 전 취소 시</th>
									<th><span style="color: #22a7af">100%</span> 환불</td>
								</tr>
								<tr>
									<th>클래스 4일 전 취소 시</th>
									<th>클래스 금액의 <span style="color: #22a7af">5%</span> 차감 후 환불
									</td>
								</tr>
								<tr>
									<th>클래스 3일 전 취소 시</th>
									<th>클래스 금액의 <span style="color: #22a7af">10%</span> 차감 후
										환불
									</td>
								</tr>
								<tr>
									<th>클래스 2일 전 취소 시</th>
									<th>클래스 금액의 <span style="color: #22a7af">20%</span> 차감 후
										환불
									</td>
								</tr>
								<tr>
									<th>클래스 1일 전 취소 시</th>
									<th>클래스 금액의 <span style="color: #22a7af">30%</span> 차감 후
										환불
									</td>
								</tr>
								<tr>
									<th>클래스 당일 취소나 불참 시</th>
									<th><span style="color: #c74f48">환불 불가</span></td>
								</tr>
								<tr>
									<th>예약 당일 밤 12시 이전 취소 시</th>
									<th><span style="color: #22a7af">100%</span> 환불</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="row sticky-md-top"
					style="top: 10px; border: 1px solid black;">
					<div class="col-md-12">
						<div class="row">
							<div class="col-md-12">${offList.categoryName}</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<h2>${offList.classTitle }</h2>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12" style="padding: 0;">
								<img alt="Bootstrap Image Preview"
									src="${contextPath}/${offList.memberProfile}"
									width="25px" height="25px" class="rounded-circle"
									style="float: left; margin-left: 20px; margin-right: 20px;" />
								<h3 style="float: left; margin: 0;">${offList.memberNickName}</h3>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<h3>가격 : ${offList.classPrice }</h3>
							</div>
						</div>
						<div class="row" style="margin-bottom: 50px;">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-4 text-center"
										style="border-right: 1px solid black;">
										<h4>난이도</h4>
										<br>${offList.classLevel}
									</div>
									<div class="col-md-4 text-center"
										style="border-right: 1px solid black;">
										<h4>소요 시간</h4>
										<br>1
									</div>
									<div class="col-md-4 text-center">
										<h4>인원</h4>
										<br>${offList.reserveLimit}
									</div>
								</div>
							</div>
						</div>
						<div class="row">
						<c:if test="${!empty loginMember}">
							<div class="col-md-6 text-center">
								<button type="button"
									class="btn btn-primary btn-md btn-block main-btn-color">
									찜하기</button>
							</div>
							</c:if>
							<div class="col-md-6 text-center">


								<!-- Button trigger modal -->
								<c:if test="${!empty loginMember}">
								<button type="button"
									class="btn btn-primary btn-block main-btn-color"
									data-bs-toggle="modal" data-bs-target="#staticBackdrop">
									예약하기</button>
								</c:if>
						
								
								

								<!-- Modal -->
								<div class="modal" id="staticBackdrop" data-bs-backdrop="static"
									data-bs-keyboard="false" tabindex="-1"
									aria-labelledby="staticBackdropLabel" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="row">
												<div class="col-md-6">
													<p></p>

													<table id="calendar" border="3" id="cal"
														style="border-color: #3333FF; text-align: center">
														<tr>
															<!-- label은 마우스로 클릭을 편하게 해줌 -->
															<th><label onclick="prevCalendar()"> &lt;</label></th>
															<th align="center" id="tbCalendarYM" colspan="5">
																yyyy년 m월</th>
															<th><label onclick="nextCalendar()">> </label></th>
														</tr>
														<tr>
															<th align="center"><label style=''>일</label></th>
															<th align="center">월</th>
															<th align="center">화</th>
															<th align="center">수</th>
															<th align="center">목</th>
															<th align="center">금</th>
															<th align="center"><label style=''>토</label></th>
														</tr>
													</table>
													<script type="text/javascript">
														buildCalendar();//
													</script>
													

												</div>
												<input type="hidden" id="ReserveViewDate" value="">
												<div id="ReserveView" class="col-md-6">
												
												<!-- 	<div class="col-md-12" style="border:1px solid black">
													시작시간 13:00 ~ 종료시간 14:00 <br>
													현재 예약 인원수 : 0 <br>
													<div>
													<input type="number" style="width:50px"><button class="btn btn-primary" onclick="ajaxReserve">예약</button>
													</div>
													</div> -->
											
													<script>
														$(document).on("click",".reBtnInsert",function(){
															console.log(${offList.classNo});
															console.log(${loginMember.memberNo});
															console.log($("#ReserveViewDate").val());
															console.log($(this).parent().children('span').text());
															console.log($(this).parent().children('div').text());
															console.log($(this).prev().val());
														
															$.ajax({
																url : "${contextPath}/reserve/reserveInsert",
																type : "POST",
																data:{"classNo":${offList.classNo},
																	  "memberNo":${loginMember.memberNo},
																	  "reserveDate" : $("#ReserveViewDate").val(),
																	  "reserveStart": $(this).parent().children('#ajaxStart').text(),
																	  "reserveEnd":$(this).parent().children('div').text(),
																	  "insertNum":$(this).prev().val()
																      },
																dataType:"JSON",
																success : function(result){
																	console.log("삽입후반환값:"+result);
																	
																	if(result>0){
																		const thisDate =$("#ReserveViewDate").val();

																$.ajax({
																	url : "${contextPath}/reserve/relist",
																	type : "POST",
																	data : {"classNo" : ${classNo},
																			"reserveDate":thisDate
																	},
																	dataType : "JSON",
																	success : function(reList){
																		console.log(reList);
																		document.getElementById("ReserveView").innerHTML="";
																		  $.each(reList, function(index, item){
																			  	max = ${offList.reserveLimit}-parseInt(item.count);
																				var reDiv =document.createElement("div");
																				reDiv.setAttribute("class","col-md-12");
																				reDiv.setAttribute("style","border:1px solid black");
																				reDiv.innerHTML="시작시간 <span id='ajaxStart'>"+item.reserveStart+"</span> ~ 종료시간 <div style='display:inline')>"+item.reserveEnd+"</div><br>현재 예약 인원수 : <span id='ajaxin'>"+item.count+"</span><br>";
																				var reDiv1 =document.createElement("div");
																				var reinput =document.createElement("input");
																				reinput.setAttribute("type","number");
																				reinput.setAttribute("style","width:50px");
																				reinput.setAttribute("max",max);
																				reinput.setAttribute("min","0");
																				var rebtn =document.createElement("button");
																				rebtn.innerHTML="예약";
																				rebtn.setAttribute("type","button");
																				rebtn.setAttribute("class","btn btn-primary reBtnInsert");
																		
																				reDiv.appendChild(reinput);
																				reDiv.appendChild(rebtn);
																				document.getElementById("ReserveView").appendChild(reDiv);
																		  });
																	
																	
																	},
																	error : function(){
																		console.log("예약 목록 조회 실패");
																	}
																})
																	}
																},
																error : function(){
																	console.log("예약 실패");
																}
																
															});
														
														});
														
													</script>

												</div>
											</div>
											<div class="modal-footer">
												<button type="button"
													class="btn btn-secondary main-btn-color"
													data-bs-dismiss="modal">취소</button>
												
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<c:if test="${loginMember.memberNo == offList.memberNo}">
					<div class="row" style="margin-top:30px">
						<div class="col-md-6 " style="text-align: center">
						<a href="updateForm?classNo=${offList.classNo}" style="display: inline"><button type="button" class="btn btn-secondary main-btn-color" >수정</button></a>
						</div>
						<div class="col-md-6" style="text-align: center">
						<a href="deleteClass?classNo=${offList.classNo}" style="display: inline"><button type="button" class="btn btn-secondary main-btn-color" >삭제</button></a>
						</div>
					</div>
					</c:if>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12" style="text-align: right;">
				<!-- Button trigger modal -->
				<c:if test="${!empty loginMember }">
				<button type="button" class="btn btn-primary main-btn-color"
					data-bs-toggle="modal" data-bs-target="#exampleModal">클래스
					신고</button>
				</c:if>

				<!-- Modal -->
				<div class="modal" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">클래스 신고</h5>
								<button type="button" class="btn-close main-btn-color"
									data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body" style="height: 300px;">
								<div class="form-floating">
									<textarea class="form-control h-25"
										placeholder="Leave a comment here" id="floatingTextarea2x"
										rows="10" style="height: 100px; resize: none;"></textarea>
									<label for="floatingTextarea2x">클래스 신고 내용</label>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary main-btn-color"
									data-bs-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary main-btn-color">Save
									changes</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
	
		$(document).on(
				"click",
				"td",
				function() {
					const thisDate = currentYear + "-" + currentMonth + "-"
							+ $(this).text();

					console.log(thisDate);
					$("#ReserveViewDate").val(thisDate);
					console.log("date "+$("#ReserveViewDate").val());
					$("td").css("backgroundColor", "white");
					$(this).css("backgroundColor", "red");
					$.ajax({
						url : "${contextPath}/reserve/relist",
						type : "POST",
						data : {"classNo" : ${classNo},
								"reserveDate":thisDate
						},
						dataType : "JSON",
						success : function(reList){
							console.log(reList);
							document.getElementById("ReserveView").innerHTML="";
							  $.each(reList, function(index, item){
								  	max = ${offList.reserveLimit}-parseInt(item.count);
									var reDiv =document.createElement("div");
									reDiv.setAttribute("class","col-md-12");
									reDiv.setAttribute("style","border:1px solid black");
									reDiv.innerHTML="시작시간 <span id='ajaxStart'>"+item.reserveStart+"</span> ~ 종료시간 <div style='display:inline')>"+item.reserveEnd+"</div><br>현재 예약 인원수 : <span id='ajaxin'>"+item.count+"</span><br>";
									var reDiv1 =document.createElement("div");
									var reinput =document.createElement("input");
									reinput.setAttribute("type","number");
									reinput.setAttribute("style","width:50px");
									reinput.setAttribute("max",max);
									reinput.setAttribute("min","0");
									var rebtn =document.createElement("button");
									rebtn.innerHTML="예약";
									rebtn.setAttribute("type","button");
									rebtn.setAttribute("class","btn btn-primary reBtnInsert");
							
									reDiv.appendChild(reinput);
									reDiv.appendChild(rebtn);
									document.getElementById("ReserveView").appendChild(reDiv);
							  });
						
						
						},
						error : function(){
							console.log("예약 목록 조회 실패");
						}
					})
				});
		
		
		$(document).on("input","input",function(){
			var mmax = $(this).attr("max");
			if(mmax<$(this).val()){
				$(this).val(mmax);
			}
			
			if(0>$(this).val()){
				$(this).val(0);
			}
			
		});
	</script>


	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
</body>

</html>