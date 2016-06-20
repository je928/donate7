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
	<div style="margin-left: 30%" id="pg">
		<c:if test="${pg.startPage != 1}">
			<a href="javascript:list(1,${pr_item})">&lt;&lt;맨 앞으로</a>
		</c:if>
		<c:if test="${pg.startPage > pg.pagePerBlock}">
			<a href="javascript:list(${startPage-pagePerBlock},${pr_item})">&lt;이전</a>
		</c:if>
		<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
			<c:if test="${i != pg.nowPage},${pr_item}">
				<a href="javascript:list(${pr_item},${i})">[${i}]</a>
			</c:if>
			<c:if test="${i == pg.nowPage}">
				<b class="b">[${i}]</b>
			</c:if>
		</c:forEach>
		<c:if test="${pg.totalPage > pg.endPage}">
			<a href="javascript:list(${pg.startPage+pg.pagePerBlock},${pr_item})">다음&gt;</a>
		</c:if>
		<c:if test="${pg.endPage != pg.totalPage}">
			<a href="javascript:list(${pg.totalPage},${pr_item})">맨 뒤로&gt;&gt;</a>
		</c:if>
	</div>
	
</body>
</html>