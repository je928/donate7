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
<input type="hidden" name="d_member" value="${sessionScope.no}">
	<table class="table table-striped table-hover">
			<tr>
				<th>제목</th>
				<td>${donate.d_title }</td>
			</tr>
			<tr>	
				<th>사진</th>
				<td><img src="/donate7/${donate.d_img }" width="80%"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${donate.d_content}</td>
			</tr>
			<tr>
				<th>기부 기간</th>				
					<td>
					${donate.d_start_date}
					 ~ ${donate.d_end_date}</td>
			</tr>
			<tr>
				<th>기부금 사용계획
				<td>${donate.d_plan}</td>
			</tr>
			
			<tr>
				<th>희망금액</th>
				<td>${donate.d_amount }</td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td>${donate.d_bank } ${donate.d_account }</td>
			</tr>
		</table>
		<div align="center">
				<button onclick="location.href='odoList.do'">목록</button>			
				<button onclick="location.href='odoReqUp.do?d_no=${donate.d_no}'">수정</button>
				<button onclick="location.href='odoReqD.do?d_no=${donate.d_no}'">삭제</button>
		</div>
</body>
</html>