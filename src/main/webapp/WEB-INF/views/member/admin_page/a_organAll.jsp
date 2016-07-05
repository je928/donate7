<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp"%>
<%@ include file="../../session/adminChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function locate(pageNum,xyn){
		location.href="a_organAll.do?pageNum="+pageNum+"&xyn="+xyn;
	}
	
	function info(pageNum,o_no,xyn){
		location.href="o_info.do?pageNum="+pageNum+"&o_no="+o_no+"&xyn="+xyn;
	}
	
	function m() {
		location.href="a_memberAll.do";
	}
	
	function o() {
		location.href="a_organAll.do";	
	}
</script>
</head>
<body style="background-color: #DAD9FF;">

	<div class="col-md-12">
		<div class="text-left list-group2">
			<input type="button" class="btn btn-default2" onclick="m()" value="일반">
			<div class="btn-group">
				<a href="javascript:o()" class="btn btn-default dropdown-toggle" data-toggle="dropdown"> 기관 <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="javascript:o()">전체</a></li>				
					<li><a href="a_organAll.do?pageNum=1&xyn=x">승인처리중</a></li>
					<li><a href="a_organAll.do?pageNum=1&xyn=y">승인완료</a></li>
					<li><a href="a_organAll.do?pageNum=1&xyn=n">승인거절</a></li>
				</ul>
			</div>
		</div>
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
							<th>oname</th>													
							<th>tel</th>
							<th>ok_yn</th>							
							<th><em class="fa fa-cog"></em></th>
						</tr>
					</thead>
					<tbody>
					<c:set var="no" value="${o_pb.no}" />
					<c:if test="${not empty organAll}">
						<c:forEach var="org" items="${organAll}">
						<tr>
							<td>${no}</td>
							<td>${org.o_email}</td>
							<td>${org.o_oname}</td>
							<td>${org.o_tel}</td>
							<c:if test="${org.o_ok_xyn eq 'x'}">
							<td><span class="ok_x">승인 처리중</span></td>
							</c:if>
							<c:if test="${org.o_ok_xyn eq 'y'}">
							<td><b class="ok_y">승인 완료</b></td>
							</c:if>
							<c:if test="${org.o_ok_xyn eq 'n'}">
							<td><b class="ok_n">승인 거절</b></td>
							</c:if>
							<td align="center">
								<a href="javascript:info(${o_pb.nowPage},${org.o_no},'${org.o_ok_xyn}')" class="btn btn-default"><em class="glyphicon glyphicon-eye-open"></em></a>
							</td>
						</tr>
						<c:set var="no" value="${no-1}"></c:set>
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
					<div class="col col-xs-4">Page ${o_pb.nowPage} of ${o_pb.totalPage} / 총 ${o_pb.total}명</div>
					<div class="col col-xs-8">
						<ul class="pagination hidden-xs pull-right">
							<c:if test="${o_pb.startPage > o_pb.pagePerBlock}">
								<li><a href="javascript:locate(1,'${xyn}')">««</a></li>						
								<li><a href="javascript:locate(${o_pb.nowPage-1},'${xyn}')">«</a></li>
							</c:if>
						</ul>
						<ul class="pagination hidden-xs pull-right">
							<c:forEach var="i" begin="${o_pb.startPage}" end="${o_pb.endPage}">
								<c:if test="${i eq o_pb.nowPage}">
									<li><a href="#"><b class="b2">${i}</b></a></li>
								</c:if>
								<c:if test="${i ne o_pb.nowPage}">
									<li><a href="javascript:locate(${i},'${xyn}')">${i}</a></li>
								</c:if>
							</c:forEach>
						</ul>
						<ul class="pagination visible-xs pull-right">
							<c:if test="${o_pb.totalPage > o_pb.endPage}">
								<li><a href="javascript:locate(${o_pb.startPage+o_pb.pagePerBlock},'${xyn}')">»</a></li>
								<li><a href="javascript:locate(${o_pb.totalPage},'${xyn}')">»»</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>