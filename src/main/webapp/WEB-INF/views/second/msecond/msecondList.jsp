<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp"%>
<%-- <%@ include file="/css/bootstrap.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function locate(pageNum){
	location.href="msecondList.do?pageNum="+pageNum;
}
</script>
</head>
<body>

	<div align="center">
		<form action="msecondList.do">
			<table class="table table-striped table-hover">
				<caption>중고기부 내역</caption>
				<tr>
					<th width="60">번호</th>
					<th width="60">제목</th>
					<th width="60">상품종류</th>
					<th width="60">등록일</th>
					<th width="60">승인여부</th>
					<th width="60">도착여부</th>
				</tr>
				<c:set var ="num" value="${pg.total}"/>
				<c:forEach var="second" items="${list }">
					<tr>
						<th>${num }</th>
						<th><a href="msecondView.do?sh_no=${second.sh_no }">${second.sh_title }</a></th>
						<th>${second.sh_category }</th>
						<th>${second.sh_reg_date }</th>
						<th>${second.sh_approve }</th>
						<th>${second.sh_arrive }</th>
					</tr>
					<c:set var ="num" value="${num-1}"/>
				</c:forEach>
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
								<li><a href="javascript:locate(${pg.startPage+pg.pagePerBlock})">»</a></li>
								<li><a href="javascript:locate(${pg.totalPage})">»»</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
		</form>
		<div align="center">
			<button onclick="location.href='msecondForm.do'">요청하기</button>
		</div>
	</div>

</body>
</html>