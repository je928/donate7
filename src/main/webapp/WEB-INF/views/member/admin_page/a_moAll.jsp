<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$.post('a_memberAll.do',function(data){
	 		$('#mlist').html(data);
		});
	});
	
	$(function() {
		$.post('a_organAll.do',function(data){
	 		$('#olist').html(data);
		});
	});
	
	function m() {
		mlist.style.display='block';
		olist.style.display='none';
	}
	
	function o() {
		mlist.style.display='none';
		olist.style.display='block';		
	}
</script>
</head>
<body>

	<div class="text-right list-group2">
	<input type="button" id="m" name="m" class="btn btn-default2" onclick="m()" value="일반">
	<input type="button" id="o" name="o" class="btn btn-default2" onclick="o()" value="기관">
	</div>
	
	<div id="mlist" style="display:block">
	
	</div>
	
	<div id="olist" style="display:none">

	</div>

</body>
</html>