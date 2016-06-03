<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$('#searchType').val('${rec.searchType == null ? "all" : rec.searchType}').attr('selected', 'selected');
		var type = $('#searchType option:selected').val();
		if (type == 'r') {
			$('#dt').html("<b>시작일:</b><input class='form-control-20' type='date' name='vt_r_start_date' value='${rec.vt_r_start_date}'/> <b>종료일:</b><input class='form-control-20' type='date' name='vt_r_end_date' value='${rec.vt_r_start_date}'/>");
		} else if (type == 'a') {
			$('#dt').html("<b>시작일:</b><input class='form-control-20' type='date' name='vt_a_start_date' value='${rec.vt_a_start_date}'/> <b>종료일:</b><input class='form-control-20' type='date' name='vt_a_end_date' value='${rec.vt_a_start_date}'/>");
		} else{
			$('#dt').html("");
		}
		
		
		$('#searchType').change(function() {
			var type = $('#searchType option:selected').val();
			if (type == 'r') {
				$('#dt').html("<b>시작일:</b><input class='form-control-20' type='date' name='vt_r_start_date' value='${rec.vt_r_start_date}'/> <b>종료일:</b><input class='form-control-20' type='date' name='vt_r_end_date' value='${rec.vt_r_end_date}'/>");
			} else if (type == 'a') {
				$('#dt').html("<b>시작일:</b><input class='form-control-20' type='date' name='vt_a_start_date' value='${rec.vt_a_start_date}'/> <b>종료일:</b><input class='form-control-20' type='date' name='vt_a_end_date' value='${rec.vt_a_end_date}'/>");
			}else{
				$('#dt').html("");
			}

		});
	});

	function locate(pageNum) {
		var type = $('#searchType option:selected').val();
		var vt_name = $('#vt_name').val();
		if (type == 'r') {
			$('#dt').html("<b>시작일:</b><input class='form-control-20' type='date' name='vt_r_start_date' id='rsdate' value='${rec.vt_r_start_date}'/> <b>종료일:</b><input class='form-control-20' type='date' name='vt_r_end_date' id='redate' value='${rec.vt_r_start_date}'/>");
			var rsdate = $('#rsdate').val();
			var redate = $('#redate').val();
			location.href = "myRecruit.do?pageNum=" + pageNum + "&searchType=" + type + "&vt_r_start_date=" + rsdate + "&vt_r_end_date=" + redate + "vt_name="+vt_name;
		} else if (type == 'a') {
			$('#dt').html("<b>시작일:</b><input class='form-control-20' type='date' name='vt_a_start_date' id='asdate' value='${rec.vt_a_start_date}'/> <b>종료일:</b><input class='form-control-20' type='date' name='vt_a_end_date' id='aedate' value='${rec.vt_a_start_date}'/>");
			var asdate = $('#asdate').val();
			var aedate = $('#aedate').val();
			location.href = "myRecruit.do?pageNum=" + pageNum + "&searchType=" + type + "&vt_a_start_date=" + asdate + "&vt_a_end_date=" + aedate + "&vt_name=" + vt_name;
		}else{
			location.href = "myRecruit.do?pageNum=" + pageNum + "&vt_name=" + vt_name;
		}
		
	}
</script>
<style type="text/css">
span {
	border-radius: 0.5em;
	padding: 0 .5em 0 .5em;
	font-size: 0.75em;
	color: white;
}

.ry {
	background: rgba(0, 0, 255, 0.5);
}

.rn {
	background: rgba(255, 0, 0, 0.5);
}
</style>
</head>
<body>
	<div class="container">
		<div class="col-md-offset-14"
			style="margin-left: 0; margin-top: 0; margin-right: 0;">
			<div id="search" style="color: black;">
				<form action="timeList.do" method="get">
					<select name="searchType" id="searchType" class="form-control-40"
						style="width: auto; display: inline;">
						<c:if test="${rec.searchType eq 'all'}">
							<option value="all" selected="selected">선택없음</option>
						</c:if>
						<c:if test="${rec.searchType ne 'all'}">
							<option value="all">선택없음</option>
						</c:if>
						<c:if test="${rec.searchType eq 'r'}">
							<option value="r" selected="selected">모집기간</option>
						</c:if>
						<c:if test="${rec.searchType ne 'r'}">
							<option value="r">모집기간</option>
						</c:if>
						<c:if test="${rec.searchType eq 'a'}">
							<option value="a" selected="selected">활동기간</option>
						</c:if>
						<c:if test="${rec.searchType ne 'a'}">
							<option value="a">활동기간</option>
						</c:if>
					</select> <span id="dt" style="color: black;"></span> <b>봉사명 : </b><input
						type="text" name="vt_name" id="vt_name" value="${rec.vt_name}"> <input type="submit"
						class="btn btn-primary btn-md"
						style="margin-left: 5px; vertical-align: top;" value="검색">
				</form>
			</div>
			<table class="table table-striped table-hover" style="width: 80%">
				<tr>
					<th>관리번호</th>
					<th>봉사명</th>
					<th>모집기간</th>
					<th>봉사기간</th>
					<th>인원</th>
					<th>신청</th>
					<th>모집여부</th>
				</tr>
				<c:set var="no" value="${tot}"></c:set>
				<c:forEach var="rc" items="${list}">
					<tr>
						<td>${rc.vt_no}</td>
						<td><a href="View.do?vt_no=${rc.vt_no}&pageNum=${paging.nowPage}">${rc.vt_name}</a></td>
						<td>${rc.vt_r_start_date }~${rc.vt_r_end_date }</td>
						<td>${rc.vt_a_start_date }~${rc.vt_a_end_date }</td>
						<td>${rc.vt_tot }</td>
						<th>${rc.count}
						</td>
						<td><c:if test="${rc.vt_r_yn == 'Y'}">
								<span class="ry">모집 중</span>
							</c:if> <c:if test="${rc.vt_r_yn == 'N'}">
								<span class="rn">모집 완료</span>
							</c:if></td>
					</tr>
					<c:set var="tot" value="${tot - 1 }"></c:set>
				</c:forEach>
			</table>
		</div>
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

		</div>
	</div>
</body>
</html>