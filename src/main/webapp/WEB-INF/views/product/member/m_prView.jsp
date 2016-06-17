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
	<input type="hidden" name="pr_mno" value="${sessionScope.no}">
		<table class="table table-striped table-hover">
			<caption>판매요청</caption>
			<tr>
				<th>제목</th>
				<td>${product.pr_proname}</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${product.pr_price}</td>
			</tr>
			<tr>
				<th>수량</th>
				<td>${product.pr_qty}</td>
			</tr>
			<tr>
				<th>종류</th>
				<td>${product.pr_item}</td>
			</tr>
			<tr>
				<th>기부처</th>
				<td>${product.pr_donation}</td>
			</tr>
			<tr>
				<th>사진</th>
				<td align="center">
					<img src="image/${product.pr_img}" width="300px">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${product.pr_content}</td>
			</tr>
			<tr>
				<th>요청메세지</th>
				<td>${product.pr_callm}</td>
			</tr>
		</table>
		
		<div align="center" >
			<c:if test="${product.pr_approve eq 'n'}">
				<button onclick="location.href='m_prUpdate.do?pr_no=${product.pr_no}'">수정</button>
				<button onclick="location.href='m_prDelete.do?pr_no=${product.pr_no}'">삭제</button>
			</c:if>
	
			<button onclick="location.href='m_prList.do'">확인</button>
		</div>

</body>
</html>