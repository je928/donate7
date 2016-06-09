<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function locate(pageNum){
		location.href="a_memberAll.do?pageNum="+pageNum;
	}
	function m() {
		location.href="a_memberAll.do";
	}
	
	function o() {
		location.href="a_organAll.do";	
	}
</script>
</head>
<body>

	<div class="text-right list-group2">
	<input type="button" id="m" name="m" class="btn btn-default2" onclick="m()" value="일반">
	<input type="button" id="o" name="o" class="btn btn-default2" onclick="o()" value="기관">
	</div>

	<div class="col-md-12">
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
					<div class="col col-xs-4">Page ${m_pb.nowPage} of ${m_pb.totalPage} / 총 ${m_pb.total}명</div>
					<div class="col col-xs-8">
						<ul class="pagination hidden-xs pull-right">
							<c:if test="${m_pb.startPage > m_pb.pagePerBlock}">
								<li><a href="javascript:locate(1)">««</a></li>						
								<li><a href="javascript:locate(${m_pb.nowPage-1})">«</a></li>
							</c:if>
						</ul>
						<ul class="pagination hidden-xs pull-right">
							<c:forEach var="i" begin="${m_pb.startPage}" end="${m_pb.endPage}">
								<c:if test="${i eq m_pb.nowPage}">
									<li><a href="#"><b class="b2">${i}</b></a></li>
								</c:if>
								<c:if test="${i ne m_pb.nowPage}">
									<li><a href="javascript:locate(${i})">${i}</a></li>
								</c:if>
							</c:forEach>
						</ul>
						<ul class="pagination visible-xs pull-right">
							<c:if test="${m_pb.totalPage > m_pb.endPage}">
								<li><a href="javascript:locate(${m_pb.startPage+m_pb.pagePerBlock})">»</a></li>
								<li><a href="javascript:locate(${m_pb.totalPage})">»»</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>