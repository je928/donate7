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
	<form action="ad_prView.do">
		<input type="hidden" name="no" value="${product.no}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<table class="table table-striped table-hover">
			<caption>승인요청</caption>
			<tr>
				<th>제목</th>
				<td><input type="text" name="pr_proname" required="required"
					autofocus="autofocus" value="${product.pr_proname}"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="pr_price" required="required" value="${product.pr_price}" ></td>
			</tr>
			<tr>
				<th>수량</th>
				<td><input type="text" name="pr_qty" required="required" value="${product.pr_qty}" ></td>
			</tr>
			<tr>
				<th>종류</th>
				<td><input type="radio" name="item" required="required" value="${product.item}">Fashion &nbsp;
					<input type="radio" name="item" required="required" value="${product.item}">Design	&nbsp;
					<input type="radio" name="item" required="required" value="${product.item}">Smart Phone &nbsp;
				</td>
			</tr>
			<tr>
				<th>기부처</th>
				<td><input type="text" name="pr_donation" required="required" value="${product.pr_donation}" ></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="pr_img" required="required" value="${product.pr_img}" ></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="100" name="content" required="required" value="${board.content}"></textarea></td>
			</tr>
			<tr>
				<th>요청메세지</th>
				<td><textarea rows="5" cols="100" name="content" required="required" value="${board.callm}"></textarea></td>
			</tr>
			
		</table>
		<div align="center">
			<button onclick="location.href='pr_List.do'">승인</button>
			<button onclick="location.href='ad_prList.do'">보류</button>
		</div>
	</form>
</body>
</html>