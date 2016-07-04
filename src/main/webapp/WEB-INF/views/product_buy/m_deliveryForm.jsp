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
</head>
<body>
	
	<div class="col-md-12">
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<b class="panel-title">구매 내역</b>
					</div>
				</div>
			</div>
			<div class="panel-body2">
				<table class="table table-striped table-bordered table-list">
					<thead>
						<tr>
							<th>제품명</th>
							<th>받는사람</th>
							<th>수량</th>
							<th>구매금액</th>
							<th>배송상태</th>
							<th>상세내용</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${not empty list}">
					<c:forEach items="${list }" var="li">
					<c:set var="ps" value="${ds.selectOne(li.pr_no) }" />
					<c:set var="gup" value="${ps.getPr_price()}" />
					<tr>
						<td>${ps.pr_proname }</td>
						<td>${li.pb_name }</td>
						<td>${li.pb_buyqty }</td>
						<td>${gup*li.pb_buyqty }</td>
						<td>
						<c:if test="${li.pb_delivery =='n'}">
							<span class="ok_n">배송준비중</span>
						</c:if>
						<c:if test="${li.pb_delivery =='y'}">
							<span class="ok_x">배송중</span>
						</c:if>
						<c:if test="${li.pb_delivery =='o'}">
							<span class="ok_Y">배송완료</span>
						</c:if>
						</td>
						<td><a href="m_delivery.do?pb_no=${li.pb_no }&pr_no=${li.pr_no }&pb_mono=${li.pb_mono}&pb_delivery=${li.pb_delivery}" class="btn btn-default"><em class="glyphicon glyphicon-eye-open"></em></a></td>
					</tr>
					</c:forEach>
					</c:if>
					<c:if test="${empty list}">
						<tr>
							<td colspan="6">구매 내역이 없습니다.</td>
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
	
</body>
</html>

