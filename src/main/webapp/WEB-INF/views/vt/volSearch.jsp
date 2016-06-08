<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		list(1);
		
		$('#sido').change(function() {
			var sendData = 'sido_no=' + $('#sido option:selected').val();
			if($('#sido option:selected').val() != 0){
				$.post('gugunList.do', sendData, function(data) {
					$('#gugun').html(data);
				});
			}else{
				$('#gugun').html("");
			}

		});
		
		$('#vt_class').change(function() {
			var sendData = 'class_no=' + $('#vt_class option:selected').val() + '&dclass_no=0';
			if($('#vt_class option:selected').val() != 0){
				$.post('dclassList.do', sendData, function(data) {
					$('#res').html(data);
				});
			}else{
				$('#res').html("");
			}
		});
		
		$('#search').click(function(){
			list(1);
		});
	});
	
	function list(pageNum){
		$('#vlist').html("");
		var sido = $('#sido option:selected').text();
		if(sido == '전체'){
			sido = "";
		}
		var gugun = $('#gugun option:selected').text();
		if(gugun =='전체'){
			gugun = "";	
		}
		
		var addr = sido + " " + gugun;
		
		var rsdate = $('#rsdate').val();
		var redate = $('#redate').val();
		var asdate = $('#asdate').val();
		var aedate = $('#aedate').val();
		if(rsdate == ""){
			rsdate = "1900-01-01";
		}
		if(redate == ""){
			redate = "2999-12-31";
		}
		if(asdate == ""){
			asdate = "1900-01-01";
		}
		if(aedate == ""){
			aedate = "2999-12-31";
		}
		
		var rec_param = {
				"addr"  : addr,
				"vt_r_start_date" : rsdate,
				"vt_r_end_date" : redate,
				"vt_a_start_date" : asdate,
				"vt_a_end_date" : aedate,
				"vt_class" : $('#vt_class').val(),
				"vt_dclass" : $('#vt_dclass').val() != null ? $('#vt_dclass').val() : 0 ,
				"vt_subject" : $('#vt_subject').val(),
				"vt_name" : $('#vt_name').val(),
				"vt_r_yn" : $('#vt_r_yn').val(),
				"pageNum" : pageNum
		};
		var sndData = $.param(rec_param);
		$.post('volSearchList.do', sndData, function(data) {
			$('#vlist').html(data);
		});
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

.ry{
	border-radius: 0.5em;
	padding: 0 .5em 0 .5em;
	font-size: 0.75em;
	color: white;
	background: rgba(0, 0, 255, 0.5);
}

.rn{
	border-radius: 0.5em;
	padding: 0 .5em 0 .5em;
	font-size: 0.75em;
	color: white;
	background: rgba(255, 0, 0, 0.5);
}

</style>
</head>
<body>
	<div class="container">
		<div class="col-md-offset-14 col-md-5"
			style="margin-left: 0; margin-top: 0;">
			<div class="form-area req-container">
					<h4 style="margin-bottom: 25px; text-align: center;">통합봉사조회</h4>
					<p class="req-form-name">검색 조건</p>
					<div class="form-group">
						<b>봉사지역: </b>
							<select id="sido" name="sido_no"class="form-control-40" style="display: inline; width: 150; ">
								<option value="0">전체</option>
						    	<c:forEach var="addr" items="${addr}">
									<option value="${addr.sido_no}">${addr.sido_name}</option>
								</c:forEach>
							</select>
							<span id="gugun"></span>
					</div>
					<div class="form-group">
						<div>
							<b>모집 기간</b> <b>시작일:</b><input class='form-control-20'
								type='date' name='vt_r_start_date' id='rsdate'
								value='${rec.vt_r_start_date}' /> <b>종료일:</b><input
								class='form-control-20' type='date' name='vt_r_end_date'
								id='redate' value='${rec.vt_r_start_date}' />
						</div>
						<div>
							<b>봉사 기간</b> <b>시작일:</b><input class='form-control-20'
								type='date' name='vt_a_start_date' id='asdate'
								value='${rec.vt_a_start_date}' /> <b>종료일:</b><input
								class='form-control-20' type='date' name='vt_a_end_date'
								id='aedate' value='${rec.vt_a_start_date}' />
						</div>
					</div>
					<div class="form-group">
						<div style="float: left; width: 50%">
							<b style="display: block;">활동분야:</b> <select
								style="float: left; width: 50%" class="form-control-40"
								name="vt_class" id="vt_class">
								<option value="0">전체</option>
								<c:forEach var="cl" items="${list}">
									<option value="${cl.class_no }">${cl.class_name }</option>
								</c:forEach>
							</select>
							<span id="res"></span>
						</div>
					 	<div>
							<b>봉사 대상자:</b> <select class="form-control-40" name="vt_subject"
								id="vt_subject" style="display: block;">
								<option value="0">전체</option>
								<c:forEach var="sub" items="${slist}">
									<option value="${sub.sub_no }">${sub.sub_name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div style="float: left; width: 50%">
							<b>봉사 제목:</b> <input type="text" class="form-control-50" id="vt_name"
							name="vt_name" maxlength="100" required style="display: block;">
						
						</div>
						<div>
							<b>모집 상태:</b> 
							<select id="vt_r_yn" name="vt_r_yn" style="display: block;">
								<option value="ALL">전체</option>
								<option value="Y">모집 중</option>
								<option value="N">모집 완료</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<button
						class="btn btn-primary btn-md"
						style="margin-left: 5px; vertical-align: top;" id="search">검색</button>
					</div>
					<div id="vlist">
					</div>
			</div>
		</div>
	</div>
</body>
</html>