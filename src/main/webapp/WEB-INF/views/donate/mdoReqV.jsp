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
	<form action="mdoReq.do" method="post" enctype="multipart/form-data">
		<div>
			<b>제목</b>
			<div>
				<input type="text" name="d_title" id="d_title" required="required"
					value="${donate.d_title }">
			</div>
		</div>
		<div>
			<b>사진첨부</b>
<%-- 				<c:if test="${not empty msg }">
					<font color="red">
						${msg }
					</font>
				</c:if>
				<c:if test="${not empty fileName }">
					<img src="/donate7/${fileName }">
				</c:if> --%>
			<div>
				<input type="file" name="d_img" multiple="multiple" required="required"
					value="${donate.d_img }">
			</div>
		</div>
		<div>
			<b>내용</b>
			<div>
				<textarea rows="10" cols="30" name="d_content" required="required"
					value="${d_content}"></textarea>
			</div>
		</div>
		<div>
			<b>기부금 사용계획</b>
			<div>
				<textarea rows="10" cols="30" name="d_plan" required="required"
					value="${d_plan}"></textarea>
			</div>
		</div>
		<div>
			<b>희망금액</b>
			<div>
				<input type="text" name="d_amount" required="required"
					value="${donate.d_amount }">원
			</div>
		</div>
		<div>
			<b>계좌번호</b>
			<div>
				<input type="text" name="d_bank" id="d_bank" value="은행" required="required"
					value="${donate.d_bank }">
				<input type="text" name="d_account" id="d_account" value="계좌번호" required="required"
					value="${donate.d_account }">
			</div>
		</div>
		<div>
			<button onclick="location.href='mdoList.do'">목록</button>
			<button onclick="">수정</button>
			<button onclick="">삭제</button>
		</div>
	</form>
</div>
</body>
</html>