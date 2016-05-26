<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="ad_prList.do">
		<table class="table table-striped table-hover">
		<caption>요청확인</caption>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>승인여부</th>
				</tr>
				<c:forEach var="product" items="${list}">
					<tr>
						<td>${product.pr_no}</td>
						<td><a href="ad_prView.do?pr_no=${product.pr_no}">
							${product.pr_proname }</a></td>
						<td>${product.pr_mno }</td>
						<td>${product.pr_date}</td>
						<td>${product.pr_approve}</td>
					
					</tr>
				</c:forEach>
			</table>
		</form>
		<div align="center">
			<button onclick="location.href='prList.do'">승인</button>
			<button onclick="location.href=''">거부</button>
		</div>
	
</body>
</html>