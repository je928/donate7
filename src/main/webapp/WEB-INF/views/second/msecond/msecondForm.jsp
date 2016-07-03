<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../module/header.jsp"%>
<%@ include file="../../session/sessionChk.jsp" %>
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
						<b class="panel-title">중고품 기부 요청</b>
					</div>
				</div>
			</div>
			<form action="msecond.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="sh_mno" value="${no }">
				<div class="panel-body2">
					<table class="table table-striped table-bordered table-list">
						<tbody>
							<tr>
								<th>제목</th>
								<td><input type="text" name="sh_title" required="required"autofocus="autofocus"></td>
							</tr>
							<tr>
								<th>이미지</th>
								<td><input type="file" name="image"></td>
							</tr>
							<tr>
								<th>상품종류</th>
								<td><input type="text" name="sh_category" required="required"></td>
							</tr>
							<tr>
								<th>설명</th>
								<td><textarea rows="10" cols="100" name="sh_explanation" required></textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="panel-footer text-center">
					<button type="submit" class="btn btn-sm btn-default">요청하기
						<i class="glyphicon glyphicon-envelope"></i></button>&nbsp;
					<button onclick="location.href='msecondList.do'" class="btn btn-sm btn-default">요청내역 보기
						<i class="glyphicon glyphicon-list-alt"></i></button>
				</div>
			</form>
		</div>
	</div>
	
</body>
</html>