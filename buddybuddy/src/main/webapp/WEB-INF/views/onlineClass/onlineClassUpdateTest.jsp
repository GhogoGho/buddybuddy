<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>온라인 클래스 수정 페이지</title>

<!-- bulma -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">

<!-- fontAwesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- 썸머노트 API -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script src="${contextPath}/resources/summer/summernote-ko-KR.js"></script>
<script src="${contextPath}/resources/summer/summernote-lite.js"></script>
<link rel="stylesheet"
	href="${contextPath}/resources/summer/summernote-lite.css">
	
	
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>
	<!-- 동영상 출력 -->
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
		<form action="updateSummer" method="POST" enctype="multipart/form-data" role="form" onsubmit="return classValidate();">
		
			<div class="row">
				<div class="col-md-3 mt-4">
					<c:if test="${ !empty category}">
					<div class="control has-icons-left">
						<div class="select is-large is-rounded">
							<select name="categoryNo" id="categoryNo" required>
								<c:forEach items="${category}" var="c">
								<option value="${c.categoryNo}">${c.categoryName}</option>
								</c:forEach>
							</select>
						</div>
						<span class="icon is-large is-left"> 
							<i class="fas fa-th-list"></i>
						</span>
					</div>
					</c:if>
				</div>
			</div>
			<!-- 클래스 금액 -->
			<div class="columns">
				<div class="column">
					<label class="form-label" for="classPrice">클래스 가격</label> 
					<input class="input is-rounded" id="classPrice"
						name="classPrice" type="text" placeholder="금액을 입력해 주세요." value="${online.classPrice }" required>
				</div>
			</div>
			<!-- 클래스 제목 -->
			<div class="row">
				<div class="col-md-10">
					<label class="form-label" for="classTitle">제목</label> 
					<input class="input is-medium is-rounded" id="classTitle"
						name="classTitle" type="text" placeholder="제목을 입력해 주세요." value="${online.classTitle }" required>
					<hr>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-10">
					<!-- 썸네일 출력 -->
					<div class="form-inline">
						<label class="input-group-addon mr-3 insert-label">썸네일</label>
						<div class="classVideo thubnail" id=titleVideoArea>
							<!-- video0 변수가 만들어진 경우 -->
							<c:if test="${!empty video0 }">  <video style="width:300px;" id="titleVideo" src="${video0}"> </c:if>
							<c:if test="${empty video0 }">  <video id="titleVideo"> </c:if>
							
							<span class="deleteVideo">x</span>	
								
						</div>
					</div>
					<!-- 썸네일 동영상 -->
					<div class="columns mb-3">
						<div class="column">
							<div class="file is-success is-boxed">
								<label class="file-label"> 
								<input class="file-input" type="file" id="video0" name="videos" onchange="LoadVideo(this,0)" accept="video/mp4"> 
									<span class="file-cta">
										<span class="file-icon"> 
											<i class="fas fa-camera-retro"></i>
										</span> 
										<span class="file-label"> 
										썸네일 동영상 
										</span>
									</span>
								</label>
							</div>
						</div>
					</div>
					
					<!-- 클래스1 출력 -->
					<div class="mr-2 classVideo" id="contentVideoArea1">
						<c:if test="${!empty video1 }">  <video style="width:200px;" id="titleVideo" src="${video1}"> </c:if>
						<c:if test="${empty video1 }">  <video style="width:200px;" id="titleVideo"> </c:if>
						<span class="deleteVideo">x</span>
					</div>
					<!-- 클래스1 동영상 -->
					<div class="columns mb-2">
						<div class="column">
							<div class="file is-dark">
							  <label class="file-label">
							    <input class="file-input" type="file" id="video1" name="videos" onchange="LoadVideo(this,1)" accept="video/mp4">
							    <span class="file-cta">
							      <span class="file-icon">
							        <i class="fas fa-film"></i>
							      </span>
							      <span class="file-label">
							        클래스 동영상
							      </span>
							    </span>
							  </label>
							</div>
						</div>
					</div>
					
					<!-- 클래스2 출력 -->
					<div class="mr-2 classVideo" id="contentVideoArea2">
						<c:if test="${!empty video2 }">  <video style="width:200px;" id="titleVideo" src="${video2}"> </c:if>
						<c:if test="${empty video2 }">  <video style="width:200px;" id="titleVideo"> </c:if>
						<span class="deleteVideo">x</span>
					</div>
					<!-- 클래스2 동영상 -->
					<div class="columns mb-2">
						<div class="column">
							<div class="file is-dark">
							  <label class="file-label">
							    <input class="file-input" type="file" id="video2" name="videos" onchange="LoadVideo(this,2)" accept="video/mp4">
							    <span class="file-cta">
							      <span class="file-icon">
							        <i class="fas fa-film"></i>
							      </span>
							      <span class="file-label">
							        클래스 동영상
							      </span>
							    </span>
							  </label>
							</div>
						</div>
					</div>
					
					<!-- 클래스3 출력 -->
					<div class="mr-2 classVideo" id="contentVideoArea3">
						<c:if test="${!empty video3 }">  <video style="width:200px;" id="titleVideo" src="${video3}"> </c:if>
						<c:if test="${empty video3 }">  <video style="width:200px;" id="titleVideo"> </c:if>
						<span class="deleteVideo">x</span>
					</div>
					<!-- 클래스3 동영상 -->
					<div class="columns mb-2">
						<div class="column">
							<div class="file is-dark">
							  <label class="file-label">
							    <input class="file-input" type="file" id="video3" name="videos" onchange="LoadVideo(this,3)" accept="video/mp4">
							    <span class="file-cta">
							      <span class="file-icon">
							        <i class="fas fa-film"></i>
							      </span>
							      <span class="file-label">
							        클래스 동영상
							      </span>
							    </span>
							  </label>
							</div>
						</div>
					</div>

				</div>
			</div>
			
			<!-- 썸머노트 start -->
			<div class="row">
				<div class="col-md-10">
					<textarea class="summernote" name="classContent" required>${online.classContent}</textarea>
				</div>
				<script>
					$(document).ready(function() {
						$('.summernote').summernote(
								{
									height : 500,
									lang : 'ko-KR',
									toolbar : [
										
											[ 'fontname',
													[ 'fontname' ] ],
											[ 'fontsize',
													[ 'fontsize' ] ],
											[
													'style',
													[
															'bold',
															'italic',
															'underline',
															'strikethrough',
															'clear' ] ],
											[
													'color',
													[ 'forecolor',
															'color' ] ],
											[ 'table', [ 'table' ] ],
											[
													'para',
													[ 'ul', 'ol',
															'paragraph' ] ],
											[ 'height', [ 'height' ] ],
											[
													'insert',
													[ 'picture',
															'link',
															'video' ] ],
											[
													'view',
													[ 'fullscreen',
															'help' ] ] ],
									fontNames : [ 'Arial',
											'Arial Black',
											'Comic Sans MS',
											'Courier New', '맑은 고딕',
											'궁서', '굴림체', '굴림', '돋움체',
											'바탕체' ],
									fontSizes : [ '8', '9', '10', '11',
											'12', '14', '16', '18',
											'20', '22', '24', '28',
											'30', '36', '50', '72' ],
											//콜백 함수
								            callbacks : { 
								            	onImageUpload : function(files, editor, welEditable) {
								            // 파일 업로드(다중업로드를 위해 반복문 사용)
								            for (var i = files.length - 1; i >= 0; i--) {
								            uploadSummernoteImageFile(files[i],
								            this);
								            		}
								            	}
								            }
								});
					});
						
						
						function uploadSummernoteImageFile(file, el) {
							data = new FormData();
							data.append("file", file);
							$.ajax({
								data : data,
								dataType:"JSON",
								type : "POST",
								url : "${contextPath}/summer/summer",
								contentType : false,
								enctype : 'multipart/form-data',
								processData : false,
								success : function(data) {
									console.log(data.url);
									$(el).summernote('editor.insertImage', data.url);
								},
								error : function(){
									console.log("썸머노트 실패");
								}
							});
						}
					</script>
			</div>
			<!-- 썸머노트 end -->
			
			<input type="hidden" name="cp" value="${param.cp}">
			<input type="hidden" name="classNo" value="${online.classNo}">
			
			<!-- 삭제된 이미지를 저장할 태그 추가 -->
			<input type="hidden" name="deleteVideos" value="">
			
			<div class="row">
				<div class="col-md-10">
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<button class="button is-link is-large" id=subBtn value="글 수정" type="submit">수정</button>
						<%-- <button type="button" class="button is-light is-rounded is-large" href="${param.classNo }?cp=${param.cp }">이전</button>
						<button type="button" class="button is-light is-rounded is-large" href="list?cp=${param.cp }">목록으로</button> --%>
						<button type="button" class="button is-light is-rounded is-large" onclick="goBack()">이전으로</button>
					</div>
				</div>
			</div>
		</form>
	</div>


