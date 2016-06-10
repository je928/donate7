<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.re_top {
	padding-top: 25px;
}

.re_bottom {
	padding-bottom: 30px;
}

.a_link {
	color: #353535;
}

.a_link:hover {
	color: #353535;
}

/* Testimonials */
.testimonials blockquote {
	background: #D1CDF4 none repeat scroll 0 0;
	border: medium none;
	color: #666;
	display: block;
	font-size: 14px;
	line-height: 20px;
	padding: 15px;
	position: relative;
}

.testimonials blockquote::before {
	width: 0;
	height: 0;
	right: 0;
	bottom: 0;
	content: " ";
	display: block;
	position: absolute;
	border-bottom: 20px solid #fff;
	border-right: 0 solid transparent;
	border-left: 15px solid transparent;
	border-left-style: inset; /*FF fixes*/
	border-bottom-style: inset; /*FF fixes*/
}

.testimonials blockquote::after {
	width: 0;
	height: 0;
	right: 0;
	bottom: 0;
	content: " ";
	display: block;
	position: absolute;
	border-style: solid;
	border-width: 20px 20px 0 0;
	border-color: #e63f0c transparent transparent transparent;
}

.testimonials .carousel-info img {
	border: 1px solid #f5f5f5;
	border-radius: 150px !important;
	padding: 3px;
	width: 75px;
}

.testimonials .carousel-info {
	overflow: hidden;
}

.testimonials .carousel-info img {
	margin-right: 15px;
}

.testimonials .carousel-info span {
	display: block;
}

.testimonials span.testimonials-name {
	color: #e6400c;
	font-size: 16px;
	font-weight: 900;
}

.testimonials span.testimonials-post {
	color: #656565;
	font-weight: 300;
	font-size: 12px;
}
.replym_w {
	margin-left: 32px;
	width: 65%;
}

.re_header {
	border-bottom: 1px solid #D1CDF4;
}
</style>
<script type="text/javascript">
	function registerPop(brd_no) {
		window.open("registerPop.do?brd_no=" + brd_no + "&chk=w", "",
				"width=370, height=300");
	}
	
	function rpSubmit(number) {
		if(number == null || number == "" || number == "null") {
			if(confirm("로그인이 필요합니다. 로그인 하시겠습니까?")) {
				location.href="login.do";
			} else {
				return false;
			}
		}else {
			return true;
		}
		return false;
	}
