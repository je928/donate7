<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../module/header.jsp" %>
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
	신고처리 완료 되었습니다.<br>
	<a href="javascript:cl()" class="btn btn-sm btn-warning">확인</a>	
</c:if>
<c:if test="${msg==null }">
<form action="reg_pro.do" method="post">
신고한 사람 : <input type="text" readonly="readonly" value="${reporter }"><p>
신고당한 사람 : <input type="text" readonly="readonly" value="${reported }"><p>
신고 날짜 : <fmt:formatDate value="${reg.re_date }"/><p>
<input type="hidden" name="reported_no" value="${reg.reported_no}">
<input type="hidden" name="reported_no" value="${reg.reporter_no}">
신고 사유 : <textarea name="re_content" rows="3" cols="50" readonly="readonly">${reg.re_content }</textarea><p>
신고 당한 (댓)글 내용:<textarea rows="2" cols="50" readonly="readonly">${content }</textarea><p>
<c:if test="${reg.re_chk == 'n' }">
	<input type="button" value="신고 보류(처리 안함)" onclick="location.href='reg_proX.do?re_no=${reg.re_no}'">
	<input type="button" value="신고 처리" onclick="location.href='reg_proY.do?re_no=${reg.re_no}'">	
</c:if>
<c:if test="${reg.re_chk == 'y' }">
	신고 처리
</c:if>
<c:if test="${reg.re_chk == 'c' }">
	신고 보류
</c:if>
</form>
</c:if>
</body>
</html>