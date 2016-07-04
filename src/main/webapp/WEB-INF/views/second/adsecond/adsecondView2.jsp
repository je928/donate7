<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@include file="../../module/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-striped table-hover">
			<tr><th>제목</th><td>${second.sh_title }</td></tr>
			<tr><th>글쓴이</th><td>${second.email }</td></tr>
			<tr><th>이미지</th><td><img src="/donate7/${second.sh_image }" width="300px"></td></tr>
			<tr><th>상품종류</th><td>${second.sh_category }</td></tr>
			<tr><th>등록일</th><td>${second.sh_reg_date }</td></tr>
			<tr><th>설명</th><td>${second.sh_explanation }</td></tr>
			<tr><th>도착여부</th>
			<td><c:if test="${second.sh_arrive eq 'y'}">
					<span class="label label-success">도착확인</span>
				</c:if> 
				<c:if test="${second.sh_arrive eq 'n'}">
					<span class="label label-warning">도착미확인</span>
				</c:if>
			</td>
			</tr>
			
			
		</table>
		
			
		<div align="center">
			<c:if test="${second.sh_arrive eq 'n'}">
				<button onclick="location.href='srUpdate.do?sh_no=${second.sh_no}'">도착</button>
			</c:if>
			<c:if test="${second.sh_arrive eq 'y'}">
				<button onclick="location.href='srCancel.do?sh_no=${second.sh_no}'">확인중</button>
			</c:if>
				<button onclick="location.href='admemList.do'">리스트</button>
		</div>
		
</body>
</html>