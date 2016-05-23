<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.js"></script>
<script>
	function openDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
				document.getElementById('post1').value = data.postcode1;
				document.getElementById('post2').value = data.postcode2;
				document.getElementById('o_addr1').value = data.address1;
				document.getElementById('o_addr2').focus();
			}
		}).open();
	}
</script>
</head>
<body>
	
	<div class="container">
		<div class="col-md-offset-14 col-md-5">
   			<div class="form-area">
	       		<form role="form" action="o_join.do" method="post">
		        	<br style="clear:both">
		        	<h4 style="margin-bottom: 25px; text-align: center;">기관 회원가입</h4>
					<div class="form-group">
						<strong>이메일:</strong>
						<input type="email" class="form-control" id="o_email" name="o_email" required>
					</div>
					<div class="form-group">
						<strong>비밀번호:</strong>
						<input type="password" class="form-control" id="o_passwd" name="o_passwd" required>
					</div>
					<div class="form-group">
						<strong>비밀번호 재확인:</strong>
						<input type="password" class="form-control" id="o_passwd2" name="o_passwd2" required>
					</div>
					<div class="form-group">
						<strong>허가번호:</strong>
						<input type="text" class="form-control" id="o_license" name="o_license" required>
					</div>
					<div class="form-group">
						<strong>기관명:</strong>
						<input type="text" class="form-control" id="o_oname" name="o_oname" required>
					</div>
					<div class="form-group">
						<strong>가입자명:</strong>
						<input type="text" class="form-control" id="o_name" name="o_name" required>
					</div>
					<div class="form-group">
						<strong>전화번호:</strong>
						<div>
							<input type="text" class="form-control-20" name="o_tel1" id="o_tel1">
							- <input type="text" class="form-control-20" name="o_tel2" id="o_tel2">
							- <input type="text" class="form-control-20" name="o_tel3" id="o_tel3">
						</div>
					</div>
					<div class="form-group">
						<strong>주소:</strong>
						<div>
							<input type="text" class="form-control-30" name="post1" id="post1">
							- <input type="text" class="form-control-30" name="post2" id="post2">
							<input type="button" onclick="openDaumPostcode()" value="우편번호 찾기"	style="width: 100px; height: 30px; font-size: 11px; background-color: #ECECEC">
						</div>
					</div>
					<div class="form-group">
						<input type="text" class="form-control-20" name="o_addr1" id="o_addr1" value="" title="행정기본주소" style="width: 99%">
						<input type="text" class="form-control-20" name="o_addr2" id="o_addr2" value="" title="상세주소" style="width: 99%" placeholder="상세주소">
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