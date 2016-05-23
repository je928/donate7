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
		location.href="list.do?pageNum="+pageNum+"&searchType="+searchType.value+"&searchTxt="+searchTxt.value;
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
		
		<div class="row">
			<div class="col-lg-8 col-md-offset-18">
				<table class="table table-striped table-hover">
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
						<tr>
							<td>1</td>
							<td class="text-left">Column content 게시판을 작성하는 중입니다. 게시판을 작</td>
							<td>Column content</td>
							<td>2016-05-22</td>
							<td>0</td>
						</tr>
						<tr>
							<td>1</td>
							<td class="text-left">Column content 게시판을 작성하는 중입니다. 게시판을 작</td>
							<td>게시물작성자요</td>
							<td>2016-05-22</td>
							<td>0</td>
						</tr>
						<tr>
							<td>1</td>
							<td class="text-left">Column content 게시판을 작성하는 중입니다. 게시판을 작</td>
							<td>Column content</td>
							<td>2016-05-22</td>
							<td>0</td>
						</tr>
						<tr>
							<td>1</td>
							<td class="text-left">Column content 게시판을 작성하는 중입니다. 게시판을 작</td>
							<td>Column content</td>
							<td>2016-05-22</td>
							<td>0</td>
						</tr>
						<tr>
							<td>1</td>
							<td class="text-left">Column content 게시판을 작성하는 중입니다. 게시판을 작</td>
							<td>Column content</td>
							<td>2016-05-22</td>
							<td>0</td>
						</tr>
						<tr>
							<td>1</td>
							<td class="text-left">Column content 게시판을 작성하는 중입니다. 게시판을 작</td>
							<td>Column content</td>
							<td>2016-05-22</td>
							<td>0</td>
						</tr>
						<tr>
							<td>1</td>
							<td class="text-left">Column content 게시판을 작성하는 중입니다. 게시판을 작</td>
							<td>Column content</td>
							<td>2016-05-22</td>
							<td>0</td>
						</tr>
						<tr>
							<td>1</td>
							<td class="text-left">Column content 게시판을 작성하는 중입니다. 게시판을 작</td>
							<td>Column content</td>
							<td>2016-05-22</td>
							<td>0</td>
						</tr>
						<tr>
							<td>1</td>
							<td class="text-left">Column content 게시판을 작성하는 중입니다. 게시판을 작</td>
							<td>Column content</td>
							<td>2016-05-22</td>
							<td>0</td>
						</tr>
						<tr>
							<td>1</td>
							<td class="text-left">Column content 게시판을 작성하는 중입니다. 게시판을 작</td>
							<td>Column content</td>
							<td>2016-05-22</td>
							<td>0</td>
						</tr>
						<tr>
							<td colspan="5">데이터가 없습니다.</td>
						</tr>
					</tbody>
				</table>				
			</div>
		</div>
	</div>
	
	<div align="center">
		<c:if test="${startPage > pagePerBlock}">
			<a href="javascript:locate(${startPage-pagePerBlock})">[이전]</a>
			<a href="javascript:locate(1)">[1]</a>
			...
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<c:if test="${i eq nowPage}">
				<b class="b">[${i}]</b>
			</c:if>
			<c:if test="${i ne nowPage}">
				<a href="javascript:locate(${i})">[${i}]</a>
			</c:if>
		</c:forEach>
		<c:if test="${totalPage > endPage}">
			...
			<a href="javascript:locate(${totalPage})">[${totalPage}]</a>
			<a href="javascript:locate(${startPage+pagePerBlock})">[다음]</a>
		</c:if>
		
		<p>
		<p>
		<button class="btn btn-default" onclick="location.href='writeForm.do?pageNum=${pageNum}'">글쓰기</button>
		<br>

	<form class="navbar-form">
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
					
				<c:if test="${searchType eq 'm_nick'}">
					<option value="m_nick" selected="selected">글쓴이</option>
				</c:if>
				<c:if test="${searchType ne 'm_nick'}">
					<option value="m_nick">글쓴이</option>
				</c:if>
			</select>			
			<input type="text" id="searchTxt" class="form-control" placeholder="Search" value="${searchTxt}">
			</div>
			<button type="submit" class="btn btn-primary" onclick="locate(1)">검색</button>
		</form>
	</div>
      
</body>
</html>