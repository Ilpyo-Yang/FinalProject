<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<% String ctxPath = request.getContextPath(); %>

<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/menu.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/content.css" /> 
    <link href='<%=ctxPath%>/resources/fullcalendar-5.7.0/lib/main.css' rel='stylesheet' />
    <script src='<%=ctxPath%>/resources/fullcalendar-5.7.0/lib/main.js'></script>
    <jsp:include page="./checkCmt_sidebar.jsp" />
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          timeZone:'local',
      	  headerToolbar: {
	        	  left: 'prev,next today',
	        	  center: 'title',
	          	  right: 'dayGridMonth,timeGridWeek,timeGridDay'
      	  },
      	  editable: true,
      	  allDaySlot: false,
			  contentHeight: 600,
      	  weekNumbers:true,
      	  businessHours: {
      		    daysOfWeek: [ 1, 2, 3, 4, 5 ], // 월 - 금
				startTime: '09:00',
      		    endTime: '18:00',
      	  }
        });
        calendar.render();
      });

    </script>
  </head>
  <body>


    <div id='calendar' style="padding:3% 3%;"></div>
  </body>
</html>