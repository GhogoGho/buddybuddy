<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
		
		<form action="insertNotice" method="POST">
		  <div class="row">
		    <div class="col-md-9">
		      <p class="h3 mb-3">클래스 공지</p>
		    </div>
		    <div class="col-md-3 mt-4">
		      <!-- 클래스 선택 -->
		      <c:choose>
		      <c:when test="${empty classList }">
		      	<p class="h3">작성된 클래스가 없습니다.</p>
		      </c:when>
		      <c:otherwise>
		      <div class="control has-icons-left">
		        <div class="select is-medium is-rounded">
		          <select name="classNo">
					      <c:forEach items="${classList }" var="cl">
		            <option value="${cl.classNo }">${cl.classTitle }</option>
					      </c:forEach>
		          </select>
		        </div>
		        <span class="icon is-large is-left">
		          <i class="fas fa-th-list"></i>
		        </span>
		      </div>
		      </c:otherwise>
					</c:choose>
		    </div>
		  </div>
		  <hr>
		  <div class="row mb-3">
		    <label class="form-label" for="boardTitle">제목</label>
		    <input class="input is-medium is-rounded" id="noticeTitle" name="noticeTitle" type="text"
		      placeholder="제목을 입력해 주세요.">
		  </div>
		  <div class="row">
		    <textarea class="textarea" name="noticeContent" id="noticeContent" placeholder="공지사항 내용을 입력해 주세요."
		      rows="10"></textarea>
		  </div>
		  <div class="row my-2">
		    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
		      <button class="button is-success is-large is-fullwidth" id="subBtn" onclick="goWrite(this.form)">공지사항 작성</button>
		    </div>
		  </div>
		</form>
		
</body>

<script>
function goWrite(frm) {
	var classNo = frm.classNo.value;
	var noticeTitle = frm.noticeTitle.value;
	var noticeContent = frm.noticeContent.value;
	
	if (noticeTitle.trim() == ''){
		alert("제목을 입력해 주세요");
		return false;
	}
	if (classNo.trim() == ''){
		alert("클래스를 선택해 주세요");
		return false;
	}
	if (noticeContent.trim() == ''){
		alert("내용을 입력해 주세요");
		return false;
	}
	frm.submit();
}
</script>

</html>