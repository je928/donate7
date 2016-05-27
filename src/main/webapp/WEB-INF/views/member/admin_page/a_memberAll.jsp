<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.panel-table .panel-footer2 .col{
 line-height: 34px;
 height: 34px;
}

.panel-table .panel-heading .col h3{
 line-height: 30px;
 height: 30px;
}

.panel-table .panel-body2 .table-bordered > tbody > tr > td{
  line-height: 34px;
}

.panel-table .panel-footer2 .pagination {
  margin:0; 
}

.panel-table .panel-body2{
  padding:0;
}

.panel-table .panel-body2 .table-bordered{
  border-style: none;
  margin:0;
}

.panel-footer2 {
	padding: 10px 15px;
	background-color: #f5f5f5;
	border-top: 1px solid #dddddd;
	border-bottom-right-radius: 2px;
	border-bottom-left-radius: 2px;
}

.list-group2 {
	margin-right: 20px;
	margin-bottom: 20px;
	padding-left: 0;
}

.btn-default2 {
	-webkit-background-size: 200% 200%;
	background-size: 200%;
	background-position: 50%;
}

.btn-default2:focus {
	background-color: #ffffff;
}

.btn-default2:hover, .btn-default2:active:hover {
	background-color: #f0f0f0;
}

.btn-default2:active {
	background-color: #e0e0e0;
	background-image: -webkit-radial-gradient(circle, #e0e0e0 10%, #ffffff 11%);
	background-image: -o-radial-gradient(circle, #e0e0e0 10%, #ffffff 11%);
	background-image: radial-gradient(circle, #e0e0e0 10%, #ffffff 11%);
	background-repeat: no-repeat;
	-webkit-background-size: 1000% 1000%;
	background-size: 1000%;
	-webkit-box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.4);
	box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.4);
}

.btn-default2 {
	color: #444444;
	background-color: #ffffff;
	border-color: transparent;
}
</style>
<script type="text/javascript">
	
	function m() {
		mlist.style.display='block';
		olist.style.display='none';
	}
	
	function o() {
		mlist.style.display='none';
		olist.style.display='block';		
	}
	
</script>
</head>
<body>

	<div class="text-right list-group2">
	<input type="button" id="m" name="m" class="btn btn-default2" onclick="m()" value="일반">
	<input type="button" id="o" name="o" class="btn btn-default2" onclick="o()" value="기관">
	</div>
	
	<div class="col-md-12" id="mlist" style="display:block">
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<b class="panel-title">일반 회원 정보</b>
					</div>
					<!-- <div class="col col-xs-6 text-right">
						<button type="button" class="btn btn-sm btn-primary btn-create">Create
							New</button>
					</div> -->
				</div>
			</div>
			<div class="panel-body2">
				<table class="table table-striped table-bordered table-list">
					<thead>
						<tr>
							<th>no</th>
							<th>email</th>
							<th>name</th>													
							<th>nick</th>
							<th>birthday</th>																										
							<th>gender</th>
							<th>tel</th>
							<th>job</th>										
							<th><em class="fa fa-cog"></em></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>je928@daum.net</td>
							<td>곽지은</td>
							<td>je928</td>
							<td>90/09/28</td>
							<td>여자</td>
							<td>010-3381-1638</td>
							<td>기타</td>
							<td align="center">
								<a class="btn btn-default"><em class="fa fa-pencil"></em></a>
								<a class="btn btn-danger"><em class="fa fa-trash"></em></a>
							</td>
						</tr>
					</tbody>
					
				</table>

			</div>
			<div class="panel-footer2">
				<div class="row">
					<div class="col col-xs-4">Page 1 of 5</div>
					<div class="col col-xs-8">
						<ul class="pagination hidden-xs pull-right">
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
						</ul>
						<ul class="pagination visible-xs pull-right">
							<li><a href="#">«</a></li>
							<li><a href="#">»</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="col-md-12" id="olist" style="display:none">
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<b class="panel-title">기관 회원 정보</b>
					</div>
				</div>
			</div>
			<div class="panel-body2">
				<table class="table table-striped table-bordered table-list">
					<thead>
						<tr>
							<th>no</th>
							<th>email</th>
							<th>name</th>													
							<th>nick</th>
							<th>birthday</th>																										
							<th>gender</th>
							<th>tel</th>
							<th>job</th>										
							<th><em class="fa fa-cog"></em></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>je928@daum.net</td>
							<td>곽지은</td>
							<td>je928</td>
							<td>90/09/28</td>
							<td>여자</td>
							<td>010-3381-1638</td>
							<td>기타</td>
							<td align="center">
								<a class="btn btn-default"><em class="fa fa-pencil"></em></a>
								<a class="btn btn-danger"><em class="fa fa-trash"></em></a>
							</td>
						</tr>
					</tbody>
					
				</table>

			</div>
			<div class="panel-footer2">
				<div class="row">
					<div class="col col-xs-4">Page 1 of 5</div>
					<div class="col col-xs-8">
						<ul class="pagination hidden-xs pull-right">
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
						</ul>
						<ul class="pagination visible-xs pull-right">
							<li><a href="#">«</a></li>
							<li><a href="#">»</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- <table align="center">
		<tr height="500">
			<td>
				<관리자 페이지><br>
				모든 회원 정보를 볼 수 있는 페이지입니다.<br>
				a_tamp는 기본적으로 이 페이지(모든회원정보보기)로 갑니다.
			</td>
		</tr>
	</table> -->

</body>
</html>