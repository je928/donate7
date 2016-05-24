<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#m_email').blur(function() {
			var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			if (regex.test(frm.m_email.value) === false) {
				$('#email_chk').html("<font class=red>필수 정보입니다. 정확한 이메일 형식으로 입력해주세요.</font>");
			} else {
			var sendData = 'm_email='+$('#m_email').val();
			$.post('m_emailChk.do',sendData,function(msg){
 	 			if(msg == "이미 사용 중이거나 탈퇴한 이메일입니다.") {
 	 				$('#email_chk').html("<font class='red'>"+msg+"</font>");
 	 				frm.mailChk.value = "false";
 	 			}else {
 	 				$('#email_chk').html("<font class='green'>"+msg+"</font>");			
 	 				frm.mailChk.value = "true";
 	 			}
 			});
			return false;
			}
 		});
	});
	
	$(function() {
		$('#m_passwd').keydown(function() {
			var str_space = /\s/;
			if($("#m_passwd").val().length < 6) {
				$('#pwd_chk').html("<font class='red'>6~20자만 사용가능합니다.</font>");
			} else if(str_space.test($("#m_passwd").val())) {
				$('#pwd_chk').html("<font class='red'>공백은 불가능합니다.</font>");
			} else
				$('#pwd_chk').html("<font></font>");
		});
	});
	
	$(function() {
		$('#m_passwd2').keyup(function() {
			if(frm.m_passwd.value != frm.m_passwd2.value) {
				$('#pwd_chk2').html("<font class='red'>비밀번호를 확인해주세요.</font>");
			} else
				$('#pwd_chk2').html("<font></font>");
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
		if(frm.mailChk.value == "false") {
			$('#email_chk').html("<font class='red'>이메일을 다시 확인해주세요.</font>");
			frm.m_email.focus();
			return false;
		}
		
		if(frm.m_passwd.value != frm.m_passwd2.value) {
			$('#pwd_chk').html("<font class='red'>비밀번호를 다시 확인해주세요.</font>");
			$('#pwd_chk2').html("<font></font>");
			frm.m_passwd.value = "";
			frm.m_passwd2.value= "";
			frm.m_passwd.focus();
			return false;
		}
		
		return true;
	}
	
</script>
</head>
<body>

	<div class="container">
		<div class="col-md-offset-14 col-md-5">
   			<div class="form-area">
	       		<form action="m_join.do" role="form" name="frm" method="post" onsubmit="return chk()">
		        	<input type="hidden" name="mailChk" value="false">
		        	<br style="clear:both">
		        	<h4 style="margin-bottom: 25px; text-align: center;">일반 회원가입</h4>
					<div class="form-group">
						<b>이메일:</b>
						<input type="email" class="form-control" id="m_email" name="m_email" maxlength="30" required>
						<span id="email_chk"> </span>
					</div>
					<div class="form-group">
						<b>비밀번호:</b>
						<input type="password" class="form-control" id="m_passwd" name="m_passwd" maxlength="20" required>
						<span id="pwd_chk"> </span>
					</div>
					<div class="form-group">
						<b>비밀번호 재확인:</b>
						<input type="password" class="form-control" id="m_passwd2" name="m_passwd2" maxlength="20" required>
						<span id="pwd_chk2"> </span>
					</div>
					<div class="form-group">
						<b>이름:</b>
						<input type="text" class="form-control" id="m_name" name="m_name" maxlength="40" required>
					</div>
					<div class="form-group">
						<b>닉네임:</b>
						<input type="text" class="form-control" id="m_nick" name="m_nick" maxlength="10" required>
					</div>
					<div class="form-group">
						<b>생년월일:</b>
						<input type="date" class="form-control-50" id="m_birth" name="m_birth" required>
					</div>
					<div class="form-group">
                    	<b>성별:</b>
                    	<div class="radio">
	                    	<label>
	                    		<input type="radio" name="m_gender" id="m_gender" value="남자" required>남자
	                    	</label>
	                    	&nbsp;&nbsp;
	                    	<label>
	                    		<input type="radio" name="m_gender" id="m_gender" value="여자" required>여자
	                    	</label>
                    	</div>
                    </div>				
					<div class="form-group">
						<b>전화번호:</b>
						<div>
							<input type="text" class="form-control-20" name="m_tel1" id="m_tel1" maxlength="3">
							- <input type="text" class="form-control-20" name="m_tel2" id="m_tel2" maxlength="4">
							- <input type="text" class="form-control-20" name="m_tel3" id="m_tel3" maxlength="4">
						</div>
						<span id="tel_chk"> </span>
					</div>
					<div class="form-group">
						<b>직업:</b>
						<div>
							<select class="form-control-40" name="m_job">
								<option value="학생">학생</option>
								<option value="회사원">회사원</option>
								<option value="자영업">자영업</option>
								<option value="무직">무직</option>
								<option value="기타">기타</option>
							</select>
						</div>
					</div>
					<div style="margin-top: 40px; text-align: center;">
						<button type="submit" id="submit" name="submit" class="btn btn-primary">가입하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>