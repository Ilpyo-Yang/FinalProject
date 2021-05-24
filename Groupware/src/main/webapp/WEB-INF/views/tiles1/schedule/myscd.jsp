<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String ctxPath = request.getContextPath(); %>

<style type="text/css">



</style>

<link href='<%= ctxPath%>/resources/fullcalendar/main.css' rel='stylesheet' />
<script src='<%= ctxPath%>/resources/fullcalendar/main.js'></script>
	
<script type="text/javascript">

	$(document).ready(function(){
	
		document.addEventListener('DOMContentLoaded', function() {
	        var calendarEl = document.getElementById('calendar');
	        var calendar = new FullCalendar.Calendar(calendarEl, {
	          initialView: 'dayGridMonth'
	        });
	        calendar.render();
	      });
		
	});// end of $(document).ready(function(){})-----------------------------

	
</script>

<div>
<div id="headerInfo">
	<table id="basicInfo">
		<tr>
			<td><img src=""/></td>
			<td><span>접속자이름</span>&nbsp;님의 일정</td>
			<td>
				<input type="checkbox" value="0"/>&nbsp;전체일정
				<input type="checkbox" value="1"/>&nbsp;부서일정
				<input type="checkbox" value="2"/>&nbsp;개인일정
			</td>
		</tr>
	</table>
</div>

<hr>

<div id='calendar'></div>


</div>