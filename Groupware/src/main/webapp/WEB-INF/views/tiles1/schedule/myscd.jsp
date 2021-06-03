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
    margin-top:20px;
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
  	display: inline-block;
  	border: none;
  	margin-left: 50px;
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
  
</style>

	
<script src='<%=ctxPath%>/resources/fullcalendar-5.7.0/lib/main.js'></script>

<script type="text/javascript">

		$(document).ready(function(){
			
		});

		 document.addEventListener('DOMContentLoaded', function() {
		        var calendarEl = document.getElementById('calendar');
		        var calendar = new FullCalendar.Calendar(calendarEl, {
		        	initialView: 'dayGridMonth',
		        	headerToolbar: {
		        	left: 'prev,next today',
		        	center: 'title',
		        	right: 'dayGridMonth,timeGridWeek,timeGridDay'
		        	},
		        	editable: true,
		        	allDaySlot: false,
		        	eventLimit: true,
		        	eventLimitText: "more",
		            eventLimitClick: "popover",
					contentHeight: 600,
		        	weekNumbers:true,
		        	businessHours: {
		        		  daysOfWeek: [ 1, 2, 3, 4, 5 ], // 월 - 금
						  startTime: '09:00',
		        		  endTime: '18:00',
		        	},
		        	navLinks: true,
		        	nowIndicator: true,
		        	events: function(info, successCallback, failureCallback) {
		        		$.ajax({
		        			url:"<%=ctxPath%>/showScd.opis",
		        			dataType:"json",
		        			success: function(result) {
		        				
		        				if(result != null) {
		        					$.each(result, function(index, item){
		        						var scddiv = item.fk_scdno2;
		        						var subject = item.scdsubject;
		        						var startdate = moment(item.scdstartdate).format('yyyy-mm-dd hh24:mi');
		        						var enddate = moment(item.scdenddate).format('yyyy-mm-dd hh24:mi');
		        						
		        						if(scddiv == 0) {
		        							event.push({
		        								title: subject,
		        								start: startdate,
		        								end: enddate,
		        								url:"<%=ctxPath%>/scdDetail.opis?scdno="+item.scdno,
		        							});
		        						}
		        						else if(scddiv == 1) {
		        							event.push({
		        								title: subject,
		        								start: startdate,
		        								end: enddate,
		        								url: "<%=ctxPath%>/scdDetail.opis?scdno="+item.scdno,
		        							});
		        						}
		        						else {
		        							event.push({
		        								title: subject,
		        								start: startdate,
		        								end: enddate,
		        								url: "<%=ctxPath%>/scdDetail.opis?scdno="+item.scdno,
		        							});
		        						}
		        					});	
		        					
		        				}// end of if--------------
		        				       				
		        				 successCallback(events); 
		    				},
		    				error:function(request, status, error) {
		        				alert("code: "+request.status+"\n"+"message: " +request.responseText+"\n"+"error: "+error);
		        			}
		        		});    
		        		
		        		},
			        locale:'ko'
		        });
		        calendar.render();
		 });// end of document.addEventListener('DOMContentLoaded', function()----------------------
	
		 
		 function scdReg() {
			 var url = "<%=ctxPath%>/scd_register.opis";
			 window.open(url, "scdRegister","left=350px, top=100px, width=700px, height=450px");
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
					<c:when test="${sessionScope.loginusre.fk_dept_no eq 3}">
						IT팀
					</c:when>
					<c:when test="${sessionScope.loginusre.fk_dept_no eq 4}">
						회계팀
					</c:when>
					<c:otherwise>
						CEO
					</c:otherwise>
				</c:choose>	  			
	  		</div>
	  		<div class="lside">수락 완료된 일정(<span></span>)</div>
	  		<div class="lside">수락 대기중인 일정(<span></span>)</div>
	  		<div id="function">
		  		<div id="option"><a href="<%=ctxPath%>/">-&nbsp;선택 일정 삭제</a></div>
		  		<div id="option"><a href="<%=ctxPath%>/">-&nbsp;선택 일정 수정</a></div>
		  		<div id="option"><a href="<%=ctxPath%>/">-&nbsp;전체 일정 삭제</a></div>
	  		</div>
	  		<button type="button" id="btnResv" onclick="mtrResv()">회의실 예약 ▶</button>
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
