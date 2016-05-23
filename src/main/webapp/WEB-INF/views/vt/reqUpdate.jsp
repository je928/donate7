<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<%@ include file="../session/orgChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$.datepicker.regional['ko'] = {
					closeText : '닫기',
					prevText : '이전달',
					nextText : '다음달',
					currentText : '오늘',
					minDate : $('#sdate').val(),
					maxDate : $('#edate').val(),
					monthNames : [ '1월(JAN)', '2월(FEB)', '3월(MAR)', '4월(APR)',
							'5월(MAY)', '6월(JUN)', '7월(JUL)', '8월(AUG)',
							'9월(SEP)', '10월(OCT)', '11월(NOV)', '12월(DEC)' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					weekHeader : 'Wk',
					dateFormat : 'yymmdd',
					firstDay : 0,
					isRTL : false,
					showMonthAfterYear : true,
					yearSuffix : '',
					showOn : 'both',
					buttonText : "▼",
					changeMonth : true,
					changeYear : true,
					showButtonPanel : true,
					yearRange : 'c-99:c+99',
				};
				$.datepicker.setDefaults($.datepicker.regional['ko']);

				$('#sdate').datepicker();
				$('#sdate').datepicker("option", "maxDate", $("#edate").val());
				$('#sdate').datepicker(
						"option",
						"onClose",
						function(selectedDate) {
							if (selectedDate != 0) {
								$("#edate").datepicker("option", "minDate",
										selectedDate);
							} else {
								$("#edate").datepicker("option", "minDate",
										'today');
							}

						});

				$('#edate').datepicker();
				$('#edate').datepicker("option", "minDate", $("#sdate").val());
				$('#edate').datepicker(
						"option",
						"onClose",
						function(selectedDate) {
							$("#sdate").datepicker("option", "maxDate",
									selectedDate);
						});
			});
