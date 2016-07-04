<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#pinBoot {
	position: relative;
	max-width: 95%;
	width: 95%;
	margin-left: 20px;
	margin-bottom: 7px;
}

img {
	width: 100%;
	max-width: 100%;
}

.white-panel {
	position: absolute;
	background: white;
	box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.3);
	padding: 10px;
}

.white-panel h1 {
	font-size: 1em;
}

.white-panel h1 a {
	color: #A92733;
}

.white-panel:hover {
	box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.5);
	margin-top: -5px;
	-webkit-transition: all 0.1s ease-in-out;
	-moz-transition: all 0.1s ease-in-out;
	-o-transition: all 0.1s ease-in-out;
	transition: all 0.1s ease-in-out;
}
.numm1{
	font-size: 15px;
	margin-left: 20px;
}
.numm2{
	font-size: 13px;
	margin-left: 20px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#pinBoot').pinterest_grid({
			no_columns : 3,
			padding_x : 15,
			padding_y : 30,
			margin_bottom : 50,
			single_column_breakpoint : 700
		});
	});

	;
	(function($, window, document, undefined) {
		var pluginName = 'pinterest_grid', defaults = {
			padding_x : 10,
			padding_y : 10,
			no_columns : 3,
			margin_bottom : 50,
			single_column_breakpoint : 700
		}, columns, $article, article_width;

		function Plugin(element, options) {
			this.element = element;
			this.options = $.extend({}, defaults, options);
			this._defaults = defaults;
			this._name = pluginName;
			this.init();
		}

		Plugin.prototype.init = function() {
			var self = this, resize_finish;

			$(window).resize(function() {
				clearTimeout(resize_finish);
				resize_finish = setTimeout(function() {
					self.make_layout_change(self);
				}, 11);
			});

			self.make_layout_change(self);

			setTimeout(function() {
				$(window).resize();
			}, 500);
		};

		Plugin.prototype.calculate = function(single_column_mode) {
			var self = this, tallest = 0, row = 0, $container = $(this.element), container_width = $container
					.width();
			$article = $(this.element).children();

			if (single_column_mode === true) {
				article_width = $container.width() - self.options.padding_x;
			} else {
				article_width = ($container.width() - self.options.padding_x
						* self.options.no_columns)
						/ self.options.no_columns;
			}

			$article.each(function() {
				$(this).css('width', article_width);
			});

			columns = self.options.no_columns;

			$article
					.each(function(index) {
						var current_column, left_out = 0, top = 0, $this = $(this), prevAll = $this
								.prevAll(), tallest = 0;

						if (single_column_mode === false) {
							current_column = (index % columns);
						} else {
							current_column = 0;
						}

						for (var t = 0; t < columns; t++) {
							$this.removeClass('c' + t);
						}

						if (index % columns === 0) {
							row++;
						}

						$this.addClass('c' + current_column);
						$this.addClass('r' + row);

						prevAll.each(function(index) {
							if ($(this).hasClass('c' + current_column)) {
								top += $(this).outerHeight()
										+ self.options.padding_y;
							}
						});

						if (single_column_mode === true) {
							left_out = 0;
						} else {
							left_out = (index % columns)
									* (article_width + self.options.padding_x);
						}

						$this.css({
							'left' : left_out,
							'top' : top
						});
					});

			this.tallest($container);
			$(window).resize();
		};

		Plugin.prototype.tallest = function(_container) {
			var column_heights = [], largest = 0;

			for (var z = 0; z < columns; z++) {
				var temp_height = 0;
				_container.find('.c' + z).each(function() {
					temp_height += $(this).outerHeight();
				});
				column_heights[z] = temp_height;
			}

			largest = Math.max.apply(Math, column_heights);
			_container.css('height', largest
					+ (this.options.padding_y + this.options.margin_bottom));
		};

		Plugin.prototype.make_layout_change = function(_self) {
			if ($(window).width() < _self.options.single_column_breakpoint) {
				_self.calculate(true);
			} else {
				_self.calculate(false);
			}
		};

		$.fn[pluginName] = function(options) {
			return this.each(function() {
				if (!$.data(this, 'plugin_' + pluginName)) {
					$.data(this, 'plugin_' + pluginName, new Plugin(this,
							options));
				}
			});
		}
	})(jQuery, window, document);
	
	function locate(pageNum,ctg){
		location.href="doList.do?pageNum="+pageNum+"&ctg="+ctg;
	}
	
	function info(pageNum,d_no,ctg){
		location.href="doView.do?pageNum="+pageNum+"&d_no="+d_no+"&ctg="+ctg;
	}
	
