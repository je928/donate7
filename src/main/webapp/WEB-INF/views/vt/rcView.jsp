<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<%@ include file="../session/orgChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.req-container {
	width: 900px;
}

.req-form-area {
	padding-top: 10px;
	padding-bottom: 10px;
}

.req-form-name {
	margin-bottom: 25px;
	text-align: left;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="container">
		<div class="col-md-offset-14 col-md-5"
			style="margin-left: 0; margin-top: 0;">
			<div class="form-area req-container">
				<input type="hidden" name="vt_o_no" value="${sessionScope.no}">
				<h4 style="margin-bottom: 25px; text-align: center;"></h4>
				<div class="form-area req-form-area">
					<p class="req-form-name">봉사 상세</p>
					<div class="form-group">
						<b>봉사명:</b> ${rc.vt_name }
					</div>
					<div class="form-group">
						<b>봉사장소 : </b>${addr}
					</div>
					<div class="form-group">
						<b>봉사 기관 : </b>${rc.o_oname}
					</div>
					<div class="form-group">
						<b style="display: inline;">봉사 모집 기간 :</b> ${rc.vt_r_start_date} ~
						${rc.vt_r_end_date}
						<b style="display: inline; margin-left: 16.25%">봉사 활동 기간 :</b> ${rc.vt_a_start_date }
						~ ${rc.vt_a_end_date }
					</div>
					<div class="form-group">
						<div style="float: left; width: 50%">
							<b style="display: block; float: left;">활동분야:</b><span>${rc.class_name }
								${rc.dclass_name}</span>
						</div>
						<div>
							<b>봉사 대상자:</b> ${rc.sub_name}
						</div>
					</div>
					<div class="form-group">
						<b>요청 인원:</b> ${rc.vt_tot }명
					</div>
					<div class="form-group">
						<b style="display: block;">상세 내용:</b>
						<pre class="">${rc.vt_desc}</pre>
					</div>
				</div>
				<div style="margin-top: 40px; text-align: center;">
						<c:if test="${rc.vt_r_yn == 'N'}">
							<c:if test="${chk > 0}">
								<input type="button" class="btn btn-primary btn-md" value="봉사 활동 결과 확인"
								onclick="location.href='volResultView.do?vt_no=${rc.vt_no}'">
							</c:if>
							<c:if test="${chk == 0}">
								<input type="button" class="btn btn-primary btn-md" value="봉사 활동 결과 입력"
								onclick="location.href='volResult.do?vt_no=${rc.vt_no}'">
							</c:if>
							
						</c:if>
						
						<input type="button" class="btn btn-primary btn-md" value="수정"
							onclick="location.href='rcUpdate.do?vt_no=${rc.vt_no}&pageNum=${pageNum}'">
						<input type="button" class="btn btn-primary btn-md" value="뒤로"
							onclick="location.href='myRecruit.do?pageNum=${pageNum}'">
					</div>
			</div>
		</div>
	</div>
</body>
</html>