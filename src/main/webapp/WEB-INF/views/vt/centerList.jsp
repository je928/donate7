<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="col-md-offset-14 col-md-5" style="margin-left: 10%">
		<div class="form-area">
			<table border="1">
				<tr>
					<th>번호</th>
					<th>기관명</th>
					<th>(우편번호)주소</th>
				</tr>
				<c:forEach var="organ" items="${list }">
					<tr>
						<td>${organ.o_no }</td>
						<td><a href="centerView.do?o_no=${organ.o_no}">${organ.o_oname }</a></td>
						<td>${organ.o_addr }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

</body>
</html>