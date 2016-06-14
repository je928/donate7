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
<script type="text/javascript">
	
	/* function al() {
		All.style.display = 'block';
		fashion.style.display = 'none';
		design.style.display = 'none';
		phonecase.style.display = 'none';
	}
	
	function fa() {
		All.style.display = 'none';
		fashion.style.display = 'block';
		design.style.display = 'none';
		phonecase.style.display = 'none';
	}

	function de() {
		All.style.display = 'none';
		fashion.style.display = 'none';
		design.style.display = 'block';
		phonecase.style.display = 'none';
	}

	function pc() {
		All.style.display = 'none';
		fashion.style.display = 'none';
		design.style.display = 'none';
		phonecase.style.display = 'block';
	} */
	$(document).ready(function(){
		list(1,'All');
		
		$('#fa').click(function(){
			list(1,'Fashion');
		});
		$('#de').click(function(){
			list(1,'Design');
		});
		$('#pc').click(function(){
			list(1,'Phone Case');
		});
	});
	
	function list(pageNum, pr_item){
		/* $('#list').html(''); */
		var sndData = "pr_item="+pr_item + "&pageNum=" + pageNum;
		$.post('goodList.do', sndData, function(data) {
			$('#list').html('');
			$('#list').html(data);
		});
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
		<div class="row pt-md" id="list" >
			
		</div>
		
		

		<%-- <div id="All" style="display: block">
			<div class="row pt-md">
				<c:forEach var="product" items="${list}">
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 profile">
							
							<a href="go_view.do?pr_no=${product.pr_no}">
								<img src="image/${product.pr_img}" class="img-responsive" class="img-box">
								</a>
							
						<h1><a href="go_view.do?pr_no=${product.pr_no}">
							${product.pr_proname}</a></h1>
						<h2>${product.pr_price}원</h2>
					</div>
				</c:forEach>
			</div>
		</div>


		<div id="fashion" style="display: none">
			<div class="row pt-md">
				<c:forEach var="product" items="${list}">
					<c:if test="${product.pr_item eq 'Fashion' }">
						<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 profile">
							
								<a href="go_view.do?pr_no=${product.pr_no}">
								<img src="image/${product.pr_img}" class="img-responsive" class="img-box">
								</a>
							
							<h1><a href="go_view.do?pr_no=${product.pr_no}">
							${product.pr_proname}</a></h1>
							<h2>${product.pr_price}원</h2>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>

		<div id="design" style="display: none">
			<c:forEach var="product" items="${list}">
				<c:if test="${product.pr_item eq 'Design' }">
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 profile">
							<a href="go_view.do?pr_no=${product.pr_no}">
								<img src="image/${product.pr_img}" class="img-responsive" class="img-box">
								</a>
							
							<h1><a href="go_view.do?pr_no=${product.pr_no}">
							${product.pr_proname}</a></h1>
						<h2>${product.pr_price}원</h2>
					</div>
				</c:if>
			</c:forEach>
		</div>


		<div id="phonecase" style="display: none">
			<c:forEach var="product" items="${list}">
				<c:if test="${product.pr_item eq 'Phone Case' }">
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 profile">
							<a href="go_view.do?pr_no=${product.pr_no}">
								<img src="image/${product.pr_img}" class="img-responsive" class="img-box">
								</a>
							
							<h1><a href="go_view.do?pr_no=${product.pr_no}">
							${product.pr_proname}</a></h1>
						<h2>${product.pr_price}원</h2>
					</div>
				</c:if>
			</c:forEach>
		</div> --%>

	</div>


</body>
</html>