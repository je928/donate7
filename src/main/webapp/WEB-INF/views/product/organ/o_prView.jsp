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
	<div class="col-md-12">
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<b class="panel-title">제품판매요청</b>
					</div>
				</div>
			</div>
			<input type="hidden" name="pr_mno" value="${sessionScope.no}">
			<table class="table table-striped table-bordered table-list">
				<tr>
					<th>제목</th>
					<td>${product.pr_proname}</td>
				</tr>
				<tr>
					<th>가격</th>
					<td>${product.pr_price}</td>
				</tr>
				<tr>
					<th>수량</th>
					<td>${product.pr_qty}</td>
				</tr>
				<tr>
					<th>종류</th>
					<td><c:if test="${product.pr_item eq 'f'}">Fashion</c:if> <c:if
							test="${product.pr_item eq 'd'}">Design</c:if> <c:if
							test="${product.pr_item eq 'p'}">Phone Case</c:if></td>
				</tr>
				<tr>
					<th>기부처</th>
					<td>${product.pr_donation}</td>
				</tr>
				<tr>
					<th>사진</th>
					<td align="center"><img src="image/${product.pr_img}"
						width="300px"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${product.pr_content}</td>
				</tr>
				<tr>
					<th>요청메세지</th>
					<td>${product.pr_callm}</td>
				</tr>

			</table>
			<div class="panel-footer text-center">
				<c:if test="${product.pr_approve eq 'n'}">
					<button class="btn btn-sm btn-primary" style="margin-left: 180px"
						onclick="location.href='o_prUpdate.do?pr_no=${product.pr_no}'">
						수정 <i class="fa fa-pencil"></i>
					</button>
					<button class="btn btn-sm btn-primary"
						onclick="location.href='o_prDelete.do?pr_no=${product.pr_no}'">
						삭제 <i class="glyphicon glyphicon-remove"></i>
					</button>
				</c:if>

				<button class="btn btn-sm btn-primary"
					onclick="location.href='m_prList.do'">
					목록 <i class="glyphicon glyphicon-menu-hamburger"></i>
				</button>
			</div>
		</div>
	</div>

</body>
</html>