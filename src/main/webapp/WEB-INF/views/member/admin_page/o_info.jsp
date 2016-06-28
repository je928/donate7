<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp" %>
<%@ include file="../../session/adminChk.jsp" %>
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
			<div class="col-lg-9 toppad" style="margin-left: 12px;">
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
											<td width="30%">회원번호</td>
											<td width="70%"><b>${organ.o_no}</b></td>
										</tr>
										<tr>
											<td>이메일:</td>
											<td><b>${organ.o_email}</b></td>
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
											<td><span class="ok_x">승인 처리중</span></td>
											</c:if>
											<c:if test="${organ.o_ok_xyn eq 'y'}">
											<td><span class="ok_y">승인 완료</span></td>
											</c:if>
											<c:if test="${organ.o_ok_xyn eq 'n'}">
											<td><span class="ok_n">승인 거절</span></td>
											</c:if>
										</tr>
										<c:if test="${organ.o_ok_xyn eq 'x'}">
										<tr>
											<td> </td>
											<td>
											<a href="ok_y_update.do?pageNum=${pageNum}&o_no=${organ.o_no}" type="button" class="btn btn-sm btn-success">승인<i class="glyphicon glyphicon-star"></i></a>
											<a href="ok_n_update.do?pageNum=${pageNum}&o_no=${organ.o_no}" type="button" class="btn btn-sm btn-danger">거절<i class="glyphicon glyphicon-remove"></i></a>
											</td>
										</tr>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="panel-footer text-center">
						<a href="a_organAll.do?pageNum=${pageNum}" type="button" class="btn btn-sm btn-default">목록<i class="fa fa-list-ul"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
		
</body>
</html>