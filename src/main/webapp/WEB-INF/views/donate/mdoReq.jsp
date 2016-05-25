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
	<div class="col-md-offset-14 col-md-5" style="margin-left: 10%">
		<div class="form-area">
			<form action="mdoReq.do" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<b>제목</b>
					<div class="form-group">
						<input type="text" name="d_title" id="d_title" required="required">
					</div>
				</div>
				<div class="form-group">
					<b>사진첨부</b>
<%-- 					<c:if test="${not empty msg }">
							<font color="red">
								${msg }
							</font>
						</c:if>
						<c:if test="${not empty fileName }">
							<img src="/donate7/${fileName }">
						</c:if> --%>
					<div class="form-group">
						<input type="file" name="d_img" multiple="multiple" required="required">
					</div>
				</div>
				<div class="form-group">
					<b>내용</b>
					<div class="form-group">
						<textarea rows="10" cols="44" name="d_content" required="required"></textarea>
					</div>
				</div>
				<div class="form-group">
					<b>기부금 사용계획</b>
					<div class="form-group">
						<textarea rows="10" cols="44" name="d_plan" required="required" class="form-group"></textarea>
					</div>
				</div>
				<div class="form-group">
					<b>희망금액</b>
					<div class="form-group">
						<input type="text" name="d_amount" required="required" class="form-group">원
					</div>
				</div>
				<div class="form-group">
					<b>계좌번호</b>
					<div class="form-group">
						<input type="text" name="d_bank" id="d_bank" value="은행" required="required">
						<input type="text" name="d_account" id="d_account" value="계좌번호" required="required">
					</div>
				</div>
				<div style="margin-top: 40px; text-align: center;">
					<input type="submit" class="btn btn-primary btn-md" value="요청하기">
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>