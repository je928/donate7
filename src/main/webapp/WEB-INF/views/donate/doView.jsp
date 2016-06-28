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
.w{
	width: 70%;
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
							<img src="image/${donate.d_img}" class="w">
						</div>
						<div class="col-md">
							<table class="table table-user-information">
								<tbody>
									<tr>
										<td>${donate.d_start_date}~ ${donate.d_end_date}</td>
									</tr>
									<tr>
										<td><strong><fmt:formatNumber
													value="${sumD }" groupingUsed="true" /></strong>원 후원</td>
									</tr>
									<tr>
										<td><strong><fmt:formatNumber
													value="${donate.d_amount}" groupingUsed="true" /></strong><span>원
												목표</span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<br>
					<div class="panel-body" style="margin-left: 60px; margin-right: 65px;">${donate.d_content}</div>
					<div class="panel-body text-center"
						style="text-align: left; margin-left: 60px;">
						<h5>
							<strong>기부금 사용계획</strong>
						</h5>
						<div style="margin-left: 10px;">
							*총 집행금액 &nbsp;
							<fmt:formatNumber value="${donate.d_amount}" groupingUsed="true" />
							원 <br> ${donate.d_plan } <br>
						</div>
					</div>
					<div class="panel-footer text-center">
						<button onclick="location.href='doList.do'"
							class="btn btn-sm btn-primary">
							목록으로<i class="glyphicon glyphicon-menu-hamburger"></i>
						</button>
						<c:if test="${sessionScope.no!=null && sessionScope.no>1}">
						<button onclick="location.href='doResult.do?d_no=${donate.d_no}'"
							class="btn btn-sm btn-success">
							기부하기<i class="glyphicon glyphicon-heart"></i>
						</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>