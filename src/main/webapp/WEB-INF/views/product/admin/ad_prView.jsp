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
	<form action="goods">
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
				<td align="center"><img src="image/${product.pr_img}"
					width="300px"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${product.pr_content}</td>
			</tr>
			<tr>
				<th>요청메세지</th>
				<td>${product.pr_callm}</td>
			</tr>
			<tr>
				<th>승인여부</th>
				<td><c:if test="${product.pr_approve eq 'y'}">
						<span class="ok_y">승인완료</span>
					</c:if> 
					<c:if test="${product.pr_approve eq 'n'}">
						<span class="ok_x">승인대기</span>
					</c:if>
				</td>
			</tr>
		</table>
	</form>
	<div align="center">
		<c:if test="${product.pr_approve eq 'n'}">
			<button onclick="location.href='apUpdate.do?pr_no=${product.pr_no}'">승인</button>
		</c:if>
		<c:if test="${product.pr_approve eq 'y'}">
			<button onclick="location.href='apCancel.do?pr_no=${product.pr_no}'">승인취소</button>
		</c:if>
		<button onclick="location.href='ad_prList.do'">리스트</button>



	</div>

</body>
</html>