<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<select name="gugun">
	<c:if test="${not empty list }">
		<option value="0">전체</option>
		<c:forEach var="gg" items="${list}">
			<option value="${gg.gugun_no}">${gg.gugun_name}</option>
		</c:forEach>
	</c:if>
	</select>
</body>
</html>