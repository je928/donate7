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
<div align="center">
<img src="/donate7/${gift.g_img}" width="300px"><br>
일련번호 : ${gb.gb_no}4186545335<br>
기프티콘 이름 : ${gift.g_name }<br>
<input type="button" value="보유 기프티콘" onclick="location.href='ownGift.do'">
</div>
</body>
</html>