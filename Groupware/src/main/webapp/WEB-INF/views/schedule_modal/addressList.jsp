<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>

<style type="text/css">

	#listup {
		margin: 10px;
		overflow: hidden;
		border: solid 1px green;
		height: 290px;
		width: 550px;
	}
	
	table, th, td, tr {
		border: solid 1px gray;
		border-collapse: collapse;
	}
	
	th {
		padding: 10px;
	}
	
	td {
		text-align: center;
		padding: 10px;
	}
	
	
</style>

<script type="text/javascript" src="<%=ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">


	$(document).ready(function() {
		$("input:checkbox[name=email]").click(function() {
			var result = "";
			var bool = $(this).prop("checked");

			console.log($(this).val());
			if (bool) {
				result = $(this).val();
			} else {
				result = "";
			}
			
			$("input.getEmail").val(result);
			
		});
	});
	
</script>

<div id="container">
<h2 style="margin-top:20px;">주소록</h2>
<hr>
	
	<div id="listup">
		<table>
			<tr>
				<th>선택</th>
				<th>번호</th>
				<th>이름</th>
				<th>부서</th>
				<th>이메일</th>
				<th>전화번호</th>
			</tr>	
			<c:forEach var="addrList" items="${requestScope.addrList}">
				<tr>
					<td><input type="checkbox" id="chkbox" name="email" value="${addrList.mbr_email}" /></td>
					<td>${addrList.addr_seq}</td>
					<td>${addrList.mbr_name}</td>
					<td>${addrList.dept_name}</td>
					<td style="text-align:left !important;">${addrList.mbr_email}</td>
					<td>${addrList.mbr_phone_number}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div>
		<input type="text" name="mbr_email" class="getEmail" id="getEmail"/>&nbsp;
		<button type="button" onclick="">초대메일 전송</button>
	</div>
	
<form name="">
	
</form>

</div>