<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function locate(pageNum){
	location.href="goodsList.do?pageNum=" +pageNum;
}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-offset-17">
				<h3 class="page-header">
					Product <small>제품판매</small>
				</h3>
				<ol class="breadcrumb">
					<li><a href="main.do">Home</a></li>
					<li class="active">Product</li>
				</ol>
			</div>
		</div>

		<div class="btn-margin">
			<input type="button" id="fa" name="fa" class="btn btn-primary"  value="Fashion"> 
			<input type="button" id="de" name="de" class="btn btn-warning"  value="Design">
			<input type="button" id="pc" name="pc" class="btn btn-success"  value="Phone Case">
		</div>
	<div class="row pt-md">
	<c:forEach var="product" items="${list}">
	<c:if test = "${product.pr_item == fdp }">
	<c:if test = "${product.pr_item == 'f' }">
		<div class="col-lg-3-1 col-md-2 col-sm-2 col-xs-12 profile">

			<a href="go_view.do?pr_no=${product.pr_no}"> 
				<img src="image/${product.pr_img}" class="img-responsive" class="img-box">
			</a>

			<h1>
				<a href="go_view.do?pr_no=${product.pr_no}">
					${product.pr_proname}</a>
			</h1>
			<h2>${product.pr_price}원</h2>
		</div>
	</c:if>
		<c:if test = "${product.pr_item == 'd' }">
		<div class="col-lg-3-1 col-md-2 col-sm-2 col-xs-12 profile">

			<a href="go_view.do?pr_no=${product.pr_no}"> 
				<img src="image/${product.pr_img}" class="img-responsive" class="img-box">
			</a>

			<h1>
				<a href="go_view.do?pr_no=${product.pr_no}">
					${product.pr_proname}</a>
			</h1>
			<h2>${product.pr_price}원</h2>
		</div>
	</c:if>
		<c:if test = "${product.pr_item == 'p'}">
		<div class="col-lg-3-1 col-md-2 col-sm-2 col-xs-12 profile">

			<a href="go_view.do?pr_no=${product.pr_no}"> 
				<img src="image/${product.pr_img}" class="img-responsive" class="img-box">
			</a>

			<h1>
				<a href="go_view.do?pr_no=${product.pr_no}">
					${product.pr_proname}</a>
			</h1>
			<h2>${product.pr_price}원</h2>
		</div>
	</c:if>
		</c:if>
	</c:forEach>
	</div>
	</div>
	

</body>
</html>