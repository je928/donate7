<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp"%>
<%@ include file="../../session/memChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="">
		<font color="red"> ${msg} </font>
	</c:if>

	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-offset-1-2 toppad">
				<div class="panel panel-default panel-table">
					<form class="form-horizontal">
						<fieldset>
							<br style="clear: both">
							<h3 style="margin-bottom: 25px; text-align: center;">
								<em class="fa fa-pencil"></em>
							</h3>
							<div class="form-group">
								<label for="m_email" class="col-lg-3 control-label"><b>이메일</b></label>
								<div class="col-lg-8">
									<label for="m_email" class="control-label">je928@daum.net</label>
								</div>
							</div>
							<div class="form-group">
								<label for="m_passwd" class="col-lg-3 control-label"><b>비밀번호</b></label>
								<div class="col-lg-8">
									<input type="text" class="form-control-95-2" id="m_passwd"
										required>
								</div>
							</div>
							<div class="form-group">
								<label for="m_passwd2" class="col-lg-3 control-label"><b>재확인</b></label>
								<div class="col-lg-8">
									<input type="password" class="form-control-95-2" id="m_passwd2"
										required>
								</div>
							</div>
							<div class="form-group">
								<label for="m_name" class="col-lg-3 control-label"><b>이름</b></label>
								<div class="col-lg-8">
									<input type="text" class="form-control-95-2" id="m_name"
										required>
								</div>
							</div>
							<div class="form-group">
								<label for="m_nick" class="col-lg-3 control-label"><b>닉네임</b></label>
								<div class="col-lg-8">
									<input type="text" class="form-control-95-2" id="m_nick"
										required>
								</div>
							</div>
							<div class="form-group">
								<label for="m_birth" class="col-lg-3 control-label"><b>생년월일</b></label>
								<div class="col-lg-8">
									<input type="date" class="form-control-50" id="m_birth"
										name="m_birth" required>
								</div>
							</div>
							<div class="form-group">
								<label for="m_gender" class="col-lg-3 control-label"><b>성별</b></label>
								<div class="col-lg-8">
									<div class="radio">
										<label> <input type="radio" name="m_gender"
											id="m_gender" value="남자" required>남자
										</label> &nbsp;&nbsp; <label> <input type="radio"
											name="m_gender" id="m_gender" value="여자" required>여자
										</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="m_tel" class="col-lg-3 control-label"><b>전화번호</b></label>
								<div class="col-lg-8">
									<input type="text" class="form-control-20" name="m_tel1"
										id="m_tel1" maxlength="3" required> - <input
										type="text" class="form-control-20" name="m_tel2" id="m_tel2"
										maxlength="4" required> - <input type="text"
										class="form-control-20" name="m_tel3" id="m_tel3"
										maxlength="4" required>
								</div>
							</div>
							<div class="form-group">
								<label for="m_job" class="col-lg-3 control-label"><b>직업</b></label>
								<div class="col-lg-8">
									<select class="form-control-30" name="m_job">
										<option value="학생">학생</option>
										<option value="회사원">회사원</option>
										<option value="자영업">자영업</option>
										<option value="무직">무직</option>
										<option value="기타">기타</option>
									</select>
								</div>
							</div>
							<div class="panel-footer text-center">
								<span>
									<button type="submit" class="btn btn-sm btn-default">
										수정<i class="glyphicon glyphicon-ok"></i>
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