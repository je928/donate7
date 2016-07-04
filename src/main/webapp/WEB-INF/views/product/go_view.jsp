<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

/*social buttons*/
.btn-social {
	color: white;
	opacity: 0.9;
}

.btn-social:hover {
	color: white;
	opacity: 1;
}

.btn-facebook {
	background-color: #3b5998;
	opacity: 0.9;
}

.btn-twitter {
	background-color: #00aced;
	opacity: 0.9;
}

.btn-linkedin {
	background-color: #0e76a8;
	opacity: 0.9;
}

.btn-github {
	background-color: #000000;
	opacity: 0.9;
}

.btn-google {
	background-color: #c32f10;
	opacity: 0.9;
}

.btn-stackoverflow {
	background-color: #D38B28;
	opacity: 0.9;
}

/* resume stuff */
.bs-callout {
	-moz-border-bottom-colors: none;
	-moz-border-left-colors: none;
	-moz-border-right-colors: none;
	-moz-border-top-colors: none;
	border-color: #eee;
	border-image: none;
	border-radius: 3px;
	border-style: solid;
	border-width: 1px 1px 1px 5px;
	margin-bottom: 5px;
	padding: 20px;
}

.bs-callout:last-child {
	margin-bottom: 0px;
}

.bs-callout h4 {
	margin-bottom: 10px;
	margin-top: 0;
}

.bs-callout-danger {
	border-left-color: #d9534f;
}

.bs-callout-danger h4 {
	color: #d9534f;
}

.resume .list-group-item:first-child, .resume .list-group-item:last-child
	{
	border-radius: 0;
}

/*makes an anchor inactive(not clickable)*/
.inactive-link {
	pointer-events: none;
	cursor: default;
}

.resume-heading .social-btns {
	margin-top: 15px;
}

.resume-heading .social-btns i.fa {
	margin-left: -5px;
}

@media ( max-width : 992px) {
	.resume-heading .social-btn-holder {
		padding: 5px;
	}
}

/* skill meter in resume. copy pasted from http://bootsnipp.com/snippets/featured/progress-bar-meter */
.progress-bar {
	text-align: left;
	white-space: nowrap;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	cursor: pointer;
}

.progress-bar>.progress-type {
	padding-left: 10px;
}

.progress-meter {
	min-height: 15px;
	border-bottom: 2px solid rgb(160, 160, 160);
	margin-bottom: 15px;
}

.progress-meter>.meter {
	position: relative;
	float: left;
	min-height: 15px;
	border-width: 0px;
	border-style: solid;
	border-color: rgb(160, 160, 160);
}

.progress-meter>.meter-left {
	border-left-width: 2px;
}

.progress-meter>.meter-right {
	float: right;
	border-right-width: 2px;
}

.progress-meter>.meter-right:last-child {
	border-left-width: 2px;
}

.progress-meter>.meter>.meter-text {
	position: absolute;
	display: inline-block;
	bottom: -20px;
	width: 100%;
	font-weight: 700;
	font-size: 0.85em;
	color: rgb(160, 160, 160);
	text-align: left;
}

.progress-meter>.meter.meter-right>.meter-text {
	text-align: right;
}
</style>
<script type="text/javascript">
	$(function() {
		var action;
		$(".number-spinner button").mousedown(
				function() {
					btn = $(this);
					input = btn.closest('.number-spinner').find('input');
					btn.closest('.number-spinner').find('button').prop(
							"disabled", false);

					if (btn.attr('data-dir') == 'up') {
						action = setInterval(function() {
							if (input.attr('max') == undefined
									|| parseInt(input.val()) < parseInt(input
											.attr('max'))) {
								input.val(parseInt(input.val()) + 1);
							} else {
								btn.prop("disabled", true);
								clearInterval(action);
							}
						}, 50);
					} else {
						action = setInterval(function() {
							if (input.attr('min') == undefined
									|| parseInt(input.val()) > parseInt(input
											.attr('min'))) {
								input.val(parseInt(input.val()) - 1);
							} else {
								btn.prop("disabled", true);
								clearInterval(action);
							}
						}, 50);
					}
				}).mouseup(function() {
					clearInterval(action);
		});	
		
	$(function() {
		$('#button').click(function(){
			location.href="delivery.do?pr_no=${product.pr_no}&pageNum=${pageNum}&cnt="+document.getElementById("cnt").value;
		});
	});
	
	$(function() {
		$('#nullbutton').click(function(){
			if(confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")) {
				location.href="login.do?pageNum=${pageNum}&page=go_view";
			} else {
			}
		});
	});

});
</script>
</head>
<body>

	<input type="hidden" name="pr_mno" value="${sessionScope.no}">
	<div class="container">
		 <div class="resume">
			<div class="row">
			<div class="col-lg-12 col-md-offset-17">
				<h3 class="page-header">
					Market  
					<%-- <small>
						<c:if test = "${product.pr_item eq 'f'}">Fashion</c:if>
						<c:if test = "${product.pr_item eq 'd'}">Design</c:if>
						<c:if test = "${product.pr_item eq 'p'}">Phone Case</c:if>
					</small> --%>
				</h3>
				<ol class="breadcrumb">
					<li><a href="goods.do">Market</a></li>
					<li class="active">						
						<c:if test = "${product.pr_item eq 'f'}">Fashion</c:if>
						<c:if test = "${product.pr_item eq 'd'}">Design</c:if>
						<c:if test = "${product.pr_item eq 'p'}">Phone Case</c:if>
					</li>
				</ol>
			</div>
				<div
					class="col-xs-12 col-sm-12 col-md-offset-1 col-md-10 col-lg-offset-2 col-lg-8">
					<div class="panel panel-default">
						<div class="panel-heading resume-heading">
							<div class="row">
								<div class="col-lg-12">
									<div class="col-xs-12 col-sm-4">
										<figure>
											<img class="img-responsive" alt=""
												src="image/${product.pr_img}">
										</figure>
									</div>
									<div class="col-xs-12 col-sm-8">
										<ul class="list-group">
											<li class="list-group-item">${product.pr_proname }</li>
											<li class="list-group-item">가격 : ${product.pr_price }</li>
											<li class="list-group-item">기본수량 : ${product.pr_qty }</li>
											
											<li class="list-group-item">

												<div class="input-group number-spinner">

													<span class="input-group-btn data-dwn">
														<button class="btn  btn-info" data-dir="dwn">
															<span class="glyphicon glyphicon-minus"></span>
														</button>
													</span>
													<input type="text" class="form-control text-center" value="1" id="cnt" name="cnt">
													<span class="input-group-btn data-up">
														<button class="btn btn-default btn-info" data-dir="up">
															<span class="glyphicon glyphicon-plus"></span>
														</button>
													</span>
												</div>
											</li>
											<li class="list-group-item">기부처 : ${product.pr_donation }</li>
											<li class="list-group-item">
											<c:if test="${sessionScope.no==null}">
												<button id="nullbutton">주문하기</button>
											</c:if>
											<c:if test="${sessionScope.no!=null && sessionScope.no>1}">
												<button id="button"  >주문하기</button>
											</c:if>
											</li>
											
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="bs-callout bs-callout-danger">
							<h4>상세설명</h4>
							<p>${product.pr_content }</p>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div> 
</body>
</html>