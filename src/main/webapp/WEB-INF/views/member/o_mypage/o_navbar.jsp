<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp" %>
<%@ include file="../../session/orgChk.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="list-group">
		<a href="o_myinfo.do" class="list-group-item">기관정보</a>
		<a href="o_updateForm.do" class="list-group-item">기관정보수정</a>
		<a href="odoList.do" class="list-group-item">기부금 요청/내역</a>
		<a href="recruit.do" class="list-group-item">봉사 모집</a>
		<a href="myRecruit.do" class="list-group-item">봉사 관리</a>
		<a href="o_prList.do" class="list-group-item">완제품 기부 요청/내역</a>
		<a href="osecondList.do" class="list-group-item">중고기부 요청/내역</a>
		<a href="o_deleteForm.do" class="list-group-item">회원탈퇴</a>
	</div>
	
</body>
</html>