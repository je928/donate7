<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp" %>

<c:if test="${result == 1}">
	<c:out value="TRUE" />
</c:if>
<c:if test="${result == 0}">
	<c:out value="FALSE" />
</c:if>

