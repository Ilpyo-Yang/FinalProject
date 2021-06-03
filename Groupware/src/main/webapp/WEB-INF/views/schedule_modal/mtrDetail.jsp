<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>    

<style>

</style>

<script type="text/javascript">

	$(document).ready(function(){
		
	});

	function goDelReg() {
		var bool = confirm("예약을 취소하시겠습니까?");
		
		if(bool) {
			
		}
		
		
	}// end of function goDelReg() {}--------------------
	
</script>

<div>
	<h2>회의실 예약 내역</h2>
	
	<c:if test="${not empty requestScope.mtrhvo}">
		<form name="mtrResvFrm">	
			<table>
				<tr>
					<td>${requestScope.schedulevo.scdsubject}</td>
				</tr>
				<tr>
					<td>${requestScope.mtrhvo.mtrname}</td>
				</tr>
				<tr>
					<td>
					<input type="hidden" value="${requestScope.mtrhvo.usemtrno}"/>
					${requestScope.mtrhvo.regDate}
					</td>
				</tr>
				<tr>
					<td>${requestScope.mtrhvo.starttime}</td>
				</tr>
				<tr>
					<td>${requestScope.mtrhvo.endtime}</td>
				</tr>
			</table>
		</form>	
	</c:if>

	<c:if test="${empty requestScope.mtrhvo}">
		<div>해당 예약 내역은 존재 하지 않습니다.</div>
	</c:if>
	
	<div>
		<button type="button" onclick="goDelReg()">예약취소하기</button>
		<button type="button" onclick="javascript:closeWindow();">확인</button>
	</div>
</div>