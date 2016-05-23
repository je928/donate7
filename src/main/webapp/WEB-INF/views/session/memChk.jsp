<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sessionChk.jsp" %>
<%
	if(no < 0) {
%>
		<script type="text/javascript">
			if(confirm("일반 회원 전용 페이지입니다. 로그인 하시겠습니까?")){
				location.href="login.do";	
			}else{
				
			}
		</script>
<%
	}
%>
