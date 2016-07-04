<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<%@ include file="../session/memChk.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function locate(pageNum) {
		location.href = "doResultList.do?pageNum=" + pageNum;
	}
</script>
</head>
<body>
	<input type="hidden" name="d_member" value="${sessionScope.no }">
	<table class="table table-striped table-hover">
		<tr>
			<th>#</th>
			<th>기부자</th>
			<th>금액</th>
			<th>응원메세지</th>
			<th>날짜</th>
		</tr>

		<c:set var="num" value="${pg.total }" />

		<c:if test="${not empty drList }">
			<c:forEach var="doResult" items="${drList}">
				<tr>
					<td>${num}</td>
					<td>${doResult.m_nick}</td>
					<td>${doResult.d_donation}</td>
					<td>당신을 응원합니다.</td>
					<td>${doResult.d_date}</td>
				</tr>
				<c:set var="num" value="${num-1}" />
			</c:forEach>
		</c:if>
		<c:if test="${empty drList}">
			<tr>
				<td colspan="4">기부내역이 없습니다</td>
			</tr>
		</c:if>
	</table>
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
</body>
</html>