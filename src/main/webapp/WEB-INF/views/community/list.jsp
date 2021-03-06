<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function locate(pageNum){
		var searchType = document.getElementById("searchType");
		var searchTxt = document.getElementById("searchTxt");
		location.href="community.do?pageNum="+pageNum+"&searchType="+searchType.value+"&searchTxt="+searchTxt.value;
	}
</script>
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
							Page ${pb.nowPage} of ${pb.totalPage}
						</div>
						<div class="col col-xs-6 text-right">
							<a href="writeForm.do?pageNum=${pb.nowPage}" class="btn btn-sm btn-primary">글작성<em class="fa fa-edit"></em></a>	
						</div>
					</div>
				</div>
				<div class="panel-body2">
					<table class="table table-striped table-bordered table-list">
						<thead>
							<tr>
								<th width="5%">#</th>
								<th width="35%">제목</th>
								<th width="12%">글쓴이</th>
								<th width="9%">작성일</th>
								<th width="6%">조회수</th>
							</tr>
						</thead>
						<tbody>
						<c:set var="no" value="${pb.no}" />
						<c:forEach var="brd" items="${list}">
						<c:if test="${brd.brd_del_yn != 'y'}">
							<tr>
								<td>${no }</td>
								<td class="text-left">
								<c:if test="${brd.re_step>0}">
									<img alt="" src="images/level.gif" height="10" width="${brd.re_level*10}">
									<img alt="" src="images/re.gif">
								</c:if>
									<a href="view.do?brd_no=${brd.brd_no}&pageNum=${pb.nowPage}&searchType=${searchType}&searchTxt=${searchTxt}"> ${brd.brd_subject} </a>
									<c:if test="${brd.replycount > 0}">
									[<a href="view.do?brd_no=${brd.brd_no}&pageNum=${pb.nowPage}&searchType=${searchType}&searchTxt=${searchTxt}">${brd.replycount}</a>]
									</c:if>
								<c:if test="${brd.brd_readcount > 300}">
									<span class="hot">hot</span>
								</c:if>
								</td>
								<td>${brd.nick}</td>
								<td>${brd.brd_reg_date}</td>
								<td>${brd.brd_readcount}</td>
							</tr>
						</c:if>
						<c:set var="no" value="${no-1}"></c:set>
						</c:forEach>
						<c:if test="${empty list}">
							<tr>
								<td colspan="5">데이터가 없습니다.</td>
							</tr>
						</c:if>
						</tbody>
					</table>
				</div>
				<div class="panel-footer2 text-center">
					<div class="row">
						<div class="col">
							<ul class="pagination">
								<c:if test="${pb.startPage > pb.pagePerBlock}">
								<li><a href="javascript:locate(1)">««</a></li>						
								<li><a href="javascript:locate(${pb.nowPage-1})">«</a></li>
								</c:if>
							</ul>
							<ul class="pagination">
								<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
									<c:if test="${i eq pb.nowPage}">
										<li><a href="#"><b class="b2">${i}</b></a></li>
									</c:if>
									<c:if test="${i ne pb.nowPage}">
										<li><a href="javascript:locate(${i})">${i}</a></li>
									</c:if>
								</c:forEach>
							</ul>
							<ul class="pagination">
								<c:if test="${pb.totalPage > pb.endPage}">
								<li><a href="javascript:locate(${pb.startPage+pb.pagePerBlock})">»</a></li>
								<li><a href="javascript:locate(${pb.totalPage})">»»</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div align="center">
	<div class="navbar-form">
		<div class="form-group">
			<select class="form-control input-lg" id="searchType">
				<c:if test="${searchType eq 'all'}">
					<option value="all" selected="selected">제목 + 내용</option>
				</c:if>
				<c:if test="${searchType ne 'all'}">
					<option value="all">제목 + 내용</option>
				</c:if>
					
				<c:if test="${searchType eq 'brd_subject'}">
					<option value="brd_subject" selected="selected">제목</option>
				</c:if>
				<c:if test="${searchType ne 'brd_subject'}">
					<option value="brd_subject">제목</option>
				</c:if>
				
				<c:if test="${searchType eq 'brd_content'}">	
					<option value="brd_content" selected="selected">내용</option>
				</c:if>
				<c:if test="${searchType ne 'brd_content'}">
					<option value="brd_content">내용</option>
				</c:if>
					
				<c:if test="${searchType eq 'nick'}">
					<option value="nick" selected="selected">글쓴이</option>
				</c:if>
				<c:if test="${searchType ne 'nick'}">
					<option value="nick">글쓴이</option>
				</c:if>
			</select>			
			<input type="text" id="searchTxt" class="form-control" placeholder="Search" value="${searchTxt}">
			</div>
			<button type="submit" class="btn btn-default" onclick="locate(1)"><i class="glyphicon fa-1x glyphicon-search"></i></button>
		</div>
	</div>
      
</body>
</html>