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
		<div class="row">

	  <div class="row">
	    <div class="col-md-3 mt-4">
	
	      <div class="control has-icons-left">
	        <div class="select is-large is-rounded">
	          <select>
	            <option selected>카테고리</option>
	            <option value="1">미술</option>
	            <option value="2">공예</option>
	            <option value="3">요리</option>
	            <option value="4">플라워</option>
	          </select>
	        </div>
	        <span class="icon is-large is-left">
	          <i class="fas fa-th-list"></i>
	        </span>
	      </div>
	
	    </div>
	  </div>
	  <form action="insert" method="POST">
	    <div class="row">
	      <div class="col-md-10">
	        <label class="form-label" for="boardTitle"></label>
	        <input class="input is-medium is-rounded" id="boardTitle" name="boardTitle" type="text"
	          placeholder="제목을 입력해 주세요.">
	        <hr>
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-md-10">
	        <!-- 썸네일 이미지 -->
	        <div class="columns my-3">
	          <div class="column">
	            <div class="file is-success is-boxed">
	              <label class="file-label">
	                <input class="file-input" type="file" id="thumbnailImg" name="thumbnailImg"
	                  onchange="LoadImg(this)">
	                <span class="file-cta">
	                  <span class="file-icon">
	                    <i class="fas fa-camera-retro"></i>
	                  </span>
	                  <span class="file-label">
	                    썸네일 이미지
	                  </span>
	                </span>
	              </label>
	            </div>
	          </div>
	        </div>
	
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-md-10">
	        <textarea class="summernote" name="editordata"></textarea>
	      </div>
	      <script>
	        $('.summernote').summernote({
	          height: 500,
	          lang: "ko-KR"
	        });
	      </script>
	    </div>
	    <div class="row">
	      <div class="col-md-10 my-3">
	        <div id="fileArea">
	          <!-- 클래스 동영상 1~4 -->
	          <div class="columns">
	            <div class="file is-dark is-boxed column">
	              <label class="file-label">
	                <input class="file-input" type="file" name="class-video" id="class-video0"
	                  onchange="LoadVideo(this,0)">
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
	            <div class="file is-dark is-boxed column">
	              <label class="file-label">
	                <input class="file-input" type="file" name="class-video" id="class-video1"
	                  onchange="LoadVideo(this,1)">
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
	            <div class="file is-dark is-boxed column">
	              <label class="file-label">
	                <input class="file-input" type="file" name="class-video" id="class-video2"
	                  onchange="LoadVideo(this,2)">
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
	            <div class="file is-dark is-boxed column">
	              <label class="file-label">
	                <input class="file-input" type="file" name="class-video" id="class-video3"
	                  onchange="LoadVideo(this,3)">
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
	          <!-- 클래스 동영상 5~8 -->
	          <div class="columns">
	            <div class="file is-dark is-boxed column">
	              <label class="file-label">
	                <input class="file-input" type="file" name="class-video" id="class-video4"
	                  onchange="LoadVideo(this,4)">
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
	            <div class="file is-dark is-boxed column">
	              <label class="file-label">
	                <input class="file-input" type="file" name="class-video" id="class-video5"
	                  onchange="LoadVideo(this,5)">
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
	            <div class="file is-dark is-boxed column">
	              <label class="file-label">
	                <input class="file-input" type="file" name="class-video" id="class-video6"
	                  onchange="LoadVideo(this,6)">
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
	            <div class="file is-dark is-boxed column">
	              <label class="file-label">
	                <input class="file-input" type="file" name="class-video" id="class-video7"
	                  onchange="LoadVideo(this,7)">
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
	          <!-- 클래스 동영상 9~12 -->
	          <div class="columns">
	            <div class="file is-dark is-boxed column">
	              <label class="file-label">
	                <input class="file-input" type="file" name="class-video" id="class-video8"
	                  onchange="LoadVideo(this,8)">
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
	            <div class="file is-dark is-boxed column">
	              <label class="file-label">
	                <input class="file-input" type="file" name="class-video" id="class-video9"
	                  onchange="LoadVideo(this,9)">
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
	            <div class="file is-dark is-boxed column">
	              <label class="file-label">
	                <input class="file-input" type="file" name="class-video" id="class-video10"
	                  onchange="LoadVideo(this,10)">
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
	            <div class="file is-dark is-boxed column">
	              <label class="file-label">
	                <input class="file-input" type="file" name="class-video" id="class-video11"
	                  onchange="LoadVideo(this,11)">
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