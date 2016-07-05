<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function ad() {
		location.href = "adList.do";
	}
	function m() {
		location.href = "adMList.do";
	}

	function o() {
		location.href = "adOList.do";
	}

	function locate(pageNum) {
		location.href = "adOList.do?pageNum=" + pageNum;
	}
</script>
</head>
<body>
	<div class="col-md-12">
		<div class="text-left list-group2">
			<input type="button" id="ad" name="ad" class="btn btn-default2"
				onclick="ad()" value="전체"> <input type="button" id="m"
				name="m" class="btn btn-default2" onclick="m()" value="일반">
			<input type="button" id="o" name="o" class="btn btn-default2"
				onclick="o()" value="기관">
		</div>

		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<b class="panel-title">기관회원 요청내역</b>
					</div>
				</div>
			</div>
			<div class="panel-body2">
				<table class="table table-striped table-bordered table-list">
					<tr>
						<th>번호</th>
						<th>회원 구분</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>승인여부</th>
					</tr>

					<c:set var="num" value="${pg.total }" />
					<c:forEach var="donate" items="${olist }">

						<tr>
							<td>${num}</td>
							<td>기관</td>
							<td><a href="adView.do?d_no=${donate.d_no }">${donate.d_title }</a></td>
							<td>${donate.o_email }</td>
							<td>${donate.d_reg_date }</td>
							<td><c:if test="${donate.d_approve eq 'y'}">
									<span class="ok_y">승인완료</span>
								</c:if> <c:if test="${donate.d_approve eq 'n'}">
									<span class="ok_x">승인대기</span>
								</c:if></td>
						</tr>

						<c:set var="num" value="${num-1}" />
					</c:forEach>
				</table>
			</div>
			<div class="panel-footer2 text-center">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							<c:if test="${pg.startPage > pg.pagePerBlock}">
								<li><a href="javascript:locate(1)">««</a></li>
								<li><a href="javascript:locate(${pg.nowPage-1})">«</a></li>
							</c:if>
						</ul>
						<ul class="pagination">
							<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
								<c:if test="${i eq pg.nowPage}">
									<li><a href="#"><b class="b2">${i}</b></a></li>
								</c:if>
								<c:if test="${i ne pg.nowPage}">
									<li><a href="javascript:locate(${i})">${i}</a></li>
								</c:if>
							</c:forEach>
						</ul>
						<ul class="pagination">
							<c:if test="${pg.totalPage > pg.endPage}">
								<li><a
									href="javascript:locate(${pg.startPage+pg.pagePerBlock})">»</a></li>
								<li><a href="javascript:locate(${pg.totalPage})">»»</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>