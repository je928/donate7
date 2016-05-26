<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp" %>
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
var lat;
var lng;
var latlng = {lat: 36.2326301, lng: 127.91031629999997};


$(function() {
	$.get('https://apis.daum.net/local/geo/addr2coord?apikey=4433ad220df9e47a4bec346b73b442e4&q=${addr.addr}&output=xml',function(data,status){
		lng = $(data).find('lng');
		lat = $(data).find('lat');
		
	});
});

function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
	   zoom: 18,
	   center:latlng,
	   mapTypeId: google.maps.MapTypeId.ROADMAP   
	  });
  SetMarker();
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