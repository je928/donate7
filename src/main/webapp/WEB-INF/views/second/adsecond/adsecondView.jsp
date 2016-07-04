<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../../module/header.jsp"%>
<!DOCTYPE html >
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
			<tr><th>승인여부</th>
				<td><c:if test="${second.sh_approve eq 'y'}">
					<span class="ok_y">승인완료</span>
				</c:if> 
				<c:if test="${second.sh_approve eq 'n'}">
					<span class="ok_x">승인대기</span>
				</c:if>
			</td>
			</tr>
		</table>
		
		
	
		<div align="center">
		
		
			<c:if test="${second.sh_approve eq 'n'}">
				<button onclick="location.href='spUpdate.do?sh_no=${second.sh_no}'">승인</button>
			</c:if>
			<c:if test="${second.sh_approve eq 'y'}">
				<button onclick="location.href='spCancel.do?sh_no=${second.sh_no}'">거부</button>
			</c:if>
			<c:if test="${second.sh_mno<0 }">
				<button onclick="location.href='adorList.do'">리스트</button>
			</c:if>	
			<c:if test="${second.sh_mno>0 }">
				<button onclick="location.href='admemList.do'">리스트</button>
			</c:if>
			</div>
			

		
		
	
</body>
</html>