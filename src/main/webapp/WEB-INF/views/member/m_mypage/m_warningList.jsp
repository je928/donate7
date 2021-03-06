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
		location.href="warningList.do?pageNum="+pageNum+"&sort="+sort;
	}
	function detailWarn(wa_no) {
		window.open("detailWarn.do?wa_no="+wa_no,"","width=370, height=400");
	}
</script>
</head>
<body>

	<div class="col-md-12">
		<div class="list-group2">
			<a href="warningList.do?sort=all" class="btn btn-sm btn-info">전체</a>&nbsp;
			<a href="warningList.do?sort=b" class="btn btn-sm btn-info">게시판</a>&nbsp;
			<a href="warningList.do?sort=d" class="btn btn-sm btn-info">봉사</a>
		</div>
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<b class="panel-title">경고 내역</b>
					</div>
				</div>
			</div>
			<div class="panel-body2">
				<table class="table table-striped table-bordered table-list">
					<thead>
						<tr>
							<th>경고 번호</th>
							<th>경고 분류</th>
							<th>경고 사유</th>
							<th>경고 횟수</th>
							<th>경고 날짜</th>
							<th>자세히 보기</th>
						</tr>
					</thead>
					<tbody>
					<c:set var="no" value="${pb.no}" />
					<c:forEach var="warn" items="${list}">
					<tr>
						<td>${no}</td>
						<td><c:if test="${warn.wa_sort =='b'}">
							게시판 경고
						</c:if> <c:if test="${warn.wa_sort !='b'}">
							봉사 경고
						</c:if></td>
						<td>${warn.wa_re}</td>
						<td>${warn.wa_cnt}</td>
						<td><fmt:formatDate value="${warn.wa_date}" /></td>
						<td><a href="javascript:detailWarn(${warn.wa_no})" class="btn btn-default"><em class="glyphicon glyphicon-eye-open"></em></a></td>
					</tr>
					<c:set var="no" value="${no - 1}"/>
					</c:forEach>
					<c:if test="${empty list}">
					<tr>
						<td colspan="6">경고내역이 없습니다.</td>
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
							<li><a href="javascript:locate(1,${sort })">««</a></li>						
							<li><a href="javascript:locate(${pb.nowPage-1},${sort })">«</a></li>
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
							<li><a href="javascript:locate(${pb.startPage+pb.pagePerBlock},${sort })">»</a></li>
							<li><a href="javascript:locate(${pb.totalPage},${sort })">»»</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>