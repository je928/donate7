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
	$(document).ready(function() {
		$('#redate').change(function() {
			var currentDate = new Date();
			var strDate = $('#redate').val();
			var redate = new Date(strDate);
			if(currentDate > redate){
				alert('모집 종료일은 오늘 일자 이후로 선택하여 주세요.');
				$('#redate').val('');
			}
			$('#vsdate').attr('min', strDate);
		});
		$('#vsdate').change(function() {
			var selDate = $('#vsdate').val();
			$('#vedate').attr('min',selDate);
		});

		$('#cls').change(function() {
			var sendData = 'class_no=' + $('#cls option:selected').val();
			$.post('dclassList.do', sendData, function(data) {
				$('#res').html(data);
			});
		});
	});

	function nameChek() {
		var content = document.getElementById("vt_name");
		if (content.value.length >= content.maxLength) {
			if (event.KeyCode != 8 || event.KeyCode != 27) {
				alert("최대 " + content.maxLength + "글자 까지 작성할수 있습니다.");
			}
		}
	}
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
								name="vt_name" maxlength="100" onkeyup="nameChek()" required>
						</div>
						<div class="form-group">
							<b>봉사지역: </b>${ addr}
						</div>
						<div class="form-group">
							<b style="display: block;">봉사 모집 기간 :</b>
							<!-- 시작일 : <input
								class="form-control-20" readonly="readonly" type="text"
								name="vt_r_start_date" id="rsdate" size="10" maxlength="10" /> -->
							종료일 : <input class="form-control-20" type="date"
								name="vt_r_end_date" id="redate" size="10" maxlength="10" />
						</div>
						<div class="form-group">
							<b style="display: block;">봉사 활동 기간 :</b> 시작일 : <input
								class="form-control-20" type="date"
								name="vt_a_start_date" id="vsdate" /> 종료일 : <input
								class="form-control-20" type="date" name="vt_a_end_date"
								id="vedate"/>
						</div>
						<div class="form-group">
							<div style="float: left; width: 50%">
								<b style="display: block;">활동분야:</b> <select
									style="float: left; width: 50%" class="form-control-40"
									name="cls" id="cls">
									<c:forEach var="cl" items="${list}">
										<option value="${cl.class_no }">${cl.class_name }</option>
									</c:forEach>
								</select><span id="res"> <select id="vt_class"
									class="form-control-40">
										<c:forEach var="dc" items="${dlist }">
											<option value="${dc.dclass_no }">${dc.dclass_name }</option>
										</c:forEach>
								</select>
								</span>
							</div>
							<div>
								<b>봉사 대상자:</b> <select class="form-control-40" name="vt_subject"
									id="vt_subject" style="display: block;">
									<c:forEach var="sub" items="${slist}">
										<option value="${sub.sub_no }">${sub.sub_name }</option>
									</c:forEach>
								</select> <span id="res"></span>
							</div>
						</div>
						<div class="form-group">
							<b>요청 인원:</b> <select class="form-control-40" style="width: 10%"
								name="vt_tot" id="vt_tot">
								<c:forEach var="i" begin="0" end="50">
									<option value="${i }">${i }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<b style="display: block;">상세 내용:</b>
							<textarea rows="5" cols="80" name="vt_desc" id="vt_desc"></textarea>
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