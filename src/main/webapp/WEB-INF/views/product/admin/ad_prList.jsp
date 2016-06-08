<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	function m() {
		mlist.style.display='block';
		olist.style.display='none';
	}
	
	function o() {
		mlist.style.display='none';
		olist.style.display='block';		
	}
	function locate(pageNum){
		location.href="m_prList.do?pageNum="+pageNum;
	}
</script>
</head>
<body>

	<div class="text-left list-group2">
		<input type="button" id="m" name="m" class="btn btn-default2" onclick="m()" value="일반"> 
		<input type="button" id="o" name="o" class="btn btn-default2" onclick="o()" value="기관">
		
	</div>
		<div class="col-md-12" id="mlist" style="display: block">
			<div class="row">
			
			
				<table class="table table-striped table-hover">
				
					<caption>일반회원요청</caption>
					<tr>
						<th>번호</th>
						<th>구분</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>승인여부</th>
					</tr>
					<c:set var="num" value="${pg.total}" />
					<c:forEach var="product" items="${list}">
					<c:if test="${product.no>0 }">
						<tr>
							<td>${num}</td>
							<td>일반</td>
							<td><a href="ad_prView.do?pr_no=${product.pr_no}">
									${product.pr_proname }</a></td>
							<td>${product.email}</td>
							<td>${product.pr_date}</td>
							<td>${product.pr_approve}</td>

						</tr>
						</c:if>
						<c:set var="num" value="${num-1}" />
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
			</div>
		</div>

		<div class="col-md-12" id="olist" style="display: none">
			<div class="row">
				<table class="table table-striped table-hover">
					<caption>기간회원요청</caption>
					<tr>
						<th>번호</th>
						<th>구분</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>승인여부</th>
					</tr>
					<c:set var="num" value="${pg.total}" />
					<c:forEach var="product" items="${list}">
						<c:if test="${product.no<0 }">
						<tr>
							<td>${num}</td>
							<td>기관</td>
							<td><a href="ad_prView.do?pr_no=${product.pr_no}">
									${product.pr_proname }</a></td>
							<td>${product.email}</td>
							<td>${product.pr_date}</td>
							<td>${product.pr_approve}</td>
						</tr>
						</c:if>
						<c:set var="num" value="${num-1}" />
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
			</div>
		</div>
</body>
</html>