</script>
<style type="text/css">
.req-container{
	width : 900px;
}
.req-form-area{
	padding-top: 10px;
	padding-bottom: 10px;
}
.req-form-name{
	margin-bottom: 25px; 
	text-align: left; 
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="container">
		<div class="col-md-offset-14 col-md-5" style="margin-left: 10%">
			<div class="form-area req-container">
				<form role="form" action="reqUpdate.do" method="post">
				<input type="hidden" name="vt_Reg_O_No" value="${sessionScope.no}">
					<h4 style="margin-bottom: 25px; text-align: center;">수요처 요청 등록</h4>
					<div class="form-area req-form-area">
						<p class="req-form-name">봉사 상세</p>
						<div class="form-group">
							<b>봉사명:</b> <input type="text" class="form-control" id="vt_Name"
								name="vt_Name" value="${volReq.vt_Name }" required>
						</div>
						<div class="form-group">
							<b>봉사지역:</b>
						</div>
						<div class="form-group">
							<b>봉사장소:</b>
						</div>
						<div class="form-group">
							<b>봉사대상자:</b> <input type="text" class="form-control"
								id="vt_Subject" name="vt_Subject" value="${volReq.vt_Subject }" required>
						</div>
						<div class="form-group">
							<b style="display: block;">봉사 기간 :</b> 시작일 : <input
								class="form-control-20" readonly="readonly" type="text"
								name="vt_Start_Date" id="sdate" size="10" maxlength="10" value="${volReq.vt_Start_Date }"/> 종료일
							: <input class="form-control-20" readonly="readonly" type="text"
								name="vt_End_Date" id="edate" size="10" maxlength="10" value="${volReq.vt_End_Date }" />
						</div>
						<div class="form-group">
							<b>요청 인원:</b> <select class="form-control-40" name="vt_Total" id="vt_Total">
								<c:forEach var="i" begin="0" end="50">
									<c:if test="${volReq.vt_Total == i }">
										<option value="${i }" selected="selected">${i }</option>
									</c:if>
									<c:if test="${volReq.vt_Total != i }">
										<option value="${i }">${i }</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<b>활동분야:</b> <select class="form-control-40" name="vt_Field" id="vt_Field">
								<c:set  var="field" value="${field}"></c:set>
								<c:if test="${field == 'C' }">
									<option value="C" selected="selected">시설봉사</option>
								</c:if>
								<c:if test="${field != 'C'}">
									<option value="C">시설봉사</option>
								</c:if>
								<c:if test="${field eq 'H'}">
									<option value="H" selected="selected">재가봉사</option>
								</c:if>
								<c:if test="${field ne 'H'}">
									<option value="H">재가봉사</option>
								</c:if>
								<c:if test="${field eq 'M'}">
									<option value="M" selected="selected">전문봉사</option>
								</c:if>
								<c:if test="${field ne 'M'}">
									<option value="M">전문봉사</option>
								</c:if>
								<c:if test="${field eq 'S'}">
									<option value="S" selected="selected">지역사회봉사</option>
								</c:if>
								<c:if test="${field ne 'S'}">
									<option value="S">지역사회봉사</option>
								</c:if>
								<c:if test="${field eq 'G'}">
									<option value="G" selected="selected">해외봉사</option>
								</c:if>
								<c:if test="${field ne 'G'}">
									<option value="G">해외봉사</option>
								</c:if>
								<c:if test="${field eq 'E'}">
									<option value="E" selected="selected">기타봉사</option>
								</c:if>
								<c:if test="${field ne 'E'}">
									<option value="E">기타봉사</option>
								</c:if>
								
								
								
							</select>
						</div>
						<div class="form-group">
							<b>활동주기:</b> 
							<c:set var="cycle" value="${cycle}"></c:set>
							<select class="form-control-40" name="vt_Cycle" id="vt_Cycle">
								<c:if test="${cycle eq 'C'}">
									<option value="C" selected="selected">정기</option>
								</c:if>
								<c:if test="${cycle ne 'C'}">
									<option value="C">정기</option>
								</c:if>
								<c:if test="${cycle eq 'N'}">
									<option value="N" selected="selected">비정기</option>
								</c:if>
								<c:if test="${cycle ne 'N'}">
									<option value="N">비정기</option>
								</c:if>
							</select>
						</div>
						<div class="form-group">
							<b style="display: block;">상세 내용:</b>
							<textarea rows="5" cols="80" name="vt_Desc" id="vt_Desc">${volReq.vt_Desc }</textarea>
						</div>
					</div>
					<div class="form-area req-form-area">
					<p class="req-form-name">담당자 정보</p>
						<div class="form-group">
							<b>담당자:</b> <input type="text" class="form-control" id="vt_Mgr"
								name="vt_Mgr" value="${volReq.vt_Mgr }" required>
						</div>

						<div class="form-group">
							<b>담당자 연락처:</b> <input type="tel" class="form-control"
								id="vt_Mgr_Tel" name="vt_Mgr_Tel" value="${volReq.vt_Mgr_Tel }" required>
						</div>

						<div class="form-group">
							<b>담당자 이메일:</b> <input type="email" class="form-control"
								id="vt_Mgr_Email" name="vt_Mgr_Email" value="${volReq.vt_Mgr_Email }" required>
						</div>
					</div>
					<div class="form-area req-form-area">
					<p class="req-form-name">봉사자 자격조건</p>
						<div class="form-group">
							<b>봉사자 연령:</b> <input type="text" class="form-control" id="vt_Age"
								name="vt_Age" value="${volReq.vt_Age }">
						</div>

						<div class="form-group">
							<b>봉사자 성별:</b> <input type="text" class="form-control"
								id="vt_Gender" name="vt_Gender" value="${volReq.vt_Gender }">
						</div>

						<div class="form-group">
							<b>자격요건:</b> <input type="text" class="form-control"
								id="vt_Qualify" name="vt_Qualify" value="${volReq.vt_Qualify }">
						</div>
						<div class="form-group">
							<b>사전교육:</b> <input type="text" class="form-control"
								id="vt_Prior_Edu" name="vt_Prior_Edu" value="${volReq.vt_Prior_Edu}">
						</div>
					</div>

					<div style="margin-top: 40px; text-align: center;">
						<input type="submit" class="btn btn-primary btn-md" value="수정">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>