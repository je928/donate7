<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function locate(pageNum, fdp) {
		location.href = "goods.do?pageNum=" + pageNum + "&fdp=" + fdp;
	}

</script>
<style type="text/css">
@media ( min-width : 1200px) {
	.col-lg-3-1 {
		float: left;
	}
	.col-lg-3-1 {
		width: 20%;
	}
}

body {
	font-family: 'Quicksand', sans-serif;
}

.profile {
	margin-top: 25px;
	text-align: center;
}

.profile h1 {
	font-weight: normal;
	font-size: 16px;
	margin: 10px 0 0 0;
}

.profile h2 {
	font-size: 14px;
	font-weight: lighter;
	margin-top: 5px;
}

.profile .img-box {
	opacity: 1;
	display: white;
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

.profile .img-box:after, .img-box ul, .img-box ul li {
	-webkit-transition: all 0.5s ease-in-out 0s;
	-moz-transition: all 0.5s ease-in-out 0s;
	transition: all 0.5s ease-in-out 0s;
}

.btn-margin {
	margin: 15px 0 30px;
	padding-left: 400px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-offset-17">
				<h3 class="page-header">
					Market 
				</h3>
				<ol class="breadcrumb">
					<li><a href="main.do">Home</a></li>
					<li class="active">Market</li>
				</ol>
			</div>
		</div>

		<div class="btn-margin">
			<input type="button" id="f" class="btn btn-primary" onclick="location.href='goods.do?pageNum=1&fdp=f'" value="Fashion"> 
			<input type="button" id="d" class="btn btn-warning" onclick="location.href='goods.do?pageNum=1&fdp=d'" value="Design"> 
			<input type="button" id="p" class="btn btn-success" onclick="location.href='goods.do?pageNum=1&fdp=p'" value="Phone Case">
		</div>
		<div class="row pt-md">
			<c:forEach var="go" items="${golist}">

				<div class="col-lg-3-1 col-md-2 col-sm-2 col-xs-12 profile">
					<a href="go_view.do?pr_no=${go.pr_no}"> 
					<img src="image/${go.pr_img}" class="img-responsive" class="img-box" style="width: 300px; height: 230px;">
					</a>

					<h1>
						<a href="go_view.do?pr_no=${go.pr_no}">
							${go.pr_proname}</a>
					</h1>
					<h2>${go.pr_price}원</h2>

				</div>
				
			</c:forEach>
		</div>
	</div>
	<div class="panel-footer2 text-center">
		<div class="row">
			<div class="col">
				<ul class="pagination">
					<c:if test="${pg.startPage > pg.pagePerBlock}">
						<li><a href="javascript:locate(1,'${fdp}')">««</a></li>
						<li><a href="javascript:locate(${pg.nowPage-1},'${fdp}')">«</a></li>
					</c:if>
				</ul>
				<ul class="pagination">
					<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
						<c:if test="${i eq pg.nowPage}">
							<li><a href="#"><b class="b2">${i}</b></a></li>
						</c:if>
						<c:if test="${i ne pg.nowPage}">
							<li><a href="javascript:locate(${i},'${fdp}')">${i}</a></li>
						</c:if>
					</c:forEach>
				</ul>
				<ul class="pagination">
					<c:if test="${pg.totalPage > pg.endPage}">
						<li><a
							href="javascript:locate(${pg.startPage+pg.pagePerBlock},'${fdp}')">»</a></li>
						<li><a href="javascript:locate(${pg.totalPage},'${fdp}')">»»</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>

</body>
</html>