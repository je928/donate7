<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
				
	});
</script>
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
				<form role="form" action="recruit.do" method="post">
					<h4 style="margin-bottom: 25px; text-align: center;">통합봉사조회</h4>
					<p class="req-form-name">검색 조건</p>
					<div class="form-group">
						<b>봉사지역: </b>
							<select name="addr_sido" class="form-control-40" style="display: inline; width: 100">
								<option value="0">전체</option>
						    <%--<c:forEach var="${}" items="${}">
									<option value=""></option>
								</c:forEach> --%>
							</select>
							<select name="addr_gugun" class="form-control-40" style="display: inline; width: 100">
								<option value="0">전체</option>
								<%-- <c:forEach var="${}" items="${}">
									<option value=""></option>
								</c:forEach> --%>
							</select>
					</div>
					<div class="form-group">
						<div>
							<b>모집 기간</b> <b>시작일:</b><input class='form-control-20'
								type='date' name='vt_r_start_date' id='rsdate'
								value='${rec.vt_r_start_date}' /> <b>종료일:</b><input
								class='form-control-20' type='date' name='vt_r_end_date'
								id='redate' value='${rec.vt_r_start_date}' />
						</div>
						<div>
							<b>봉사 기간</b> <b>시작일:</b><input class='form-control-20'
								type='date' name='vt_a_start_date' id='asdate'
								value='${rec.vt_a_start_date}' /> <b>종료일:</b><input
								class='form-control-20' type='date' name='vt_a_end_date'
								id='aedate' value='${rec.vt_a_start_date}' />
						</div>
					</div>
					<div class="form-group">
						<div style="float: left; width: 50%">
							<b style="display: block;">활동분야:</b> <select
								style="float: left; width: 50%" class="form-control-40"
								name="cls" id="cls">
								<c:forEach var="cl" items="${list}">
									<option value="${cl.class_no }">${cl.class_name }</option>
								</c:forEach>
							</select><span id="res"> <select id="vt_class"
								class="form-control-40">
									<c:forEach var="dc" items="${dlist }">
										<option value="${dc.dclass_no }">${dc.dclass_name }</option>
									</c:forEach>
							</select>
							</span>
						</div>
						<div>
							<b>봉사 대상자:</b> <select class="form-control-40" name="vt_subject"
								id="vt_subject" style="display: block;">
								<c:forEach var="sub" items="${slist}">
									<option value="${sub.sub_no }">${sub.sub_name }</option>
								</c:forEach>
							</select> <span id="res"></span>
						</div>
					</div>
					<div class="form-group">
						<b>봉사 제목:</b> <input type="text" class="form-control-40" id="vt_name"
							name="vt_name" maxlength="100" onkeyup="nameChek()" required style="display: inline;">
						<b>모집 상태:</b> 
						<select name="vt_r_yn" style="display: inline;">
							<option value="Y">모집 중</option>
							<option value="N">모집 완료</option>
						</select>
					</div>
				</form>
				<table>
				</table>
			</div>
		</div>
	</div>
</body>
</html>