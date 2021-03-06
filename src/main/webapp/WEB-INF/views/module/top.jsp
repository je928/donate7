<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a href="main.do" class="navbar-brand">Donate7</a>
				<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse collapse" id="navbar-main">
				<ul class="nav navbar-nav">
					<li><a href="doList.do">기부</a></li>
					<li><a href="volSearch.do">봉사</a></li>
					<!-- <li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href=".do" id="download">봉사
						<span class="caret"></span></a>
						<ul class="dropdown-menu" aria-labelledby="download">
							<li><a href="volSearch.do">통합 봉사 조회</a></li>
							<li><a href="timeList.do">기간별 봉사 조회</a></li>
							<li><a href="centerList.do">수요처 조회</a></li>
						</ul>
					</li> -->
					<li><a href="goods.do">마켓</a></li>
					<li><a href="community.do">커뮤니티</a></li>
					<li><a href="giftList.do">기프트샵</a></li>
				</ul>
				<c:set var="no" value="${sessionScope.no }"></c:set>
				<c:if test="${empty no}">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="login.do">로그인</a></li>
						<li><a href="join.do">회원가입</a></li>
					</ul>
				</c:if>
				<c:if test="${not empty no}">
					<ul class="nav navbar-nav navbar-right">
						<c:if test="${no < 0}">
							<li><a href="o_tamp.do">마이페이지</a></li>
						</c:if>
						<c:if test="${no > 1}">
							<li><a href="m_tamp.do">마이페이지</a></li>
						</c:if>
						<c:if test="${no == 1}">
							<li><a href="a_tamp.do">마이페이지</a></li>
						</c:if>
						<li><a href="logout.do">로그아웃</a></li>
					</ul>
				</c:if>
			</div>
		</div>
	</div>

</body>
</html>