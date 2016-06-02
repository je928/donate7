<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-offset-17">
				<h3 class="page-header">Community
					<small>게시판</small>
				</h3>
				<ol class="breadcrumb">
					<li>
						<a href="main.do">Home</a>
					</li>
					<li class="active">
						Community
					</li>
				</ol>
			</div>
		</div>
		
		<div class="col-lg-9 col-md-offset-18">
			<div class="panel panel-default panel-table">
				<div class="panel-heading">
					<div class="row">
						<div class="col col-xs-6">
							<a href="register.do?brd_no=${community.brd_no}&pageNum=${pageNum}" class="btn btn-sm btn-warning">신고<em class="fa fa-minus"></em></a>
						</div>
						<div class="col col-xs-6 text-right">
							<a href="community.do?pageNum=${pageNum}&searchType=${searchType}&searchTxt=${searchTxt}" class="btn btn-sm btn-default">목록<em class="fa fa-list-ul"></em></a>
							<a href="writeForm.do?brd_no=${community.brd_no}&pageNum=${pageNum}" class="btn btn-sm btn-default">답변<em class="fa fa-comment-o"></em></a>							
							<a href="updateForm.do?brd_no=${community.brd_no}&pageNum=${pageNum}" class="btn btn-sm btn-default">수정<em class="fa fa-pencil"></em></a>
							<a href="deleteForm.do?brd_no=${community.brd_no}&pageNum=${pageNum}" class="btn btn-sm btn-danger">삭제<em class="fa fa-trash"></em></a>
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
							<td colspan="2">${community.brd_content}</td>
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
	
</body>
</html>