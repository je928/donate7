<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<%@ include file="../session/memChk.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" name="d_member" value="${sessionScope.no }">
	<table class="table table-striped table-hover">
		<tr>
			<th>#</th>
			<th>기부자</th>
			<th>금액</th>
			<th>날짜</th>
		</tr>
		
		<c:if test="${not empty drList }">
			<c:forEach var="doResult" items="${drList}">
				<tr>
					<td>${doResult.d_request}</td>
					<td>${doResult.m_nick}</td>
					<td>${doResult.d_donation}</td>
					<td>${doResult.d_date}</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty drList}">
			<tr>
				<td colspan="4">기부내역이 없습니다</td>
			</tr>
		</c:if>
	</table>
</body>
</html>