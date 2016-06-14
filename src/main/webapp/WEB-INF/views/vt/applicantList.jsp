<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp" %>
<%@ include file="../session/orgChk.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		var vt_tot = '${vt_tot}';
		var appCount = parseInt('${appCount}');
		if(appCount == 0){
			alert('신청자가 존재하지 않습니다.');
			window.close();
		}
		$('input[name=vt_sel_yn]').click(function(){
			var count = $('input[name=vt_sel_yn]:checked').length;
			if(count > vt_tot){
				alert("모집인원 (" + vt_tot + "명)보다 선정인원이 더 많습니다.");
				$(this).attr("checked",false);
			}
		});
		
		$('#select').click(function(){
				if(confirm("현재 선택으로 결정합니까?(현재 선택 인원으로 봉사를 진행합니다.)")){
					var valueArr = new Array();
					var list = $('input[name=vt_sel_yn]');
						for(var i = 0; i < list.length;i++){
							if(list[i].checked){
								valueArr.push(list[i].value);
							}
						}
						
						if(valueArr.length != 0){
							jQuery.ajaxSettings.traditional = true;
							
							$.ajax({
							    method      : 'GET',
							    url         : 'appSelect.do',
							    data        : {
							        'valueArr' : valueArr,
							        'vt_no' : parseInt('${vt_no}')
							    },
							    error       : function(request, status, error) {
							        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
							    },
							    success     : function(msg) {
							        alert(msg);
							        window.opener.location = 'myRecruit.do';
							        window.close();
							        
							    }
							});
						}else{
							alert('신청자가 선택되지 않았습니다.');
						}
				}
		});
		
		$('#cancel').click(function(){
			window.close();
		});		
	});

</script>
</head>
<body>
	<h4>봉사 신청자 </h4>
	<table class="table table-striped table-hover" style="width: 100%" >
		<tr>
			<th>이메일</th>
			<th>이름</th>
			<th>나이</th>
			<th>성별</th>
			<th>전화번호</th>
			<th>직업</th>
			<th>경고횟수</th>
			<th>총봉사 시간</th>
			<th>선정여부</th>
		</tr>
		<c:forEach var="app" items="${list }">
		<tr>
			<td>${app.m_email }</td>
			<td>${app.m_name }</td>
			<td>${app.m_age }</td>
			<td>${app.m_gender }</td>
			<td>${app.m_tel }</td>
			<td>${app.m_job }</td>
			<td>${app.wnCount }</td>
			<td>${app.totalVolTime }</td>
			<td>
				<c:if test="${app.vt_sel_yn eq 'Y' }">
					<input type="checkbox" name="vt_sel_yn" value="${app.m_no}" checked="checked">
				</c:if>
				<c:if test="${app.vt_sel_yn eq 'N' }">
					<input type="checkbox" name="vt_sel_yn" value="${app.m_no}">
				</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	<input type="button" class="btn btn-primary btn-md" value="결정" id="select">
	<input type="button" class="btn btn-primary btn-md" value="취소" id="cancel">
</body>
</html>