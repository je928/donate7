<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<%@ include file="../session/memChk.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.ts{
	width: 300px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
table {table-layout: fixed;}
</style>
<title>Insert title here</title>
</head>
<body>
		<div class="row">
			<div class="col-md-9-2">
				<table class="table table-striped table-hover">
					<caption>배송 요청 내역</caption>
					<tr>
						<th>제품</th>
						<th>받는사람</th>
						<th>수량</th>
						<th>주소</th>
						<th>전화번호</th>
						<th>배송상태</th>
					</tr>
					<c:forEach items="${list }" var="li">
						<c:set var="ds" value="${ds.selectOne(li.pr_no) }"/>
						<tr>
							<td>${ds.pr_proname }</td>
							<td>${li.pb_name }</td>
							<td>${li.pb_buyqty }</td>
							<td class="ts">${li.pb_addr }</td>
							<c:if test="${li.pb_delivery =='n'}">
								<td>배송준비중</td>
							</c:if>
							<c:if test="${li.pb_delivery =='y'}">
								<td>배송중</td>
							</c:if>
							<c:if test="${li.pb_delivery =='o'}">
								<td>배송완료</td>
							</c:if>
							<td><a href="am_delivery.do?pb_no=${li.pb_no }&pr_no=${li.pr_no }&pb_mono=${li.pb_mono}">자세히보기</a></td>
						</tr>
						
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>

