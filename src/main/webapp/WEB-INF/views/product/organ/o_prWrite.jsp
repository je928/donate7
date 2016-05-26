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
	<c:if test="${not empty msg }">
			<font color="red">
				${msg }
			</font>
			</c:if>
			<c:if test="${not empty fileName }">
				<img src="/ex/${fileName }">
			</c:if>
	<form action="o_prWrite.do" method="post" enctype="multipart/form-data">
		<table class="table table-striped table-hover">
			<caption>판매요청</caption>
			<tr>
				<th>제목</th>
				<td><input type="text" name="pr_proname" required="required" autofocus="autofocus" ></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="number" name="pr_price" required="required"></td>
			</tr>
			<tr>
				<th>수량</th>
				<td><input type="number" name="pr_qty" required="required" ></td>
			</tr>
			<tr>
				<th>종류</th>
				<td><input type="radio" name="pr_item" required="required" >Fashion &nbsp;
					<input type="radio" name="pr_item" required="required" >Design	&nbsp;
					<input type="radio" name="pr_item" required="required" >Smart Phone &nbsp;
				</td>
			</tr>
			<tr>
				<th>기부처</th>
				<td><input type="text" name="pr_donation" required="required" ></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="oimg" required="required" ></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="100" name="pr_content" required="required" ></textarea></td>
			</tr>
			<tr>
				<th>요청메세지</th>
				<td><textarea rows="5" cols="100" name="pr_callm" required="required"></textarea></td>
			</tr>
			
		</table>
		<div align="center">
			<input type="submit" value="요청하기">
			<button onclick="location.href='o_prList.do'">요청내역 보기</button>
		</div>
	</form>
</body>
</html>