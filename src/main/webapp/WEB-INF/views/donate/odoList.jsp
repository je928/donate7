<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<table class="table table-striped table-hover">
		<caption>기부 요청 내역</caption>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
			<th>승인여부</th>
		</tr>

		<c:set var = "cnt" value="${count }"/>

 	<c:if test="${not empty list }">
	<c:forEach var="donate" items="${list }">
		<tr><td>${cnt }</td>
			<td><a href="odoReqV.do?d_no=${donate.d_no }">${donate.d_title }</a></td>
			<td>${donate.d_reg_date }</td>
			<td>${donate.d_approve }</td></tr>
		<c:set var="cnt" value="${cnt-1}"/>
	</c:forEach></c:if>
	<c:if test="${empty list }"> 
		<tr>
			<td colspan="4">요청하신 글이 없습니다</td>
		</tr>
 	</c:if>	 
	</table>
	<div align="center">
		<button onclick="location.href='odoReq.do'">요청글쓰기</button>
	</div>

</body>
</html>