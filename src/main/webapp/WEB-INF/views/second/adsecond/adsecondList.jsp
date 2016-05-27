<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<form action="adsecondList.do">
			<table class="table table-striped table-hover">
				<caption>중고기부 내역</caption>
				<tr>
					<th width="60">번호</th>
					<th width="60">제목</th>
					<th width="60">상품종류</th>
					<th width="60">등록일</th>
					<th width="60">승인여부</th>
					<th width="60">도착여부</th>
				</tr>
				<c:forEach var="second" items="${list }">
					<tr>
						<th>${second.sh_no }</th>
						<th><a href="adsecondView.do?sh_no=${second.sh_no }">${second.sh_title }</a></th>
						<th>${second.sh_category }</th>
						<th>${second.sh_reg_date }</th>
						<th>${second.sh_approve }</th>
						<th>${second.sh_arrive }</th>
					</tr>
				</c:forEach>

			</table>
		</form>

	</div>

</body>
</html>