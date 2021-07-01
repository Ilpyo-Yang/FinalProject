<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% String ctxPath = request.getContextPath(); %>

 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/menu.css" />
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/content.css" /> 
 <style type="text/css">
 
 #comIn,  #comOut{

 	padding: 3%;
 	border-radius: 25px;
  	background: #04AA6D;
  	color: white;
  	font-size: 25px;
 }
 
 #clock{
 	
 	border:none;
 	margin-top:30px;
 	margin-left: 500px;
 	margin-bottom: 100px;
 	color: #04AA6D;
 	font-size: 20px;
 	font-weight: 600;
 }
 
 </style>
 
 <jsp:include page="./checkCmt_sidebar.jsp" />
 <script type="text/javascript">

	function realtimeClock() {
	  document.rtcForm.rtcInput.value = getTimeStamp();
	  setTimeout("realtimeClock()", 1000);
	}
	
	
	function getTimeStamp() { // 24시간제
	  var d = new Date();
	
	  var s =
	    leadingZeros(d.getFullYear(), 4) + '-' +
	    leadingZeros(d.getMonth() + 1, 2) + '-' +
	    leadingZeros(d.getDate(), 2) + ' ' +
	
	    leadingZeros(d.getHours(), 2) + ':' +
	    leadingZeros(d.getMinutes(), 2) + ':' +
	    leadingZeros(d.getSeconds(), 2);
	
	  return s;
	}
	
	
	function leadingZeros(n, digits) {
	  var zero = '';
	  n = n.toString();
	
	  if (n.length < digits) {
	    for (i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}

 </script>

 <body onload="realtimeClock()">
 <div style="width: 1460px"> 
 
 	<!-- 게시판제목 -->
	<div style="padding: 15px; font-size: 25px; font-weight: 600; height: 60px; width: 100%; background-color: #f2f2f2;">
	</div>
	
	<!-- 현재시각 -->
	<form name="rtcForm">
	<input type="text" name="rtcInput" id="clock" size="20" readonly="readonly"/>
	</form>

	
	<!-- 등록 근태 표시부분 -->
	<div id="cmtStatus" style="width: 100%; margin-left: 400px;">
		<!-- 출근 기록이 있을 때 -->
		<c:if test="${not empty requestScope.cmtvo}">
			<table style="margin-left:160px;">
				<tr style="color: #04AA6D; padding-bottom:50px;">
					<th>
						<i class="fas fa-sign-in-alt fa-3x"></i>
					</th>
					<th style="width:50px;">&nbsp;</th>	
					<th>
		 				<i class="fas fa-sign-out-alt fa-3x"></i>
		 			</th>		
				</tr>
			 	<tr>
			 		<td id="comIn">
			 		${requestScope.cmtvo.starttime} (${requestScope.cmtvo.startstatus})
			 		</td>
			 		<td style="width:50px;">&nbsp;</td>
			 		<!-- 출근, 퇴근 기록이 있을 때 -->
		 			<c:if test="${requestScope.cmtvo.endtime ne null}">
		 				<td id="comOut">
				 			${requestScope.cmtvo.endtime} (${requestScope.cmtvo.endstatus})
				 		</td>
		 			</c:if>
				 	<!-- 출근 기록은 있고, 퇴근 기록은 없을 때 -->
				 	<c:if test="${requestScope.cmtvo.endtime eq null}">
					 	<td id="comOut">
					 		퇴근 정보 없음
					 	</td>
				 	</c:if>
			 	</tr>
		 	</table>
 	

		</c:if>
		<!-- 등록된 근태 사항이 없을 때 -->
		<c:if test="${empty requestScope.cmtvo}">
		 	<span style="width: 100%; margin-left: 300px; font-size: 25px; font-weight: 600; color: red;">
		 	등록된 출퇴근 사항이 없습니다.
		 	</span>
		</c:if>
	</div>

 </div>
</body>