<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp" %>
<%@ include file="../session/sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<div>			
	<table align="center" border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
			<th>승인여부</th>
		</tr>
	<c:if test="${not empty list }">
	<c:forEach var="" items="%{ }">
		<tr><td>${donate.d_no }</td>
			<td>${donate.d_title }</td>
			<td>${donate.d_reg_date }</td>
			<td>${donate.d_approve }</td></tr>
	</c:forEach></c:if>
	<c:if test="${empty list }">
		<tr>
			<td colspan="4">요청하신 글이 없습니다</td>
		</tr>
	</c:if>	
	</table>
		<button onclick="location.href='doReq.do'">요청 글쓰기</button>
	</div>
</div>
</body>
</html>