<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<%@ include file="../session/orgChk.jsp"%>

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
				<table border="1">
					<caption>봉사 수요 요청 관리</caption>
					<tr>
						<th>번호</th>
						<th>봉사명</th>
						<th>분야</th>
						<th>기간</th>
						<th>주기</th>
						<th>인원</th>
						<th>신청</th>
						<th>모집여부</th>
					</tr>
					<c:forEach var="vol" items="${list }">
						<tr>
							<td>${vol.vt_No}</td>
							<td><a href="volReqView.do?vt_No=${vol.vt_No}">${vol.vt_Name }</a></td>
							<td>${vol.vt_Field }</td>
							<td>${vol.vt_Start_Date }~${vol.vt_End_Date }</td>
							<td>${vol.vt_Cycle }</td>
							<td>${vol.vt_Total }</td>
							<td></td>
							<td>${vol.vt_Recruit_Yn }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>