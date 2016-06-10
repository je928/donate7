<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../module/header.jsp"%>
<%@include file="script.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function locate(pageNum){
	location.href="ad_memAlist.do?pageNum="+pageNum;
}
</script>

</head>
<body>

<div class="btn-group">
		<div class="btn-group">
			<a href="javascript:al()" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown"> 전체 <span class="caret"></span>
			</a>
			<ul class="dropdown-menu">
				<li><a href="javascript:as()">승인처리중</a></li>
				<li><a href="javascript:aa()">승인완료</a></li>
			</ul>
		</div>
	</div>
<div class="btn-group">
		<div class="btn-group">
			<a href="#" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown"> 일반 <span class="caret"></span>
			</a>
			<ul class="dropdown-menu">
				<li><a href="javascript:ms()">승인처리중</a></li>
				<li><a href="javascript:ma()">승인완료</a></li>
			</ul>
		</div>
	</div>
<div class="btn-group">
		<div class="btn-group">
			<a href="#" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown"> 기관 <span class="caret"></span>
			</a>
			<ul class="dropdown-menu">
				<li><a href="javascript:os()">승인처리중</a></li>
				<li><a href="javascript:oa()">승인완료</a></li>
			</ul>
		</div>
	</div>
<div class="col-md-12" id="malist" style="display: block"> 
	<div class="row" align="center">
		<table class="table table-striped table-hover">
					<caption>일반회원 승인</caption>
					<tr>
						<th>번호</th>
						<th>구분</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>승인여부</th>
					</tr>
					<c:set var="num" value="${pg.total }" />
					<c:forEach var="product" items="${mAlist }">
						
						<tr>
							<td>${num}</td>
							<c:if test="${product.pr_mno>0 }">
							<td>일반</td>	</c:if>
							<c:if test="${product.pr_mno<0 }">
							<td>기관</td></c:if>
							<td><a href="ad_prView.do?pr_no=${product.pr_no}">
									${product.pr_proname }</a></td>
							<td>${product.email}</td>
							<td>${product.pr_date}</td>
							<td>${product.pr_approve}</td>
						</tr>
						
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