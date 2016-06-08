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
		<caption>기부 요청 내역</caption>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
			<th>승인여부</th>
		</tr>

		<c:set var = "num" value="${pg.total }"/>

 	<c:if test="${not empty list }">
	<c:forEach var="donate" items="${list }">
		<tr><td>${num }</td>
			<td><a href="odoReqV.do?d_no=${donate.d_no }">${donate.d_title }</a></td>
			<td>${donate.d_reg_date }</td>
			<td>${donate.d_approve }</td></tr>
		<c:set var="num" value="${num-1}"/>
	</c:forEach></c:if>
	<c:if test="${empty list }"> 
		<tr>
			<td colspan="4">요청하신 글이 없습니다</td>
		</tr>
 	</c:if>	 
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
	<br>
	<div align="center">
		<button class="btn btn-sm btn-primary" onclick="location.href='odoReq.do'">요청글쓰기
			<i class="glyphicon glyphicon-envelope"></i></button>
	</div>

</body>
</html>