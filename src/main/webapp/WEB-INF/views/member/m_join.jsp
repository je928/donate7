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
			var sendData = 'm_email='+$('#m_email').val();
			$.post('m_emailChk.do',sendData,function(msg){
 	 			$('#m_check').html(msg);
 			});
			return false;
 		});
	});
	
	function chk() {
		if(frm.m_passwd.value != frm.m_passwd2.value) {
			alert("비밀번호를 확인하세요.");
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
		        	<br style="clear:both">
		        	<h4 style="margin-bottom: 25px; text-align: center;">일반 회원가입</h4>
					<div class="form-group">
						<b>이메일:</b>
						<input type="email" class="form-control" id="m_email" name="m_email" required>
						<span id="m_check"> </span>
					</div>
					<div class="form-group">
						<b>비밀번호:</b>
						<input type="password" class="form-control" id="m_passwd" name="m_passwd" required>
					</div>
					<div class="form-group">
						<b>비밀번호 재확인:</b>
						<input type="password" class="form-control" id="m_passwd2" name="m_passwd2" required>
					</div>
					<div class="form-group">
						<b>이름:</b>
						<input type="text" class="form-control" id="m_name" name="m_name" required>
					</div>
					<div class="form-group">
						<b>닉네임:</b>
						<input type="text" class="form-control" id="m_nick" name="m_nick" required>
					</div>
					<div class="form-group">
						<b>생년월일:</b>
						<input type="date" class="form-control-50" id="m_birth" name="m_birth" required>
					</div>
					<div class="form-group">
                    	<b>성별:</b>
                    	<div class="radio">
	                    	<label>
	                    		<input type="radio" name="m_gender" id="m_gender" value="남자">남자
	                    	</label>
	                    	&nbsp;&nbsp;
	                    	<label>
	                    		<input type="radio" name="m_gender" id="m_gender" value="여자">여자
	                    	</label>
                    	</div>
                    </div>				
					<div class="form-group">
						<b>전화번호:</b>
						<div>
							<input type="text" class="form-control-20" name="m_tel1" id="m_tel1">
							- <input type="text" class="form-control-20" name="m_tel2" id="m_tel2">
							- <input type="text" class="form-control-20" name="m_tel3" id="m_tel3">
						</div>
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