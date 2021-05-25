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
    border: none;
    border-radius:2pt;
    background:#336699;
  	color:#fff;
  	position:relative;
  	font-size:1.6em;
  	cursor:pointer;
  	transition:800ms ease all;
  }
	
  #btnReg:hover {
  	background:#f2f2f2;
  	color:#336699;
  }
	
  #btnReg:before,button:after{
	content:'';
	position:absolute;
	top:0;
	right:0;
	height:2px;
	width:0;
	background: #336699;
	transition:400ms ease all;
	}

  #btnReg:after{
    right:inherit;
    top:inherit;
    left:0;
    bottom:0;
  }

  #btnReg:hover:before,#btnReg:hover:after{
    width:100%;
    transition:800ms ease all;
  } 	
  
  #menuTitle {
    height:80px;
    width:400px;
    background-color:black;
    color:white;
    font-size: 20pt;
    font-weight: bold;
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
  
  #btnReg2 {
  	display: inline-block;
  	border: none;
  	margin-left: 50px;
  	padding: 15px 40px;
  	border-radius: 2pt;
  	font-weight: bold;
  	background: #8cb1d9;
  }
  
  #btnReg2:hover {
  	color:white;
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
	  	<div><button type="button" id="btnReg" data-toggle="modal" data-target="#scdReg" data-dismiss="modal">일정 등록</button></div>
	  	
	  	<!-- 일정등록 모달창 띄우기 -->
	  	  <div class="modal fade" id="scdReg" role="dialog">
    		<div class="modal-dialog">
	  	 		<!-- modal content -->
	  	 			<div class="modal-content">
        				<div class="modal-header">
          					<button type="button" class="close myclose" data-dismiss="modal">&times;</button>
          					<h4 class="modal-title">일정 등록하기</h4>
          				</div>
          				<div class="modal-body" style="height: 300px; width: 100%;">
          					<div id="reservation">
          						<iframe style="border: none; width: 100%; height: 280px;" src="<%=ctxPath%>">
          						</iframe>
          					</div>	
          				</div>
          				<div class="modal-footer">
          				</div>
          			</div>
    		</div>
  		</div>	
          					
          					
	  		<div class="lside" style="font-weight:bold;">내소속</div>
	  		<div id="teamName">구매팀</div>
	  		<div class="lside">수락 완료된 일정(<span></span>)</div>
	  		<div class="lside">수락 대기중인 일정(<span></span>)</div>
	  		<div id="function">
		  		<div id="option"><a href="<%=ctxPath%>/">-&nbsp;선택 일정 삭제</a></div>
		  		<div id="option"><a href="<%=ctxPath%>/">-&nbsp;선택 일정 수정</a></div>
		  		<div id="option"><a href="<%=ctxPath%>/">-&nbsp;전체 일정 삭제</a></div>
	  		</div>
	  		<button type="button" id="btnReg2" data-toggle="modal" data-target="#mtrReg" data-dismiss="modal">회의실 예약 ▶</button>
	  		
	  		<!-- 회의실예약 모달창 띄우기 -->
	  		<div class="modal fade" id="mtrReg" role="dialog">
    		<div class="modal-dialog">
	  		
		  		<!-- Modal content-->
	      		<div class="modal-content">
		        	<div class="modal-header">
		          		<button type="button" class="close myclose" data-dismiss="modal">&times;</button>
			  				<h4 class="modal-title">회의실 예약하기</h4>
			  		</div>
			  	<div class="modal-body">
         			 <div id="mtrResv">
			  			<iframe style="border: none; width: 100%; height: 350px;" src="">  
			          	</iframe>
			         </div>
			  	</div>
	        	<div class="modal-footer">
	        	</div>
      		</div>
		</div>
  </div>	

</div>
	
	<div id="headerInfo">
		<table>
			<tr>
				<td><img src=""/></td>
				<td style="padding:20px 10px 0px 10px;"><span style="color:#008ae6; font-weight:bold;">${sessionScope.loginuser.name}</span>&nbsp;님의 일정</td>
				<td id="chkboxes">
					<input type="checkbox" value="0"/>&nbsp;전체일정&nbsp;
					<input type="checkbox" value="1"/>&nbsp;부서일정&nbsp;
					<input type="checkbox" value="2"/>&nbsp;개인일정&nbsp;
				</td>
			</tr>
		</table>
	</div>
	<hr>
	
	<div id='calendar' style="padding:20px;"></div>
	
</div>
</body>
</html>
