<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>


<!DOCTYPE html>
<html lang="en">
<head>
<title>내 일정</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  
<link href='<%=ctxPath%>/resources/fullcalendar-5.7.0/lib/main.css' rel='stylesheet' />
<style>

  #sideMenu {
	width:20%;
	height:750px;
    background-color: #f2f2f2;
    display: inline-block;
  }

  #btnReg {
    margin: 30px 40px;
    padding: 15px 50px;
    font-size: 15pt;
    border-radius:2pt;
  }

  #menuTitle {
    height:80px;
    width:400px;
    background-color:black;
    color:white;
    font-size: 20pt;
    text-align: center;
    display:table-cell;
    vertical-align:middle;
  }

  .lside {
    margin-top:20px;
    padding-left:70px;
  }
	
  #teamName {
  	text-align:center;
  }
  	
  #chkboxes {
    padding-left: 730px;
    padding-top: 20px;
  }

  #function {
  	margin: 40px 0 50px 0;
  	padding-left:70px;
  }	
	
  #option {
  	padding: 15px 0;  	
  }	
  
  #btnRez {
  	display: inline-block;
  	margin-left: 50px;
  	padding: 15px 40px;
  	border-radius:10pt;
  }
  
</style>

	
<script src='<%=ctxPath%>/resources/fullcalendar-5.7.0/lib/main.js'></script>


<script type="text/javascript">

		 document.addEventListener('DOMContentLoaded', function() {
		        var calendarEl = document.getElementById('calendar');
		        var calendar = new FullCalendar.Calendar(calendarEl, {
		        	initialView: 'dayGridMonth',
		        	headerToolbar: {
		        	left: 'prev,next today',
		        	center: 'title',
		        	right: 'dayGridMonth,timeGridWeek,timeGridDay'
		        	},
		        });
		        calendar.render();
		      });
	
</script>
</head>
<body>

<div style="display: inline-block; width: 1400px;"> 
    <div id="sideMenu" style="display : inline-block; float:left;">
	  	<div id="menuTitle">일정</div>
	  	<div><button type="button" id="btnReg" onclick="">일정 등록</button></div>
	
	  		<div class="lside" style="font-weight:bold;">내소속</div>
	  		<div id="teamName">구매팀</div>
	  		<div class="lside">수락 완료된 일정(<span></span>)</div>
	  		<div class="lside">수락 대기중인 일정(<span></span>)</div>
	  		<div id="function">
		  		<div id="option"><a href="<%=ctxPath%>/">-&nbsp;선택 일정 삭제</a></div>
		  		<div id="option"><a href="<%=ctxPath%>/">-&nbsp;선택 일정 수정</a></div>
		  		<div id="option"><a href="<%=ctxPath%>/">-&nbsp;전체 일정 삭제</a></div>
	  		</div>
	  		<button type="button" onclick="goRsvdMtr()" id="btnRez">회의실 예약 ▶</button>
	</div>
	
	<div id="headerInfo">
		<table>
			<tr>
				<td><img src=""/></td>
				<td style="padding:20px 10px 0px 10px;"><span style="color:#008ae6; font-weight:bold;">${sessionScope.loginuser.name}</span>&nbsp;님의 일정</td>
				<td id="chkboxes">
					<input type="checkbox" value="0"/>&nbsp;전체일정
					<input type="checkbox" value="1"/>&nbsp;부서일정
					<input type="checkbox" value="2"/>&nbsp;개인일정
				</td>
			</tr>
		</table>
	</div>
	<hr>
	
	<div id='calendar' style="padding:20px;"></div>
	
</div>
</body>
</html>
