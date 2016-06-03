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
		msecondList.style.display = 'block';
		asecondList.style.display = 'none';
		osecondList.style.display = 'none';
		aasecondList.style.display = 'none';

	}

	function so() {
		msecondList.style.display = 'none';
		asecondList.style.display = 'block';
		osecondList.style.display = 'none';
		aasecondList.style.display = 'none';

	}
	function ss() {
		osecondList.style.display = 'block';
		aasecondList.style.display = 'none';
		msecondList.style.display = 'none';
		asecondList.style.display = 'none';
		
	}
	function sa() {
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
					<th width="60">번호</th>
					<th width="60">제목</th>
					<th width="60">작성자</th>
					<th width="60">상품종류</th>
					<th width="60">등록일</th>
					<th width="60">승인여부</th>
				</tr>
				<c:set var="cnt" value="${count }" />
				<c:forEach var="second" items="${list }">
					<c:if test="${second.no>0 }">
						<tr>
							<th>${cnt }</th>
							<th><a href="adsecondView.do?sh_no=${second.sh_no }">${second.sh_title }</a></th>
							<th>${second.email }</th>
							<th>${second.sh_category }</th>
							<th>${second.sh_reg_date }</th>
							<th>${second.sh_approve }</th>
						</tr>
					</c:if>
					<c:set var="cnt" value="${cnt-1 }" />
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="col-md-12" id="asecondList" style="display: none">
		<div class="row">
			<table class="table table-striped table-hover">
				<caption>일반 도착여부</caption>
				<tr>
					<th width="60">번호</th>
					<th width="60">제목</th>
					<th width="60">작성자</th>
					<th width="60">상품종류</th>
					<th width="60">등록일</th>
					<th width="60">도착여부</th>
				</tr>
				<c:set var="cnt" value="${count }" />
				<c:forEach var="second" items="${list }">
					<c:if test="${second.no>0 }">
						<c:if test="${second.sh_approve eq 'Y' }">
							<tr>
							<th>${cnt }</th>
							<th><a href="adsecondView2.do?sh_no=${second.sh_no }">${second.sh_title }</a></th>
							<th>${second.email }</th>
							<th>${second.sh_category }</th>
							<th>${second.sh_reg_date }</th>
							<th>${second.sh_arrive }</th>
						</tr>
						</c:if>
					</c:if>
					<c:set var="cnt" value="${cnt-1 }" />
				</c:forEach>
			</table>
		</div>
	</div>
	
	
	<!-- 기관!! -->
	<div class="col-md-12" id="osecondList" style="display: none">
		<div class="row" align="center">
			<table class="table table-striped table-hover">
				<caption>기관 승인여부</caption>
				<tr>
					<th width="60">번호</th>
					<th width="60">제목</th>
					<th width="60">작성자</th>
					<th width="60">상품종류</th>
					<th width="60">등록일</th>
					<th width="60">승인여부</th>
				</tr>
				<c:set var="cnt" value="${count }" />
				<c:forEach var="second" items="${list }">
					<c:if test="${second.no<0 }">
						<tr>
							<th>${cnt }</th>
							<th><a href="adsecondView.do?sh_no=${second.sh_no }">${second.sh_title }</a></th>
							<th>${second.email }</th>
							<th>${second.sh_category }</th>
							<th>${second.sh_reg_date }</th>
							<th>${second.sh_approve }</th>
						</tr>
					</c:if>
					<c:set var="cnt" value="${cnt-1 }" />
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="col-md-12" id="aasecondList" style="display: none">
		<div class="row">
			<table class="table table-striped table-hover">
				<caption>기관 도착여부</caption>
				<tr>
					<th width="60">번호</th>
					<th width="60">제목</th>
					<th width="60">작성자</th>
					<th width="60">상품종류</th>
					<th width="60">등록일</th>
					<th width="60">도착여부</th>
				</tr>
				<c:set var="cnt" value="${count }" />
				<c:forEach var="second" items="${list }">
					<c:if test="${second.no<0 }">
						<tr>
							<th>${cnt }</th>
							<th><a href="adsecondView2.do?sh_no=${second.sh_no }">${second.sh_title }</a></th>
							<th>${second.email }</th>
							<th>${second.sh_category }</th>
							<th>${second.sh_reg_date }</th>
							<th>${second.sh_arrive }</th>
						</tr>
					</c:if>
					<c:set var="cnt" value="${cnt-1 }" />
				</c:forEach>
			</table>
		</div>
	</div>
	
</body>
</html>