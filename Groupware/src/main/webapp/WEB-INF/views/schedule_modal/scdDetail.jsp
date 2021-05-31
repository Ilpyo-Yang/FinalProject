<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String ctxPath = request.getContextPath(); %>

<style>

</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		
		
	});


	function goDelScd() {
		var bool = confirm("정말 삭제하시겠습니까?");
		
		if(bool) {
			location.href="<%=ctxPath%>/delScd.opis";
		}
		
		
	}// end of function goDelScd() {}----------------------
	
</script>


<div>
	<h2>일정 상세 내역</h2>
	
	<c:if test="${not empty requestScope.schedulevo}">
		<table>
			<tr>
				<td>
					<c:if test=""></c:if> <!-- 1이면 부서일정 -->
					<c:if test=""></c:if> <!-- 2이면 개인일정 -->
				</td>
			</tr>	
			<tr>
				<td>제목</td>
			</tr>
			<tr>
				<td> ~ </td> <!-- 일자 입력 -->
			</tr>
			<tr>
				<td> ~ </td> <!-- 시간 입력 -->
			</tr>
				<td>장소</td>
			</tr>
			<tr>
				<td>참석자</td>
			</tr>
		</table>
	
	</c:if>
	
	<c:if test="${empty requestScope.schedulevo}">
		<div>해당 일정은 존재 하지 않습니다.</div>
	</c:if>
	
		<div>
			<button type="button" onclick="javascript:location.href='<%=ctxPath%>/editScd.opis?scdno='">수정</button>
			<button type="button" onclick="goDelScd()">삭제</button>
			<button type="button" onclick="javascript:closeWindow();">닫기</button> 
		</div>

</div>