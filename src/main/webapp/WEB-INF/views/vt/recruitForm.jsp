<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<%@ include file="../session/orgChk.jsp"%>
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

				$('#vsdate').datepicker();
				$('#vsdate')
						.datepicker("option", "maxDate", $("#vedate").val());
				$('#vsdate').datepicker(
						"option",
						"onClose",
						function(selectedDate) {
							if (selectedDate != 0) {
								$("#vedate").datepicker("option", "minDate",
										selectedDate);
							} else {
								$("#vedate").datepicker("option", "minDate",
										'today');
							}

						});

				$('#vedate').datepicker();
				$('#vedate')
						.datepicker("option", "minDate", $("#vsdate").val());
				$('#vedate').datepicker(
						"option",
						"onClose",
						function(selectedDate) {
							$("#vsdate").datepicker("option", "maxDate",
									selectedDate);
						});

				$('#rsdate').datepicker();
				$('#rsdate')
						.datepicker("option", "maxDate", $("#redate").val());
				$('#rsdate').datepicker(
						"option",
						"onClose",
						function(selectedDate) {
							if (selectedDate != 0) {
								$("#redate").datepicker("option", "minDate",
										selectedDate);
							} else {
								$("#redate").datepicker("option", "minDate",
										'today');
							}

						});

				$('#redate').datepicker();
				$('#redate')
						.datepicker("option", "minDate", $("#rsdate").val());
				$('#redate').datepicker(
						"option",
						"onClose",
						function(selectedDate) {
							$("#rsdate").datepicker("option", "maxDate",
									selectedDate);
						});

				$('#cls').change(
						function() {
							var sendData = 'class_no='
									+ $('#cls option:selected').val();
							$.post('dclassList.do', sendData, function(data) {
								$('#res').html(data);
							});
						});
				
				/* //검색버튼 클릭
				$("#searchButton").click(function(){
				    var objParams = {
				            searchCd : $("input[name=searchCd]").val() //검색할 코드 (실제로 예제에서는 사용 안함)
				    }
				 
				    var values = []; //ArrayList 값을 받을 변수를 선언
				 
				    //검색할 코드를 넘겨서 값을 가져온다.      
				    $.post(
				        "http://www.test.com/get", 
				        objParams,
				        function(retVal) {
				            if(retVal.code == "OK") { //controller에서 넘겨준 성공여부 코드
				                 
				                values = retVal.bookList ; //java에서 정의한 ArrayList명을 적어준다.
				                 
				                $.each(values, function( index, value ) {
				                   console.log( index + " : " + value.name ); //Book.java 의 변수명을 써주면 된다.
				                });
				                 
				                alert("성공");
				            }
				            else {
				                alert("실패");
				            }                   
				        }
				    );
				     
				}); */
			});
</script>
<style type="text/css">
.req-container {
	width: 900px;
}

.req-form-area {
	padding-top: 10px;
	padding-bottom: 10px;
}

.req-form-name {
	margin-bottom: 25px;
	text-align: left;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="container">
		<div class="col-md-offset-14 col-md-5"
			style="margin-left: 0; margin-top: 0;">
			<div class="form-area req-container">
				<form role="form" action="recruit.do" method="post">
					<input type="hidden" name="vt_o_no" value="${sessionScope.no}">
					<h4 style="margin-bottom: 25px; text-align: center;">수요처 요청 등록</h4>
					<div class="form-area req-form-area">
						<p class="req-form-name">봉사 상세</p>
						<div class="form-group">
							<b>봉사명:</b> <input type="text" class="form-control" id="vt_name"
								name="vt_name" required>
						</div>
						<div class="form-group">
							<b>봉사지역: </b>${ addr}
						</div>
						<div class="form-group">
							<b style="display: block;">봉사 모집 기간 :</b> 시작일 : <input
								class="form-control-20" readonly="readonly" type="text"
								name="vt_r_start_Date" id="rsdate" size="10" maxlength="10" />
							종료일 : <input class="form-control-20" readonly="readonly"
								type="text" name="vt_r_end_Date" id="redate" size="10"
								maxlength="10" />
						</div>
						<div class="form-group">
							<b style="display: block;">봉사 활동 기간 :</b> 시작일 : <input
								class="form-control-20" readonly="readonly" type="text"
								name="vt_a_start_Date" id="vsdate" size="10" maxlength="10" />
							종료일 : <input class="form-control-20" readonly="readonly"
								type="text" name="vt_a_end_Date" id="vedate" size="10"
								maxlength="10" />
						</div>
						<div class="form-group">
							<div style="float: left; width: 50%">
								<b style="display: block;">활동분야:</b> <select style="float: left; width: 50%"
									class="form-control-40" name="cls" id="cls">
										<c:forEach var="cl" items="${list}">
											<option value="${cl.class_no }">${cl.class_name }</option>
										</c:forEach>
								</select><span id="res"></span>
							</div>
							<div>
								<b>봉사 대상자:</b> <select class="form-control-40" name="cls"
									id="cls" style="display: block;">
									<c:forEach var="sub" items="${slist}">
										<option value="${sub.sub_no }">${sub.sub_name }</option>
									</c:forEach>
								</select> <span id="res"></span>
							</div>
						</div>
						<div class="form-group">
							<b>요청 인원:</b> <select class="form-control-40" name="vt_tot"
								id="vt_tot">
								<c:forEach var="i" begin="0" end="50">
									<option value="${i }">${i }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<b style="display: block;">상세 내용:</b>
							<textarea rows="5" cols="80" name="vt_Desc" id="vt_Desc"></textarea>
						</div>
					</div>
					<div style="margin-top: 40px; text-align: center;">
						<input type="submit" class="btn btn-primary btn-md" value="요청">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>