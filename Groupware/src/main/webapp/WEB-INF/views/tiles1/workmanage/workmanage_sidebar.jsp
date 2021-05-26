<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>


<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/menu.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
button.accBtn {
	/* border: none; */
	display: block;
	width: 100%;
	text-align: left;
}
</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		$("button#btnReg").click(function(){
			location.href="<%=ctxPath%>/worklistAdd.opis";
		});
		
	}); 

</script>


<div id="sideMenu" style="width: 20%; border: 1px solid red;">
	<div id="menuTitle">업무 관리</div>
	<div>
		<button type="button" id="btnReg">업무 등록</button>
	</div>

	<div class="lside">
		<button class="accBtn side">To Do</button>
		<ul>
			<li><a class="" href="<%=ctxPath%>/todolist.opis">나의 할 일</a></li>
		</ul>
	</div>
	<div class="lside">
		<button class="accBtn side">업무 요청</button>
		<ul>
			<li><a class="" href="<%=ctxPath%>/sendWorkList.opis?fk_wtno=1&type=1">내가 한 업무 요청</a></li>
			<li><a class="" href="<%=ctxPath%>/sendWorkList.opis?fk_wtno=1&type=2">수신 업무 요청</a></li>
			<li><a class="" href="<%=ctxPath%>/sendWorkList.opis?fk_wtno=1&type=3">참조 업무 요청</a></li>
		</ul>
	</div>
	<div class="lside">
		<button class="accBtn side">업무 보고</button>
		<ul>
			<li><a class="" href="<%=ctxPath%>/sendWorkList.opis?fk_wtno=2&type=1">내가 한 업무 보고</a></li>
			<li><a class="" href="<%=ctxPath%>/sendWorkList.opis?fk_wtno=2&type=2">수신 업무 보고</a></li>
			<li><a class="" href="<%=ctxPath%>/sendWorkList.opis?fk_wtno=2&type=3">참조 업무 보고</a></li>
		</ul>
	</div>

</div>




