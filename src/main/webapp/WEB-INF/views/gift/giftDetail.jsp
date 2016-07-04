<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp" %>
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
		
		<div class="container">
			<div class="row">
				<div class="col-lg-6 toppad" style="margin-left: 280px;">
					<div class="panel panel-default panel-table">
						<form action="" class="form-horizontal">
							<fieldset>
								<br style="clear: both">
								<h3 style="margin-bottom: 25px; text-align: center;">
									<em class="glyphicon glyphicon-gift"></em>
								</h3>
								<div class="form-group">
									<div class="col-lg-12 text-center">
										<img src="/donate7/${gift.g_img }" height="300px">
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-12 text-center">
										<b>기프티콘 이름 : </b>${gift.g_name }
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-12 text-center">
										<b>기프티콘 가격 : </b>${gift.g_price }
									</div>
								</div>
								<div class="panel-footer text-center">
								<c:if test="${no>1 }">
									<input type="button" class="btn btn-sm btn-default" onclick="location.href='gift_buy.do?g_no=${gift.g_no}'" value="기프티콘 구매">
								</c:if>
								<c:if test="${no==1 }">
									<input type="button" class="btn btn-sm btn-default" onclick="location.href='gift_delete.do?g_no=${gift.g_no}'" value="기프티콘 삭제">
								</c:if>					
									<input type="button" class="btn btn-sm btn-default" onclick="location.href='giftList.do'" value="기프티콘 샵">
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>