</script>
</head>
<body>
	
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-offset-17">
				<h3 class="page-header">
					Donation <small>기부</small>
				</h3>
				<ol class="breadcrumb">
					<li><a href="main.do">Home</a></li>
					<li class="active">Donation</li>
				</ol>
			</div>
		</div>
		
		<div class="col-md-12">
		<div class="list-group2 text-center">
			<input type="button" class="btn btn-success" onclick="location.href='doList.do?pageNum=1&ctg=all'" value="전체"> &nbsp;
			<input type="button" class="btn btn-success" onclick="location.href='doList.do?pageNum=1&ctg=p'" value="사람"> &nbsp;
			<input type="button" class="btn btn-success" onclick="location.href='doList.do?pageNum=1&ctg=a'" value="동물"> &nbsp;
			<input type="button" class="btn btn-success" onclick="location.href='doList.do?pageNum=1&ctg=e'" value="환경"> &nbsp;
			<input type="button" class="btn btn-success" onclick="location.href='doList.do?pageNum=1&ctg=etc'" value="기타">
		</div>
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
			</div>
			<div class="panel-body2">
				<section id="pinBoot">
					<c:if test="${not empty list}">
						<c:forEach var="donate" items="${list}">
							<c:set var="sumD" value ="${ds.sumDonate(donate.d_no) }"> </c:set>
							<article class="white-panel">
								<c:if test="${donate.category == '학생' || donate.category == '회사원' ||
								donate.category == '자영업' || donate.category == '무직'}">
								<strong>[ 기타 ]</strong>
								</c:if>
								<c:if test="${donate.category != '학생' and donate.category != '회사원' and
								donate.category != '자영업' and donate.category != '무직'}">
								<strong>[ ${donate.category} ]</strong>
								</c:if>
								<img src="image/${donate.d_img}">
								<h5>
									<a href="javascript:info(${gp.nowPage},${donate.d_no},'${donate.ctg}')">${donate.d_title}</a>
								</h5>
								<div>
									<p class="numm1">
										<strong> <fmt:formatNumber value="${donate.d_amount}"
												groupingUsed="true" /></strong><span>원 목표</span>
									</p>
									<p class="numm2">
										<strong><fmt:formatNumber value="${sumD}"
												groupingUsed="true" /></strong><span>원 후원</span>
									</p>
								</div>
							</article>
						</c:forEach>
					</c:if>
				</section>
					<c:if test="${empty list}">
						<div class="text-center"> 데이터가 없습니다. </div>
					</c:if>
			</div>
			<div class="panel-footer2 text-center">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							<c:if test="${gp.startPage > gp.pagePerBlock}">
								<li><a href="javascript:locate(1,'${ctg}')">««</a></li>						
								<li><a href="javascript:locate(${gp.nowPage-1},'${ctg}')">«</a></li>
							</c:if>
						</ul>
						<ul class="pagination">
							<c:forEach var="i" begin="${gp.startPage}" end="${gp.endPage}">
								<c:if test="${i eq gp.nowPage}">
									<li><a href="#"><b class="b2">${i}</b></a></li>
								</c:if>
								<c:if test="${i ne gp.nowPage}">
									<li><a href="javascript:locate(${i},'${ctg}')">${i}</a></li>
								</c:if>
							</c:forEach>
						</ul>
						<ul class="pagination">
							<c:if test="${gp.totalPage > gp.endPage}">
								<li><a href="javascript:locate(${gp.startPage+gp.pagePerBlock},'${ctg}')">»</a></li>
								<li><a href="javascript:locate(${gp.totalPage},'${ctg}')">»»</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
		
		<div class="container">
			<div class="row">
				
			</div>
		</div>
	</div>
	
</body>
</html>