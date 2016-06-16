<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<script type="text/javascript">
	function registerPop(brd_no,chk) {
		window.open("registerPop.do?brd_no=" + brd_no + "&chk="+chk, "",
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
	
	function deleteRpChk(cr_no, brd_no, pageNum) {
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href="deleteReply.do?cr_no="+cr_no+"&brd_no="+brd_no+"&pageNum="+pageNum;
		}else {
			return;
		}
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
							<c:if test="${community.no != sessionScope.no && community.no>1 && sessionScope.no!=null}">
								<a href="javascript:registerPop(${community.brd_no},'w');" class="btn btn-sm btn-warning">신고<em class="fa fa-minus"></em></a>
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
							<small style="color: #747474; font-weight: 900; font-size: 22px;">${replyCount} Comments:</small>
							</h5>
							<div class="testimonials">
								<c:if test="${not empty crList}">
								<c:forEach var="cr" items="${crList}">
								<div class="active item">
									<div class="carousel-info">
										<div class="pull-left">
											<span class="testimonials-name">${cr.nick}</span>
											<span class="testimonials-post">${cr.cr_reg_date}</span>
										</div>
										<div class="pull-right">
											<span class="testimonials-name">　</span>
											<span class="testimonials-menu">
											<c:if test="${sessionScope.no!=null || community.no>1}">
											<a class="a_link">답글</a> | 
											</c:if>
											<c:if test="${cr.no == sessionScope.no}">
											<!-- <a class="a_link">수정</a> -->											
											<a class="a_link" onclick="deleteRpChk(${cr.cr_no},${community.brd_no},${pageNum})">삭제</a>
											</c:if>
											<c:if test="${cr.no!=sessionScope.no && community.no>1 && sessionScope.no!=null}">
											<a href="javascript:registerPop(${cr.no},'c');" class="a_link">신고</a>
											</c:if>
											</span>
										</div>
									</div>
									<blockquote>
										<p> ${cr.cr_content} </p>
									</blockquote>
								</div>
								</c:forEach>
								</c:if>
								<c:if test="${empty crList}">
								<div class="active item">
									<blockquote>
										<p>
											등록된 댓글이 없습니다.
										</p>
									</blockquote>
								</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				
				<div class="container re_bottom">
					<div class="row">
						<div class="replym_w">
							<form action="writeReply.do" name="frm" onsubmit="return rpSubmit(${sessionScope.no})">
							<input type="hidden" name="no" value="${sessionScope.no}">
							<input type="hidden" name="brd_no" value="${community.brd_no}">
							<input type="hidden" name="pageNum" value="${pageNum}">
							<c:if test="${sessionScope.no > 0}">					
							<textarea style="resuze: none; border:solid 1px; width:88%; vertical-align:top;" rows="3" cols="80" maxlength="1000" id="cr_content" name="cr_content"></textarea>&nbsp;
							<input type="submit" class="btn btn-sm btn-default" style="height:80px; width:80px;" value="등록">
							</c:if>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>