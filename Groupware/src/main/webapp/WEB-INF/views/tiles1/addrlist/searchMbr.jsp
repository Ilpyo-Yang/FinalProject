<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">

#content {
    width: 100%;
    margin: 20px 0 0 20px;
    font-size: 15px;
 }

#addr_table{
	width: 90%;
	border-top: 3px solid black;
 	border-bottom: 3px solid black;
}

#addr_table th, td{
	border-top: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
 	padding: 5px;
 }

td#name{
	font-size: 20px; 
	font-weight: 600;
	height: 100px;
	background-color: lightgray;
}

.btnaddr{
	margin: 20px 0 0 0;
}

.title{
	font-size: 17px;
	font-weight: 600;
}

</style>

<script type="text/javascript">

</script>


<div id="content">
	<table id="addr_table">
	<c:forEach var="sMbrList" items="${searchMbrList}">
		<c:if test="${not empty searchMbrList}">
			<tr>
				<td colspan="2" id="name" style="border-bottom: none;">${sMbrList.mbr_name}</td>				
			</tr>
			<tr>
				<td colspan="2" style="border-top: none;">
	               	<input type="hidden" name="addr_seq" value="${sMbrList.mbr_seq}" />   
	           	</td>
			</tr>
			<tr>
				<th class="title">번호</th>
				<td>${sMbrList.mbr_phone_number}</td>
			</tr>
			<tr>
				<th class="title">이메일</th>
				<td>${sMbrList.mbr_email}</td>
			</tr>
			<tr>
				<th class="title">부서</th>
				<td>${sMbrList.dept_detail}</td>
			</tr>
			<tr>
				<th class="title">직책</th>
				<td>${sMbrList.rank_detail}</td>
			</tr>
			<tr>
				<th class="title">생년월일</th>
				<td>${sMbrList.mbr_birthday}</td>
			</tr>
		</c:if>
	</c:forEach>
	<c:if test="${empty searchMbrList}">
		<tr>
			<td><span>해당 사원번호의 사원이 존재하지 않습니다.</span></td>
		</tr>
	</c:if>
	
	</table>
</div>	
<div align="center">
	<button type="button" class="btnaddr" onclick="">확인</button>
   	<button type="button" class="btnaddr" onclick="window.close()">취소</button>
</div>
