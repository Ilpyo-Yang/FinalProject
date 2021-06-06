<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>개인 주소록 관리</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <jsp:include page="./addr_sidebar.jsp" />

	<script type="text/javascript">

	$(document).ready(function(){

		
	}); // end of $(document).ready(function(){})---------------------------------------

	
</script>
</head>
<body>

<div style="width: 1460px"> 
	
	<!-- 게시판 제목 -->
	<div style="padding: 15px; font-size: 25px; font-weight: 600; height: 60px; width: 100%; background-color: #f2f2f2; color: #555;">
	&nbsp;&nbsp;개인 주소록 관리
	</div>
	
	<div class="container" style="float: right; width: 80%; margin-top: 50px;">        

  		<!-- 등록 -->
		<form name="addAdrListFrm" style="margin-top: 20px;">
		  <span>추가&nbsp;&nbsp;</span>	
	      <input type="text" name="groupname" id="groupname" size="20" placeholder="그룹명" /> 
	      <input type="text" name="groupdetail" id="groupdetail" size="40" placeholder="그룹 설명" /> 
	      <button type="button" onclick="goAdd()">추가</button>
	   	</form>
	   
		<!-- 본문(게시판) -->
		<table class="table table-striped">
		    <thead>
		      <tr>
		        <th style="width: 20%; text-align: center;">그룹명</th>
		        <th style="width: 40%; text-align: center;">그룹설명</th>
		      </tr>
		    </thead>
		    <tbody>
		    	<c:if test="${not empty requestScope.addrList}"></c:if>
		      	<tr>
					<td>
						<span class="name">${requestScope.addrList.groupname}</span>
					</td>
					<td>
						<span class="detail">${requestScope.addrList.groupdetail}</span>
					</td>  	
		      	</tr>		
		      
		    </tbody>
		</table>
	  
	<!-- 페이지바 -->  
	<div align="center" style="width: 70%; border: solid 0px gray; margin: 20px auto;">
   		${requestScope.pageBar}
    </div>

  	</div>	  	
	
	
</div>
</body>
</html>
