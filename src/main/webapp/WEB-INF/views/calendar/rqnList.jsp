<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<%@ include file="../session/memChk.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function locate(pageNum,vtryn){
		location.href="rqnList.do?pageNum="+pageNum+"&vtryn="+vtryn;
	}
	
	function vtry() {
		location.href="rqnList.do?pageNum=1&vtryn=Y";
	}
	
	function vtrn() {
		location.href="rqnList.do?pageNum=1&vtryn=N";	
	}
</script>
</head>
<body>
	
	
	<div class="col-md-12">
		<div class="text-left list-group2">
			<input type="button" class="btn btn-sm btn-default2" onclick="vtry()" value="봉사 신청 목록">&nbsp;
			<input type="button" class="btn btn-sm btn-default2" onclick="vtrn()" value="봉사 완료 목록">
		</div>
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<b class="panel-title">봉사 내역</b>
					</div>
					<div class="col col-xs-6 text-right">
						<c:set var="vt_time" value="${vs.Vt_TimeTotal(m_no) }"> </c:set>
						<c:if test="${vtryn == 'Y'}">
						</c:if>
						<c:if test="${vtryn == 'N'}">
						<b class="green">총 봉사시간 : </b><b>${vt_time}</b>
						</c:if>
					</div>
				</div>
			</div>
			<div class="panel-body2">
				<table class="table table-striped table-bordered table-list">
					<thead>
						<tr>
							<th>모집번호</th>
							<th>봉사명</th>
							<th>모집기간</th>
							<th>봉사기간</th>
							<th>모집인원</th>
							<th>신청인원</th>
							<th>모집여부</th>
						</tr>
					</thead>
					<tbody>
					<c:set var="no" value="${tot}" />
					<c:if test="${not empty list}">
						<c:forEach var="rc" items="${list}">
						<tr>
							<td>${rc.vt_no}</td>
							<td><a href="View.do?vt_no=${rc.vt_no}&pageNum=${paging.nowPage}&vtryn=${vtryn}">${rc.vt_name}</a></td>
							<td>${rc.vt_r_start_date }~${rc.vt_r_end_date }</td>
							<td>${rc.vt_a_start_date }~${rc.vt_a_end_date }</td>
							<td>${rc.vt_tot }</td>
							<td>${rc.count}</td>
							<td>
							<c:if test="${rc.vt_r_yn == 'Y'}">
								<span class="ok_x">모집중</span>
							</c:if> <c:if test="${rc.vt_r_yn == 'N'}">
								<b class="ok_y">모집 완료</b>
							</c:if>
							</td>
						</tr>
						<c:set var="tot" value="${tot-1}"></c:set>
						</c:forEach>
					</c:if>
					<c:if test="${empty list}">
						<tr>
							<td colspan="7">참여한 봉사가 없습니다.</td>
						</tr>
					</c:if>
					</tbody>
				</table>
			</div>
			<div class="panel-footer2 text-center">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							<c:if test="${paging.startPage > paging.pagePerBlock}">
								<li><a href="javascript:locate(1,'${vtryn}')">««</a></li>						
								<li><a href="javascript:locate(${paging.nowPage-1},'${vtryn}')">«</a></li>
							</c:if>
						</ul>
						<ul class="pagination">
							<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
								<c:if test="${i eq paging.nowPage}">
									<li><a href="#"><b class="b2">${i}</b></a></li>
								</c:if>
								<c:if test="${i ne paging.nowPage}">
									<li><a href="javascript:locate(${i},'${vtryn}')">${i}</a></li>
								</c:if>
							</c:forEach>
						</ul>
						<ul class="pagination">
							<c:if test="${paging.totalPage > paging.endPage}">
								<li><a href="javascript:locate(${paging.startPage+paging.pagePerBlock},'${vtryn}')">»</a></li>
								<li><a href="javascript:locate(${paging.totalPage},'${vtryn}')">»»</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>