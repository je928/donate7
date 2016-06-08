<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="ckfinder/ckfinder.js"></script>
<script type="text/javascript">
	window.onload = function() {
		CKEDITOR.replace('d_content');
		CKEDITOR.config.height = '500px';

	}

	function checkEditorValue() {
		var txt = CKEDITOR.instances.d_content;
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
	<form action="mdoReq.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="d_member" value="${sessionScope.no }">
		<table class="table table-striped table-hover">
			<tr>
				<th>제목</th>
				<td><input type="text" name="d_title" id="d_title"
					required="required"></td>
			</tr>
			<tr>
				<th>사진첨부</th>
				<c:if test="${not empty msg }">
					<font color="red"> ${msg } </font>
				</c:if>
				<c:if test="${not empty fileName }">
					<img src="image/${fileName }">
				</c:if>
				<td><input type="file" name="img" required="required"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="80" name="d_content"
						required="required"></textarea></td>
			</tr>
			<tr>
				<th>기부 기간</th>
				<td><input type="date" name="d_start_date" id="d_start_date">
					~ <input type="date" name="d_end_date" id="d_end_date"></td>
			</tr>
			<tr>
				<th>기부금 사용계획</th>
				<td><textarea rows="10" cols="90" name="d_plan"
						required="required"></textarea></td>
			</tr>
			<tr>
				<th>희망금액</th>
				<td><input type="number" name="d_amount" required="required">원</td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td><input type="text" name="d_bank" id="d_bank" value="은행"
					required="required"> <input type="text" name="d_account"
					id="d_account" value="계좌번호" required="required"></td>
			</tr>
		</table>

		<div align="center">
				<button type="submit" class="btn btn-primary btn-md">요청하기
					<i class=" glyphicon glyphicon-ok"></i></button>
		</div>
	</form>
</body>
</html>