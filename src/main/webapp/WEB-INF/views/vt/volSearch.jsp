<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		var sendData = 'sido_no=' + $('#sido option:selected').val();
		$.post('gugunList.do', sendData, function(data) {
			$('#gugun').html(data);
		});
		
		sendData = 'class_no=' + $('#cls option:selected').val();
		$.post('dclassList.do', sendData, function(data) {
			$('#res').html(data);
		});
		
		$('#sido').change(function() {
			var sendData = 'sido_no=' + $('#sido option:selected').val();
			$.post('gugunList.do', sendData, function(data) {
				$('#gugun').html(data);
			});
		});
		
		$('#cls').change(function() {
			var sendData = 'class_no=' + $('#cls option:selected').val();
			$.post('dclassList.do', sendData, function(data) {
				$('#res').html(data);
			});
		});
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

.ry{
	border-radius: 0.5em;
	padding: 0 .5em 0 .5em;
	font-size: 0.75em;
	color: white;
	background: rgba(0, 0, 255, 0.5);
}

.rn{
	border-radius: 0.5em;
	padding: 0 .5em 0 .5em;
	font-size: 0.75em;
	color: white;
	background: rgba(255, 0, 0, 0.5);
}

</style>
</head>
<body>
	<div class="container">
		<div class="col-md-offset-14 col-md-5"
			style="margin-left: 0; margin-top: 0;">
			<div class="form-area req-container">
				<form role="form" action="volSearch.do" method="post">
					<h4 style="margin-bottom: 25px; text-align: center;">통합봉사조회</h4>
					<p class="req-form-name">검색 조건</p>
					<div class="form-group">
						<b>봉사지역: </b>
							<select id="sido" name="sido_no"class="form-control-40" style="display: inline; width: 150; ">
								<option value="0">전체</option>
						    	<c:forEach var="addr" items="${addr}">
									<option value="${addr.sido_no}">${addr.sido_name}</option>
								</c:forEach>
							</select>
							<span id="gugun"></span>
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
							</select>
							<span id="res"></span>
						</div>
						<div>
							<b>봉사 대상자:</b> <select class="form-control-40" name="vt_subject"
								id="vt_subject" style="display: block;">
								<c:forEach var="sub" items="${slist}">
									<option value="${sub.sub_no }">${sub.sub_name }</option>
								</c:forEach>
							</select>
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
					<div class="form-group">
						<input type="submit"
						class="btn btn-primary btn-md"
						style="margin-left: 5px; vertical-align: top;" value="검색">
					</div>
				
				<table class="table table-striped table-hover" >
					<tr>
						<th>번호</th>
						<th>모집 상태</th>
						<th>봉사 지역</th>
						<th>봉사 기관</th>
						<th>봉사 제목</th>
						<th>활동 분야</th>
						<th>모집인원</th>
						<th>신청자수</th>
					</tr>
					<c:forEach var="result" items="${result}">
						<tr>
							<td>${result.vt_no }</td>
							<td><c:if test="${result.vt_r_yn eq 'Y' }">
								<span class="ry">모집 중</span>
							</c:if>
							<c:if test="${result.vt_r_yn eq 'N' }">
								<span class="rn">모집 완료</span>
							</c:if>
							</td>
							<td>${result.addr}</td>
							<td>${result.o_oname }</td>
							<td>${result.vt_name }</td>
							<td>${result.cn }</td>
							<td>${result.vt_tot }</td>
							<td>${result.count }</td>
						</tr>
					</c:forEach>
				</table>
				<div style="margin-left: 30%" id="paging">
			<c:if test="${paging.startPage != 1}">
				<a href="javascript:locate(1)">&lt;&lt;맨 앞으로</a>
			</c:if>
			<c:if test="${paging.startPage > paging.pagePerBlock}">
				<a href="javascript:locate(${startPage-pagePerBlock})">&lt;이전</a>
			</c:if>
			<c:forEach var="i" begin="${paging.startPage}"
				end="${paging.endPage}">
				<c:if test="${i != paging.nowPage}">
					<a href="javascript:locate(${i})">[${i}]</a>
				</c:if>
				<c:if test="${i == paging.nowPage}">
					<b class="b">[${i}]</b>
				</c:if>
			</c:forEach>
			<c:if test="${paging.totalPage > paging.endPage}">
				<a href="javascript:locate(${paging.startPage+paging.pagePerBlock})">다음&gt;</a>
			</c:if>
			<c:if test="${paging.endPage != paging.totalPage}">
				<a href="javascript:locate(${paging.totalPage})">맨 뒤로&gt;&gt;</a>
			</c:if>
			</form>
		</div>
			</div>
		</div>
	</div>
</body>
</html>