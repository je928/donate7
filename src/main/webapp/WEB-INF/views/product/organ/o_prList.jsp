<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="o_prList.do">
		<table class="table table-striped table-hover">
		<caption>제품 판매 요청</caption>
				<tr>
					<th>글번호</th>
					<th>제품명</th>
					<th>수량</th>
					<th>제품가격</th>
					<th>작성일</th>
					<th>승인여부</th>
				</tr>
				<c:set var="num" value="${pg.total}"/>
					<c:forEach var="pr" items="${list}">
						<tr>
							<td>${num}</td>
							<td><a href="o_prView.do?pr_no=${pr.pr_no}&pageNum=${pageNum}">
								${pr.pr_proname }</a></td>
							<td>${pr.pr_qty}</td>
							<td>${pr.pr_price}</td>
							<td>${pr.pr_date}</td>
							<td><c:if test="${pr.pr_approve eq 'y'}">
									<span class="ok_y">승인완료</span>
								</c:if> 
								<c:if test="${pr.pr_approve eq 'n'}">
									<span class="ok_x">승인대기</span>
								</c:if>
							</td>
						
						</tr>
					<c:set var="num" value="${num-1}"/>
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
			<button onclick="location.href='o_prWrite.do'">요청하기</button>
		</div>
	
</body>
</html>