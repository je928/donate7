<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%-- <%@ include file="/css/bootstrap.jsp" %> --%>
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>
<div align="center">
<table class="table table-striped table-hover"><caption>중고기부 내역</caption>
	<tr><th width="60">번호</th><th width="60">제목</th>
		<th width="60">글쓴이</th><th width="60">상품종류</th>
		<th width="60">등록일</th><th width="60">승인여부</th><th width="60">도착여부</th></tr>

	<tr><th>${second.sh_no }</th>
		<th>${second.sh_title }</th>
		<th>글쓴이</th>
		<th>${second.sh_category }</th>
		<th>${second.sh_reg_date }</th>
		<th>${second.sh_approve }</th>
		<th>${second.sh_arrive }</th></tr>
</table>
<div align="center">
<button onclick="location.href='msecondForm.do'">요청하기</button>
</div>
</div>
</body>
</html>