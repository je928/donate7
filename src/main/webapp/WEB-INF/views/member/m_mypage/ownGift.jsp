<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../module/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function locate(pageNum){
		location.href="ownGift.do?pageNum="+pageNum;
	}
</script>
</head>
<body>

	<div class="col-md-12">
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<b class="panel-title">보유 기프티콘</b>
					</div>
				</div>
			</div>
			<div class="panel-body2">
				<c:set var="i" value="1"/>
				<table class="table table-striped table-bordered table-list">
					<c:forEach var="list" items="${list }">
					<c:if test="${i%3==1 }">
						<tr>
					</c:if>
					<td>
					<c:set var="gift" value="${gs.selectOne(list.g_no) }"/>
					<a href="ownGiftDetail.do?gb_no=${list.gb_no}&pageNum=${pageNum}"><img src="/donate7/${gift.g_img}" height="150px"></a><br>
					<a href="ownGiftDetail.do?gb_no=${list.gb_no}&pageNum=${pageNum}">${gift.g_name }</a>
					<br>
					<c:if test="${list.gb_chk == 'n'}">
					<b class="chk_n">사용 안함</b>
					</c:if>
					<c:if test="${list.gb_chk == 'y'}">
					<b class="chk_y">사용 완료</b>
					</c:if>
					</td>
					<c:if test="${i%3==4 }">
						</tr>
					</c:if>	
					<c:set var="i" value="${i+1 }"/>
					</c:forEach>
					<c:if test="${empty list}">
						<tr>
							<td colspan="5">구매하신 기프티콘이 없습니다.</td>
						</tr>
					</c:if>
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
	
</body>
</html>