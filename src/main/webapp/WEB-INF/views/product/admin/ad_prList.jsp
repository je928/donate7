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
	
</script>
</head>
<body>

	<div class="text-left list-group2">
		<input type="button" id="m" name="m" class="btn btn-default2"
			onclick="m()" value="일반"> <input type="button" id="o"
			name="o" class="btn btn-default2" onclick="o()" value="기관">
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
					<c:set var="cnt" value="${count}" />
					<c:forEach var="product" items="${list}">
					<c:if test="${product.no>0 }">
						<tr>
							<td>${cnt}</td>
							<td>일반</td>
							<td><a href="ad_prView.do?pr_no=${product.pr_no}">
									${product.pr_proname }</a></td>
							<td>${product.email}</td>
							<td>${product.pr_date}</td>
							<td>${product.pr_approve}</td>

						</tr>
						</c:if>
						<c:set var="cnt" value="${cnt-1}" />
					</c:forEach>
				</table>

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
					<c:set var="cnt" value="${count}" />
					<c:forEach var="product" items="${list}">
						<c:if test="${product.no<0 }">
						<tr>
							<td>${cnt}</td>
							<td>기관</td>
							<td><a href="ad_prView.do?pr_no=${product.pr_no}">
									${product.pr_proname }</a></td>
							<td>${product.email}</td>
							<td>${product.pr_date}</td>
							<td>${product.pr_approve}</td>
						</tr>
						</c:if>
						<c:set var="cnt" value="${cnt-1}" />
					</c:forEach>
				</table>
			</div>
		</div>
</body>
</html>