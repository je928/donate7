<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type='text/javascript' src='//code.jquery.com/jquery-1.10.2.min.js'></script>
<script type='text/javascript' src='//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
<script type='text/javascript'>
	$(document).ready(function() {
		$('#characterLeft').text('140 characters left');
		$('#message').keydown(function() {
			var max = 140;
			var len = $(this).val().length;
			if (len >= max) {
				$('#characterLeft').text('You have reached the limit');
				$('#characterLeft').addClass('red');
				$('#btnSubmit').addClass('disabled');
			} else {
				var ch = max - len;
				$('#characterLeft').text(ch + ' characters left');
				$('#btnSubmit').removeClass('disabled');
				$('#characterLeft').removeClass('red');
			}
		});
	});
</script>
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
		<div class="col-md-offset-13 col-md-5">
   			<div class="form-area">
	       		<form role="form">
		        	<br style="clear:both">
		        	<h3 style="margin-bottom: 25px; text-align: center;">Delivery Form</h3>
					<div class="form-group">
						<input type="text" class="form-control" id="name" name="name" placeholder="Name" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="email" name="email" placeholder="Email" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="mobile" name="mobile" placeholder="Mobile Number" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="subject" name="subject" placeholder="Subject" required>
					</div>
					<div class="form-group">
						<textarea class="form-control" id="message" placeholder="Message" maxlength="140" rows="7"></textarea>
						<span class="help-block"><span id="characterLeft" class="help-block">You have reached the limit</span></span>
					</div>
					<button type="button" id="submit" name="submit" class="btn btn-primary pull-right">Submit Form</button>
				</form>
			</div>
		</div>
	</div>

</body>
</html>