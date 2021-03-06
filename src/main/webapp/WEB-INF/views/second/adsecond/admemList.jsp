<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function sm() {
		location.href="admemList.do";
		
		msecondList.style.display = 'block';
		asecondList.style.display = 'none';
		osecondList.style.display = 'none';
		aasecondList.style.display = 'none';

	}

	function so() {
		location.href="admemArrive.do";
		
		msecondList.style.display = 'none';
		asecondList.style.display = 'block';
		osecondList.style.display = 'none';
		aasecondList.style.display = 'none';

	}
	function ss() {
		location.href="adorList.do";
		
		osecondList.style.display = 'block';
		aasecondList.style.display = 'none';
		msecondList.style.display = 'none';
		asecondList.style.display = 'none';
		
	}
	function sa() {
		location.href="adorArrive.do";
		
		osecondList.style.display = 'none';
		aasecondList.style.display = 'block';
		msecondList.style.display = 'none';
		asecondList.style.display = 'none';

	}
</script>
</head>
<body>
	<div class="btn-group">
		<div class="btn-group">
			<a href="#" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown"> 일반 <span class="caret"></span>
			</a>
			<ul class="dropdown-menu">
				<li><a href="javascript:sm()">승인</a></li>
				<li><a href="javascript:so()">도착</a></li>
			</ul>
		</div>
	</div>
	<div class="btn-group">
		<div class="btn-group">
			<a href="#" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown"> 기관 <span class="caret"></span>
			</a>
			<ul class="dropdown-menu">
				<li><a href="javascript:ss()">승인</a></li>
				<li><a href="javascript:sa()">도착</a></li>
			</ul>
		</div>
	</div>
	<!-- 일반!! -->
	<div class="col-md-12" id="msecondList" style="display: block">
		<div class="row" align="center">
			<table class="table table-striped table-hover">
				<caption>일반 승인여부</caption>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>상품종류</th>
					<th>등록일</th>
					<th>승인여부</th>
				</tr>
				<c:set var="num" value="${pg.total }" />
				<c:forEach var="second" items="${memlist }">
				
						<tr>
							<td>${num }</td>
							<td><a href="adsecondView.do?sh_no=${second.sh_no }">${second.sh_title }</a></td>
							<td>${second.m_email }</td>
							<td>${second.sh_category }</td>
							<td>${second.sh_reg_date }</td>
							<td><c:if test="${second.sh_approve eq 'y'}">
								<span class="ok_y">승인완료</span>
							</c:if> 
							<c:if test="${second.sh_approve eq 'n'}">
								<span class="ok_x">승인대기</span>
							</c:if>
						</td>
						</tr>
					
					<c:set var="num" value="${num-1 }" />
				</c:forEach>
			</table>
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
								<li><a href="javascript:locate(${pg.startPage+pg.pagePerBlock})">»</a></li>
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