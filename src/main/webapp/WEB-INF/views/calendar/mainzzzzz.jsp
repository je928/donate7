<%@ page language="java"  contentType="text/html;charset=UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>업무 시스템</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jui/jui.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/lib/animate.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/lib/main.css"/>
<link href='${pageContext.request.contextPath}/resources/fullcalendar/fullcalendar.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src="${pageContext.request.contextPath}/resources/SE/js/HuskyEZCreator.js" type="text/javascript" charset="utf-8"></script>
<script src='${pageContext.request.contextPath}/resources/lib/jquery.min.js'></script>
<script src='${pageContext.request.contextPath}/resources/lib/jquery-ui.custom.min.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/fullcalendar.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/lib/niee-canvas-chart003.js"></script>
<script src="${pageContext.request.contextPath}/resources/lib/ajaxfileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/base.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/core.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ui/button.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ui/combo.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ui/datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ui/dropdown.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ui/modal.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/uix/table.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/uix/tree.js"></script>
</head>
<body>
<div class="jui" style="width: 1250px;margin: 0 auto;">
<input type="hidden" id="selectUser">
<input type="hidden" id="selectTab" value="tab_Home">
<!-- 탭 -->
	<ul class="tab tab-top">
		<li class="active">
			<a href="#" id="tab_View" title="main_View">Schedule</a>
		</li>
		<li >
			<a href="#" id="tab_Home" title="main_Home">Employee</a>
		</li>
		<li><a href="#" id="tab_Lib" title="main_Lib">자료실</a></li>
		<li><a href="#" id="tab_Etc" title="main_Etc">Etc</a></li>
	</ul>
