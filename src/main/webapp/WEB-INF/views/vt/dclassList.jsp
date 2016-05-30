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
	<select class="form-control-40" name="vt_class">
	<c:if test="${not empty list }">
		<c:forEach var="dc" items="${list}">
			<option value="${dc.dclass_no}">${dc.dclass_name}</option>
		</c:forEach>
	</c:if>
	</select>
</body>
</html>