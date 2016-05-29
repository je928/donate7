<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sessionChk.jsp" %>
<%
	if(!no.equals("1")) {
%>
		<script type="text/javascript">
			alert("관리자 전용 페이지입니다.");
			history.back();
		</script>
<%
	}
%>
