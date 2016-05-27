<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../module/header.jsp"%>
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
	<form action="msecondUpdate.do" method="post" enctype="multipart/form-data">
	<input type ="hidden" name="sh_no" value="${second.sh_no }">
		<table class="table table-striped table-hover">
			<caption>요청글 수정</caption>
			<tr>
				<th>제목</th>
				<td><input type="text" name="sh_title" required="required" value="${second.sh_title }" ></td>
			</tr>
			<tr>
				<th>사진</th>
				<td> <img src="/donate7/${second.sh_image}" width="300px" id="UploadImg1">				
				<input type="file" name="image" id="file1" onchange="readURL(this,'UploadImg1');"></td>
			</tr>
			<tr>
				<th>상품종류</th>
				<td><input type="text" name="sh_category" required="required" value="${second.sh_category }"></td>
			</tr>
			<tr>
				<th>설명</th>
				<td><textarea rows="10" cols="100" name="sh_explanation" required="required" >${second.sh_explanation }</textarea></td>
			</tr>
		</table>
		<div align="center">
			<input type="submit" value="수정완료">
			<input type="reset" value="취소">
		</div>
	</form>
</body>
</html>