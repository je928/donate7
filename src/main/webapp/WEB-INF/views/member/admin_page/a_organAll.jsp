<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function locate(pageNum){
		location.href="a_organAll.do?pageNum="+pageNum;
	}
</script>
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
					<div class="col col-xs-4">Page ${o_pb.startPage} of ${o_pb.endPage} / 총 ${o_pb.total}명</div>
					<div class="col col-xs-8">
						<ul class="pagination hidden-xs pull-right">
							<c:if test="${o_pb.startPage > o_pb.pagePerBlock}">
								<li><a href="javascript:locate(1)">««</a></li>						
								<li><a href="javascript:locate(${o_pb.nowPage-1})">«</a></li>
							</c:if>
						</ul>
						<ul class="pagination hidden-xs pull-right">
							<c:forEach var="i" begin="${o_pb.startPage}" end="${o_pb.endPage}">
								<c:if test="${i eq o_pb.nowPage}">
									<li><a href="#"><b class="b2">${i}</b></a></li>
								</c:if>
								<c:if test="${i ne o_pb.nowPage}">
									<li><a href="javascript:locate(${i})">${i}</a></li>
								</c:if>
							</c:forEach>
						</ul>
						<ul class="pagination visible-xs pull-right">
							<c:if test="${o_pb.totalPage > o_pb.endPage}">
								<li><a href="javascript:locate(${o_pb.startPage+o_pb.pagePerBlock})">»</a></li>
								<li><a href="javascript:locate(${o_pb.totalPage})">»»</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>