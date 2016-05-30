<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file ="/css/bootstrap.css" %> --%>
<!DOCTYPE html>
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
			<tr><th>설명</th><td>${second.sh_explanation }</td></tr>
			<tr><th>승인여부</th><td>${second.sh_approve }</td></tr>
			<tr><th>도착여부</th><td>${second.sh_arrive }</td></tr>
		</table>
		<div align="center">
			<button onclick="location.href='msecondUpdate.do?sh_no=${second.sh_no}'">수정</button>
			<button onclick="location.href='msecondDelete.do?sh_no=${second.sh_no}'">삭제</button>
			<button onclick="location.href='msecondList.do'">확인</button>
		</div>
</body>
</html>