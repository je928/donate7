<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String no = session.getAttribute("no").toString();
	if(no == null || no.equals("") || no.equals("null")) {
%>
		<script type="text/javascript">
			alert("로그인을 하셔야 이용할 수 있는 페이지입니다.");
			location.href="login.do";
		</script>	
<%
	}else{
		int orgNo = Integer.parseInt(no);
		if(orgNo >= 0){
%>
		<script type="text/javascript">
			if(confirm("시설관리자담당자 전용 페이지 입니다.")){
				location.href="login.do";
			}
		</script>
<%
		}
	}
%>