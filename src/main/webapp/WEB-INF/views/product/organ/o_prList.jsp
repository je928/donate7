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
	<form action="o_prList.do">
		<table class="table table-striped table-hover">
		<caption>제품 판매 요청</caption>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성일</th>
					<th>승인여부</th>
				</tr>
				<c:forEach var="pr" items="${list}">
					<tr>
						<td>${pr.pr_no}</td>
						<td><a href="m_prView.do?pr_no=${pr.pr_no}">
							${pr.pr_proname }</a></td>
						<td>${pr.pr_date}</td>
						<td>${pr.pr_approve}</td>
					
					</tr>
				</c:forEach>
			</table>
		</form>
		<div align="center">
			<button onclick="location.href='o_prWrite.do'">요청하기</button>
		</div>
	
</body>
</html>