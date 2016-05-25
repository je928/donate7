<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<form action="" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>제목</th>
				<td>${donate.d_title }</td>
			</tr>
			<tr>	
				<th>사진첨부</th>
				<td>${donate.d_img }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${donate.d_content}</td>
			</tr>
			<tr>
				<th>기부금 사용계획
				<td>${donate.d_plan}</td>
			<tr>
				<th>희망금액</th>
				<td>${donate.d_amount }</td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td>${donate.d_bank } ${donate.d_account }</td>
			</tr>
			<div>
				<button onclick="location.href='mdoList.do'">목록</button>
				<button onclick="">수정</button>
				<button onclick="">삭제</button>
			</div>	
		</table>
	</form>
</div>
</body>
</html>