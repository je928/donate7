<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<%@ include file="../session/orgChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		list(1);
		$('#searchType').change(function() {
			var type = $('#searchType option:selected').val();
			if (type != 'all') {
				$('#dt').html("<b>시작일:</b><input class='form-control-20' type='date' id='sdate'/> <b>종료일:</b><input class='form-control-20' type='date' id='edate'/>");
			}else{
				$('#dt').html("");
			}
		});
		
		$('#btnSearch').click(function(){
			list(1);
		});
	});
	
	
	function list(pageNum){	
		var sdate = $('#sdate').val();
		var edate = $('#edate').val();	
		var searchType = $('#searchType option:selected').val();
		var rsdate = "1900-01-01";
		var redate = "2999-12-31";
		var asdate = "1900-01-01";
		var aedate = "2999-12-31";

		if(searchType == 'r'){
			if(sdate){
				rsdate = sdate;
			}
			if(edate){
				redate = edate;
			}
		}else if(searchType == 'a'){
			if(sdate){
				asdate = sdate;
			}
			if(edate){
				aedate = edate;
			}
		}		
		var vt_name = $('#vt_name').val();
		var rec_param = {
				"vt_o_no" : 0,
				"vt_r_start_date" : rsdate,
				"vt_r_end_date" : redate,
				"vt_r_yn" : "ALL",
				"vt_a_start_date" : asdate,
				"vt_a_end_date" : aedate,
				"vt_name" : vt_name,
				"pageNum" : pageNum
		};		
		var sndData = $.param(rec_param);
		$.post('myRecruitList.do', sndData, function(data) {
			$('#vlist').html(data);
		});
	}
</script>
<style type="text/css">
span {
	border-radius: 0.5em;
	padding: 0 .5em 0 .5em;
	font-size: 0.75em;
	color: white;
}

.ry {
	background: rgba(0, 0, 255, 0.5);
}

.rn {
	background: rgba(255, 0, 0, 0.5);
}
</style>
</head>
<body>
	<div class="container">
		<div class="col-md-offset-14"
			style="margin-left: 0; margin-top: 0; margin-right: 0;">
			<div id="search" style="color: black;">
					<select name="searchType" id="searchType" class="form-control-40"
						style="width: auto; display: inline;">
							<option value="all">선택없음</option>
							<option value="r">모집기간</option>
							<option value="a">봉사기간</option>
					</select> <span id="dt" style="color: black;"></span> <b>봉사명 : </b><input
						type="text" name="vt_name" id="vt_name">
					<input type="hidden" id="vt_o_no" name="vt_o_no" value="${sessionScope.no}">
					<input type="button" class="btn btn-primary btn-md" value="검색" id="btnSearch">
			</div>
			<div id="vlist">
			</div>
		</div>
		
		
	</div>
</body>
</html>