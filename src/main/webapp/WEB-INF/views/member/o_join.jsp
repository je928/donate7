<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
<script type="text/javascript">
	$(function() {
		$('#o_email').blur(function() {
			var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			if (regex.test(frm.o_email.value) === false) {
				$('#email_chk').html("<font class=red>정확한 이메일 형식으로 입력해주세요.</font>");
			} else {
			var sendData = 'o_email='+$('#o_email').val();
			$.post('o_emailChk.do',sendData,function(msg){
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
		$('#o_passwd').keyup(function() {
			var str_space = /\s/;
			if($("#o_passwd").val().length < 6) {
				$('#pwd_chk').html("<font class='red'>6~20자만 사용가능합니다.</font>");
			} else if(str_space.test($("#o_passwd").val())) {
				$('#pwd_chk').html("<font class='red'>공백은 불가능합니다.</font>");
			} else {
				$('#pwd_chk').html("<font class='green'>사용 가능합니다.</font>");
			}
		});
	});
	
	$(function() {
		$('#o_passwd2').keyup(function() {
			if(frm.o_passwd.value != frm.o_passwd2.value) {
				$('#pwd_chk2').html("<font class='red'>비밀번호를 확인해주세요.</font>");
			} else {
				$('#pwd_chk2').html("<font></font>");
			}
		});
	});
	
	$(function() {
		$('#o_name').keyup(function() {
			var regex = /^[가-힣A-Za-z]{2,40}$/;
			var str_space = /\s/;
			if($("#o_name").val().length < 2) {
				$('#name_chk').html("<font class='red'>2자 이상 사용가능합니다.</font>");
			} else if(str_space.test($("#o_name").val())) {
				$('#name_chk').html("<font class='red'>공백 없이 입력해 주세요.</font>");
			} else if(regex.test(frm.o_name.value) === false) {
				$('#name_chk').html("<font class='red'>한글, 영문 대소문자를 이용해 주세요.</font>");
			} else {
				$('#name_chk').html("<font class='green'>사용 가능합니다.</font>");
			}
		});
	});
	
	$(function() {
		$('#o_oname').keyup(function() {
			var regex = /^[가-힣A-Za-z0-9]{2,30}$/;
			if($("#o_oname").val().length < 2) {
				$('#oname_chk').html("<font class='red'>2자 이상 사용가능합니다.</font>");
			} else if (regex.test(frm.o_oname.value) === false) {
				$('#oname_chk').html("<font class='red'>한글, 영문 대소문자, 숫자를 이용해 주세요.</font>");
			}else {
				var sendData = 'o_oname='+$('#o_oname').val()+'&no=0';
				$.post('o_onameChk.do',sendData,function(msg){
	 	 			if(msg == "이미 사용 중인 기관명입니다.") {
	 	 				$('#oname_chk').html("<font class='red'>"+msg+"</font>");
	 	 				frm.onameChk.value = "false";
	 	 			}else {
	 	 				$('#oname_chk').html("<font class='green'>"+msg+"</font>");			
	 	 				frm.onameChk.value = "true";
	 	 			}
					});
				return false;
			}
			});
	});
	
	$(function() {
		$('#o_tel3').blur(function() {
			var tel1 = /^\d{2,3}$/;
			var tel2 = /^\d{3,4}$/;
			var tel3 = /^\d{4}$/;
			if (tel1.test(frm.o_tel1.value) === false || tel2.test(frm.o_tel2.value) === false || tel3.test(frm.o_tel3.value) === false) {
				$('#tel_chk').html("<font class=red>전화번호를 다시 확인해주세요.</font>");
			}else {
				$('#tel_chk').html("<font></font>");
			}
		});
	});
	
	function openDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
				document.getElementById('post1').value = data.postcode1;
				document.getElementById('post2').value = data.postcode2;
				document.getElementById('o_addr1').value = data.address1;
				document.getElementById('o_addr2').focus();
				frm.addrChk.value = "true";
			}
		}).open();
	}
	
	function chk() {
		if(frm.mailChk.value == "false") {
			$('#email_chk').html("<font class='red'>이메일을 다시 확인해주세요.</font>");
			frm.o_email.focus();
			return false;
		}
		
		if(frm.o_passwd.value != frm.o_passwd2.value) {
			$('#pwd_chk').html("<font class='red'>비밀번호를 다시 확인해주세요.</font>");
			$('#pwd_chk2').html("<font></font>");
			frm.o_passwd.value = "";
			frm.o_passwd2.value= "";
			frm.o_passwd.focus();
			return false;
		}
		
		if(frm.o_passwd.value.length < 6) {
			$('#pwd_chk').html("<font class='red'>6~20자만 사용가능합니다.</font>");
			$('#pwd_chk2').html("<font></font>");
			frm.o_passwd.value="";
			frm.o_passwd2.value = "";
			frm.o_passwd.focus();
			return false;
		}
		
		if(frm.o_passwd.value.indexOf(" ")>=0) {
			$('#pwd_chk').html("<font class='red'>공백 없이 입력해 주세요.</font>");
			$('#pwd_chk2').html("<font></font>");
			frm.o_passwd.value = "";
			frm.o_passwd2.value = "";
			frm.o_passwd.focus();
			return false;
		}
		
		if(frm.o_name.value.length < 2) {
			$('#name_chk').html("<font class='red'>2자 이상 사용가능합니다.</font>");
			frm.o_name.value = "";
			frm.o_name.focus();
			return false;
		}
		
		if(frm.o_name.value.indexOf(" ")>=0) {
			$('#name_chk').html("<font class='red'>공백 없이 입력해 주세요.</font>");
			frm.o_name.value = "";
			frm.o_name.focus();
			return false;
		}
		
		var name = /^[가-힣A-Za-z]{2,40}$/;
		if(name.test(frm.o_name.value) === false) {
			$('#name_chk').html("<font class='red'>한글, 영문 대소문자를 이용해 주세요.</font>");
			frm.o_name.value = "";
			frm.o_name.focus();
			return false;
		}

		if(frm.onameChk.value == "false") {
			$('#oname_chk').html("<font class='red'>닉네임을 다시 확인해주세요.</font>");
			frm.o_oname.focus();
			return false;
		}
		
		if(frm.o_oname.value.length < 2) {
			$('#oname_chk').html("<font class='red'>2자 이상 사용가능합니다.</font>");
			frm.o_oname.value = "";
			frm.o_oname.focus();
			return false;
		}
		
		if(frm.o_oname.value.indexOf(" ")>=0) {
			$('#oname_chk').html("<font class='red'>공백 없이 입력해 주세요.</font>");
			frm.o_oname.value = "";
			frm.o_oname.focus();
			return false;
		}
		
		var oname = /^[가-힣A-Za-z0-9]{2,10}$/;
		if(oname.test(frm.o_oname.value) === false) {
			$('#oname_chk').html("<font class='red'>한글, 영문 대소문자, 숫자를 이용해 주세요.</font>");
			frm.o_oname.value = "";
			frm.o_oname.focus();
			return false;
		}
				
		var tel1 = /^\d{2,3}$/;
		var tel2 = /^\d{3,4}$/;
		var tel3 = /^\d{4}$/;
		if (tel1.test(frm.o_tel1.value) === false || tel2.test(frm.o_tel2.value) === false || tel3.test(frm.o_tel3.value) === false) {
			$('#tel_chk').html("<font class=red>전화번호를 다시 확인해주세요.</font>");
			frm.o_tel1.value = "";
			frm.o_tel2.value = "";
			frm.o_tel3.value = "";
			frm.o_tel1.focus();
			return false;
		}
		
		if(frm.addrChk.value == "false") {
			$('#addr_chk').html("<font class='red'>우편번호찾기로 주소를 입력해주세요.</font>");
			frm.o_addr2.value = "";
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
				<form action="o_join.do" role="form" name="frm" method="post" onsubmit="return chk()">
					<input type="hidden" name="mailChk" value="false">
					<input type="hidden" name="onameChk" value="false">
					<input type="hidden" name="addrChk" value="false">					
		        	<br style="clear:both">
		        	<h4 style="margin-bottom: 25px; text-align: center;">기관 회원가입</h4>
					<div class="form-group">
						<strong>이메일:</strong>
						<input type="email" class="form-control" id="o_email" name="o_email" maxlength="30" required autofocus="autofocus">
						<span id="email_chk"> </span>
					</div>
					<div class="form-group">
						<strong>비밀번호:</strong>
						<input type="password" class="form-control" id="o_passwd" name="o_passwd" maxlength="20" required>
						<span id="pwd_chk"> </span>
					</div>
					<div class="form-group">
						<strong>비밀번호 재확인:</strong>
						<input type="password" class="form-control" id="o_passwd2" name="o_passwd2" maxlength="20" required>
						<span id="pwd_chk2"> </span>
					</div>
					<div class="form-group">
						<strong>허가번호:</strong>
						<input type="text" class="form-control" id="o_license" name="o_license" maxlength="50" required>
						<span id="license_chk"> </span>
					</div>
					<div class="form-group">
						<strong>기관명:</strong>
						<input type="text" class="form-control" id="o_oname" name="o_oname" maxlength="30" required>
						<span id="oname_chk"> </span>
					</div>
					<div class="form-group">
						<strong>가입자명:</strong>
						<input type="text" class="form-control" id="o_name" name="o_name" maxlength="40" required>
						<span id="name_chk"> </span>
					</div>
					<div class="form-group">
						<strong>전화번호:</strong>
						<div>
							<input type="text" class="form-control-20" name="o_tel1" id="o_tel1" maxlength="3" required>
							- <input type="text" class="form-control-20" name="o_tel2" id="o_tel2" maxlength="4" required>
							- <input type="text" class="form-control-20" name="o_tel3" id="o_tel3" maxlength="4" required>
						</div>
						<span id="tel_chk"> </span>
					</div>
					<div class="form-group">
						<strong>주소:</strong>
						<div>
							<input type="text" class="form-control-30" name="post1" id="post1" required readonly="readonly">
							- <input type="text" class="form-control-30" name="post2" id="post2" required readonly="readonly">
							<input type="button" onclick="openDaumPostcode()" value="우편번호 찾기"	style="width: 100px; height: 30px; font-size: 11px; background-color: #ECECEC">
						</div>
					</div>
					<div class="form-group">
						<input type="text" class="form-control-20" name="o_addr1" id="o_addr1" value="" title="행정기본주소" style="width: 99%" required readonly="readonly">
						<input type="text" class="form-control-20" name="o_addr2" id="o_addr2" value="" title="상세주소" style="width: 99%" placeholder="상세주소">
						<span id="addr_chk"> </span>
					</div>
					<div class="form-group">
						<strong>카테고리:</strong>
						<div>
							<select class="form-control-40" name="o_category">
								<option value="사람">사람</option>
								<option value="환경">환경</option>
								<option value="동물">동물</option>
								<option value="기타">기타</option>								
							</select>
						</div>
					</div>
					<div style="margin-top: 40px; text-align: center;">
						<button type="submit" id="submit" name="submit" class="btn btn-success">가입하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>