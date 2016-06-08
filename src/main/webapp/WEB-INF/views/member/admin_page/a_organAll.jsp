<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="col-md-12">
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
							<td>${org.o_ok_xyn}</td>
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

</body>
</html>