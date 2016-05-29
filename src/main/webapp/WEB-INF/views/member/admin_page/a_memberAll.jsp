<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
							<th>tel</th>
							<th>warning</th>													
							<th><em class="fa fa-cog"></em></th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${not empty memberAll}">
						<c:forEach var="mem" items="${memberAll}">
						<tr>
							<td>${mem.m_no}</td>
							<td>${mem.m_email}</td>
							<td>${mem.m_name}</td>
							<td>${mem.m_nick}</td>
							<td>${mem.m_birth}</td>
							<td>${mem.m_tel}</td>
							<td>0</td>
							<td align="center">
								<a class="btn btn-default"><em class="fa fa-pencil"></em></a>
								<a class="btn btn-danger"><em class="fa fa-trash"></em></a>
							</td>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty memberAll}">
						<tr>
							<td colspan="8">데이터가 없습니다.</td>
						</tr>
					</c:if>
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
							<th>license</th>													
							<th>oname</th>													
							<th>name</th>
							<th>tel</th>
							<th>ok_yn</th>							
							<th><em class="fa fa-cog"></em></th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${not empty organAll}">
						<c:forEach var="org" items="${organAll}">
						<tr>
							<td>${org.o_no}</td>
							<td>${org.o_email}</td>
							<td>${org.o_license}</td>							
							<td>${org.o_oname}</td>
							<td>${org.o_name}</td>
							<td>${org.o_tel}</td>
							<td>${org.o_ok_yn}</td>
							<td align="center">
								<a class="btn btn-default"><em class="fa fa-pencil"></em></a>
								<a class="btn btn-danger"><em class="fa fa-trash"></em></a>
							</td>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty organAll}">
						<tr>
							<td colspan="8">데이터가 없습니다.</td>
						</tr>
					</c:if>
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