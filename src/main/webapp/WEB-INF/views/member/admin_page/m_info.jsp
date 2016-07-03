<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp" %>
<%@ include file="../../session/adminChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-lg-9 toppad" style="margin-left: 12px;">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title"><b>${member.m_nick}</b>님의 상세정보</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-3 text-center">
							<em class="glyphicon glyphicon-user fa-lg3 img-circle img-responsive"></em>
							</div>
							<div class="col-md-8-2">
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td width="30%">회원번호</td>
											<td width="70%"><b>${member.m_no}</b></td>
										</tr>
										<tr>
											<td>이메일:</td>
											<td><b>${member.m_email}</b></td>
										</tr>
										<tr>
											<td>이름:</td>
											<td><b>${member.m_name}</b></td>
										</tr>
										<tr>
											<td>닉네임:</td>
											<td><b>${member.m_nick}</b></td>
										</tr>
										<tr>
											<td>생년월일(나이)</td>
											<td><b>${member.m_birth} (만 ${member.age}세)</b></td>
										</tr>
										<tr>
											<td>성별</td>
											<td><b>${member.m_gender}</b></td>
										</tr>
										<tr>
											<td>전화번호</td>
											<td><b>${member.m_tel}</b></td>
										</tr>
										<tr>
											<td>직업</td>
											<td><b>${member.m_job}</b></td>
										</tr>
										<tr>
											<td>가입일</td>
											<td><b><fmt:formatDate value="${member.m_reg_date}" /></b></td>
										</tr>
										<tr>
											<td><b class="orange">경고(봉사)</b></td>
											<td><b>${dr_total}</b></td>
										</tr>
										<tr>
											<td><b class="orange">경고(게시판)</b></td>
											<td><b>${br_total}</b></td>
										</tr>
										<tr>
											<td><b class="blue">보유 캐시</b></td>
											<td><b>${sumC}</b></td>
										</tr>
										<tr>
											<td><b class="blue">보유 포인트</b></td>
											<td><b>${sumP}</b></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="panel-footer text-center">
						<a href="a_memberAll.do?pageNum=${pageNum}" type="button" class="btn btn-sm btn-default">목록<i class="fa fa-list-ul"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
		
</body>
</html>