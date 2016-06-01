<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: 'Quicksand', sans-serif;
}

h6.description {
	font-weight: bold;
	letter-spacing: 2px;
	color: #999;
	border-bottom: 1px solid rgba(0, 0, 0, 0.1);
	padding-bottom: 5px;
}

.profile {
	margin-top: 25px;
}

.profile h1 {
	font-weight: normal;
	font-size: 20px;
	margin: 10px 0 0 0;
}

.profile h2 {
	font-size: 14px;
	font-weight: lighter;
	margin-top: 5px;
}

.profile .img-box {
	opacity: 1;
	display: block;
	position: relative;
}

.profile .img-box:after {
	content: "";
	opacity: 0;
	background-color: rgba(0, 0, 0, 0.75);
	position: absolute;
	right: 0;
	left: 0;
	top: 0;
	bottom: 0;
}

.img-box ul {
	position: absolute;
	z-index: 2;
	bottom: 50px;
	text-align: center;
	width: 100%;
	padding-left: 0px;
	height: 0px;
	margin: 0px;
	opacity: 0;
}

.profile .img-box:after, .img-box ul, .img-box ul li {
	-webkit-transition: all 0.5s ease-in-out 0s;
	-moz-transition: all 0.5s ease-in-out 0s;
	transition: all 0.5s ease-in-out 0s;
}

.img-box ul i {
	font-size: 20px;
	letter-spacing: 10px;
}

.img-box ul li {
	width: 30px;
	height: 30px;
	text-align: center;
	border: 1px solid #88C425;
	margin: 2px;
	padding: 5px;
	display: inline-block;
}

.img-box a {
	color: #fff;
}

.img-box:hover:after {
	opacity: 1;
}

.img-box:hover ul {
	opacity: 1;
}

.img-box ul a {
	-webkit-transition: all 0.3s ease-in-out 0s;
	-moz-transition: all 0.3s ease-in-out 0s;
	transition: all 0.3s ease-in-out 0s;
}

.img-box a:hover li {
	border-color: #fff;
	color: #88C425;
}

a {
	color: #88C425;
}

a:hover {
	text-decoration: none;
	color: #519548;
}

i.red {
	color: #BC0213;
}
</style>
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

		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="col-lg-12">
						<h6 class="description">제품판매</h6>
						<div class="row pt-md">
							<c:forEach var="product" items="${list}">
								<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 profile">
									<div class="img-box">
										<img src="ex/${product.pr_img}"	class="img-responsive">
									</div>
									<h1>Marrie Doi</h1>
									<h2>Co-founder/ Operations</h2>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit.</p>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>