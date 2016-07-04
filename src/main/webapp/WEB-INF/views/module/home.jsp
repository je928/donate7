<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#pinBoot {
	position: relative;
	max-width: 100%;
	width: 100%;
}

img {
	width: 100%;
	max-width: 100%;
	height: 100px;
}

.white-panel {
	background: white;
	box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.3);
	padding: 10px;
	margin-bottom: 20px;
	margin-right: 30px;
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

.body {
	padding-top: 20px;
}

#myCarousel .nav a small {
	display: block;
}

#myCarousel .nav {
	background: #eee;
}

#myCarousel .nav a {
	border-radius: 0px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#pinBoot').pinterest_grid({
			no_columns : 6,
			padding_x : 10,
			padding_y : 10,
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

	$(document).ready(function() {
		$('#myCarousel').carousel({
			interval : 4000
		});

		var clickEvent = false;
		$('#myCarousel').on('click', '.nav a', function() {
			clickEvent = true;
			$('.nav li').removeClass('active');
			$(this).parent().addClass('active');
		}).on('slid.bs.carousel', function(e) {
			if (!clickEvent) {
				var count = $('.nav').children().length - 1;
				var current = $('.nav li.active');
				current.removeClass('active').next().addClass('active');
				var id = parseInt(current.data('slide-to'));
				if (count == id) {
					$('.nav li').first().addClass('active');
				}
			}
			clickEvent = false;
		});
	});
</script>
</head>
<body style="background-color: white;">

	<div class="container body">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/donate.png">
				</div>
				<div class="item">
					<img src="images/volunteer.png">
				</div>
				<div class="item">
					<img src="images/market.png">
				</div>
			</div>

			<ul class="nav nav-pills nav-justified">
				<li data-target="#myCarousel" data-slide-to="0" class="active">
					<a href="#">기부<small>donate</small></a>
				</li>
				<li data-target="#myCarousel" data-slide-to="1">
					<a href="#">봉사<small>volunteer</small></a>
				</li>
				<li data-target="#myCarousel" data-slide-to="2">
					<a href="#">마켓<small>market</small></a>
				</li>
			</ul>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-offset-19"></div>
		</div>
		<div class="container">
			<div class="row">
				<section id="pinBoot" class="text-center">
					<article class="white-panel">
						<img src="http://i.imgur.com/xOIMvAe.jpg" alt="">
						<h4>
							<a href="#">Title 2</a>
						</h4>
						<p>내용을 입력합니다. 내용을 입력합니다. 내용을 입력합니다. 내용을 입력합니다.</p>
					</article>
					<article class="white-panel">
						<img src="http://i.imgur.com/xOIMvAe.jpg" alt="">
						<h4>
							<a href="#">Title 2</a>
						</h4>
						<p>Excepteur sint occaecat cupidatat non proident, sunt in
							culpa qui officia deserunt mollit anim id est laborum.</p>
					</article>
					<article class="white-panel">
						<img src="http://i.imgur.com/xOIMvAe.jpg" alt="">
						<h4>
							<a href="#">Title 2</a>
						</h4>
						<p>Excepteur sint occaecat cupidatat non proident, sunt in
							culpa qui officia deserunt mollit anim id est laborum.</p>
					</article>
					<article class="white-panel">
						<img src="http://i.imgur.com/xOIMvAe.jpg" alt="">
						<h3>
							<a href="#">Title 2</a>
						</h3>
						<p>내용을 입력합니다.</p>
					</article>

					<article class="white-panel">
						<img src="http://i.imgur.com/xOIMvAe.jpg" alt="">
						<h4>
							<a href="#">Title 2</a>
						</h4>
						<p>내용을 입력합니다. 내용을 입력합니다. 내용을 입력합니다. 내용을 입력합니다.</p>
					</article>
					<article class="white-panel">
						<img src="http://i.imgur.com/xOIMvAe.jpg" alt="">
						<h4>
							<a href="#">Title 2</a>
						</h4>
						<p>Excepteur sint occaecat cupidatat non proident, sunt in
							culpa qui officia deserunt mollit anim id est laborum.</p>
					</article>
					<article class="white-panel">
						<img src="http://i.imgur.com/xOIMvAe.jpg" alt="">
						<h4>
							<a href="#">Title 2</a>
						</h4>
						<p>Excepteur sint occaecat cupidatat non proident, sunt in
							culpa qui officia deserunt mollit anim id est laborum.</p>
					</article>
					<article class="white-panel">
						<img src="http://i.imgur.com/xOIMvAe.jpg" alt="">
						<h4>
							<a href="#">Title 2</a>
						</h4>
						<p>Excepteur sint occaecat cupidatat non proident, sunt in
							culpa qui officia deserunt mollit anim id est laborum.</p>
					</article>
					<article class="white-panel">
						<img src="http://i.imgur.com/xOIMvAe.jpg" alt="">
						<h4>
							<a href="#">Title 2</a>
						</h4>
						<p>Excepteur sint occaecat cupidatat non proident, sunt in
							culpa qui officia deserunt mollit anim id est laborum.</p>
					</article>
					<article class="white-panel">
						<img src="http://i.imgur.com/xOIMvAe.jpg" alt="">
						<h4>
							<a href="#">Title 2</a>
						</h4>
						<p>Excepteur sint occaecat cupidatat non proident, sunt in
							culpa qui officia deserunt mollit anim id est laborum.</p>
					</article>
				</section>
			</div>
		</div>
	</div>

</body>
</html>