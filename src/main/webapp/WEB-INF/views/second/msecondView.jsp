<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/css/bootstrap.css" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<table border="1">
			<tr><th>제목</th><td>${second.sh_title }</td></tr>
			<tr><th>글쓴이</th><td></td></tr>
			<tr><th>이미지</th><td>${second.sh_image }</td></tr>
			<tr><th>상품종류</th><td>${second.sh_category }</td></tr>
			<tr><th>등록일</th><td>${second.sh_reg_date }</td></tr>
			<tr><th>설명</th><td>${second.sh_explanation }</td></tr>
			<tr><th>도착여부</th><td>${second.sh_approve }</td></tr>
			<tr><th>승인여부</th><td>${second.sh_apprive }</td></tr>
		</table>
</body>
</html>