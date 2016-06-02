<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String no = String.valueOf(session.getAttribute("no"));
	if(no == null || no.equals("") || no.equals("null")) {
%>
		<script type="text/javascript">
			alert("로그인을 하셔야 이용할 수 있는 페이지입니다.");
			location.href="login.do";
		</script>
<%
	} else {
		int o_no = Integer.parseInt(no);
		if(o_no > 0) {
%>
		<script type="text/javascript">
			alert("시설관리자 회원 전용 페이지입니다.");
			history.back();
		</script>
<%
		}
	}
%>
