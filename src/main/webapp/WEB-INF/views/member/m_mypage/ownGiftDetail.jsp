<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../module/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-offset-1-2 toppad">
				<div class="panel panel-default panel-table">
					<form action="" class="form-horizontal">
						<fieldset>
							<br style="clear: both">
							<h3 style="margin-bottom: 25px; text-align: center;">
								<em class="glyphicon glyphicon-gift"></em>
							</h3>
							<div class="form-group">
								<div class="col-lg-12 text-center">
									<img src="/donate7/${gift.g_img}" height="300px">
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-12 text-center">
									<b>일련번호 : </b>${gb.gb_no}4186545335
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-12 text-center">
									<b>기프티콘 이름 : </b>${gift.g_name }
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-12 text-center">
									<c:if test="${gb.gb_chk == 'n'}">
									<b class="chk_n">사용 안함</b>
									</c:if>
									<c:if test="${gb.gb_chk == 'y'}">
									<b class="chk_y">사용 완료</b>
									</c:if>
								</div>
							</div>
							<div class="panel-footer text-center">
								<span>
									<input type="button" class="btn btn-sm btn-default" value="보유 기프티콘" onclick="location.href='ownGift.do?pageNum=${pageNum}'">
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