<!-- 스케줄 글보기 모달 -->
	<div id="modal" class="msgbox" style="display: none;">
		<div class="head">
			<span id="modal-title"></span>
			<!-- 508: $("#modal-title").html(article.title + '<span style="float:right;">'+article.name+'</span>');
			337: $("#modal-title").html(article.title + '<span style="float:right;">'+article.writer+'</span>');  -->
	    </div>
		<div class="body">
			<span id="modal-contents"></span>
			<!-- 497: $("#modal-contents").html(html);
			296: $("#modal-contents").html('<div class="label label-red" style="min-width:300px;">' + stime + ' ~ ' + etime + '</div><br><div class="notify contents-view" style="margin-top:5px;">' + article.contents +'</div>'+fileHtml); --> 
			
			<div style="text-align: center; margin-top: 45px;" id="contentsBtn">
			</div>
			<!-- 497: $("#modal-contents").html(html);
			296: $("#modal-contents").html('<div class="label label-red" style="min-width:300px;">' + stime + ' ~ ' + etime + '</div><br><div class="notify contents-view" style="margin-top:5px;">' + article.contents +'</div>'+fileHtml); -->  
		</div>
	</div>

	<!-- schedule view modal -->
	<div id="sviewModal" class="msgbox" style="display: none;">
		<div class="head">
			<span id="sviewModal-title"></span>
	    </div>
		<div class="body">
			<div class="contents-view" id="sviewModal-contents"></div>
			<div style="text-align: center; margin-bottom: 10px;">
				<a href="#" class="btn btn-gray btn-small" onclick='javascript:sviewModal.hide();'>Close</a>
			</div>
		</div>
	</div>
	<!-- 스케줄등록모달 달력 insert 과정 -->
	<div id="writeModal" class="msgbox" style="display: none;">
		<div class="head">
			<span>등록 폼</span>
	    </div>
		<div class="body">
			<table>
				<tr>
					<td>
						<input class="input input-rect" id="title" name="title" style="width: 612px" maxlength="100" placeholder="제목"/>
					</td>
				</tr>
				<tr>
					<td>
						<div id="schedulePicker">
						<div style="float: left;">
							<input class="input input-rect" id="starttime" name="starttime" style="width: 192px" placeholder="시작일" readonly="readonly"/>
							<div id="spicker" class="datepicker">
							    <div class="head">
							        <div class="prev"></div>
							        <div class="title"></div>
							        <div class="next"></div>
							    </div>
							    <table class="body">
							        <tr>
							            <th>S</th><th>M</th><th>T</th><th>W</th><th>T</th><th>F</th><th>S</th>
							        </tr>
							    </table>
							</div>
						</div>
						<div style="float: left;margin-top: 100px;margin-left: 100px;">
							<a class="btn btn-gray btn-small"><i class="icon-chevron-right"></i></a>
						</div>
						<div style="float: right;">
						<input class="input input-rect" id="endtime" name="endtime" style="width: 192px" placeholder="종료일" readonly="readonly"/>
						<script data-jui="#spicker" data-tpl="dates" type="text/template">
    						<tr>
        						<! for(var i = 0; i < dates.length; i++) { !>
        						<td><!= dates[i] !></td>
        						<! } !>
    						</tr>
						</script>
						<div id="epicker" class="datepicker">
						    <div class="head">
						        <div class="prev"></div>
						        <div class="title"></div>
						        <div class="next"></div>
						    </div>
						    <table class="body">
						        <tr>
						            <th>S</th><th>M</th><th>T</th><th>W</th><th>T</th><th>F</th><th>S</th>
						        </tr>
						    </table>
						</div>
						<script data-jui="#epicker" data-tpl="dates" type="text/template">
    						<tr>
        						<! for(var i = 0; i < dates.length; i++) { !>
        						<td><!= dates[i] !></td>
        						<! } !>
    						</tr>
						</script>
						</div>
						</div>
					</td>
				</tr>
				<tr>
					<td style="border-spacing: 0px;border-collapse: 0px;border: 1px solid #BEBeBe;">
						<span id="schedulefileName"></span>
						<div id="scheduleFiles">
							<input type="file" name="schedulefile" id="schedulefile"><br>
							<a href="#" id="scheduleFileAddBtn" class="btn btn-gray btn-small">파일등록</a>(파일선택 후 등록해야 글 저장시 함께 등록 됩니다.)
						</div>
					</td>
				</tr>
				<tr>
					<td style="border-spacing: 0px;border-collapse: 0px;height:25px;border: 1px solid #BEBeBe;">
						공유 여부 : <input type="checkbox" id="etcYn"><font color="red">(체크시 Etc 에 표시 되지 않습니다.)</font>
					</td>
				</tr>
				<tr>
					<td>
						<textarea class="input" id="contents" name="contents" style="width: 610px;height: 300px;" placeholder="내용"></textarea>
					</td>
				</tr>
			</table>
			<div style="text-align: center;">
				<a href="#" id="writeBtn" class="btn btn-gray btn-small">저장</a>
				<a href="#" id="writeClose" class="btn btn-gray btn-small">Close</a>
			</div>
		</div>
	</div>
	
				
		
		<!-- ETc영역 달력 검색 뷰 부분-->
		<div id="main_Etc" style="display: none;">
			<div>
				<div class="group" >
					<a class="left btn btn-mini btn-gray-black" id="etc-refresh"><span>새로고침</span>&nbsp;<i class="icon-refresh"></i></a>
					<a class="left btn btn-mini btn-gray-black" id="etc-chart"><span>통계</span>&nbsp;<i class="icon-gear"></i></a>
					<a class="left btn btn-mini btn-gray-black" id="etc-game"><span>지렁이 게임</span>&nbsp;<i class="icon-image"></i></a>
				</div>
				<span id="etcSelect">
					<select id="syear">
						<script>
							var date = new Date();
							for(var i = (date.getFullYear()-1) ; i > (date.getFullYear()-2) ; i --){
								document.write("<option value='"+i+"'>"+i+"년</option>");
							}
							document.write("<option selected='selected' value='"+date.getFullYear()+"'>"+date.getFullYear()+"월</option>");
							for(var i = (date.getFullYear()+1) ; i < (date.getFullYear()+2) ; i ++){
								document.write("<option value='"+i+"'>"+i+"년</option>");
							}
						</script>
					</select>
					<select id="smonth">
						<script>
							var date = new Date();
							for(var i = 0 ; i < 12 ; i ++){
								if(i == date.getMonth()){
									document.write("<option selected='selected' value='"+(i+1)+"'>"+(i+1)+"월</option>");
								}else{
									document.write("<option value='"+(i+1)+"'>"+(i+1)+"월</option>");
								}
							}
						</script>
					</select>
					~
					<select id="eyear">
						<script>
							var date = new Date();
							for(var i = (date.getFullYear()-1) ; i > (date.getFullYear()-2) ; i --){
								document.write("<option value='"+i+"'>"+i+"년</option>");
							}
							document.write("<option selected='selected' value='"+date.getFullYear()+"'>"+date.getFullYear()+"월</option>");
							for(var i = (date.getFullYear()+1) ; i < (date.getFullYear()+2) ; i ++){
								document.write("<option value='"+i+"'>"+i+"년</option>");
							}
						</script>
					</select>
					<select id="emonth">
						<script>
							var date = new Date();
							for(var i = 0 ; i < 12 ; i ++){
								if(i == date.getMonth()){
									document.write("<option selected='selected' value='"+(i+1)+"'>"+(i+1)+"월</option>");
								}else{
									document.write("<option value='"+(i+1)+"'>"+(i+1)+"월</option>");
								}
							}
						</script>
					</select>
					<a class="left btn btn-mini btn-gray-black" id="etc-search" onclick="getEtc()"><span>검색</span></a>
				</span>
				<div class="group" style="float: right;">
					<a class="left btn btn-mini btn-gray-black" id="etc-print"><span>출력</span>&nbsp;<i class="icon-document"></i></a>
				</div>
			</div>
			<div id="etc-contents" style="margin-top: 5px;">
				
			</div>
		</div>

		<!-- Schedule_View -->
		<div id="main_View" style="display: block;">
			<div class="group" >
				<a class="left btn btn-mini btn-gray-black" id="sview-refresh"><span>새로고침</span>&nbsp;<i class="icon-refresh"></i></a>
				(날짜의 빈공간을 클릭하면 스케줄을 등록 할 수 있습니다.)
			</div>
			<div id='schcalendar'></div>
		</div>
	</div>
	</div>
</div>
<script type="text/javascript">
function getContextPath(){
    var context = '${pageContext.request.contextPath}'
    return context;
}
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/intranet_JUI.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/intranet_JQUERY.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/intranet_FUNCTION.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/intranet_DATE.js"></script>
</body>
</html>