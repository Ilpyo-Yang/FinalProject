<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>
    
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
	
	#resvList {
		overflow:hidden;
		margin-top:30px;
		width: 588px;
		height: 170px;
	}
	
	table, tr, th, td {
		border: solid 1px green;
		border-collapse: collapse;
		font-size: 11pt;
	}
	
	table {margin-left:17px;}
	
	td {text-align:center;}
	
	#btns {
		text-align:right;
		padding-right: 20px;
	}
	
</style>

<script type="text/javascript" src="<%=ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	function cancelMtr() {
		
		var checkArr = new Array();
		
		$("input#usemtrno[name=usemtrno]:checked").each(function(){
			checkArr.push($(this).val());
		});
		
		
		
	}

</script>

<div id="container">
<h2>${sessionScope.loginuser.mbr_name} 님의 예약내역</h2>
<hr>

	<div id="resvList">
		<table>
			<tr>
				<th>선택</th>
				<th>회의실명</th>
				<th>예약자</th>
				<th>예약명</th>
				<th>시작시간</th>
				<th>종료시간</th>
			</tr>
			<c:forEach var="mtrResvList" items="${requestScope.mtrResvList}">
				<tr>
					<td><input type="checkbox" id="usemtrno" name="usemtrno" value="${mtrResvList.usemtrno}"/></td>
					<td>${mtrResvList.mtrname}</td>
					<td>${mtrResvList.booker}</td>
					<td>${mtrResvList.mtrsubject}</td>
					<td>${mtrResvList.starttime}</td>
					<td>${mtrResvList.endtime}</td>
				</tr>
			</c:forEach>
		</table>
		
	</div>
	<br>
	<div id="btns">
		<button type="button" class="btn " onclick="cancelMtr()">취소하기</button>
		<button type="button" class="btn close" onclick="javascript:window.close();">닫기</button>
	</div>


</div>