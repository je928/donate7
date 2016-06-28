<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function rqn_prev() {
		location.href="rqnList.do";
	}
	
	function rqn_next() {
		location.href="rqnList_finish.do";	
	}
</script>
</head>
<body>

	<div class="text-left">
	<input type="button" id="rqn_prev" name="rqn_prev" class="btn btn-default2" onclick="rqn_prev()" value="봉사 신청 목록">
	<input type="button" id="rqn_next" name="rqn_next" class="btn btn-default2" onclick="rqn_next()" value="봉사 완료 목록">
	</div>
	
	<br>
	
	<table class="table table-striped table-hover" style="width: 80%">
		<tr>
			<th>관리번호</th>
			<th>봉사명</th>
			<th>모집기간</th>
			<th>봉사기간</th>
			<th>인원</th>
			<th>신청</th>
			<th>모집여부</th>
		</tr>
		<c:set var="no" value="${tot}"></c:set>
		<c:forEach var="rc" items="${list}">
			<tr>
				<td>${rc.vt_no}</td>
				<td><a
					href="View.do?vt_no=${rc.vt_no}&pageNum=${paging.nowPage}">${rc.vt_name}</a></td>
				<td>${rc.vt_r_start_date }~${rc.vt_r_end_date }</td>
				<td>${rc.vt_a_start_date }~${rc.vt_a_end_date }</td>
				<td>${rc.vt_tot }</td>
				<td>${rc.count}</td>
				<td><c:if test="${rc.vt_r_yn == 'Y'}">
						<span class="ry">모집 중</span>
					</c:if> <c:if test="${rc.vt_r_yn == 'N'}">
						<span class="rn">모집 완료</span>
					</c:if></td>
			</tr>
			<c:set var="tot" value="${tot - 1 }"></c:set>
		</c:forEach>
	</table>
	<div style="margin-left: 30%" id="paging">
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
	
</body>
</html>