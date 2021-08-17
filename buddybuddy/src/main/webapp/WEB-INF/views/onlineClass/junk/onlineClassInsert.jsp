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
	<main>
		<div class="container">
			<form action="insert" method="POST">

				<div class="row">
					<div class="col-md-3 mt-4">
						<c:if test="${ !empty category}">
							<div class="control has-icons-left">
								<div class="select is-large is-rounded">
									<select>
										<option selected>카테고리</option>
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
						<label class="form-label" for="boardTitle"></label> <input
							class="input is-medium is-rounded" id="boardTitle"
							name="boardTitle" type="text" placeholder="제목을 입력해 주세요.">
						<hr>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10">
						<!-- 썸네일 동영상 -->
						<div class="columns my-3">
							<div class="column">
								<div class="file is-success is-boxed">
									<label class="file-label"> <input class="file-input"
										type="file" id="thumbnailImg" name="thumbnailImg"
										onchange="LoadImg(this)"> <span class="file-cta">
											<span class="file-icon"> <i
												class="fas fa-camera-retro"></i>
										</span> <span class="file-label"> 썸네일 동영상 </span>
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
						<textarea class="summernote" name="editordata"></textarea>
					</div>
					<script>
						// 툴바생략
						var setting = {
		            height : 500,
		            minHeight : null,
		            maxHeight : null,
		            focus : true,
		            lang : 'ko-KR',
		            toolbar : toolbar,
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
		         };
		        $('.summernote').summernote(setting);
		        });
					        
		        function uploadSummernoteImageFile(file, el) {
							data = new FormData();
							data.append("file", file);
							$.ajax({
								data : data,
								type : "POST",
								url : "uploadSummernoteImageFile",
								contentType : false,
								enctype : 'multipart/form-data',
								processData : false,
								success : function(data) {
									$(el).summernote('editor.insertImage', data.url);
								}
							});
						}
					</script>
				</div>
				<!-- 썸머노트 end -->
				
				<div class="row">
					<div class="col-md-10 my-3">
						<div id="fileArea">
							<!-- 클래스 동영상 1~4 -->
							<div class="columns">
								<div class="file is-dark is-boxed column">
									<label class="file-label"> <input class="file-input"
										type="file" name="class-video" id="class-video0"
										onchange="LoadVideo(this,0)"> <span class="file-cta">
											<span class="file-icon"> <i class="fas fa-film"></i>
										</span> <span class="file-label"> 클래스 동영상 </span>
									</span>
									</label>
								</div>
								<div class="file is-dark is-boxed column">
									<label class="file-label"> <input class="file-input"
										type="file" name="class-video" id="class-video1"
										onchange="LoadVideo(this,1)"> <span class="file-cta">
											<span class="file-icon"> <i class="fas fa-film"></i>
										</span> <span class="file-label"> 클래스 동영상 </span>
									</span>
									</label>
								</div>
								<div class="file is-dark is-boxed column">
									<label class="file-label"> <input class="file-input"
										type="file" name="class-video" id="class-video2"
										onchange="LoadVideo(this,2)"> <span class="file-cta">
											<span class="file-icon"> <i class="fas fa-film"></i>
										</span> <span class="file-label"> 클래스 동영상 </span>
									</span>
									</label>
								</div>
								<div class="file is-dark is-boxed column">
									<label class="file-label"> <input class="file-input"
										type="file" name="class-video" id="class-video3"
										onchange="LoadVideo(this,3)"> <span class="file-cta">
											<span class="file-icon"> <i class="fas fa-film"></i>
										</span> <span class="file-label"> 클래스 동영상 </span>
									</span>
									</label>
								</div>
							</div>
							<!-- 클래스 동영상 5~8 -->
							<div class="columns">
								<div class="file is-dark is-boxed column">
									<label class="file-label"> <input class="file-input"
										type="file" name="class-video" id="class-video4"
										onchange="LoadVideo(this,4)"> <span class="file-cta">
											<span class="file-icon"> <i class="fas fa-film"></i>
										</span> <span class="file-label"> 클래스 동영상 </span>
									</span>
									</label>
								</div>
								<div class="file is-dark is-boxed column">
									<label class="file-label"> <input class="file-input"
										type="file" name="class-video" id="class-video5"
										onchange="LoadVideo(this,5)"> <span class="file-cta">
											<span class="file-icon"> <i class="fas fa-film"></i>
										</span> <span class="file-label"> 클래스 동영상 </span>
									</span>
									</label>
								</div>
								<div class="file is-dark is-boxed column">
									<label class="file-label"> <input class="file-input"
										type="file" name="class-video" id="class-video6"
										onchange="LoadVideo(this,6)"> <span class="file-cta">
											<span class="file-icon"> <i class="fas fa-film"></i>
										</span> <span class="file-label"> 클래스 동영상 </span>
									</span>
									</label>
								</div>
								<div class="file is-dark is-boxed column">
									<label class="file-label"> <input class="file-input"
										type="file" name="class-video" id="class-video7"
										onchange="LoadVideo(this,7)"> <span class="file-cta">
											<span class="file-icon"> <i class="fas fa-film"></i>
										</span> <span class="file-label"> 클래스 동영상 </span>
									</span>
									</label>
								</div>
							</div>
							<!-- 클래스 동영상 9~12 -->
							<div class="columns">
								<div class="file is-dark is-boxed column">
									<label class="file-label"> <input class="file-input"
										type="file" name="class-video" id="class-video8"
										onchange="LoadVideo(this,8)"> <span class="file-cta">
											<span class="file-icon"> <i class="fas fa-film"></i>
										</span> <span class="file-label"> 클래스 동영상 </span>
									</span>
									</label>
								</div>
								<div class="file is-dark is-boxed column">
									<label class="file-label"> <input class="file-input"
										type="file" name="class-video" id="class-video9"
										onchange="LoadVideo(this,9)"> <span class="file-cta">
											<span class="file-icon"> <i class="fas fa-film"></i>
										</span> <span class="file-label"> 클래스 동영상 </span>
									</span>
									</label>
								</div>
								<div class="file is-dark is-boxed column">
									<label class="file-label"> <input class="file-input"
										type="file" name="class-video" id="class-video10"
										onchange="LoadVideo(this,10)"> <span class="file-cta">
											<span class="file-icon"> <i class="fas fa-film"></i>
										</span> <span class="file-label"> 클래스 동영상 </span>
									</span>
									</label>
								</div>
								<div class="file is-dark is-boxed column">
									<label class="file-label"> <input class="file-input"
										type="file" name="class-video" id="class-video11"
										onchange="LoadVideo(this,11)"> <span class="file-cta">
											<span class="file-icon"> <i class="fas fa-film"></i>
										</span> <span class="file-label"> 클래스 동영상 </span>
									</span>
									</label>
								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10">
						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<button class="button is-success is-large">작성</button>
							<button class="button is-light is-rounded is-large">취소</button>
						</div>
					</div>
				</div>
			</form>

		</div>
	</main>
</body>
</html>