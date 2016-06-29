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
		location.href = "m_delivery.do?pageNum=" + pageNum;
	}
</script>
<style type="text/css">
.ts {
	width: 500px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

table {
	table-layout: fixed;
	width: 100%;
}
</style>
</head>
<body>

	<div class="center">
		<div class="col-md-9-2">
			<table class="table table-striped table-hover">
				<caption>배송 요청 내역</caption>
				<tr>
					<th>제품명</th>
					<th>받는사람</th>
					<th>수량</th>
					<th>주소</th>
					<th>배송상태</th>
					<th>상세내용</th>
				</tr>
				<c:forEach items="${list }" var="li">
						<c:set var="ps" value="${ds.selectOne(li.pr_no) }" />
						<tr>
							<td>${ps.pr_proname }</td>
							<td>${li.pb_name }</td>
							<td>${li.pb_buyqty }</td>
							<td class="ts">${li.pb_addr }</td>
							<td><c:if test="${li.pb_delivery =='n'}">
								배송준비중
							</c:if> <c:if test="${li.pb_delivery =='y'}">
								배송중
							</c:if> <c:if test="${li.pb_delivery =='o'}">
								배송완료
							</c:if></td>
							<td><a
								href="am_delivery.do?pb_no=${li.pb_no }&pr_no=${li.pr_no }&pb_mono=${li.pb_mono}&pb_delivery=${li.pb_delivery}">자세히보기</a></td>
						</tr>
				</c:forEach>
				<c:if test="${empty list}">
					<tr>
						<td colspan="6">배송 내역이 없습니다.</td>
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
		</div>
	</div>
</body>
</html>

