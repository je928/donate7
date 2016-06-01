<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<%@ include file="../session/orgChk.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function locate(pageNum){
	var searchType = document.getElementById("searchType");
	var searchTxt = document.getElementById("searchTxt");
	location.href="myRecruit.do?pageNum=" + pageNum;
}
</script>
</head>
<body>
	<div class="container">
		<div class="col-md-offset-14" style="margin-left: 0; margin-top: 0;">
			<table class="table table-striped table-hover">
				<tr>
					<th>번호</th>
					<th>봉사명</th>
					<th>모집기간</th>
					<th>봉사기간</th>
					<th>인원</th>
					<th>신청</th>
					<th>모집여부</th>
				</tr>
				<c:forEach var="rc" items="${list}">
					<tr>
						<td>${rc.vt_no}</td>
						<td><a href="rcView.do?vt_no=${rc.vt_no }">${rc.vt_name}</a></td>
						<td>${rc.vt_r_start_date }~${rc.vt_r_end_date }</td>
						<td>${rc.vt_a_start_date }~${rc.vt_a_end_date }</td>
						<td>${rc.vt_tot }</td>
						<th>${rc.count}
						</td>
						<td>${rc.vt_r_yn}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div align="center" id="pagingandsearch">
			<c:if test="${paging.startPage != 1}">
				<a href="javascript:locate(1)">&lt;&lt;맨 앞으로</a>
			</c:if>
			<c:if test="${paging.startPage > paging.pagePerBlock}">
				<a href="javascript:locate(${startPage-pagePerBlock})">&lt;이전</a>
			</c:if>
			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
				<c:if test="${i != paging.nowPage}">
					<a href="javascript:locate(${i})">[${i}]</a>
				</c:if>
				<c:if test="${i == paging.nowPage}">
					<b class="b">[${i}]</b>
				</c:if>
			</c:forEach>
			<c:if test="${paging.totalPage > paging.endPage}">
				<a href="javascript:locate(${paging.startPage+paging.pagePerBlock})">다음&gt;</a>
			</c:if>
			<c:if test="${paging.endPage != paging.totalPage}">
				<a href="javascript:locate(${paging.totalPage})">맨 뒤로&gt;&gt;</a>
			</c:if>
		</div>
	</div>
</body>
</html>