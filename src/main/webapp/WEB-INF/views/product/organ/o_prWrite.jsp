<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="ckfinder/ckfinder.js"></script>
<script type="text/javascript">
	window.onload = function() {
		CKEDITOR.replace('pr_content');
		CKEDITOR.config.height = '500px';
	}

	function checkEditorValue() {
		var txt = CKEDITOR.instances.pr_content;
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
	
	<form action="o_prWrite.do" method="post" enctype="multipart/form-data">
		<table class="table table-striped table-hover">
			<caption>판매요청</caption>
			<tr>
				<th>제목</th>
				<td><input type="text" name="pr_proname" required="required" autofocus="autofocus" ></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="number" name="pr_price" required="required"></td>
			</tr>
			<tr>
				<th>수량</th>
				<td><input type="number" name="pr_qty" required="required" ></td>
			</tr>
			<tr>
				<th>종류</th>
				<td><input type="radio" name="pr_item" required="required" id="Fashion" value="option1">Fashion &nbsp;
					<input type="radio" name="pr_item" required="required" id="Design" value="option1">Design	&nbsp;
					<input type="radio" name="pr_item" required="required" id="Smart Phone" value="Smart option1" >Smart Phone &nbsp;
				</td>
			</tr>
			<tr>
				<th>기부처</th>
				<td><input type="text" name="pr_donation" required="required" ></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="oimg" required="required" ></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="100" name="pr_content" id="pr_content" required="required" ></textarea></td>
			</tr>
			<tr>
				<th>요청메세지</th>
				<td><textarea rows="5" cols="100" name="pr_callm" required="required"></textarea></td>
			</tr>
			
		</table>
		<div align="center">
			<input type="submit" value="요청하기">
			<button onclick="location.href='o_prList.do'">요청내역 보기</button>
		</div>
	</form>
</body>
</html>