</body>
<!-- 하단부 -->
<jsp:include page="../common/footer.jsp"/>

<script>
/* 뒤로가기 */
function goBack(){
	history.back();
}


/* const classNo = ${online} */

// 유효성 Check
function classValidate() {
	if ($("#classTitle").val().trim().length == 0) {
		alert("제목을 입력해 주세요.");
		$("#title").focus();
		return false;
	}

	if ($("#classContent").val().trim().length == 0) {
		alert("내용을 입력해 주세요.");
		$("#content").focus();
		return false;
	}
	
	// 유효성 검사를 모두 통과한 경우에
	// input type = "hidden" 태그 중 name 속성값이 "deleteVideos"인 요소에
	// deleteVideos 배열을 value로 추가
	$("input[name='deleteVideos']").val(deleteVideos);
	
}


// 카테고리 불러오기
const categoryName = "${online.categoryName}";
$("#categoryNo > option").each(function(index, item){
	
	if( $(item).text() == categoryName  ){
		
		$(item).prop("selected", true);
		
	}
	
});
	
// 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
$(function() {
	$(".classVideo").on("click", function() {
		var index = $(".classVideo").index(this);
		$("#video" + index).click();
	});

});


// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
function LoadVideo(value, num) {
	if (value.files && value.files[0]) {
		var reader = new FileReader();
		// 자바스크립트 FileReader
		// 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 읽을 파일을 가리키는 File 혹은 Blob객체를 이용해 파일의 내용을 읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 해주는 객체

		reader.readAsDataURL(value.files[0]);
		// FileReader.readAsDataURL()
		// 지정된의 내용을 읽기 시작합니다. Blob완료되면 result속성 data:에 파일 데이터를 나타내는 URL이 포함 됩니다.

		// FileReader.onload
		// load 이벤트의 핸들러. 이 이벤트는 읽기 동작이 성공적으로 완료 되었을 때마다 발생합니다.
		reader.onload = function(e) {
			//console.log(e.target.result);
			// e.target.result
			// -> 파일 읽기 동작을 성공한 객체에(fileTag) 올라간 결과(이미지 또는 파일)
		
			$(".classVideo").eq(num).children("video").attr("src", e.target.result);
			
			//****************************************************
			// 이미지가 추가된 경우 추가된 레벨이 deleteVideos 배열에 있는지 검사하여
			// 있을 경우 해당 배열 요소를 제거
			
			const index = deleteVideos.indexOf(num);
			// 배열.indexOf("값") : 배열 내부에 값이 일치하는 요소가 있을 경우 해당 인덱스를 반환. 없으면  -1 반환
			
			if(index != -1){ // 배열에 일치하는 레벨이 존재하는 경우
				
				deleteVideos.splice( index, 1 );
				// 배열.splice(시작인덱스, 제거할 요소 수)
				// : 배열 내부 요소 중 특정 인텍스부터 시작하여
				// 	지정된 개수 만큼의 요소를 제거
			
			}
			
			
			
			
			//****************************************************
			
		}
	}
	
	
}
	
	
	
