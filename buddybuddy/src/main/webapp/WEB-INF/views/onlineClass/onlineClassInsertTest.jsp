<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>온라인 클래스 작성 페이지</title>
<!-- bulma -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">

<!-- fontAwesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- 썸머노트 API -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

</head>
<body>

	<div class="container">
		<form action="write" method="POST" enctype="multipart/form-data">

			<div class="row">
				<div class="col-md-3 mt-4">
					<c:if test="${ !empty category}">
						<div class="control has-icons-left">
							<div class="select is-large is-rounded">
								<select name="categoryNo">
									<c:forEach items="${category}" var="c">
										<option value="${c.categoryNo}">${c.categoryName}</option>
									</c:forEach>
								</select>
							</div>
							<span class="icon is-large is-left"> <i
								class="fas fa-th-list"></i>
							</span>
						</div>
					</c:if>
				</div>
			</div>
			<div class="row">
				<div class="col-md-10">
					<label class="form-label" for="classTitle"></label> <input
						class="input is-medium is-rounded" id="classTitle"
						name="classTitle" type="text" placeholder="제목을 입력해 주세요.">
					<hr>
				</div>
			</div>
			<div class="row">
				<div class="col-md-10">
				
					<div class="mr-2 classVideo" id="contentVideoArea1">
						<video style="width:300px; id="contentVideo0">
					</div>
					<!-- 썸네일 동영상 -->
					<div class="columns mb-3">
						<div class="column">
							<div class="file is-success is-boxed">
								<label class="file-label"> 
								<input class="file-input" type="file" id="thumbnail" name="videos" onchange="LoadVideo(this,0)" accept="video/mp4"> 
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
					
					<div class="mr-2 classVideo" id="contentVideoArea1">
						<video style="width:200px; id="contentVideo1">
					</div>
					<!-- 클래스 동영상 -->
					<div class="columns mb-2">
						<div class="column">
							<div class="file is-danger">
							  <label class="file-label">
							    <input class="file-input" type="file" id="classVideo1" name="videos" onchange="LoadVideo(this,1)" accept="video/mp4">
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
					
					<div class="mr-2 classVideo" id="contentVideoArea2">
						<video style="width:200px; id="contentVideo2">
					</div>
					<!-- 클래스 동영상 -->
					<div class="columns mb-2">
						<div class="column">
							<div class="file is-danger">
							  <label class="file-label">
							    <input class="file-input" type="file" id="classVideo2" name="videos" onchange="LoadVideo(this,2)" accept="video/mp4">
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
					
					<div class="mr-2 classVideo" id="contentVideoArea3">
						<video style="width:200px; id="contentVideo3">
					</div>
					<!-- 클래스 동영상 -->
					<div class="columns mb-2">
						<div class="column">
							<div class="file is-danger">
							  <label class="file-label">
							    <input class="file-input" type="file" id="classVideo3" name="videos" onchange="LoadVideo(this,3)" accept="video/mp4">
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
					<textarea class="summernote" name="classContent"></textarea>
				</div>
				<script>
					$('.summernote').summernote({
						height : 500,
						lang : "ko-KR",
					});
				</script>
			</div>
			<!-- 썸머노트 end -->
			
			
			<div class="row">
				<div class="col-md-10">
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<button class="button is-success is-large" id=subBtn value="글 작성" onclick="goWrite(this.form)">작성</button>
						<button class="button is-light is-rounded is-large">취소</button>
					</div>
				</div>
			</div>
			
		</form>

	</div>
		
</body>

<script>
function goWrite(frm) {
	var categoryCode = frm.categoryCode.value;
	var classTitle = frm.classTitle.value;
	var classContent = frm.classContent.value;
	
	if (classTitle.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}
	if (categoryCode.trim() == ''){
		alert("카테고리를 선택해주세요");
		return false;
	}
	if (classContent.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	frm.submit();
}





//이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
$(function() {
	$(".classVideo").on("click", function() {
		var index = $(".classVideo").index(this);
		// this : 이벤트가 발생한 요소  == 클릭된 .classImg 요소
		// 배열.index("요소") : 매개변수로 작성된 요소가 요소가 배열의 몇 번째 index 요소인지 반환 
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
			// e.target.result
			// -> 파일 읽기 동작을 성공한 객체에(fileTag) 올라간 결과(이미지 또는 파일)

			$(".classVideo").eq(num).children("video").attr("src",e.target.result);
		}

	}
}
</script>


</html>