<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>::: Opistachio :::</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/menu.css" />		
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<script type="text/javascript">

	$(document).ready(function(){
	
		
	}); // end of $(document).ready(function(){})---------------------------------------
	
</script>
</head>
<body>

<div style="display: inline-block; width: 1400px;"> 
    <div id="sideMenu">
	  	<div id="menuTitle">조직도</div>
	
  		<div class="lside"><a class="side" href="#">전체</a></div>
  		<div class="lside"><a class="side" href="#">영업팀</a></div>
  		<div class="lside"><a class="side" href="#">인사팀</a></div>
  		<div class="lside"><a class="side" href="#">홍보팀</a></div>
  		<div class="lside"><a class="side" href="#">IT팀</a></div>
  		<div class="lside"><a class="side" href="#">회계팀</a></div>
	</div>
	
<div class="container" style="float: right; width: 700px; margin: 50px 200px; ">        


</div>
	  	
	
	
</div>
</body>
</html>
