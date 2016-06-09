<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp" %>
<%@ include file="../session/adminChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="col-md-offset-15">
			<h2>파일 업로드</h2>
			<c:if test="${not empty msg }">
			<font color="red">
				${msg }
			</font>
			</c:if>
			<c:if test="${not empty fileName }">
				<img src="/donate7/${fileName }">
			</c:if>
			<form action="giftUpload.do" method="post" enctype="multipart/form-data">
				기프티콘 : <input type="file" name="img"><p>
				기프티콘 이름 : <input type="text" name="g_name"><p>
				기프티콘 가격 : <input type="number" name="g_price"><p>
				<input type="submit" value="확인">
			</form>
		</div>
	</div>
	
</body>
</html>