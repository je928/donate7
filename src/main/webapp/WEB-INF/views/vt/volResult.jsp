<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp" %>
<%@ include file="../session/orgChk.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<script type="text/javascript">
	$(document).ready(function(){
		var pvt_no = '${vt_no}';
		var vt_no = parseInt(pvt_no);
		list(vt_no);
	});
	
	function list(vt_no){
		var sndData = "vt_no="+vt_no;
		$.post('volResultList.do', sndData, function(data) {
			$('#mlist').html(data);
		});
	}
</script>
</head>
<body>
	<div class="container">
		<div class="col-md-offset-14"
			style="margin-left: 0; margin-top: 0; margin-right: 0;">
			<table class="table table-striped table-hover" style="width: 80%">
			
			</table>
			<form method="post" action="volResult.do"> 
				<div id="mlist">
				
				</div>
				<input type="submit" value="확인" class="btn btn-primary btn-md">
			</form>
		</div>
	</div>
</body>
</html>