// 이미지 x 버튼을 눌렀을 때의 동작
// ****************************************

// 1) x버튼이 눌러진 이미지 레벨을 저장할 배열 생성
let deleteVideos = [];

// 2) x버튼이 클릭되었을 때 라는 이벤트 생성
$(".deleteVideo").on("click", function(event){
	// 매개변수 event : 현재 발생한 이벤트와 관련된 모든 정보를 가지고 있는 객체
	event.stopPropagation(); // 이벤트 버블링(이벤트가 연달아 시작되는 것) 삭제
	
	// console.log( $(this).prev().attr("src") ); // img의 src속성값 반환
	
	if( $(this).prev().attr("src") != undefined ){ // 이미지가 있을 경우에만 x버튼 동작을 실행
		
		// 3) 4개의 .deleteVideo 중 몇번째 인덱스의 x버튼이 눌러졌는지 확인
		// 왜? index == 0,1,2,3으로 존재 == fileLevel
		const index = $(this).index(".deleteVideo");
				// $(this) : 클릭된 x버튼
				// $(this).index(".deleteVideo") : 클릭된 x버튼이 .deleteVideo 중 몇번째 인덱스인지 반환
		
		// console.log(index); //요소 클릭 인텍스 확인용
		
		// 4) deleteVideos 배열에 index를 추가
		deleteVideos.push(index);
		
		// 5) x버튼이 눌러진 곳의 이미지 삭제
		$(this).prev().removeAttr("src"); // 클릭한 x버튼의 이전 요소의 속성 중 src 제거
		
		
		// 새로 이미지를 올린 후 삭제를해도 input type="file" 태그에는 업로드된 파일 정보가 남아있음
           // -> 이를 제거하지 않으면 파일이 업로드되는 문제 발생!
           // --> 이를 해결하기 위해 눌러진 x버튼과 같은 index의 file 타입 태그의 값을 초기화함.
           $("input[name='videos']").eq(index).val("");
		
	}
});
</script>

</html>