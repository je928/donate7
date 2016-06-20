<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<%@ include file="../session/orgChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input name="vt_no" type="hidden" value="${vt_no}">
	<table class="table table-striped table-hover" style="width: 80%">
		<tr>
			<th>이름</th>
			<th>이메일</th>
			<th>닉네임</th>
			<th>생년월일</th>
			<th>성별</th>
			<th>전화번호</th>
			<th>직업</th>
			<th>봉사시간</th>
		</tr>
		<c:forEach var="member" items="${list}">
			<tr>
				<td>${member.m_name}</td>
				<td>${member.m_email }</td>
				<td>${member.m_nick }</td>
				<td>${member.m_birth }</td>
				<td>${member.m_gender }</td>
				<td>${member.m_tel }</td>
				<td>${member.m_job }</td>
				<td>
					<input name="m_no" type="hidden" value="${member.m_no}">
					<input name="volTime" type="number" value="0">
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>