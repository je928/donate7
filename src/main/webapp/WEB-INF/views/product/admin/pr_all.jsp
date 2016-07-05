<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../module/header.jsp"%>
<%@ include file="../../session/adminChk.jsp"%>
<%-- <%@include file="script.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function locate(pageNum, yn) {
		location.href = "pr_all.do?pageNum=" + pageNum + "&yn=" + yn;
	}
</script>
</head>
<body>
	<div class="col-md-12">
		<div class="text-left list-group2">
			<div class="btn-group">
				<a href="#" class="btn btn-default dropdown-toggle"
					data-toggle="dropdown"> 전체 <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="pr_all.do?pageNum=1&yn=n">승인대기</a></li>
					<li><a href="pr_all.do?pageNum=1&yn=y">승인완료</a></li>
				</ul>
			</div>
			<div class="btn-group">
				<div class="btn-group">
					<a href="#" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown"> 일반 <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="pr_memAll.do?pageNum=1&mymn=mn">승인대기</a></li>
						<li><a href="pr_memAll.do?pageNum=1&mymn=my">승인완료</a></li>
					</ul>
				</div>
			</div>
			<div class="btn-group">
				<div class="btn-group">
					<a href="#" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown"> 기관 <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="pr_orAll.do?pageNum=1&mymn=mn">승인대기</a></li>
						<li><a href="pr_orAll.do?pageNum=1&mymn=mn">승인완료</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<b class="panel-title">전체회원 요청내역</b>
					</div>
				</div>
			</div>
			<div class="panel-body2">
				<table class="table table-striped table-bordered table-list">


					<tr>
						<th>번호</th>
						<th>구분</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>승인여부</th>
					</tr>
					<c:set var="num" value="${pg.total }" />
					<c:forEach var="product" items="${plist }">

						<tr>
							<td>${num}</td>
							<c:if test="${product.pr_mno>0 }">
								<td>일반</td>
							</c:if>
							<c:if test="${product.pr_mno<0 }">
								<td>기관</td>
							</c:if>
							<td><a
								href="ad_prView.do?pr_no=${product.pr_no} &pageNum=${pageNum}&yn=${yn}">
									${product.pr_proname }</a></td>
							<td>${product.email}</td>
							<td>${product.pr_date}</td>
							<%-- "${org.o_ok_xyn eq 'x'}" --%>
							<td><c:if test="${product.pr_approve eq 'y'}">
									<span class="ok_y">승인완료</span>
								</c:if> <c:if test="${product.pr_approve eq 'n'}">
									<span class="ok_x">승인대기</span>
								</c:if></td>
						</tr>

						<c:set var="num" value="${num-1}" />
					</c:forEach>
				</table>
			</div>
			<div class="panel-footer2 text-center">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							<c:if test="${pg.startPage > pg.pagePerBlock}">
								<li><a href="javascript:locate(1,'${yn}')">««</a></li>
								<li><a href="javascript:locate(${pg.nowPage-1},'${yn}')">«</a></li>
							</c:if>
						</ul>
						<ul class="pagination">
							<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
								<c:if test="${i eq pg.nowPage}">
									<li><a href="#"><b class="b2">${i}</b></a></li>
								</c:if>
								<c:if test="${i ne pg.nowPage}">
									<li><a href="javascript:locate(${i},'${yn}')">${i}</a></li>
								</c:if>
							</c:forEach>
						</ul>
						<ul class="pagination">
							<c:if test="${pg.totalPage > pg.endPage}">
								<li><a
									href="javascript:locate(${pg.startPage+pg.pagePerBlock},'${yn}')">»</a></li>
								<li><a href="javascript:locate(${pg.totalPage},'${yn}')">»»</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>