<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp"%>
<%@ include file="../../session/memChk.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="list-group">
		<a href="m_myinfo.do" class="list-group-item">회원정보</a>
		<a href="m_updateForm.do" class="list-group-item">회원정보수정</a>
		<a href="mdoList.do" class="list-group-item">기부금 요청/내역</a>
		<a href="rqnList.do" class="list-group-item">내 봉사 요청/내역</a>
		<a href="m_prList.do" class="list-group-item">완제품 기부 요청/내역</a>
		<a href="m_delivery.do" class="list-group-item">배송 내역</a>
		<a href="msecondList.do" class="list-group-item">중고기부 요청/내역</a>
		<a href="cpointList.do" class="list-group-item">캐시/포인트 내역</a>
		<a href="ownGift.do" class="list-group-item">보유 기프티콘</a>
		<a href="warningList.do" class="list-group-item">경고 내역</a>
		<a href="m_deleteForm.do" class="list-group-item">회원탈퇴</a>
	</div>

</body>
</html>