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
  
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/menu.css" />
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
    margin-top:40px;
    padding-left:70px;
  }

  #teamName {
  	text-align:center;
  }
  	
  #chkboxes {
    padding-left: 660px;
    padding-top: 20px;
  }

  #function {
  	margin: 40px 0 50px 0;
  	padding-left:70px;
  }	
	
  #option {
  	padding: 15px 0;  	
  }	
  
  #btnResv {
  	border: none;
  	padding: 15px 40px;
  	border-radius: 2pt;
  	font-weight: bold;
  	background: #8cb1d9;
  }
  
  #btnResv:hover {
  	color:white;
  }
  
  #user_img {
  	padding: 0px 20px;
  	vertical-align: bottom; 
  }
  
  #btnDelAll {
  	border: none;
  	padding: 15px 30px;
  	border-radius: 2pt;
  	font-weight: bold;
  	background: #b3b3b3;
  }
  
  #btnDelAll:hover {
  	color:white;
  }
  
</style>

	
<script src='<%=ctxPath%>/resources/fullcalendar-5.7.0/lib/main.js'></script>

<script type="text/javascript">

		$(document).ready(function(){
			
			$("button#btnDelAll").click(function(){
				var bool = confirm("전체 일정을 모두 삭제하시겠습니까?\n삭제하시면 복구할 수 없습니다.");
				
				if(bool) {
					location.href = "<%=ctxPath%>/delAll.opis";
				}
			});
			
			
		});// end of $(document).ready(function(){})--------------------------

		
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
	        	},
	        	navLinks: true,
	        	nowIndicator: true,
	        	eventLimit: true,
	            eventLimitText: "more",
	            eventLimitClick: "popover",
	            dayPopoverFormat: { year: 'numeric', month: 'long', day: 'numeric' },
	            events:function(info, successCallback, failureCallback) {
	        		 $.ajax({
	     				url:"<%=ctxPath%>/scdList.opis",
	     				dataType:"json",
	     				success:function(json){
	     					var scdArr = [];
	     						
	     						$.each(json, function(index,item){
	     							
	     							var startdate = item.scdstartdate.substring(0,10)+"T"+item.scdstartdate.substring(11,19);
	     							var enddate = item.scdenddate.substring(0,10)+"T"+item.scdenddate.substring(11,19);
	     							
	     							scdArr.push({title:item.scdsubject,
	     									start:startdate,
	     									end:enddate,
	     									url:"<%=ctxPath%>/showDetail.opis?scdno="+item.scdno})
	     						});
	     						console.log(scdArr);
	     						successCallback(scdArr);
	     				},
	     				error:function(request,status,error) {
	     					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	     				}
	     			});// end of $.ajax({})------------------------
	        	},
	        	eventClick: function(info) {
	        		var eventObj = info.event;
	        		if (eventObj.url) {
	        		    window.open(eventObj.url,"","left=350px, top=100px, width=700px, height=455px");
						info.jsEvent.preventDefault(); // prevents browser from following link in current tab.
	        		 } else {
	        		        alert('일정명: ' + eventObj.title +'\n'+
	        		        	  '시간: ' + eventObj.start +' ~ '+ eventObj.end);
	        		 }    
	        	},
	        	dayMaxEventRows: true, // for all non-TimeGrid views
	        	views: {
	        	    timeGrid: {
	        	      dayMaxEventRows: 6 // adjust to 6 only for timeGridWeek/timeGridDay
	        	    }
	        	},
	        	locale:'ko'
	        });
	        calendar.render();
	 });// end of document.addEventListener('DOMContentLoaded', function()----------------------
		
		 function scdReg() {
			 var url = "<%=ctxPath%>/scd_register.opis";
			 window.open(url, "scdRegister","left=350px, top=100px, width=700px, height=455px");
		 }
		 
		 function mtrResv() {
			 var url = "<%=ctxPath%>/mtr_resv.opis";
			 window.open(url, "mtrResv","left=350px, top=100px, width=900px, height=650px,");
		 }
		 
</script>
</head>
<body>

<div style="display: inline-block; width: 1400px;"> 
    <div id="sideMenu" style="display : inline-block; float:left;">
	  	<div id="menuTitle">일정</div>
	  	<button type="button" id="btnReg" onclick="scdReg()">일정 등록</button>	
	      					
	  		<div class="lside" style="font-weight:bold;">내소속</div>
	  		<div id="teamName">
				<c:choose>
					<c:when test="${sessionScope.loginuser.fk_dept_no eq 0}">
						영업팀
					</c:when>
					<c:when test="${sessionScope.loginuser.fk_dept_no eq 1}">
						인사팀
					</c:when>
					<c:when test="${sessionScope.loginuser.fk_dept_no eq 2}">
						홍보팀
					</c:when>
					<c:when test="${sessionScope.loginuser.fk_dept_no eq 3}">
						IT팀
					</c:when>
					<c:when test="${sessionScope.loginuser.fk_dept_no eq 4}">
						회계팀
					</c:when>
					<c:otherwise>
						CEO
					</c:otherwise>
				</c:choose>	  			
	  		</div>
	  		<div class="lside">수락 완료된 일정(<span></span>)</div>
	  		<div class="lside" style="margin-bottom:60px;">수락 대기중인 일정(<span></span>)</div>
	  		<br>
	  		<div style="text-align:center;">
	  			<button type="button" id="btnDelAll">전체 일정 삭제 ▶</button>
	  		</div>
	  		<br>
	  		<div style="text-align:center;">	
	  			<button type="button" id="btnResv" onclick="mtrResv()">회의실 예약 ▶</button>
	  		</div>
		  		
	  		
	  		
	</div>
	
	<div id="headerInfo">
		<table>
			<tr>
				<td id="user_img"><img src="<%=ctxPath%>/resources/images/menuuser.png" style="width:30px; height:30px;" /></td>
				<td style="padding:20px 0 0px 10px;"><span style="color:#008ae6; font-weight:bold;">${sessionScope.loginuser.mbr_name}</span>&nbsp;님의 일정</td>
				<td id="chkboxes">
					<input type="checkbox" value="0"/>&nbsp;전체일정&nbsp;
					<input type="checkbox" value="1"/>&nbsp;부서일정&nbsp;
					<input type="checkbox" value="2"/>&nbsp;개인일정&nbsp;
				</td>
			</tr>
		</table>
	</div>
	<hr>
	<div id='calendar' style="padding:10px 20px;"></div>
	
</div>
</body>
</html>
