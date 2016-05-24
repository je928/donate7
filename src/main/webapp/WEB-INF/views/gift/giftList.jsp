<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-offset-17">
				<h3 class="page-header">GiftShop
					<small>기프트샵</small>
				</h3>
				<ol class="breadcrumb">
					<li>
						<a href="main.do">Home</a>
					</li>
					<li class="active">
						GiftShop
					</li>
				</ol>
			</div>
		</div>
	
		<div align="center">
			<c:forEach var="gift" items="${list }">
				<div style="display: inline;">
				<img src="/donate7/${gift.g_img }" width="150px"><br>
				<a href="giftDetail.do?g_no=${gift.g_no }"> 기프티콘 이름 :${gift.g_name }</a><br>
				기프티콘 가격 : ${gift.g_price }<br>
				</div>
			</c:forEach>
		</div>
	</div>
	
</body>
</html>