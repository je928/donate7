<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<table border="1" width="100%">
				<tr>
					<th width="40">번호</th>
					<th width="60">제목</th>
					<th width="30">작성자</th>
					<th width="90">작성일</th>
				</tr>
				<c:forEach var="pr" items="${list}">
					<tr>
						<td>${pr_no}</td>
						<td>${pr.pr_proname }</td>
						<td>${pr.pr_mno}</td>
						<td>${pr.pr_date}</td>
					</tr>
				</c:forEach>
			</table>
		<div align="center">
			<button onclick="location.href='oWrite.do'">요청하기</button>
		</div>
		
		
		</div>
</body>
</html>