</script>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-offset-17">
				<h3 class="page-header">
					Community <small>게시판</small>
				</h3>
				<ol class="breadcrumb">
					<li><a href="main.do">Home</a></li>
					<li class="active">Community</li>
				</ol>
			</div>
		</div>

		<div class="col-lg-9 col-md-offset-18">
			<div class="panel panel-default panel-table">
				<div class="panel-heading">
					<div class="row">
						<div class="col col-xs-6">
							<c:if
								test="${community.no != sessionScope.no && community.no>1 &&sessionScope.no!=null}">
								<a href="javascript:registerPop(${community.brd_no});" class="btn btn-sm btn-warning">신고<em class="fa fa-minus"></em></a>
							</c:if>
						</div>
						<div class="col col-xs-6 text-right">
							<a href="community.do?pageNum=${pageNum}&searchType=${searchType}&searchTxt=${searchTxt}" class="btn btn-sm btn-default">목록<em class="fa fa-list-ul"></em></a>
							<c:if test="${sessionScope.no != null}">
								<a href="writeForm.do?brd_no=${community.brd_no}&pageNum=${pageNum}" class="btn btn-sm btn-default">답변<em class="fa fa-comment-o"></em></a>
							</c:if>
							<c:if test="${sessionScope.no == community.no}">
								<a href="updateForm.do?brd_no=${community.brd_no}&pageNum=${pageNum}" class="btn btn-sm btn-default">수정<em class="fa fa-pencil"></em></a>
								<a href="deleteForm.do?brd_no=${community.brd_no}&pageNum=${pageNum}" class="btn btn-sm btn-danger">삭제<em class="fa fa-trash"></em></a>
							</c:if>
						</div>
					</div>
				</div>
				<div class="panel-body2">
					<table class="table table-striped table-bordered table-list">
						<c:if test="${not empty community }">
							<tr>
								<th width="20%">제목</th>
								<td class="text-left">${community.brd_subject }</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td class="text-left">${community.nick}</td>
							</tr>
							<tr>
								<th>조회수</th>
								<td class="text-left">${community.brd_readcount}</td>
							</tr>
							<c:if test="${null eq community.brd_update_date}">
								<tr>
									<th>작성일</th>
									<td class="text-left">${community.brd_reg_date}</td>
								</tr>
							</c:if>
							<c:if test="${null ne community.brd_update_date}">
								<tr>
									<th>작성일</th>
									<td class="text-left">${community.brd_reg_date}</td>
								</tr>
								<tr>
									<th>최근 수정일</th>
									<td class="text-left">${community.brd_update_date}</td>
								</tr>
							</c:if>
							<tr>
								<td colspan="2"><div class="text-left" style="margin: 20px;">${community.brd_content}</div></td>
							</tr>
						</c:if>
						<c:if test="${empty community }">
							<tr>
								<td colspan="2">데이터가 없습니다.</td>
							</tr>
						</c:if>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="col-lg-9 col-md-offset-18">
			<div class="panel panel-default panel-table">
				<div class="container re_top">
					<div class="row">
						<div class="replym_w">
							<h5 class="re_header">
							<small style="color: #747474; font-weight: 900; font-size: 22px;">0 Comments:</small>
							</h5>
							<div class="testimonials">
								<div class="active item">
									<div class="carousel-info">
										<div class="pull-left">
											<span class="testimonials-name">je928</span>
											<span class="testimonials-post">2016.06.09. 15:19</span>
										</div>
										<div class="pull-right">
											<span class="testimonials-name">　</span>
											<span class="testimonials-menu">
											<a class="a_link">답글</a> | 
											<a class="a_link">수정</a> | 
											<a class="a_link">삭제</a> | 
											<a class="a_link">신고</a></span>
										</div>
									</div>
									<blockquote>
										<p>Denim you probably haven't heard of. Lorem ipsum dolor
											met consectetur adipisicing sit amet, consectetur adipisicing
											elit, of them jean shorts sed magna aliqua. Lorem ipsum dolor
											met.
										</p>
									</blockquote>
								</div>
								<div class="active item">
									<div class="carousel-info">
										<div class="pull-left">
											<span class="testimonials-name">je928</span>
											<span class="testimonials-post">2016.06.09. 15:19</span>
										</div>
										<div class="pull-right">
											<span class="testimonials-name">　</span>
											<span class="testimonials-menu">
											<a class="a_link">답글</a> | 
											<a class="a_link">수정</a> | 
											<a class="a_link">삭제</a> | 
											<a class="a_link">신고</a></span>
										</div>
									</div>
									<blockquote>
										<p>Denim you probably haven't heard of. Lorem ipsum dolor
											met consectetur adipisicing sit amet, consectetur adipisicing
											elit, of them jean shorts sed magna aliqua. Lorem ipsum dolor
											met.
										</p>
									</blockquote>
								</div>
								<div class="active item">
									<div class="carousel-info">
										<div class="pull-left">
											<span class="testimonials-name">je928</span>
											<span class="testimonials-post">2016.06.09. 15:19</span>
										</div>
										<div class="pull-right">
											<span class="testimonials-name">　</span>
											<span class="testimonials-menu">
											<a class="a_link">답글</a> | 
											<a class="a_link">수정</a> | 
											<a class="a_link">삭제</a> | 
											<a class="a_link">신고</a></span>
										</div>
									</div>
									<blockquote>
										<p>Denim you probably haven't heard of. Lorem ipsum dolor
											met consectetur adipisicing sit amet, consectetur adipisicing
											elit, of them jean shorts sed magna aliqua. Lorem ipsum dolor
											met.
										</p>
									</blockquote>
								</div>
								<div class="active item">
									<blockquote>
										<p>
											등록된 댓글이 없습니다.
										</p>
									</blockquote>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="container re_bottom">
					<div class="row">
						<div class="replym_w">
							<form action="writeReply.do" name="frm" onsubmit="return rpSubmit(${sessionScope.no})">
							<input type="hidden" name="no" value="${sessionScope.no}">
							<input type="hidden" name="brd_no" value="${brd_no}">
							<input type="hidden" name="pageNum" value="${pageNum}">							
							<textarea style="resuze: none; border:solid 1px; width:88%; vertical-align:top;" rows="3" cols="80" maxlength="1000" id="cr_content" name="cr_content"></textarea>&nbsp;
							<input type="submit" class="btn btn-sm btn-default" style="height:80px; width:80px;" value="등록">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>