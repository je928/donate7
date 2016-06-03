<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp"%>
<%@ include file="../../session/memChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="">
		<font color="red"> ${msg} </font>
	</c:if>

	<div class="container">
		<div class="row">
		<div class="col-xs-12 col-lg-9 toppad">
			<div class="panel panel-default panel-table">
				<form action="write.do" name="frm" method="post" role="form"
					onsubmit="return checkEditorValue()">
					<input type="hidden" name="no" value="${no}"> <input
						type="hidden" name="brd_no" value="${community.brd_no}"> <input
						type="hidden" name="ref" value="${community.ref}"> <input
						type="hidden" name="re_step" value="${community.re_step}">
					<input type="hidden" name="re_level" value="${community.re_level}">
					<input type="hidden" name="pageNum" value="${pageNum}"> <br
						style="clear: both">
					<h3 style="margin-bottom: 25px; text-align: center;">
						<em class="fa fa-pencil"></em>
					</h3>
					<div class="form-group">
						<input type="text" class="form-control-95" name="brd_subject"
							id="brd_subject" maxlength="50" placeholder="제목을 입력해 주세요."
							autofocus="autofocus" value="${community.brd_subject}" required>
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