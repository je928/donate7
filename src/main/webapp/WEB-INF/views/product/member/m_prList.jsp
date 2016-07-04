<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function locate(pageNum) {
		location.href = "m_prList.do?pageNum=" + pageNum;
	}
</script>
</head>
<body>

	<div class="col-md-12">
		<div class="list-group2">
			<!-- <a href="#.do?#=all" class="btn btn-sm btn-info">전체</a>&nbsp;
			<a href="#.do?#=#" class="btn btn-sm btn-info">승인 대기</a>&nbsp;
			<a href="#.do?#=#" class="btn btn-sm btn-info">승인 완료</a>&nbsp; -->
		</div>
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<b class="panel-title">완제품 판매 요청 내역</b>
					</div>
				</div>
			</div>
			<div class="panel-body2">
				<table class="table table-striped table-bordered table-list">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제품명</th>
							<th>수량</th>
							<th>제품가격</th>
							<th>작성일</th>
							<th>승인여부</th>
						</tr>
					</thead>
					<tbody>
					<c:set var="num" value="${pg.total}" />
					<c:if test="${not empty list }">
					<c:forEach var="pr" items="${list}">
					<tr>
						<td>${num}</td>
						<td><a href="m_prView.do?pr_no=${pr.pr_no}">${pr.pr_proname }</a></td>
						<td>${pr.pr_qty}</td>
						<td>${pr.pr_price}</td>
						<td><fmt:formatDate value="${pr.pr_date}" /></td>
						<td>
						<c:if test="${pr.pr_approve eq 'y'}">
							<span class="ok_y">승인완료</span>
						</c:if> 
						<c:if test="${pr.pr_approve eq 'n'}">
							<span class="ok_x">승인대기</span>
						</c:if>
						</td>
					</tr>
					<c:set var="num" value="${num-1}" />
					</c:forEach>
					</c:if>
					<c:if test="${empty list }">
					<tr>
						<td colspan="4">요청하신 글이 없습니다.</td>
					</tr>
					</c:if>
					</tbody>
				</table>
			</div>
			<div class="panel-footer2 text-center">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							<c:if test="${pg.startPage > pg.pagePerBlock}">
								<li><a href="javascript:locate(1)">««</a></li>
								<li><a href="javascript:locate(${pg.nowPage-1})">«</a></li>
							</c:if>
						</ul>
						<ul class="pagination">
							<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
								<c:if test="${i eq pg.nowPage}">
									<li><a href="#"><b class="b2">${i}</b></a></li>
								</c:if>
								<c:if test="${i ne pg.nowPage}">
									<li><a href="javascript:locate(${i})">${i}</a></li>
								</c:if>
							</c:forEach>
						</ul>
						<ul class="pagination">
							<c:if test="${pg.totalPage > pg.endPage}">
								<li><a
									href="javascript:locate(${pg.startPage+pg.pagePerBlock})">»</a></li>
								<li><a href="javascript:locate(${pg.totalPage})">»»</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<br>
	<div align="center">
		<button class="btn btn-sm btn-default" onclick="location.href='m_prWrite.do'">
			요청글쓰기<i class="glyphicon glyphicon-envelope"></i>
		</button>
	</div>

</body>
</html>