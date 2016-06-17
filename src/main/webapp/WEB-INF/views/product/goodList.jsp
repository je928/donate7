<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
@media ( min-width : 1200px) {
.col-lg-3-1{float: left;}
.col-lg-3-1 {
		width: 20%;
	}
}
</style>
<!-- <script type="text/javascript">
function locate(pageNum){
	location.href="goodList.do?pageNum="+pageNum;
}
</script> -->
</head>
<body>
	<div class="row pt-md">
	<c:forEach var="product" items="${list}">
		<div class="col-lg-3-1 col-md-2 col-sm-2 col-xs-12 profile">

			<a href="go_view.do?pr_no=${product.pr_no}"> <img
				src="image/${product.pr_img}" class="img-responsive" class="img-box">
			</a>

			<h1>
				<a href="go_view.do?pr_no=${product.pr_no}">
					${product.pr_proname}</a>
			</h1>
			<h2>${product.pr_price}원</h2>
		</div>
	</c:forEach>
	</div>
	<div class="panel-footer2 text-center" id="pg">
		<div class="row">
			<div class="col">
				<ul class="pagination">
					<c:if test="${pg.startPage != 1}">
						<li><a href="javascript:list(1,${pr_item})">&lt;&lt;««</a></li>
					</c:if>
					<c:if test="${pg.startPage > pg.pagePerBlock}">
						<li><a href="javascript:list(${startPage-pagePerBlock},${pr_item})">&lt;«</a></li>
					</c:if>
		
				</ul>
				<ul class="pagination">
					<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
						<c:if test="${i != pg.nowPage},${pr_item}">
							<li><a href="javascript:list(${pr_item},${i})">${i}</a></li>
						</c:if>
						<c:if test="${i == pg.nowPage}">
							<li><a href="#"><b class="b">${i}</b></a></li>
						</c:if>
					</c:forEach>
				</ul>
				<ul class="pagination">
					<c:if test="${pg.totalPage > pg.endPage}">
						<li><a href="javascript:list(${pg.startPage+pg.pagePerBlock},${pr_item})">»&gt;</a></li>
					</c:if>
					<c:if test="${pg.endPage != pg.totalPage}">
						<li><a href="javascript:list(${pg.totalPage},${pr_item})">»»&gt;&gt;</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	
	
	<%-- <div class="panel-footer2 text-center">
					<div class="row">
						<div class="col">
							<ul class="pagination">
								<c:if test="${pg.startPage != 1}">
									<li><a href="javascript:locate(1,${pr_item})">««</a></li>
								</c:if>
								<c:if test="${pg.startPage > pg.pagePerBlock}">						
									<li><a href="javascript:locate(${pg.nowPage-1},${pr_item})">«</a></li>
								</c:if>
							</ul>
							<ul class="pagination">
								<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
									<c:if test="${i eq pg.nowPage}, ${pr_item}">
										<li><a href="#"><b class="b2">${i}</b></a></li>
									</c:if>
									<c:if test="${i ne pg.nowPage}">
										<li><a href="javascript:locate(${i},${pr_item})">${i}</a></li>
									</c:if>
								</c:forEach>
							</ul>
							<ul class="pagination">
								<c:if test="${pg.totalPage > pg.endPage}">
								<li><a href="javascript:locate(${pg.startPage+pg.pagePerBlock},${pr_item})">»</a></li>
								<li><a href="javascript:locate(${pg.totalPage},${pr_item})">»»</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div> --%>

	
</body>
</html>