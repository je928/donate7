<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../module/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function cl() {
		self.close();
		window.opener.location.reload(true);
	}
</script>
</head>
<body>
<c:if test="${msg!=null }">
	충전 되었습니다.<br>
	<a href="javascript:cl()" class="btn btn-sm btn-warning">확인</a>	
</c:if>
<c:if test="${msg==null }">
<form action="addCash.do" method="post">
충전 캐시 : <input type="number" name="cp_point"><p>
<input type="submit" value="충전">
</form>
</c:if>
</body>
</html>