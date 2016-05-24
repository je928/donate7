<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="o_prWrite.do" method="post">
		<input type="hidden" name="no" value="${product.no}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<table class="table table-striped table-hover">

			<caption>판매요청</caption>
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
			<button onclick="location.href='ad_prList.do'">요청하기</button>
			<button onclick="location.href='o_prList.do'">요청내역 보기</button>
		</div>
	</form>
</body>
</html>