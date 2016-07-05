<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../module/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.timeline {
  list-style: none;
  padding: 20px 0 20px;
  position: relative;
}
.timeline:before {
  top: 0;
  bottom: 0;
  position: absolute;
  content: " ";
  width: 3px;
  background-color: #eeeeee;
  left: 50%;
  margin-left: -1.5px;
}
.timeline > li {
  margin-bottom: 20px;
  position: relative;
}
.timeline > li:before,
.timeline > li:after {
  content: " ";
  display: table;
}
.timeline > li:after {
  clear: both;
}
.timeline > li:before,
.timeline > li:after {
  content: " ";
  display: table;
}
.timeline > li:after {
  clear: both;
}
.timeline > li > .timeline-panel {
  width: 50%;
  float: left;
  border: 1px solid #d4d4d4;
  background-color: white;
  border-radius: 2px;
  padding: 20px;
  position: relative;
  -webkit-box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
  box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
}
.timeline > li.timeline-inverted + li:not(.timeline-inverted),
.timeline > li:not(.timeline-inverted) + li.timeline-inverted {
margin-top: -60px;
}

.timeline > li:not(.timeline-inverted) {
padding-right:90px;
}

.timeline > li.timeline-inverted {
padding-left:90px;
}
.timeline > li > .timeline-panel:before {
  position: absolute;
  top: 26px;
  right: -15px;
  display: inline-block;
  border-top: 15px solid transparent;
  border-left: 15px solid #ccc;
  border-right: 0 solid #ccc;
  border-bottom: 15px solid transparent;
  content: " ";
}
.timeline > li > .timeline-panel:after {
  position: absolute;
  top: 27px;
  right: -14px;
  display: inline-block;
  border-top: 14px solid transparent;
  border-left: 14px solid #fff;
  border-right: 0 solid #fff;
  border-bottom: 14px solid transparent;
  content: " ";
}
.timeline > li > .timeline-badge {
  color: #fff;
  width: 50px;
  height: 50px;
  line-height: 50px;
  font-size: 1.4em;
  text-align: center;
  position: absolute;
  top: 16px;
  left: 50%;
  margin-left: -25px;
  background-color: #999999;
  z-index: 100;
  border-top-right-radius: 50%;
  border-top-left-radius: 50%;
  border-bottom-right-radius: 50%;
  border-bottom-left-radius: 50%;
}
.timeline > li.timeline-inverted > .timeline-panel {
  float: right;
}
.timeline > li.timeline-inverted > .timeline-panel:before {
  border-left-width: 0;
  border-right-width: 15px;
  left: -15px;
  right: auto;
}
.timeline > li.timeline-inverted > .timeline-panel:after {
  border-left-width: 0;
  border-right-width: 14px;
  left: -14px;
  right: auto;
}
.timeline-badge.primary {
  background-color: #2e6da4 !important;
}
.timeline-badge.success {
  background-color: #3f903f !important;
}
.timeline-badge.warning {
  background-color: #f0ad4e !important;
}
.timeline-badge.danger {
  background-color: #d9534f !important;
}
.timeline-badge.info {
  background-color: #5bc0de !important;
}
.timeline-title {
  margin-top: 0;
  border-color: grey;
  color: inherit;
}
.timeline-body > p,
.timeline-body > ul {
  margin-bottom: 0;
}
.timeline-body > p + p {
  margin-top: 5px;
}
</style>
</head>
<body style="background-color: #DAD9FF;">
	<div class="container">
		<div class="row">
			<div class="col-lg-9 toppad" style="margin-left: 12px;">
				<ul class="timeline">
					<li>
						<div class="timeline-badge"><i class="glyphicon glyphicon-user"></i></div>
						<div class="timeline-panel">
							<div class="timeline-heading">
								<h4 class="timeline-title text-left" style="font-size: 20px; font-weight: 900;">회원 관리
								<i class="glyphicon glyphicon-chevron-down" style="float: right"></i>
								</h4>
							</div>
							<div class="timeline-body">
								<p>회원/기관에 대한 정보를 볼 수 있습니다.</p>
							</div>
						</div>
					</li>
					<li class="timeline-inverted">
						<div class="timeline-badge success"><i class="glyphicon glyphicon-leaf"></i></div>
						<div class="timeline-panel">
							<div class="timeline-heading">
								<h4 class="timeline-title text-left" style="font-size: 20px; font-weight: 900;">기부
								<i class="glyphicon glyphicon-chevron-down" style="float: right"></i>
								</h4>
							</div>
							<div class="timeline-body">
								<p>기부금 요청 내역을 확인할 수 있습니다.</p>
							</div>
						</div>
					</li>
					<li>
						<div class="timeline-badge info"><i class="glyphicon glyphicon-shopping-cart"></i></div>
						<div class="timeline-panel">
							<div class="timeline-heading">
								<h4 class="timeline-title text-left" style="font-size: 20px; font-weight: 900;">마켓
								<i class="glyphicon glyphicon-chevron-down" style="float: right"></i>
								</h4>
							</div>
							<div class="timeline-body">
								<p>완제품 판매 요청 내역과 <br> 판매, 구매 내역을 확인할 수 있습니다.</p>
							</div>
						</div>
					</li>
					<li>
						<div class="timeline-badge warning"><i class="glyphicon glyphicon-barcode"></i></div>
						<div class="timeline-panel">
							<div class="timeline-heading">
								<h4 class="timeline-title text-left" style="font-size: 20px; font-weight: 900;">중고품
								<i class="glyphicon glyphicon-chevron-down" style="float: right"></i>
								</h4>
							</div>
							<div class="timeline-body">
								<p>중고품 기부 요청 내역을 확인할 수 있습니다.</p>
							</div>
						</div>
					</li>
					<li class="timeline-inverted">
						<div class="timeline-badge primary"><i class="fa fa-minus"></i></div>
						<div class="timeline-panel">
							<div class="timeline-heading">
								<h4 class="timeline-title text-left" style="font-size: 20px; font-weight: 900;">신고
								<i class="glyphicon glyphicon-chevron-down" style="float: right"></i>
								</h4>
							</div>
							<div class="timeline-body">
								<p>신고 내역을 확인하고 처리를 할 수 있습니다.</p>
							</div>
						</div>
					</li>
					<li class="timeline-inverted">
						<div class="timeline-badge danger"><i class="glyphicon glyphicon-gift"></i></div>
						<div class="timeline-panel">
							<div class="timeline-heading">
								<h4 class="timeline-title text-left" style="font-size: 20px; font-weight: 900;">기프티콘
								<i class="glyphicon glyphicon-chevron-down" style="float: right"></i>
								</h4>
							</div>
							<div class="timeline-body">
								<p>기프티콘을 업로드 할 수 있습니다.</p>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>

</body>
</html>