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
					<tr>
						<th rowspan="8">봉사 상세 내용</th>
						<th>봉사명</th>
						<td>${volReq.vt_Name}</td>
					</tr>
					<tr>
						<th>등록일</th>
						<td>${volReq.vt_Reg_Date }</td>
					</tr>
					<tr>
						<th>봉사 대상자</th>
						<td>${volReq.vt_Subject }</td>
					</tr>
					<tr>
						<th>요청 인원</th>
						<td>${volReq.vt_Total }</td>
					</tr>
					<tr>
						<th>뢍존분야</th>
						<td>${volReq.vt_Field }</td>
					</tr>
					<tr>
						<th>활동주기</th>
						<td>${volReq.vt_Cycle }</td>
					</tr>
					<tr>
						<th>활동기간</th>
						<td>${volReq.vt_Start_Date}~ ${volReq.vt_End_Date }</td>
					</tr>
					<tr>
						<th>상세내용</th>
						<td><pre>${volReq.vt_Desc }</pre></td>
					</tr>
					<tr>
						<th rowspan="3">담당자 정보</th>
						<th>담당자명</th>
						<td>${volReq.vt_Mgr }</td>
					</tr>
					<tr>
						<th>담당자 연락처</th>
						<td>${volReq.vt_Mgr_Tel }</td>
					</tr>
					<tr>
						<th>담당자 이메일</th>
						<td>${volReq.vt_Mgr_Email }</td>
					</tr>
					<tr>
						<th rowspan="4">자격조건</th>
						<th>봉사자 연령</th>
						<td>${volReq.vt_Age }</td>
					</tr>
					<tr>
						<th>봉사자 성별</th>
						<td>${volReq.vt_Gender }</td>
					</tr>
					<tr>
						<th>자격요건</th>
						<td>${volReq.vt_Qualify }</td>
					</tr>
					<tr>
						<th>사전교육</th>
						<td>${volReq.vt_Prior_Edu }</td>
					</tr>
				</table>
				<button onclick="location.href='manageVol.do'">목록으로</button>
				<button onclick="location.href='reqUpdate.do?vt_No=${volReq.vt_No}'">수정</button>
				<button onclick="location.href='reqCancel.do?vt_No=${volReq.vt_No}'">삭제</button>
			</div>
		</div>
	</div>
</body>
</html>