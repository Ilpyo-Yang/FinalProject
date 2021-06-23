<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/menu.css" />
<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/boardButtons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

<script type="text/javascript">

	$(document).ready(function(){
		
		$("button#startWork").click(function(){
			location.href="<%=ctxPath%>/startWork.opis";
		});
		
		$("button#endWork").click(function(){
			location.href="<%=ctxPath%>/endWork.opis";
		});
		
	}); // end of $(document).ready(function(){})---------------------------------------
	
</script>


<div id="sideMenu">
	<div id="menuTitle">개인 근태 관리</div>

	<div style="margin-top: 30px; text-align: center;">
		<i class="far fa-smile fa-5x"></i><br><br>
		<span style="color: blue; font-size: 20px;">${sessionScope.loginuser.mbr_name}</span> 님 환영합니다.
	</div>
	
	<div class="lside" style="margin-top: 20px; text-align: center;">
		<button type="button" class="btn-ok" style="margin-right: 10px;" id="startWork">출근</button>
		<button type="button" class="btn-basic" id="endWork">퇴근</button>
	</div>
</div>
