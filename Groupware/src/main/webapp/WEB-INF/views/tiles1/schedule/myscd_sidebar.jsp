<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>    
    
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/menu.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

<style type="text/css">
	
	.myTeam {
		margin-bottom: 5px;
		padding-left: 40px;
	}
	
	.sideInfo {
		margin-bottom: 25px;
		padding-left: 40px;
	}
	
	#teamName {
		text-align:center;
		margin-bottom:40px;	
	}
		
	#btnResv {
	  	border: none;
	  	padding: 15px 40px;
	  	border-radius: 2pt;
	  	font-weight: bold;
	  	background: #8cb1d9;
  	}
  
	#btnResv:hover {color:white;}
	
	#btnDelAll {
	  	border: none;
	  	padding: 15px 30px;
	  	border-radius: 2pt;
	  	font-weight: bold;
	  	background: #b3b3b3;
	}
  
  	#btnDelAll:hover {color:white;}
		
</style>


<script type="text/javascript">
	
	$(document).ready(function(){
		$("button#btnDelAll").click(function(){
			var bool = confirm("전체 일정을 모두 삭제하시겠습니까?\n삭제하시면 복구할 수 없습니다.");
			
			if(bool) {
				location.href = "<%=ctxPath%>/delAll.opis";
			}
		});
	});
	
</script>

<div id="sideMenu" style="display:inline-block; float:left;">
	  	<div id="menuTitle">일정</div>
	  	<div id="btnDiv">
	  		<button type="button" id="btnReg" onclick="scdReg()">일정 등록</button>	
	    </div> 					
	  		<div class="myTeam" style="font-weight:bold;">내소속</div>
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
	  		<div class="sideInfo">수락 완료된 일정(<span></span>)</div>
	  		<div class="sideInfo" style="margin-bottom:60px;">수락 대기중인 일정(<span></span>)</div>
	  		<br>
	  		<div style="text-align:center;">
	  			<button type="button" id="btnDelAll">전체 일정 삭제 ▶</button>
	  		</div>
	  		<br>
	  		<div style="text-align:center;">	
	  			<button type="button" id="btnResv" onclick="mtrResv()">회의실 예약 ▶</button>
	  		</div>
		  		
</div>
