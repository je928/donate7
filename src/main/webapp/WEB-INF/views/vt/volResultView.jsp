<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp" %>
<%@ include file="../session/orgChk.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
span {
	border-radius: 0.5em;
	padding: 0 .5em 0 .5em;
	font-size: 0.75em;
	color: white;
}

.ry {
	background: rgba(0, 0, 255, 0.5);
}

.rn {
	background: rgba(255, 0, 0, 0.5);
}
</style>
</head>
<body>
	<div class="container">
		<div class="col-md-offset-14"
			style="margin-left: 0; margin-top: 0; margin-right: 0;">
		<table class="table table-striped table-hover" style="width: 80%">
			
		</table>	
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
				
				<c:if test="${member.vt_time == 0}">
					<font style="color: red">불참</font>
				</c:if>
				<c:if test="${member.vt_time > 0}">
					${member.vt_time}
				</c:if>
				</td>
			</tr>
		</c:forEach>
		</table>
		
		</div>
	</div>
</body>
</html>