<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../module/header.jsp"%>
<%@ include file="../../session/memChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function locate(pageNum,sort){
		location.href="cpointList.do?pageNum="+pageNum+"&sort="+sort;
	}
	function addCash() {
		window.open("addCash.do","","width=370, height=300");
	}
</script>
</head>
<body>
	
	<div class="col-md-12">
		<div class="list-group2">
			<a href="cpointList.do?sort=all" class="btn btn-sm btn-info">캐시/포인트</a>&nbsp;
			<a href="cpointList.do?sort=c" class="btn btn-sm btn-info">캐시</a>&nbsp;
			<a href="cpointList.do?sort=p" class="btn btn-sm btn-info">포인트</a>&nbsp;
			<div style="float: right"><a href="javascript:addCash()" class="btn btn-sm btn-primary">캐시 충전</a></div>
		</div>
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<b class="panel-title">캐시/포인트 내역</b>
					</div>
					<div class="col col-xs-6 text-right">
						<b class="blue">총 포인트 : </b><b>${sumP}, </b><b class="blue">총 캐시 : </b><b>${sumC}</b>
					</div>
				</div>
			</div>
			<div class="panel-body2">
				<table class="table table-striped table-bordered table-list">
					<thead>
						<tr>
							<th>번호</th>
							<th>구분</th>
							<th>변동</th>
							<th>얻은 사유</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>
					<c:set var="no" value="${pb.no}" />
					<c:forEach var="cp" items="${list}">
					<tr>
						<td>${no}</td>
						<c:set var="p" value="p"/>
						<td>
						<c:if test="${cp.cp_sort ne p}">
							캐시
						</c:if>
						<c:if test="${cp.cp_sort eq p}">
							포인트	
						</c:if>
						</td>
						<td>${cp.cp_point}</td>				
						<td>${cp.cp_point_re}</td>
						<td><fmt:formatDate value="${cp.cp_date}" /></td>
					</tr>
					<c:set var="no" value="${no - 1}"/>
					</c:forEach>
					<c:if test="${empty list}">
					<tr>
						<td colspan="5">캐시/포인트 내역이 없습니다.</td>
					</tr>
					</c:if>
					</tbody>
				</table>
			</div>
			<div class="panel-footer2 text-center">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							<c:if test="${pb.startPage > pb.pagePerBlock}">
							<li><a href="javascript:locate(1,'${sort }')">««</a></li>						
							<li><a href="javascript:locate(${pb.nowPage-1},'${sort }')">«</a></li>
							</c:if>
						</ul>
						<ul class="pagination">
							<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
								<c:if test="${i eq pb.nowPage}">
									<li><a href="#"><b class="b2">${i}</b></a></li>
								</c:if>
								<c:if test="${i ne pb.nowPage}">
									<li><a href="javascript:locate(${i},'${sort }')">${i}</a></li>
								</c:if>
							</c:forEach>
						</ul>
						<ul class="pagination">
							<c:if test="${pb.totalPage > pb.endPage}">
							<li><a href="javascript:locate(${pb.startPage+pb.pagePerBlock},'${sort }')">»</a></li>
							<li><a href="javascript:locate(${pb.totalPage},'${sort }')">»»</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>