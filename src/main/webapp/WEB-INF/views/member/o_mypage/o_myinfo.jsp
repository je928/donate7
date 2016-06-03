<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp" %>
<%@ include file="../../session/orgChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.fa-lg2 {
	margin-left:25px;
	font-size: 150px;
	color: #808080;
}
</style>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-lg-9 toppad">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title"><b>${organ.o_oname}</b> 기관의 상세정보</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-3 text-center">
							<em class="btn-lg fa-lg2 fa fa-building img-circle img-responsive"></em>
							</div>
							<div class="col-md-8-2">
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td width="30%">이메일:</td>
											<td width="70%"><b>${organ.o_email}</b></td>
										</tr>
										<tr>
											<td>허가번호:</td>
											<td><b>${organ.o_license}</b></td>
										</tr>
										<tr>
											<td>기관명:</td>
											<td><b>${organ.o_oname}</b></td>
										</tr>
										<tr>
											<td>가입자명:</td>
											<td><b>${organ.o_name}</b></td>
										</tr>
										<tr>
											<td>전화번호</td>
											<td><b>${organ.o_tel}</b></td>
										</tr>
										<tr>
											<td>주소</td>
											<td><b>${organ.o_addr}</b></td>
										</tr>
										<tr>
											<td>카테고리</td>
											<td><b>${organ.o_category}</b></td>
										</tr>
										<tr>
											<td>승인유무</td>
											<c:if test="${organ.o_ok_xyn eq 'x'}">
											<td><b class="red">승인 처리중</b></td>
											</c:if>
											<c:if test="${organ.o_ok_xyn eq 'y'}">
											<td><b class="green">승인 완료</b></td>
											</c:if>
											<c:if test="${organ.o_ok_xyn eq 'n'}">
											<td><b class="red">승인 거절</b></td>
											</c:if>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="panel-footer">
						<a href="mail.do" type="button" class="btn btn-sm btn-primary">관리자에게 메일 보내기<i class="glyphicon glyphicon-envelope"></i></a>
						<span class="pull-right">
							<a href="edit.html" type="button" class="btn btn-sm btn-default">수정<i class="glyphicon glyphicon-edit"></i></a>
							<a href="edit.html" type="button" class="btn btn-sm btn-danger">탈퇴<i class="glyphicon glyphicon-remove"></i></a>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
		
</body>
</html>