<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<style>
.red {
	color: red;
}

.form-area {
	background-color: #FAFAFA;
	padding: 10px 40px 60px;
	margin: 10px 0px 60px;
	border: 1px solid GREY;
	border-radius: 15px;
}

.col-md-offset-13 {
	margin-left: 29%;
}
</style>
</head>
<body>
	<div class="container">
		<div class="col-md-5" style="margin-left: 200px;">
			<div class="form-area">
				<form role="form" >
					<br style="clear: both">
					<h3 style="margin-bottom: 25px; text-align: center;">Delivery details</h3>
					<img class="img-responsive" alt="" src="image/${price.pr_img }">
						<div class="form-group">
						구매 상품명:${price.pr_proname }
						</div>
						<div class="form-group">
						구매 가격 :	${price.pr_price }
						</div>
						<div class="form-group">
						구매 수량 : ${pb.pb_buyqty }
						</div>
						<div class="form-group">
						총구매 가격 : 
						${gup*pb.pb_buyqty }
						</div>
					<div class="form-group">
						보내는 사람 : ${nick}
					</div>
					<div class="form-group"><!--받는사람  -->
						받는 사람 : ${pb.pb_name }
					</div>
					<div class="form-group"><!--전화번호  -->
						전화번호 : ${pb.pb_tel }
					</div>
					<div class="form-group"><!--주소  -->
						 주소 : ${pb.pb_addr }
					</div>
					<div>
						<c:if test="${delivery =='n'}">
							배송상태 : 배송준비중
						</c:if>
						<c:if test="${delivery =='y'}" >
							배송상태 : 배송중
						</c:if>
						<c:if test="${delivery =='o'}">
							배송상태 : 배송완료
						</c:if>
					</div>
				</form>
				<button onclick="location.href='a_deliveryForm.do'">확인</button>
				<button onclick="location.href='a_deliveryForm.do?pb_no=${pb.pb_no}'">배송 중</button>
				<button onclick="location.href='a_deliveryForm?pb_no=${pb.pb_no}'">배송 완료</button>
			</div>
		</div>
	</div>

</body>
</html>