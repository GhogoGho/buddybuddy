<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1 문의</title>

    <!-- Fontfaces CSS-->
    <link href="${contextPath}/resources/admin/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="${contextPath}/resources/admin/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="${contextPath}/resources/admin/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="${contextPath}/resources/admin/css/theme.css" rel="stylesheet" media="all">

    <style>
        textarea{
            resize: none;
        }
    </style>

</head>
<body>
	<div class="col-lg-6">
		<div class="card">
			<div class="card-header">
				<strong>Q&A</strong> 1:1문의
			</div>
			<div class="card-body card-block">
				<form action="qnaAnswerUpdate" method="post" class="form-horizontal">
					<div class="row form-group">
						<div class="col col-md-3">
							<label class=" form-control-label">작성자</label>
						</div>
						<div class="col-12 col-md-9">
							<p class="form-control-static">${que.memberNickname}</p>
						</div>
					</div>
					<div class="row form-group">
						<div class="col col-md-3">
							<label for="text-input" class=" form-control-label">제목</label>
						</div>
						<div class="col-12 col-md-9">
							<input type="text" id="text-input" name="queTitle" class="form-control" readonly="readonly" value="${que.queTitle}">
						</div>
					</div>

					<div class="row form-group">
						<div class="col col-md-3">
							<label for="textarea-input" class=" form-control-label">내용</label>
						</div>
						<div class="col-12 col-md-9">
							<textarea name="queContent" id="textarea-input" rows="9"
								class="form-control" readonly="readonly">${que.queContent}</textarea>
							<small class="form-text text-muted">* 해당 문의 내용은 관리자에게만 전달됩니다</small>
						</div>
					</div>

					<%-- <c:if test="${!empty answerContent}"> --%>
					<div class="row form-group">
						<div class="col col-md-3">
							<label for="textarea-input" class=" form-control-label">답변</label>
						</div>
						<div class="col-12 col-md-9">
							<textarea name="answerContent" id="textarea-input" rows="9"
								placeholder="답변을 입력해주세요." class="form-control"></textarea>
						</div>
					</div>
					<%-- </c:if> --%>

					<div class="card-footer">
						<button type="submit" class="btn btn-primary btn-sm">
							<i class="fa fa-dot-circle-o" onclick="qnaUp(this)"></i> 보내기
						</button>
						<button type="reset" class="btn btn-danger btn-sm">
							<i class="fa fa-ban" onclick="winclose();"></i> 취소
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
	
	function qnaUp(e){
    	
	    console.log($(e).val());
	    	
	  	const queNo = $(e).val();
	    	
	    	 $.ajax({
	    	      url : "${contextPath}/admin/qnaAnswerUpdate",
	    	      type : "POST",
	    	      data : {"queNo" : queNo},
	    	      success : function(e){
	    	         
	    	           if(e != null){
	    	            /* location.href = "${contextPath}/admin/qnaAnswer"; */
	    	            alert("성공");
	    	         }  
	    	      },
	    	      error : function(){
	    	      }
	    	   });
	    	
	    }
    
	</script>
</body>
</html>