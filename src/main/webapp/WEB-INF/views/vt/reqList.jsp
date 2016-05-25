<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
td {
	text-align: left;
	padding-left: 10px;
}
</style>
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
					yearRange : 'c-5:c+5',
				};
				$.datepicker.setDefaults($.datepicker.regional['ko']);

				$('#sdate').datepicker();
				//$('#sdate').datepicker("option", "minDate", '${volReq.vt_Start_Date}');
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
				//$('#edate').datepicker("option", "maxDate",'${volReq.vt_End_Date}');
				$('#edate').datepicker(
						"option",
						"onClose",
						function(selectedDate) {
							$("#sdate").datepicker("option", "maxDate",
									selectedDate);
						});

				$('#sido').change(
						function() {
							var sendData = 'sido_no='
									+ $('#sido option:selected').val();
							$.post('gugunList.do', sendData, function(data) {
								$('#res').html(data);
							});
						});
			});
</script>
</head>
<body>
	<div class="container">
		<div class="col-md-offset-14 col-md-5" style="margin-left: 10%">
			<div class="form-area">
				<form action="reqList.do" method="post">
					<table>
						<tr>
							<th>지역선택</th>
							<td><select name="sido" id="sido">
									<option value="0">----</option>
									<c:forEach var="sido" items="${sList }">
										<option value="${sido.sido_no}">${sido.sido_name}</option>
									</c:forEach>
							</select> <span id="res"></span></td>
						</tr>
						<tr>
							<th>분야선택</th>
							<td><select name="vt_Field">
									<option value="0">----</option>
									<option value="C">시설봉사</option>
									<option value="H">재가봉사</option>
									<option value="M">전문봉사</option>
									<option value="S">지역사회봉사</option>
									<option value="G">해외봉사</option>
									<option value="E">기타봉사</option>
							</select></td>
						</tr>
						<tr>
							<th>봉사기간</th>
							<td><input type="text" name="vt_Start_Date" id="sdate"
								readonly="readonly"> <input type="text"
								name="vt_End_Date" id="edate" readonly="readonly"></td>
						</tr>
						<tr>
							<th>봉사주기</th>
							<td><select name="vt_Cycle">
									<option value="0">----</option>
									<option value="C">정기</option>
									<option value="N">비정기</option>
							</select></td>
						</tr>
						<tr>
							<th>모집상태</th>
							<td><select name="vt_Cycle">
									<option value="0">----</option>
									<option value="Y">모집 중</option>
									<option value="N">모집 완료</option>
							</select></td>
						</tr>
						<tr>
							<th>봉사제목</th>
							<td><input type="text" name="vt_Name"></td>
						</tr>
					</table>
					<input type="submit" class="btn btn-primary btn-md" value="조회">
				</form>
				<table border="1">
					<tr>
						<th>번호</th>
						<th>지역</th>
						<th>분야</th>
						<th>제목</th>
						<th>기간</th>
						<th>주기</th>
					
						<th>모집상태</th>
					</tr>
					<c:forEach var="volReq" items="${list}">
						<tr>
							<td>${volReq.vt_No }</td>
							<td>지역</td>
							<td>${volReq.vt_Field }</td>
							<td><a href="reqDetail.do?vt_No=${volReq.vt_No}">${volReq.vt_Name }</a></td>
							<td>${volReq.vt_Start_Date} - ${volReq.vt_End_Date }</td>
							<td>${volReq.vt_Cycle }</td>
							<td>
								<c:if test="${volReq.vt_Recruit_Yn == 'Y'}">
									모집 중
								</c:if>
								<c:if test="${volReq.vt_Recruit_Yn == 'N'}">
									모집 완료
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>