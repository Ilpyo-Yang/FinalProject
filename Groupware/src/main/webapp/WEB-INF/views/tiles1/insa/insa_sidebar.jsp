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
 
function goInsaCate(category){
		
		location.href = "<%=ctxPath%>/insa.opis?category="+category;
		
	}
</script>


<div id="sideMenu" style="width: 20%; display: inline-block;">

	


	<div id="menuTitle">인사 관리</div>
	<div>
		<button type="button" id="btnReg" onclick="javascript:location.href='<%=ctxPath%>/insaRegister1.opis'">신규 사원 등록</button>
	</div>

	<div class="lside">
		<button class="accBtn side" onclick="javascript:location.href='<%=ctxPath%>/insa.opis'">인사정보</button>
		<ul>
			<li><a class="" onclick="goInsaCate(6)">전체</a></li>
		</ul>
		<ul>
			<li><a class="" onclick="goInsaCate(0)">영업</a></li>
		</ul>
		<ul>
			<li><a class="" onclick="goInsaCate(1)">인사</a></li>
		</ul>
		<ul>
			<li><a class="" onclick="goInsaCate(2)">홍보</a></li>
		</ul>
		<ul>
			<li><a class="" onclick="goInsaCate(3)">IT</a></li>
		</ul>
		<ul>
			<li><a class="" onclick="goInsaCate(4)">회계</a></li>
		</ul>
	</div>

	<div class="lside">
		<button class="accBtn side" onclick="javascript:location.href='<%=ctxPath%>/payment.opis'">급여정보</button>
		<ul>
			<li><a class="" onclick="goInsaCate(6)">전체</a></li>
		</ul>
		<ul>
			<li><a class="" onclick="goInsaCate(0)">영업</a></li>
		</ul>
		<ul>
			<li><a class="" onclick="goInsaCate(1)">인사</a></li>
		</ul>
		<ul>
			<li><a class="" onclick="goInsaCate(2)">홍보</a></li>
		</ul>
		<ul>
			<li><a class="" onclick="goInsaCate(3)">IT</a></li>
		</ul>
		<ul>
			<li><a class="" onclick="goInsaCate(4)">회계</a></li>
		</ul>
	</div>

</div>




