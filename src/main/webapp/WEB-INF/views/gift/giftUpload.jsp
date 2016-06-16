<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp" %>
<%@ include file="../session/adminChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function readURL(input, id) {
	    if (input.files && input.files[0]) {
	       var reader = new FileReader();
	       reader.onload = function(e) {
	          $('#' + id).attr('src', e.target.result);
	       }
	       reader.readAsDataURL(input.files[0]);
	    }
	 }
</script>
</head>
<body>
	
	<c:if test="${not empty msg }">
		<font color="red">
			${msg }
		</font>
	</c:if>
	
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-offset-1-2 toppad">
				<div class="panel panel-default panel-table">
					<form action="giftUpload.do" name="frm" method="post" enctype="multipart/form-data" class="form-horizontal">
						<input type="hidden" name="m_no" value="${no}">
						<input type="hidden" name="nickChk" value="false">
						<c:if test="${not empty fileName }">
							<img src="/donate7/${fileName }">
						</c:if>
						<fieldset>
							<br style="clear: both">
							<h4 style="margin-bottom: 25px; text-align: center;">
								기프티콘 업로드
								<em class="glyphicon glyphicon-floppy-open"></em>
							</h4>
							<div class="form-group">
								<label for="img" class="col-lg-3 control-label"><b>이미지</b></label>
								<div class="col-lg-8">
									<input type="file" name="img" id="file1" onchange="readURL(this,'UploadImg1');">
									<img width="300px" style="margin-top: 10px;" id="UploadImg1">
								</div>
							</div>
							<div class="form-group">
								<label for="g_name" class="col-lg-3 control-label"><b>이름</b></label>
								<div class="col-lg-8">
									<input type="text" class="form-control-95-2" name="g_name" id="g_name" maxlength="50" required>
								</div>
							</div>
							<div class="form-group">
								<label for="g_price" class="col-lg-3 control-label"><b>가격</b></label>
								<div class="col-lg-8">
									<input type="number" class="form-control-95-2" name="g_price" id="g_price" required>
								</div>
							</div>
							<div class="panel-footer text-center">
								<span>
									<button type="submit" class="btn btn-sm btn-default">
										확인<i class="glyphicon glyphicon-ok"></i>
									</button>
								</span>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>