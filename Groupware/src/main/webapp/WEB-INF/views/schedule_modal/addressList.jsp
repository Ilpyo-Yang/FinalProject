<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>

<style type="text/css">

</style>

<script type="text/javascript">

	$(document).ready(function(){
		
	});

</script>

<div id="container">
<h2>주소록</h2>
	
	<table>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>부서</th>
			<th>이메일</th>
		</tr>	
		<c:forEach var="addrList" items="${requestScope.addrList}">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>			
		</c:forEach>
	</table>

<form name="">

</form>

</div>