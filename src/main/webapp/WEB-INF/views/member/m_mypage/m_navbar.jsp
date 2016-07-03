<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp"%>
<%@ include file="../../session/memChk.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

  nav.sidebar, .main{
    -webkit-transition: margin 200ms ease-out;
      -moz-transition: margin 200ms ease-out;
      -o-transition: margin 200ms ease-out;
      transition: margin 200ms ease-out;
  }

 @media (min-width: 765px) {

    nav.sidebar:hover + .main{
      margin-left: 200px;
    }

    nav.sidebar.navbar.sidebar>.container .navbar-brand, .navbar>.container-fluid .navbar-brand {
      margin-left: 0px;
    }

    nav.sidebar .navbar-brand, nav.sidebar .navbar-header{
      text-align: center;
      width: 100%;
      margin-left: 0px;
    }
    
    nav.sidebar a{
      padding-right: 13px;
    }

    nav.sidebar .navbar-nav > li:first-child{
      border-top: 1px #e5e5e5 solid;
    }

    nav.sidebar .navbar-nav > li{
      border-bottom: 1px #e5e5e5 solid;
    }

    nav.sidebar .navbar-nav .open .dropdown-menu {
      position: static;
      float: none;
      width: auto;
      margin-top: 0;
      background-color: transparent;
      border: 0;
      -webkit-box-shadow: none;
      box-shadow: none;
    }

    nav.sidebar .navbar-collapse, nav.sidebar .container-fluid{
      padding: 0 0px 0 0px;
    }

    .navbar-inverse .navbar-nav .open .dropdown-menu>li>a {
      color: #777;
    }

    nav.sidebar{
      width: 180px;
      margin-left: -160px;
      float: left;
      margin-bottom: 0px;
    }

    nav.sidebar li {
      width: 100%;
    }

    nav.sidebar:hover{
      margin-left: 0px;
    }

    .forAnimate{
      opacity: 0;
    }
  }
   
  @media (min-width: 1330px) {

    .main{
      width: calc(100% - 200px);
      margin-left: 200px;
    }

    nav.sidebar{
      margin-left: 0px;
      float: left;
    }

    nav.sidebar .forAnimate{
      opacity: 1;
    }
  }

  nav.sidebar .navbar-nav .open .dropdown-menu>li>a:hover, nav.sidebar .navbar-nav .open .dropdown-menu>li>a:focus {
    color: #CCC;
    background-color: transparent;
  }

  nav:hover .forAnimate{
    opacity: 1;
  }
  section{
    padding-left: 15px;
  }
  
 
</style>

</head>
<body>

	<!-- <div class="list-group">
		<a href="m_myinfo.do" class="list-group-item">회원정보</a>
		<a href="m_updateForm.do" class="list-group-item">회원정보수정</a>
		<a href="mdoList.do" class="list-group-item">기부금 요청/내역</a>
		<a href="rqnList.do" class="list-group-item">봉사 내역</a>
		<a href="m_prList.do" class="list-group-item">완제품 기부 요청/내역</a>
		<a href="a_deliveryForm.do" class="list-group-item">완제품 판매 내역</a>
		<a href="m_delivery.do" class="list-group-item">완제품 구매 내역</a>
		<a href="msecondList.do" class="list-group-item">중고품 기부 요청/내역</a>
		<a href="cpointList.do" class="list-group-item">캐시/포인트 내역</a>
		<a href="ownGift.do" class="list-group-item">보유 기프티콘</a>
		<a href="warningList.do" class="list-group-item">경고 내역</a>
		<a href="m_deleteForm.do" class="list-group-item">회원탈퇴</a>
	</div> -->
	
	<nav class="navbar navbar-default sidebar" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button> 
			</div>
			<div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">회원<span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a>
						<ul class="dropdown-menu forAnimate" role="menu">
							<li><a href="m_myinfo.do">회원 정보</a></li>
							<li class="divider"></li>
							<li><a href="m_updateForm.do">회원 정보 수정</a></li>
							<li class="divider"></li>
							<li><a href="cpointList.do">캐시/포인트 내역</a></li>
							<li class="divider"></li>
							<li><a href="warningList.do">경고 내역</a></li>
							<li class="divider"></li>
							<li><a href="ownGift.do">보유 기프티콘</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">기부<span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-leaf"></span></a>
						<ul class="dropdown-menu forAnimate" role="menu">
							<li><a href="mdoReq.do">기부 요청</a></li>
							<li class="divider"></li>
							<li><a href="mdoList.do">기부 요청 내역</a></li>
							<li class="divider"></li>
							<li><a href="#">기부 내역</a></li>
						</ul>
					</li>
					<li><a href="rqnList.do">봉사<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-heart"></span></a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">마켓<span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-shopping-cart"></span></a>
						<ul class="dropdown-menu forAnimate" role="menu">
							<li><a href="m_prWrite.do">완제품 판매 요청</a></li>
							<li class="divider"></li>
							<li><a href="m_prList.do">완제품 판매 요청 내역</a></li>
							<li class="divider"></li>
							<li><a href="a_deliveryForm.do">판매 내역(배송 관리)</a></li>
							<li class="divider"></li>
							<li><a href="m_deliveryForm.do">구매 내역</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">중고품<span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-barcode"></span></a>
						<ul class="dropdown-menu forAnimate" role="menu">
							<li><a href="msecondForm.do">중고품 기부 요청</a></li>
							<li class="divider"></li>
							<li><a href="msecondList.do">중고품 기부 내역</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>

</body>
</html>