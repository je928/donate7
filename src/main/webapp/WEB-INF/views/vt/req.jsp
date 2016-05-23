<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
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
					minDate : 0,
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
</head>
<body>
	<div class="container">
		<div class="col-md-offset-14 col-md-5">
			<div class="form-area">
				<form role="form" action="reqResist.do" method="post">
					<h4 style="margin-bottom: 25px; text-align: center;">수요처 요청 등록</h4>
					<div class="form-group">
						<b>봉사명:</b> <input type="text" class="form-control" id="vt_name"
							name="vt_name" required>
					</div>
					<div class="form-group">
						<b>봉사지역:</b>
					</div>
					<div class="form-group">
						<b>봉사장소:</b>
					</div>
					<div class="form-group">
						<b>봉사대상자:</b> <input type="text" class="form-control"
							id="vt_subject" name="vt_subject" required>
					</div>
					<div class="form-group">
						<b style="display: block;">봉사 기간 :</b> 시작일 : <input
							class="form-control-20" readonly="readonly" type="text"
							name="vt_start_date" id="sdate" size="10" maxlength="10" /> 종료일
						: <input class="form-control-20" readonly="readonly" type="text"
							name="vt_end_date" id="edate" size="10" maxlength="10" />
					</div>
					<div class="form-group" >
						<b>요청 인원:</b>
						<select class="form-control-40" name="vt_total">
							<c:forEach var="i" begin="0" end="50">
								<option value="${i }">${i }</option>
							</c:forEach>							
						</select>
					</div>
					<div class="form-group">
						<b>활동분야:</b>
						<select class="form-control-40" name="vt_field">
							<option value="C">시설봉사</option>
							<option value="H">재가봉사</option>
							<option value="M">전문봉사</option>
							<option value="S">지역사회봉사</option>
							<option value="G">해외봉사</option>
							<option value="E" selected="selected">기타봉사</option>
						</select>
					</div>
					<div class="form-group">
						<b>활동주기:</b>
						<select class="form-control-40" name="vt_cycle">
							<option value="C">정기</option>
							<option value="N" selected="selected">비정기</option>
						</select>
					</div>
					<div class="form-group">
						<b>활동주기:</b>
						<textarea rows="" cols="" name="vt_desc"></textarea>
					</div>
					<div style="margin-top: 40px; text-align: center;">
						<button type="submit" id="submit" name="submit"
							class="btn btn-primary">요청</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>