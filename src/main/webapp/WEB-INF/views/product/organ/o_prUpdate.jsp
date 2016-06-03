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

	<form action="o_prUpdate.do" method="post" enctype="multipart/form-data">
	<input type ="hidden" name="pr_no" value="${product.pr_no }">
		<table class="table table-striped table-hover">
			<caption>요청글 수정</caption>
			<tr>
				<th>제목</th>
				<td><input type="text" name="pr_proname" required="required" value="${product.pr_proname }" ></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="number" name="pr_price" required="required" value="${product.pr_price }"></td>
			</tr>
			<tr>
				<th>수량</th>
				<td><input type="number" name="pr_qty" required="required" value="${product.pr_qty }" ></td>
			</tr>
			<tr>
				<th>종류</th>
				<td>
				
					<input type="radio" name="pr_item" required="required" value="Fashion"
						<c:if test="${product.pr_item eq 'Fashion' }" >checked</c:if> >Fashion &nbsp;
					<input type="radio" name="pr_item" required="required" value="Design"
						<c:if test="${product.pr_item eq 'Design' }" >checked</c:if> >Design &nbsp;
					<input type="radio" name="pr_item" required="required" value="Smart Phone"
						<c:if test="${product.pr_item eq 'Phone Case' }" >checked</c:if> >Phone Case &nbsp;
					
					
				</td>
			</tr>
			<tr>
				<th>기부처</th>
				<td><input type="text" name="pr_donation" value="${product.pr_donation }" required="required" ></td>
			</tr>
			<tr>
				<th>사진</th>
				<td> <img src="image/${product.pr_img}" width="300px" id="UploadImg1">				
				<input type="file" name="oimg" id="file1" onchange="readURL(this,'UploadImg1');"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="100" name="pr_content" required="required" >${product.pr_content }</textarea></td>
			</tr>
			<tr>
				<th>요청메세지</th>
				<td><textarea rows="5" cols="100" name="pr_callm" required="required">${product.pr_callm }</textarea></td>
			</tr>
			
		</table>
		<div align="center">
			<input type="submit" value="수정완료">
			<input type="reset" value="취소">
		</div>
	</form>
</body>
</html>