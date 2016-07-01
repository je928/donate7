<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function locate(pageNum){
	location.href="osecondList.do?pageNum="+pageNum;
}
</script>
</head>
<body>

	<div align="center">
		<form action="osecondList.do">
			<table class="table table-striped table-hover">
				<caption>중고기부 내역</caption>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>상품종류</th>
					<th>등록일</th>
					<th>승인여부</th>
					<th>도착여부</th>
				</tr>
					<c:set var="num" value="${pg.total }"/>
				<c:forEach var="second" items="${list }">
					<tr>
						<td>${num }</td>
						<td><a href="osecondView.do?sh_no=${second.sh_no }">${second.sh_title }</a></th>
						<td>${second.sh_category }</td>
						<td>${second.sh_reg_date }</td>
						
						<td><c:if test="${second.sh_approve eq 'y'}">
								<span class="label label-success">승인완료</span>
							</c:if> 
							<c:if test="${second.sh_approve eq 'n'}">
								<span class="label label-warning">승인대기</span>
							</c:if>
						</td>
						<td><c:if test="${second.sh_arrive eq 'y'}">
									<span class="label label-success">도착확인</span>
								</c:if> 
								<c:if test="${second.sh_arrive eq 'n'}">
									<span class="label label-warning">도착미확인</span>
								</c:if>
							</td>
					</tr>
					<c:set var="num" value="${num-1 }"/>
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
			<button onclick="location.href='osecondForm.do'">요청하기</button>
		</div>
	</div>

</body>
</html>