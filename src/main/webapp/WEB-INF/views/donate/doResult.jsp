<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btn').click(function(){
			var mycash = '${cash}';
			var donation = $('#donation').val();
			if(donation > parseInt(mycash)){
				if(confirm("보유금액보다 기부금액이 더 커요")){
					location.href="cpointList.do";
				}
			}else{
				if(confirm("현재 금액으로 기부하시겠습니까?")){
					
				}
			}
		});
	});
</script>
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
	</div>

	<div class="container">
		<div align="center">
			<input type="number" size="5" id="donation" step="100" min="100" value="100">원<br>
		</div>
		<div class="col-md-2">
			<button id="btn"
				class="form-control input-sm btn btn-success disabled"
				style="height: 35px" >
				모금함에 기부하기 <i class="glyphicon glyphicon-heart"></i>
			</button>
		</div>
	</div>
</body>
</html>