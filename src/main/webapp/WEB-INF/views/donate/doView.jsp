<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.do_margin {
	position: relative;
	margin-left: 48px;
}

.col-xs {
	float: left;
	margin-top: 30px;
}

.col-md {
	float: left;
	margin-top: 120px;
	width: 250px;
}
</style>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-offset-17">
				<h3 class="page-header">
					Donation <small>기부</small>
				</h3>
				<ol class="breadcrumb">
					<li><a href="main.do">Home</a></li>
					<li class="active">Donation</li>
				</ol>
			</div>
		</div>
		
		<div class="col-lg-11 do_margin">
			<div class="panel panel-default panel-table ">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs text-center">
							<h4>${donate.d_title}</h4>
							<img src="image/${donate.d_img}" width="70%">
						</div>
						<div class="col-md">
							<table class="table table-user-information">
								<tbody>
									<tr>
										<td>0%</td>
									</tr>
									<tr>
										<td>까지</td>
									</tr>
									<tr>
										<td>기관명:</td>
									</tr>
									<tr>
										<td>버튼</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="panel-body">${donate.d_content}</div>
					<div class="panel-body text-center">
						<h6>
							<strong>기부금 사용계획</strong>
						</h6>
						*총 집행금액 &nbsp;
						<fmt:formatNumber value="${donate.d_amount}" groupingUsed="true" />
						원 <br> ${donate.d_plan } <br> <br>
					</div>
					<div class="panel-footer text-center">
						<button onclick="location.href='doList.do'"
							class="btn btn-sm btn-primary">
							목록으로<i class="glyphicon glyphicon-edit"></i>
						</button>
						<button class="btn btn-sm btn-success">
							기부하기<i class="glyphicon glyphicon-remove"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>