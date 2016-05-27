<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	var sendData = 'o_no=${organ.o_no}'
		$.post('map.do', sendData, function(data) {
			$('#omap').html(data);
		});

});

</script>
</head>
<body>
	<div class="container">
		<div class="col-md-offset-14 col-md-5" style="margin-left: 10%">
			<div class="form-area">

				<table border="1">
					<tr>
						<td colspan="2">
							<div id="omap" style="width: 300; height: 300"></div>
						</td>
					</tr>
					<tr>
						<th>기관명</th>
						<td>${organ.o_oname }</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${organ.o_addr }</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>