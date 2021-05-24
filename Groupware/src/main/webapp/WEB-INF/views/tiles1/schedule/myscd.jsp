<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String ctxPath = request.getContextPath(); %>

<style type="text/css">

#sideMenu {
	width:20%;
	height:750px;
    background-color: #f2f2f2;
  }

  #btnReg {
    margin: 30px 40px;
    padding: 15px 50px;
    font-size: 15pt;
    box-shadow: 3px 3px 3px gray;
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
    margin-top:50px;
    padding:10px 0 10px 70px;
  }

  a {
    color: black;
    font-size:25px;
    text-decoration: none;
    font-weigth: bold;
  }

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

<div id="sideMenu">s
  	<div id="menuTitle">게시판</div>
  	<div><button type="button" id="btnReg">게시글 등록</button></div>

  		<div class="lside"><a href="#">전체공지사항</a></div>
  		<div class="lside"><a href="#">부서공지사항</a></div>
  		<div class="lside"><a href="#">공통서식</a></div>

</div>

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