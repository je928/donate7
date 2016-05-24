<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty msg }">
	<script type="text/javascript">
		alert("${msg }");
	</script>
	</c:if>
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
			<img src="/donate7/${gift.g_img }" width="300px"><p>
			기프티콘 이름 : ${gift.g_name }<p>
			기프티콘 가격 : ${gift.g_price }<p>
			<c:if test="${no>1 }">
				<input type="button" onclick="location.href='gift_buy.do?g_no=${gift.g_no}'" value="기프티콘 구매">
			</c:if>				
			<input type="button" onclick="location.href='giftList.do'" value="기프티콘 샵">
		</div>
	</div>
	

</body>
</html>