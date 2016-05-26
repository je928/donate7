<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="osecond.do" method="post" enctype="multipart/form-data">
		<table class="table table-striped table-hover"><caption>중고기부 요청</caption>
			<tr><th>제목</th><td><input type="text" name="sh_title" required="required"autofocus="autofocus"></td></tr>
			<tr><th>이미지</th><td><input type="file" name="image"></td></tr>
			<tr><th>상품종류</th><td><input type="text" name="sh_category" required="required"></td></tr>
			<tr><th>설명</th><td><textarea rows="10" cols="100" name="sh_explanation" required></textarea></td></tr>
		</table>
		<div align="center">
		<input type="submit" value="요청하기">
			<button	onclick="location.href='osecondList.do'">요청내역보기</button>
		</div>
	</form>
</body>
</html>