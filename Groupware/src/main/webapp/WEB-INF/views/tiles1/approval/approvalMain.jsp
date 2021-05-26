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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
  
<link rel="stylesheet" type="text/css" href="resources/css/approval.css"/>

<script type="text/javascript">
	$(document).ready(function(){
	
		
	}); // end of $(document).ready(function(){})---------------------------------------
	
</script>
</head>
<body>

<div style="display: inline-block; width: 1400px;"> 
    <div id="sideMenu">
	  	<div id="menuTitle">전자결재</div>
	
  		<div class="lside"><a class="side" href="#">결재</a></div>
  		<div class="lside"><a class="side" href="#">기안문작성</a></div>
  		<div class="lside"><a class="side" href="#">일반기안서</a></div>
  		<div class="lside"><a class="side" href="#">지출결의서</a></div>
  		<div class="lside"><a class="side" href="#">휴가신청서</a></div>
  		
  		<div class="lside"><a class="side" href="#">결재진행함</a></div>
  		<div class="lside"><a class="side" href="#">완료문서함</a></div>
  		<div class="lside"><a class="side" href="#">반려문서함</a></div>
  		
  		<hr>
  		
  		<div class="lside"><a class="side" href="#">설정</a></div>
  		<div class="lside"><a class="side" href="#">서명관리</a></div>
 	</div>
	
	<div id="approvalContainer">
		<span class="subtitle">기안문작성</span>
		<hr>
		<div id="approvalForm">        	
			<div class="menu"><i class="fas fa-file-signature fa-3x icon"></i>일반기안서</div>
			<div class="menu"><i class="fas fa-file-signature fa-3x icon"></i>지출결의서</div>
			<div class="menu"><i class="fas fa-file-signature fa-3x icon"></i>휴가신청서</div>
		</div>
	</div>
	  	
	
	
</div>
</body>
</html>
