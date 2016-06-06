<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp"%>
<%@ include file="../../session/memChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#m_passwd').keyup(function() {
			var str_space = /\s/;
			if($("#m_passwd").val().length < 6) {
				$('#pwd_chk').html("<font class='red'>6~20자만 사용가능합니다.</font>");
			} else if(str_space.test($("#m_passwd").val())) {
				$('#pwd_chk').html("<font class='red'>공백은 불가능합니다.</font>");
			} else {
				$('#pwd_chk').html("<font class='green'>사용 가능합니다.</font>");
			}
		});
	});
	
	$(function() {
		$('#m_passwd2').keyup(function() {
			if(frm.m_passwd.value != frm.m_passwd2.value) {
				$('#pwd_chk2').html("<font class='red'>비밀번호를 확인해주세요.</font>");
			} else {
				$('#pwd_chk2').html("<font></font>");
			}
		});
	});
	
	$(function() {
		$('#m_name').keyup(function() {
			var regex = /^[가-힣A-Za-z]{2,40}$/;
			var str_space = /\s/;
			if($("#m_name").val().length < 2) {
				$('#name_chk').html("<font class='red'>2자 이상 사용가능합니다.</font>");
			} else if(str_space.test($("#m_name").val())) {
				$('#name_chk').html("<font class='red'>공백 없이 입력해 주세요.</font>");
			} else if(regex.test(frm.m_name.value) === false) {
				$('#name_chk').html("<font class='red'>한글, 영문 대소문자를 이용해 주세요.</font>");
			} else {
				$('#name_chk').html("<font class='green'>사용 가능합니다.</font>");
			}
		});
	});
	
	$(function() {
		$('#m_nick').keyup(function() {
			var regex = /^[가-힣A-Za-z0-9]{2,10}$/;
			if($("#m_nick").val().length < 2) {
				$('#nick_chk').html("<font class='red'>2~10자만 사용가능합니다.</font>");
			} else if (regex.test(frm.m_nick.value) === false) {
				$('#nick_chk').html("<font class='red'>한글, 영문 대소문자, 숫자를 이용해 주세요.</font>");
			}else {
				var sendData = 'm_nick='+$('#m_nick').val()+'&no='+${no};
				$.post('m_nickChk.do',sendData,function(msg){
	 	 			if(msg == "이미 사용 중인 닉네임입니다.") {
	 	 				$('#nick_chk').html("<font class='red'>"+msg+"</font>");
	 	 				frm.nickChk.value = "false";
	 	 			}else {
	 	 				$('#nick_chk').html("<font class='green'>"+msg+"</font>");			
	 	 				frm.nickChk.value = "true";
	 	 			}
 				});
				return false;
			}
 		});
	});
	
	$(function() {
		$('#m_tel3').blur(function() {
			var tel1 = /^\d{2,3}$/;
			var tel2 = /^\d{3,4}$/;
			var tel3 = /^\d{4}$/;
			if (tel1.test(frm.m_tel1.value) === false || tel2.test(frm.m_tel2.value) === false || tel3.test(frm.m_tel3.value) === false) {
				$('#tel_chk').html("<font class=red>전화번호를 다시 확인해주세요.</font>");
			}else {
				$('#tel_chk').html("<font></font>");
			}
		});
	});
	
	function chk() {
		if(frm.m_passwd.value != frm.m_passwd2.value) {
			$('#pwd_chk').html("<font class='red'>비밀번호를 다시 확인해주세요.</font>");
			$('#pwd_chk2').html("<font></font>");
			frm.m_passwd.value = "";
			frm.m_passwd2.value= "";
			frm.m_passwd.focus();
			return false;
		}
		
		if(frm.m_passwd.value.length < 6) {
			$('#pwd_chk').html("<font class='red'>6~20자만 사용가능합니다.</font>");
			$('#pwd_chk2').html("<font></font>");
			frm.m_passwd.value="";
			frm.m_passwd2.value = "";
			frm.m_passwd.focus();
			return false;
		}
		
		if(frm.m_passwd.value.indexOf(" ")>=0) {
			$('#pwd_chk').html("<font class='red'>공백 없이 입력해 주세요.</font>");
			$('#pwd_chk2').html("<font></font>");
			frm.m_passwd.value = "";
			frm.m_passwd2.value = "";
			frm.m_passwd.focus();
			return false;
		}
		
		if(frm.m_name.value.length < 2) {
			$('#name_chk').html("<font class='red'>2자 이상 사용가능합니다.</font>");
			frm.m_name.value = "";
			frm.m_name.focus();
			return false;
		}
		
		if(frm.m_name.value.indexOf(" ")>=0) {
			$('#name_chk').html("<font class='red'>공백 없이 입력해 주세요.</font>");
			frm.m_name.value = "";
			frm.m_name.focus();
			return false;
		}
		
		var name = /^[가-힣A-Za-z]{2,40}$/;
		if(name.test(frm.m_name.value) === false) {
			$('#name_chk').html("<font class='red'>한글, 영문 대소문자를 이용해 주세요.</font>");
			frm.m_name.value = "";
			frm.m_name.focus();
			return false;
		}

		if(frm.nickChk.value == "false") {
			$('#nick_chk').html("<font class='red'>닉네임을 다시 확인해주세요.</font>");
			frm.m_nick.focus();
			return false;
		}
		
		if(frm.m_nick.value.length < 2) {
			$('#nick_chk').html("<font class='red'>2~10자만 사용가능합니다.</font>");
			frm.m_nick.value = "";
			frm.m_nick.focus();
			return false;
		}
		
		if(frm.m_nick.value.indexOf(" ")>=0) {
			$('#nick_chk').html("<font class='red'>공백 없이 입력해 주세요.</font>");
			frm.m_nick.value = "";
			frm.m_nick.focus();
			return false;
		}
		
		var nick = /^[가-힣A-Za-z0-9]{2,10}$/;
		if(nick.test(frm.m_nick.value) === false) {
			$('#nick_chk').html("<font class='red'>한글, 영문 대소문자, 숫자를 이용해 주세요.</font>");
			frm.m_nick.value = "";
			frm.m_nick.focus();
			return false;
		}
				
		var tel1 = /^\d{2,3}$/;
		var tel2 = /^\d{3,4}$/;
		var tel3 = /^\d{4}$/;
		if (tel1.test(frm.m_tel1.value) === false || tel2.test(frm.m_tel2.value) === false || tel3.test(frm.m_tel3.value) === false) {
			$('#tel_chk').html("<font class=red>전화번호를 다시 확인해주세요.</font>");
			frm.m_tel1.value = "";
			frm.m_tel2.value = "";
			frm.m_tel3.value = "";
			frm.m_tel1.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>

	<c:if test="">
		<font color="red"> ${msg} </font>
	</c:if>

	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-offset-1-2 toppad">
				<div class="panel panel-default panel-table">
					<form action="m_update.do" name="frm" onsubmit="return chk()" class="form-horizontal">
						<input type="hidden" name="m_no" value="${no}">
						<input type="hidden" name="nickChk" value="false">
						<fieldset>
							<br style="clear: both">
							<h3 style="margin-bottom: 25px; text-align: center;">
								<em class="fa fa-pencil"></em>
							</h3>
							<div class="form-group">
								<label for="m_email" class="col-lg-3 control-label"><b>이메일</b></label>
								<div class="col-lg-8">
									<label for="m_email" class="control-label">${member.m_email}</label>
								</div>
							</div>
							<div class="form-group">
								<label for="m_passwd" class="col-lg-3 control-label"><b>비밀번호</b></label>
								<div class="col-lg-8">
									<input type="password" class="form-control-95-2" name="m_passwd" id="m_passwd" value="${member.m_passwd}" required>
									<span id="pwd_chk"> </span>
								</div>
							</div>
							<div class="form-group">
								<label for="m_passwd2" class="col-lg-3 control-label"><b>재확인</b></label>
								<div class="col-lg-8">
									<input type="password" class="form-control-95-2" name="m_passwd2" id="m_passwd2" required>
									<span id="pwd_chk2"> </span>
								</div>
							</div>
							<div class="form-group">
								<label for="m_name" class="col-lg-3 control-label"><b>이름</b></label>
								<div class="col-lg-8">
									<input type="text" class="form-control-95-2" name="m_name" id="m_name" value="${member.m_name}" required>
									<span id="name_chk"> </span>
								</div>
							</div>
							<div class="form-group">
								<label for="m_nick" class="col-lg-3 control-label"><b>닉네임</b></label>
								<div class="col-lg-8">
									<input type="text" class="form-control-95-2" name="m_nick" id="m_nick" value="${member.m_nick}" required>
									<span id="nick_chk"> </span>
								</div>
							</div>
							<div class="form-group">
								<label for="m_birth" class="col-lg-3 control-label"><b>생년월일</b></label>
								<div class="col-lg-8">
									<input type="date" class="form-control-50" name="m_birth" id="m_birth" value="${member.m_birth}" required>
								</div>
							</div>
							<div class="form-group">
								<label for="m_gender" class="col-lg-3 control-label"><b>성별</b></label>
								<div class="col-lg-8">
									<div class="radio">
										<label>
											<input type="radio" name="m_gender" id="m_gender" value="남자" <c:if test="${member.m_gender eq '남자'}">checked</c:if> required>남자
										</label>
										&nbsp;&nbsp;
										<label>
											<input type="radio" name="m_gender" id="m_gender" value="여자" <c:if test="${member.m_gender eq '여자'}">checked</c:if> required>여자
										</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="m_tel" class="col-lg-3 control-label"><b>전화번호</b></label>
								<div class="col-lg-8">
									<input type="text" class="form-control-20" name="m_tel1" id="m_tel1" maxlength="3" value="${member.m_tel1}" required> - 
									<input type="text" class="form-control-20" name="m_tel2" id="m_tel2" maxlength="4" value="${member.m_tel2}" required> -
									<input type="text" class="form-control-20" name="m_tel3" id="m_tel3" maxlength="4" value="${member.m_tel3}" required>
									<br>
									<span id="tel_chk"> </span>
								</div>
							</div>
							<div class="form-group">
								<label for="m_job" class="col-lg-3 control-label"><b>직업</b></label>
								<div class="col-lg-8">
									<select class="form-control-30" name="m_job">
										<option value="학생" <c:if test="${member.m_job eq '학생'}">selected</c:if>>학생</option>
										<option value="회사원" <c:if test="${member.m_job eq '회사원'}">selected</c:if>>회사원</option>
										<option value="자영업" <c:if test="${member.m_job eq '자영업'}">selected</c:if>>자영업</option>
										<option value="무직" <c:if test="${member.m_job eq '무직'}">selected</c:if>>무직</option>
										<option value="기타" <c:if test="${member.m_job eq '기타'}">selected</c:if>>기타</option>
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