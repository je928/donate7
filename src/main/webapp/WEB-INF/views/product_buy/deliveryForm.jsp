<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type='text/javascript'
	src='//code.jquery.com/jquery-1.10.2.min.js'></script>
<script type='text/javascript'
	src='//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	var x = '${price.pr_price }';
	function myFunction(val) {
		var y='${cnt}';
		document.getElementById("hap").value = x * val;
	}
</script>
<script type='text/javascript'>
	function openDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById("postcode1").value = data.postcode1;
						document.getElementById("postcode2").value = data.postcode2;
						document.getElementById("addr1").value = fullAddr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("addr2").focus();
					}
				}).open();
	}
</script>
<script type="text/javascript">
	<c:if test="${not empty msg }">
		alert("${msg}");
	</c:if>
</script>
<style>
.red {
	color: red;
}

.form-area {
	background-color: #FAFAFA;
	padding: 10px 40px 60px;
	margin: 10px 0px 60px;
	border: 1px solid GREY;
	border-radius: 15px;
}

.col-md-offset-13 {
	margin-left: 29%;
}
</style>
</head>
<body>

	<div class="container">
		<div class="col-md-offset-13 col-md-5">
			<div class="form-area">
				<form role="form" name="frm" action="deliveryForm.do" method="post">
					<input type="hidden" name="pr_no" value="${price.pr_no }">
					<input type="hidden" id="cp_point" name="cp_point" value="${ci}">
					<br style="clear: both">
					<h3 style="margin-bottom: 25px; text-align: center;">Delivery
						Form</h3>

					<img class="img-responsive" alt="" src="image/${price.pr_img }">
					<div class="form-group">현재 내 캐쉬: ${ci}</div>
					<div class="form-group">상품명:${price.pr_proname }</div>
					<div class="form-group">가격: ${price.pr_price }</div>
					<div class="form-group">보내는 사람 : ${nick}</div>
					<div class="form-group">
						<!--받는사람  -->
						받는 사람 <input type="text" class="form-control" id="name"
							name="pb_name" placeholder="Name" required>
					</div>
					<div class="form-group">
						<!--전화번호  -->
						구매자 전화번호<input type="text" class="form-control" id="mobile"
							name="pb_tel" placeholder="Mobile Number" required>
					</div>
					<div class="form-group">
						<!--수량  -->
						구매 수량<input type="number" name="pb_buyqty" id="pb_buyqty"
							onchange="myFunction(this.value)" value="${cnt}" min="1"
							max=${price.pr_qty }> 구매 금액<input type="text" name="hap"
							id="hap" readonly="readonly" value="${cnt*price.pr_price }">
					</div>
					<div class="form-group">
						<!--주소  -->
						주소 <input type="text" name="zip1" value="" id="postcode1"
							title="우편번호 앞자리" class="frm_input readonly" size="3"
							maxlength="3"> - <input type="text" name="zip2" value=""
							id="postcode2" title="우편번호 뒷자리" class="frm_input readonly"
							size="3" maxlength="3"> <input type="button"
							onclick="openDaumPostcode()" value="우편번호 찾기"
							style="width: 100px; height: 25px; font-size: 11px; background-color: #ECECEC"><br>
						<input type="text" name="addr1" value="" id="addr1"
							placeholder="주소" class="frm_input readonly" style="width: 70%"><br>
						<input type="text" name="addr2" value="" id="addr2"
							placeholder="상세주소" class="frm_input" style="width: 38%"><br>
					</div>
					<input type="submit" name="submit" value="Submit Form">
				</form>
			</div>
		</div>
	</div>

</body>
</html>