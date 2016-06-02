<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<%@ include file="../session/sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		CKEDITOR.replace('brd_content');
		CKEDITOR.config.height = '500px';
	}

	function checkEditorValue() {
		var txt = CKEDITOR.instances.brd_content;
		if (txt.getData() == "") {
			alert('내용을 입력해 주세요.');
			txt.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-offset-17">
				<h3 class="page-header">
					Community <small>게시판</small>
				</h3>
				<ol class="breadcrumb">
					<li><a href="main.do">Home</a></li>
					<li class="active">Community</li>
				</ol>
			</div>
		</div>

		<c:if test="">
			<font color="red"> ${msg} </font>
		</c:if>

		<div class="container">
			<div class="col-lg-9 col-md-offset-20">
				<div class="panel panel-default panel-table">
					<form action="write.do" name="frm" method="post" role="form" onsubmit="return checkEditorValue()">
						<input type="hidden" name="no" value="${no}">
						<input type="hidden" name="brd_no" value="${community.brd_no}">
						<input type="hidden" name="ref" value="${community.ref}">
						<input type="hidden" name="re_step" value="${community.re_step}">
						<input type="hidden" name="re_level" value="${community.re_level}">
						<input type="hidden" name="pageNum" value="${pageNum}">
						<br style="clear: both">
						<h3 style="margin-bottom: 25px; text-align: center;">
							<em class="fa fa-edit"></em>
						</h3>
						<div class="form-group">
							<input type="text" class="form-control-95" name="brd_subject"
								id="brd_subject" maxlength="50" placeholder="제목을 입력해 주세요."
								autofocus="autofocus" value="${community.brd_subject}" required>
						</div>
						<div class="form-group">
							<textarea class="form-control-95" name="brd_content"
								id="brd_content" rows="50">${community.brd_content}</textarea>
						</div>
						<div class="panel-footer text-center">
							<span>
								<button type="submit" class="btn btn-sm btn-primary">
									확인<i class="glyphicon glyphicon-ok"></i>
								</button>
							</span>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>