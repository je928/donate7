<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		var chk = window.navigator.userAgent;
		if(chk.indexOf('Chrome') > 0){
			location.href = "main.do";
		}else{
			alert('크롬 브라우저로 실행해 주세요.');
		}
	</script>
</body>
</html>
