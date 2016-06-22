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
		var d_no = '${d_no}';
		var donation;
		list(0,d_no);
		$('#btn').click(function(){
			var mycash = '${cash}';
			donation = $('#donation').val();
			if(donation > parseInt(mycash)){
				if(confirm("보유금액이 부족합니다. 충전 하시겠습니까?")){
					location.href="cpointList.do";
				}
			}else{
				donation = $('#donation').val();
				if(donation == "" || donation == 0 || donation < 0){
					alert("정확한 금액을 입력해주세요");
				}else{
					if(confirm("현재 금액으로 기부하시겠습니까?")){
						list(donation, d_no);
					}
				}
			}
		});
	});
	
	function list(d_donation, d_no){
			var donate_param = {
					"d_donation" : d_donation,
					"d_no" : d_no,
			}
			var sndData = $.param(donate_param);
			$.post('doResultList.do', sndData, function(data) {
				$('#dlist').html(data);
			 });
	}
</script>
<style type="text/css">
.col22{
width: 15%;
margin-left: 42%;
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
	</div>

	<div class="container">
		<div align="center">
			<input type="number" size="5" id="donation" step="100" min="100" name="d_donation">원<br>
		</div>
		<br>
		<div class="col22">
			<button id="btn"
				class="form-control input-sm btn btn-success"
				style="height: 35px" >
				모금함에 기부하기 <i class="glyphicon glyphicon-heart"></i>
			</button>
		</div>
		<br>
		<div id="dlist">
		</div>
		
	</div>
</body>
</html>