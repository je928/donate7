<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="ckfinder/ckfinder.js"></script>
<script type="text/javascript">
	window.onload = function() {
		CKEDITOR.replace('pr_content');
		CKEDITOR.config.height = '500px';
	
	}

	function checkEditorValue() {
		var txt = CKEDITOR.instances.pr_content;
		if (txt.getData() == "") {
			alert('내용을 입력해 주세요.');
			txt.focus();
			return false;
		}
		return true;
	}
	
</script>
</head>
<body>
	
	<div class="col-md-12">
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<b class="panel-title">완제품 판매 요청</b>
					</div>
				</div>
			</div>
			<form action="m_prWrite.do" method="post" enctype="multipart/form-data">
				<div class="panel-body2">
					<table class="table table-striped table-bordered table-list">
						<tbody>
							<tr>
								<th>제목</th>
								<td><input type="text" name="pr_proname" required="required" autofocus="autofocus" ></td>
							</tr>
							<tr>
								<th>가격</th>
								<td><input type="number" name="pr_price" required="required"></td>
							</tr>
							<tr>
								<th>수량</th>
								<td><input type="number" name="pr_qty" required="required" ></td>
							</tr>
							<tr>
								<th>종류</th>
								<td><input type="radio" name="pr_item" required="required" value="f">Fashion &nbsp;
									<input type="radio" name="pr_item" required="required" value="d">Design	&nbsp;
									<input type="radio" name="pr_item" required="required" value="p" >Phone Case &nbsp;
								</td>
							</tr>
							<tr>
								<th>기부처</th>
								<td><input type="text" name="pr_donation" required="required" ></td>
							</tr>
							<tr>
								<th>사진</th>
								<td><input type="file" name="mimg" required="required" ></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea rows="10" cols="100" name="pr_content" id="pr_content" required="required" ></textarea></td>
							</tr>
							<tr>
								<th>요청메세지</th>
								<td><textarea rows="5" cols="100" name="pr_callm" required="required"></textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="panel-footer text-center">
					<button type="submit" class="btn btn-sm btn-default">요청하기
						<i class="glyphicon glyphicon-envelope"></i></button>&nbsp;
					<button onclick="location.href='m_prList.do'" class="btn btn-sm btn-default">요청내역 보기
						<i class="glyphicon glyphicon-list-alt"></i></button>
				</div>
			</form>
		</div>
	</div>
	
</body>
</html>