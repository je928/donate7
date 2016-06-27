<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<%@ include file="../session/adminChk.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function locate(pageNum) {
		location.href = "a_deliveryForm.do?pageNum=" + pageNum;
	}
</script>
<style type="text/css">
.ts {
	width: 300px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

table {
	table-layout: fixed;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-offset-17">
				<h3 class="page-header">
					MYPAGE <small>${member.m_nick}</small>
				</h3>
				<ol class="breadcrumb">
					<li><a href="main.do">Home</a></li>
					<li class="active">mypage</li>
				</ol>
			</div>
		</div>

		<div class="center">
			<div class="col-md-3-2">
				<jsp:include page="../member/admin_page/a_navbar.jsp" />
			</div>
			<div class="col-md-9-2">
				<table class="table table-striped table-hover">
					<caption>배송 요청 내역</caption>
				<tr>
					<td><button onclick="location.href='a_deliveryForm.do'">배송대기</button></td>
					<td><button onclick="location.href='a_deliveryForm.do?nyo=y'">배송중</button></td>
					<td><button onclick="location.href='a_deliveryForm.do?nyo=o'">배송완료</button></td>
				</tr>
					<tr>
						<th>번호</th>
						<th>제품</th>
						<th>구매자</th>
						<th>수량</th>
						<th>전화번호</th>
						<th>배송상태</th>
						<th>자세히보기</th>
					</tr>
					<c:forEach items="${list }" var="li">
					<c:if test="${li.pb_delivery== nyo}">
						<c:set var="nick" value="${ds.Nick(li.pb_mono)}" />
						<c:set var="no" value="${ds.selectOne(li.pr_no) }" />
						<tr>
							<td>${li.pb_no}</td>
							<td>${no.pr_proname}</td>
							<td>${nick}</td>
							<td>${li.pb_buyqty }</td>
							<td class="ts">${li.pb_addr }</td>
							<c:if test="${li.pb_delivery =='n'}">
								<td>배송준비중</td>
							</c:if>
							<c:if test="${li.pb_delivery =='y'}">
								<td>배송중</td>
							</c:if>
							<c:if test="${li.pb_delivery =='o'}">
								<td>배송완료</td>
							</c:if>
							<td><a
								href="am_delivery.do?pb_no=${li.pb_no }&pr_no=${li.pr_no }&pb_mono=${li.pb_mono}">자세히보기</a></td>
						</tr>
					</c:if>
					</c:forEach>
					<c:if test="${empty list}">
			<tr>
				<td colspan="7">배송 내역이 없습니다.</td>
			</tr>
		</c:if>
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
</body>
</html>

