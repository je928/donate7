<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp" %>
<%@ include file="../session/sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="">
		<form action="">
			<div>
				<b>일반/기관 받아오기</b>
			</div>
			<div>
				<b>제목</b>
				<div>
					${donate.d_title }
				</div>
			</div>
			<div>
				${donate.d_img }	
			</div>
			<div>
				<b>내용</b>
				<div>
					${donate.d_content }
				</div>
			</div>
			<div>
				<b>기부금 사용계획</b>
				<div>
					${donate.d_plan }
				</div>
			</div>
		</form>
	</div>
	<div class="">
		<div>
			<b>목표금액</b>
			<div>
				${donate.d_amount }
			</div>
		</div>
		<div>
			<b>기간</b>
			<div>
				${donate.d_start_date } ~ ${donate.d_end_date }
			</div>
		</div>
	</div>
	<div>
		<div>
			<button>기부하기</button>
			<button>기부자현황</button>
		</div>
	</div>
</div>
</body>
</html>