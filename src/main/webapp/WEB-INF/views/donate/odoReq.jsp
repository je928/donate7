<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="ckfinder/ckfinder.js"></script>
<script type="text/javascript">
	window.onload = function() {
		CKEDITOR.replace('d_content');
		CKEDITOR.config.height = '500px';
	
	}

	function checkEditorValue() {
		var txt = CKEDITOR.instances.d_content;
		if (txt.getData() == "") {
			alert('내용을 입력해 주세요.');
			txt.focus();
			return false;
		}
		return true;
	}
	
</script>
<style type="text/css">
.form-control-b {
	width: 15%;
	height: 34px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s
}
.form-control-ac {
	width: 30%;
	margin-left: 5px;
	height: 34px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s
}
</style>
</head>
<body>
	<form action="odoReq.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="d_member" value="${sessionScope.no }">
		<table class="table table-striped table-hover">		
			<tr>
				<th>제목</th>
				<td><input type="text" name="d_title" id="d_title" class="form-control-95"
					required="required"></td>
			</tr>
			<tr>
				<th>메인 사진</th>
				<c:if test="${not empty msg }">
					<font color="red"> ${msg } </font>
				</c:if>
				<c:if test="${not empty fileName }">
					<img src="image/${fileName }">
				</c:if>
				<td><input type="file" name="img" required="required"></td>
			</tr>
			<tr>
				<th>사진첨부 및 내용</th>
				<td><textarea rows="6" cols="100" name="d_content"
					required="required"></textarea></td>
			</tr>
			<tr>
				<th>기부 기간</th>
				<td><input type="date" name="d_start_date"  id="d_start_date">
					 ~ <input type="date" name="d_end_date" id="d_end_date"></td>
			</tr>
			<tr>
				<th>기부금 사용계획</th>
				<td><textarea rows="10" cols="90" name="d_plan"
					required="required"></textarea></td>
			</tr>
			<tr>
				<th>희망금액</th>
				<td><input type="number" name="d_amount" required="required">원</td>
			</tr>
			<tr>
			<th>계좌번호</th>
			<td><input type="text" name="d_bank" id="d_bank" placeholder="은행" class="form-control-b"
				required="required"> <input type="text" name="d_account" class="form-control-ac"
				id="d_account" placeholder="계좌번호" required="required"></td>
			</tr>
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
				<button type="submit" class="btn btn-primary btn-md">요청하기
					<i class=" glyphicon glyphicon-ok"></i></button>
			</div>
	</form>
</body>
</html>