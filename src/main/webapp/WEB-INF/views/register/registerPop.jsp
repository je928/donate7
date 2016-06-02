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
<form action="registerPop" method="post">
신고 당하는 사람 : <input type="text" readonly="readonly" value="${reported_no }"><p>
<input type="hidden" name="re_sort" value="${chk }">
<input type="hidden" name="re_sort_no" value="${re_sort_no }">
<input type="hidden" name="reporter_no" value="${sessionScope.no }">
<input type="hidden" name="reported_no" value="${reported_no}">
신고 사유 : <textarea name="re_content" rows="4" cols="50" required="required"></textarea><p>
<input type="submit" value="신고">
</form>
</body>
</html>