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
				<c:set var="cnt" value="${count}"/>
					<c:forEach var="product" items="${list}">
					<%-- <c:if test="${product.pr_no > 0 }">
						<c:set var="member" value="${ms.selectOne(product.pr_mno) }"/>
					</c:if>
					<c:if test="${product.pr_no < 0 }">
						<c:set var="member" value="${od.selectOne(product.pr_mno) }"/>
					</c:if> --%>
						<tr>
							<td>${cnt}</td>
							<td><a href="ad_prView.do?pr_no=${product.pr_no}">
								${product.pr_proname }</a></td>
						<%-- 	<td><c:if test="${product.pr_no > 0 }">
									${member.m_email }
								</c:if>
								<c:if test="${product.pr_no < 0 }">
									${member.o_email }
								</c:if></td> --%>
							<td>${product.email}</td>
							<td>${product.pr_date}</td>
							<td>${product.pr_approve}</td>
						
						</tr>
					<c:set var="cnt" value="${cnt-1}"/>
				</c:forEach>
			</table>
		</form>
		
	
</body>
</html>