<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function reg_pro(re_no) {
		window.open("reg_pro.do?re_no="+re_no,"","width=370, height=400");
	}
</script>
<style type="text/css">
table{
	width: 100%;
	table-layout: fixed;
}
table td {
	width: 300px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
	<table>
		<caption>신고처리</caption>
		<tr>
			<th>신고 번호</th>
			<th>신고 사유</th>
			<th>신고 날짜</th>
			<th>신고 처리</th>
			<th>자세히 보기</th>
		</tr>
		<c:forEach var="reg" items="${list }">
			<tr>
				<td>${reg.re_no }</td>
				<td>${reg.re_content }</td>
				<td><fmt:formatDate value="${reg.re_date }" /></td>
				<td><c:if test="${reg.re_chk =='n' }">
					처리 안 됨
				</c:if> <c:if test="${reg.re_chk !='n' }">
					처리 됨
				</c:if></td>
				<td><a href="javascript:reg_pro(${reg.re_no })"
					class="btn btn-sm btn-primary">자세히 보기</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>