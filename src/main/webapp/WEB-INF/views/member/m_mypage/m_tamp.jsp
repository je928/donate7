<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp" %>
<%@ include file="../../session/memChk.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-offset-17">
				<h3 class="page-header">MYPAGE
					<small>${member.m_nick}님</small>
				</h3>
				<ol class="breadcrumb">
					<li>
						<a href="main.do">Home</a>
					</li>
					<li class="active">
						mypage
					</li>
				</ol>
			</div>
		</div>
    
        <div class="row">
            <div class="col-md-3-2">
                <jsp:include page="m_navbar.jsp" />
            </div>
            <div class="col-md-9-2">
            	<c:if test="${empty mypgm}">
					<jsp:include page="m_index.jsp"/>
				</c:if> 
				<c:if test="${not empty mypgm}">
					<jsp:include page="${mypgm}"/>
				</c:if>
            </div>
        </div>
   </div>
 
</body>
</html>