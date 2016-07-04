<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#pinBoot').pinterest_grid({
		no_columns : 5,
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
		no_columns : 5,
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



	function locate(pageNum, fdp) {
		location.href = "goods.do?pageNum=" + pageNum + "&fdp=" + fdp;
	}
</script>
<style type="text/css">
@media ( min-width : 1200px) {
	.col-lg-3-1 {
		float: left;
	}
	.col-lg-3-1 {
		width: 20%;
	}
}

body {
	font-family: 'Quicksand', sans-serif;
}

.profile {
	margin-top: 25px;
	text-align: center;
}

.profile h1 {
	font-weight: normal;
	font-size: 16px;
	margin: 10px 0 0 0;
}

.profile h2 {
	font-size: 14px;
	font-weight: lighter;
	margin-top: 5px;
}

.profile .img-box {
	opacity: 1;
	display: white;
	position: relative;
}

.profile .img-box:after {
	content: "";
	opacity: 0;
	background-color: rgba(0, 0, 0, 0.75);
	position: absolute;
	right: 0;
	left: 0;
	top: 0;
	bottom: 0;
}

.profile .img-box:after, .img-box ul, .img-box ul li {
	-webkit-transition: all 0.5s ease-in-out 0s;
	-moz-transition: all 0.5s ease-in-out 0s;
	transition: all 0.5s ease-in-out 0s;
}

.btn-margin {
	margin: 15px 0 30px;
	padding-left: 400px;
}

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

.numm1 {
	font-size: 15px;
	margin-left: 20px;
}

.numm2 {
	font-size: 13px;
	margin-left: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-offset-17">
				<h3 class="page-header">Market</h3>
				<ol class="breadcrumb">
					<li><a href="main.do">Home</a></li>
					<li class="active">Market</li>
				</ol>
			</div>
		</div>

		<div class="btn-margin">
			<input type="button" id="f" class="btn btn-primary"
				onclick="location.href='goods.do?pageNum=1&fdp=f'" value="Fashion">
			<input type="button" id="d" class="btn btn-warning"
				onclick="location.href='goods.do?pageNum=1&fdp=d'" value="Design">
			<input type="button" id="p" class="btn btn-success"
				onclick="location.href='goods.do?pageNum=1&fdp=p'"
				value="Phone Case">
		</div>
		<div class="panel panel-default panel-table">
			<div class="panel-heading"></div>
			<div class="panel-body2">

				<section id="pinBoot"> <c:forEach var="go"
					items="${golist}">
					<article class="white-panel"> <a
						href="go_view.do?pr_no=${go.pr_no}&pageNum=${pageNum}"> <img
						src="image/${go.pr_img}" style="width: 300px; height: 230px;">
					</a>
					<h1 style="font-size: 18px">
						<a href="go_view.do?pr_no=${go.pr_no}&pageNum=${pageNum}">
							${go.pr_proname}</a>
					</h1>
					<div>
						<h1 style="font-size: 16px">${go.pr_price}원</h1>

					</div>

					</article>
				</c:forEach> 
			</section>
		</div>
			<div class="panel-footer2 text-center">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							<c:if test="${pg.startPage > pg.pagePerBlock}">
								<li><a href="javascript:locate(1,'${fdp}')">««</a></li>
								<li><a href="javascript:locate(${pg.nowPage-1},'${fdp}')">«</a></li>
							</c:if>
						</ul>
						<ul class="pagination">
							<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
								<c:if test="${i eq pg.nowPage}">
									<li><a href="#"><b class="b2">${i}</b></a></li>
								</c:if>
								<c:if test="${i ne pg.nowPage}">
									<li><a href="javascript:locate(${i},'${fdp}')">${i}</a></li>
								</c:if>
							</c:forEach>
						</ul>
						<ul class="pagination">
							<c:if test="${pg.totalPage > pg.endPage}">
								<li><a
									href="javascript:locate(${pg.startPage+pg.pagePerBlock},'${fdp}')">»</a></li>
								<li><a href="javascript:locate(${pg.totalPage},'${fdp}')">»»</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>