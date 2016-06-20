<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../module/header.jsp" %>
<%@ include file="../../session/memChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function cl() {
		self.close();		
	}
</script>
</head>
<body>
<form action="reg_pro.do" method="post" name="frm">
신고된 날짜 : <fmt:formatDate value="${warn.wa_date }"/><p>
신고 유형 : ${sort }<p>
<c:if test="${ warn.getWa_sort()=='b'}">
신고 당한 (댓)글 내용:<textarea rows="2" cols="50" readonly="readonly">${content }</textarea><p>
</c:if>
<c:if test="${ warn.getWa_sort()=='d'}">
봉사에서 경고처리<p>
</c:if>
<a href="javascript:cl()"class="btn btn-sm btn-primary">확인</a>
</form>
</body>
</html>