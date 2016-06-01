<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function m() {
		mlist.style.display = 'block';
		olist.style.display = 'none';
	}

	function o() {
		mlist.style.display = 'none';
		olist.style.display = 'block';
	}
</script>
</head>
<body>

	<input type="button" id="m" name="m" class="btn btn-default2"
		onclick="m()" value="일반">
	<input type="button" id="o" name="o" class="btn btn-default2"
		onclick="o()" value="기관">

	<div id="mlist" style="display: block">
		<table class="table table-striped table-hover">
			<caption>일반 요청 내역</caption>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>회원 구분</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>승인여부</th>
			</tr>

			<c:set var="cnt" value="${count }" />
			<c:forEach var="donate" items="${list }">
				<c:if test="${donate.no>0}">
					<tr>
						<td>${cnt}</td>
						<td><a href="adView.do?d_no=${donate.d_no }">${donate.d_title }</a></td>
						<td>일반</td>
						<td>${donate.email }</td>
						<td>${donate.d_reg_date }</td>
						<td>${donate.d_approve }</td>
					</tr>
				</c:if>
			<c:set var="cnt" value="${cnt-1}" />
			</c:forEach>
		</table>
	</div>

	<div id="olist" style="display: none">
		<table class="table table-striped table-hover">
			<caption>기관 요청 내역</caption>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>회원 구분</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>승인여부</th>
			</tr>

			<c:set var="cnt" value="${count }" />
			<c:forEach var="donate" items="${list }">
				<c:if test="${donate.no<0}">
					<tr>
						<td>${cnt}</td>
						<td><a href="adView.do?d_no=${donate.d_no }">${donate.d_title }</a></td>
						<td>기관</td>
						<td>${donate.email }</td>
						<td>${donate.d_reg_date }</td>
						<td>${donate.d_approve }</td>
					</tr>
				</c:if>
				<c:set var="cnt" value="${cnt-1}" />
			</c:forEach>
		</table>
	</div>

</body>
</html>