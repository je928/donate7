<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../module/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>목록</h3>
<c:forEach var="list" items="${list }">
<c:set var="gift" value="${gs.selectOne(list.g_no) }"/>
<a href="ownGiftDetail.do?gb_no=${list.gb_no }"><img src="/donate7/${gift.g_img}" width="150px"></a>
기프티콘 이름 : ${gift.g_name }
</c:forEach>
</body>
</html>