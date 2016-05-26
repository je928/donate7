<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<table class="table table-striped table-hover">
			<tr><th>제목</th><td>${second.sh_title }</td></tr>
			<tr><th>글쓴이</th><td></td></tr>
			<tr><th>이미지</th><td><img src="/donate7/${second.sh_image }" width="300px"></td></tr>
			<tr><th>상품종류</th><td>${second.sh_category }</td></tr>
			<tr><th>등록일</th><td>${second.sh_reg_date }</td></tr>
			<tr><th>설명</th><td>${second.sh_explanation }</td></tr>
			<tr><th>승인여부</th><td>${second.sh_approve }</td></tr>
			<tr><th>도착여부</th><td>${second.sh_arrive }</td></tr>
		</table>
</body>
</html>