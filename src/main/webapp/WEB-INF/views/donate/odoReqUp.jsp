<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
   function readURL(input, id) {
      if (input.files && input.files[0]) {
         var reader = new FileReader();
         reader.onload = function(e) {
            $('#' + id).attr('src', e.target.result);
         }
         reader.readAsDataURL(input.files[0]);
      }
     
   }
</script>
</head>
<body>
	<form action="odoReqUp.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="d_no" value="${donate.d_no}">
		<table class="table table-striped table-hover">		
			<tr>
				<th>제목</th>
				<td><input type="text" name="d_title" id="d_title"
					required="required" value="${donate.d_title }"></td>
			</tr>
			<tr>
				<th>사진첨부</th>
				<td><img src="image/${donate.d_img }" width="80%" id="imgUp">
					<input type="file" name="img" id="fileD" onchange="readURL(this,'imgUp');"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="90" name="d_content"
					required="required">${donate.d_content }</textarea></td>
			</tr>
			<tr>
				<th>기부 기간</th>
				<td><input type="date" name="d_start_date"  id="d_start_date" value="${donate.d_start_date}">
					 ~ <input type="date" name="d_end_date" id="d_end_date" value="${donate.d_end_date}"></td>
			</tr>
			<tr>
				<th>기부금 사용계획</th>
				<td><textarea rows="10" cols="90" name="d_plan"
					required="required">${donate.d_plan }</textarea></td>
			</tr>
			<tr>
				<th>희망금액</th>
				<td><input type="text" name="d_amount" required="required"
				 		value="${donate.d_amount }">원</td>
			</tr>
			<tr>
			<th>계좌번호</th>
			<td><input type="text" name="d_bank" id="d_bank" required="required"
				value="${donate.d_bank }"> <input type="text" name="d_account"
				id="d_account" required="required" value="${donate.d_account }"></td>
			</tr>
		</table>
			<div align="center">
				<input type="submit" class="btn btn-primary btn-md" value="수정완료">
			</div>
	</form>
</body>
</html>