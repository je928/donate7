<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp"%>
<%@ include file="../../session/adminChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function locate(pageNum,sort){
		location.href="registerPro.do?pageNum="+pageNum+"&sort="+sort;
	}
	function reg_pro(re_no) {
		window.open("reg_pro.do?re_no="+re_no,"","width=370, height=400");
	}
</script>
<style type="text/css">
table{
	table-layout: fixed;
}
table #td {
	width: 300px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
<body style="background-color: #DAD9FF;">

	<div class="panel-body2">
	<a href="registerPro.do?sort=all" class="btn btn-sm btn-info">전체</a>
	<a href="registerPro.do?sort=y" class="btn btn-sm btn-info">처리 한거</a>
	<a href="registerPro.do?sort=n" class="btn btn-sm btn-info">처리 안한거</a>
	<table class="table table-striped table-bordered table-list">
		<caption>신고처리</caption>
		<tr>
			<th style="width:80px">신고 번호</th>
			<th>신고 사유</th>
			<th style="width:100px">신고 날짜</th>
			<th style="width:100px">신고 처리</th>
			<th style="width:100px">자세히 보기</th>
		</tr>
		<c:set var="no" value="${pb.no}" />
		<c:forEach var="reg" items="${list }">
			<tr>
				<td >${no }</td>
				<td id="td">${reg.re_content }</td>
				<td><fmt:formatDate value="${reg.re_date }" /></td>
				<td><c:if test="${reg.re_chk =='n' }">
					처리 안 됨
				</c:if> <c:if test="${reg.re_chk !='n' }">
					처리 됨
				</c:if></td>
				<td><a href="javascript:reg_pro(${reg.re_no })"
					class="btn btn-sm btn-primary">자세히 보기</a></td>
			</tr>
			<c:set var="no" value="${no - 1}"/>
		</c:forEach>
		<c:if test="${empty list}">
			<tr>
				<td colspan="5">신고 내역이 없습니다.</td>
			</tr>
		</c:if>
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
</body>
</html>