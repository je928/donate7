<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp"%>
<%@ include file="../../session/orgChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
<script type="text/javascript">
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
			var dbname = '${organ.o_name}';
			if($("#o_name").val().length < 2) {
				$('#name_chk').html("<font class='red'>2자 이상 사용가능합니다.</font>");
			}else if(str_space.test($("#o_name").val())) {
				$('#name_chk').html("<font class='red'>공백 없이 입력해 주세요.</font>");
			}else if(regex.test(frm.o_name.value) === false) {
				$('#name_chk').html("<font class='red'>한글, 영문 대소문자를 이용해 주세요.</font>");
			}else if($("#o_name").val() === dbname) {
				$('#name_chk').html("");
			}else {
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
				var sendData = 'o_oname='+$('#o_oname').val()+'&no='+${no};
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
				document.getElementById('addr1').value = data.address1;
				document.getElementById('addr2').focus();
			}
		}).open();
	}
	
	function chk() {
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
		var dboname = '${organ.o_oname}';
		if(frm.o_oname.value === dboname) {
			frm.onameChk.value == "true";
		}else if(frm.onameChk.value == "false") {
			$('#oname_chk').html("<font class='red'>기관명을 다시 확인해주세요.</font>");
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
					<form action="o_update.do" name="frm" onsubmit="return chk()" class="form-horizontal">
						<input type="hidden" name="o_no" value="${no}">
						<input type="hidden" name="onameChk" value="false">
						<fieldset>
							<br style="clear: both">
							<h3 style="margin-bottom: 25px; text-align: center;">
								<em class="fa fa-pencil"></em>
							</h3>
							<div class="form-group">
								<label for="o_email" class="col-lg-3 control-label"><b>이메일</b></label>
								<div class="col-lg-8">
									<label for="o_email" class="control-label">${organ.o_email}</label>
								</div>
							</div>
							<c:if test="${organ.o_ok_xyn eq 'y'}">
							<div class="form-group">
								<label for="o_license" class="col-lg-3 control-label"><b>허가번호</b></label>
								<div class="col-lg-8">
									<label for="o_license" class="control-label">${organ.o_license}</label>
								</div>
							</div>
							</c:if>
							<c:if test="${organ.o_ok_xyn eq 'n' or organ.o_ok_xyn eq 'x'}">
							<div class="form-group">
								<label for="o_license" class="col-lg-3 control-label"><b>허가번호</b></label>
								<div class="col-lg-8">
									<input type="text" class="form-control-95-2" name="o_license" id="o_license" value="${organ.o_license}" required>
									<span id="license_chk"> </span>
								</div>
							</div>
							</c:if>
							<div class="form-group">
								<label for="o_passwd" class="col-lg-3 control-label"><b>비밀번호</b></label>
								<div class="col-lg-8">
									<input type="password" class="form-control-95-2" name="o_passwd" id="o_passwd" value="${organ.o_passwd}" required>
									<span id="pwd_chk"> </span>
								</div>
							</div>
							<div class="form-group">
								<label for="o_passwd2" class="col-lg-3 control-label"><b>재확인</b></label>
								<div class="col-lg-8">
									<input type="password" class="form-control-95-2" name="o_passwd2" id="o_passwd2" required>
									<span id="pwd_chk2"> </span>
								</div>
							</div>
							<div class="form-group">
								<label for="o_oname" class="col-lg-3 control-label"><b>기관명</b></label>
								<div class="col-lg-8">
									<input type="text" class="form-control-95-2" name="o_oname" id="o_oname" value="${organ.o_oname}" required>
									<span id="oname_chk"> </span>
								</div>
							</div>
							<div class="form-group">
								<label for="o_name" class="col-lg-3 control-label"><b>가입자명</b></label>
								<div class="col-lg-8">
									<input type="text" class="form-control-95-2" name="o_name" id="o_name" value="${organ.o_name}" required>
									<span id="name_chk"> </span>
								</div>
							</div>
							<div class="form-group">
								<label for="o_tel" class="col-lg-3 control-label"><b>전화번호</b></label>
								<div class="col-lg-8">
									<input type="text" class="form-control-20" name="o_tel1" id="o_tel1" maxlength="3" value="${organ.o_tel1}" required> - 
									<input type="text" class="form-control-20" name="o_tel2" id="o_tel2" maxlength="4" value="${organ.o_tel2}" required> -
									<input type="text" class="form-control-20" name="o_tel3" id="o_tel3" maxlength="4" value="${organ.o_tel3}" required>
									<br>
									<span id="tel_chk"> </span>
								</div>
							</div>
							<div class="form-group">
								<label for="o_addr" class="col-lg-3 control-label"><b>주소</b></label>
								<div class="col-lg-8">
									<input type="text" class="form-control-30 text-center" name="post1" id="post1" value="${organ.post1}" required readonly="readonly">
									- <input type="text" class="form-control-30 text-center" name="post2" id="post2" value="${organ.post2}" required readonly="readonly">
									<input type="button" onclick="openDaumPostcode()" value="우편번호 찾기"	style="width: 100px; height: 30px; font-size: 11px; background-color: #ECECEC">
								</div>
							</div>
							<div class="form-group">
								<label for="o_addr" class="col-lg-3 control-label"></label>
								<div class="col-lg-8">
									<input type="text" class="form-control-95-2" name="addr1" id="addr1" title="행정기본주소" value="${organ.addr1}" required readonly="readonly">
									<input type="text" class="form-control-95-2" name="addr2" id="addr2" title="상세주소" value="${organ.addr2}" placeholder="상세주소">
									<span id="addr_chk"> </span>
								</div>
							</div>
							<div class="form-group">
								<label for="o_category" class="col-lg-3 control-label"><b>카테고리</b></label>
								<div class="col-lg-8">
									<select class="form-control-30" name="o_category">
										<option value="사람" <c:if test="${organ.o_category eq '사람'}">selected</c:if>>사람</option>
										<option value="환경" <c:if test="${organ.o_category eq '환경'}">selected</c:if>>환경</option>
										<option value="동물" <c:if test="${organ.o_category eq '동물'}">selected</c:if>>동물</option>
										<option value="기타" <c:if test="${organ.o_category eq '기타'}">selected</c:if>>기타</option>
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