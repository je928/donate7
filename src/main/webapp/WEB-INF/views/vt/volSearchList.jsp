<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-striped table-hover">
		<tr>
			<th width="50px">번호</th>
			<th width="100px">모집 상태</th>
			<th>봉사 지역</th>
			<th width="120px">봉사 기관</th>
			<th>봉사 제목</th>
			<th>활동 분야</th>
			<th width="50px">모집인원</th>
			<th width="50px">신청자수</th>
		</tr>
		<c:forEach var="result" items="${result}">
			<tr>
				<td>${result.vt_no }</td>
				<td><c:if test="${result.vt_r_yn eq 'Y' }">
						<span class="ry">모집 중</span>
					</c:if> <c:if test="${result.vt_r_yn eq 'N' }">
						<span class="rn">모집 완료</span>
					</c:if></td>
				<td>${result.addr}</td>
				<td>${result.o_oname }</td>
				<td>
				<c:if test="${sessionScope.no!=null}">
				<a href="vtView.do?vt_no=${result.vt_no}&pageNum=${paging.nowPage}">${result.vt_name }</a>
				</c:if>
				<c:if test="${sessionScope.no==null}">
				${result.vt_name }
				</c:if>
				</td>
				<td>${result.cn }</td>
				<td>${result.vt_tot }</td>
				<td>${result.count }</td>
			</tr>
		</c:forEach>
	</table>
	<div class="text-center" id="paging">
		<div class="row">
			<div class="col">
				<ul class="pagination">
					<c:if test="${paging.startPage > paging.pagePerBlock}">
						<li><a href="javascript:list(1)">««</a></li>						
						<li><a href="javascript:list(${paging.nowPage-1})">«</a></li>
					</c:if>
				</ul>
				<ul class="pagination">
					<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
						<c:if test="${i eq paging.nowPage}">
							<li><a href="#"><b class="b2">${i}</b></a></li>
						</c:if>
						<c:if test="${i ne paging.nowPage}">
							<li><a href="javascript:list(${i})">${i}</a></li>
						</c:if>
					</c:forEach>
				</ul>
				<ul class="pagination">
					<c:if test="${paging.totalPage > paging.endPage}">
						<li><a href="javascript:list(${paging.startPage+paging.pagePerBlock})">»</a></li>
						<li><a href="javascript:list(${paging.totalPage})">»»</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<%-- <div style="margin-left: 30%" id="paging">
		<c:if test="${paging.startPage != 1}">
			<a href="javascript:list(1)">&lt;&lt;맨 앞으로</a>
		</c:if>
		<c:if test="${paging.startPage > paging.pagePerBlock}">
			<a href="javascript:list(${startPage-pagePerBlock})">&lt;이전</a>
		</c:if>
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
			<c:if test="${i != paging.nowPage}">
				<a href="javascript:list(${i})">[${i}]</a>
			</c:if>
			<c:if test="${i == paging.nowPage}">
				<b class="b">[${i}]</b>
			</c:if>
		</c:forEach>
		<c:if test="${paging.totalPage > paging.endPage}">
			<a href="javascript:list(${paging.startPage+paging.pagePerBlock})">다음&gt;</a>
		</c:if>
		<c:if test="${paging.endPage != paging.totalPage}">
			<a href="javascript:list(${paging.totalPage})">맨 뒤로&gt;&gt;</a>
		</c:if>
	</div> --%>
	
</body>
</html>