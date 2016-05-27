<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#map {
	height: 100%;
}
</style>
</head>
<body>
	<div id="map"></div>
	<script type="text/javascript">

var map;
var marker;
var latlng = {lat: ${lat} , lng: ${lng}};

function initMap() {
	
  map = new google.maps.Map(document.getElementById('map'), {
	   zoom: 18,
	   center:latlng,
	   mapTypeId: google.maps.MapTypeId.ROADMAP   
	  });
  SetMarker();
  alert(latlng.lat);
	alert(latlng.lng);
}


function SetMarker(){
	marker = new google.maps.Marker({
		position:latlng,
		map:map
	});
}

    </script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwJDlAm22bRBfQS47FY22fnC6Jp-Bo2qY&callback=initMap">
    </script>
</body>
</html>