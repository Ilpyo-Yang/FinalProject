<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">

	#listup {
		margin: 10px;
		overflow: hidden;
		height: 290px;
		width: 550px;
	}
	
	table, th, td, tr {
		text-align: center !important;
		border-collapse: collapse;
	}
	
	table {margin-left:20px;}
	
	th {padding: 10px;}
	
	td {
		text-align: center;
		padding: 10px;
	}
	
	#search {text-align: center;}
	
	#searchType {height: 25.5px;}
	
	#searchImg {
		width:20px;
		height:20px;
	}
	
	#btns {
		text-align:right;
		margin-top: 10px;
		margin-right: 50px;
	}
	
	.cbtn {
		border:none;
		border-radius: 2pt;
		font-weight: bold;
		width : 50px;
		height: 30px;
		box-shadow: 1pt 1pt 1pt gray;
	}
	
	.ok {
		background:black;
		color: white;
	}
	
	#sendBtn {
		padding-left: 40px;
	}
	
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="<%=ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$("input:checkbox[name=email]").click(function() {
			var resultArr = [];
			var bool = $(this).prop("checked");

			if (bool) {
				resultArr.push($(this).val());
			} 
			
			var result = resultArr.join();
			
			console.log(result);
			
			$("input.getEmail").val(result);
			
		});
		
	});// end of $(document).ready(function() {}---------------------------------- 
	
	function sendMail() {
		
	}
	
</script>

<div id="container">
<h3 style="margin-top:20px; margin-left:20px;">주소록</h3>
<hr>
	
	<div id="search">	
		<form name="searchFrm">
			<select name="searchType" id="searchType" >
				<option>선택</option>
				<option>부서</option>
				<option>이름</option>
			</select>
			
			<input type="text" name="searchWord" id="searchWord" size="20" autocomplete="off">
			<a href="#" onclick="goSearch()"><img src="<%=ctxPath%>/resources/images/icon_search.png" id="searchImg"/></a>
		</form>
	</div>	

	<div id="listup">
		<table class="table table-striped">
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
					<td>${addrList.mbr_email}</td>
					<td id="phonenum">${addrList.mbr_phone_number}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>	
	
	<div id="sendBtn">
		<input type="text" name="mbr_email" class="getEmail" id="getEmail"/>&nbsp;
		<button type="button" onclick="sendMail()">초대메일 전송</button>
	</div>
	
	<div id="btns">
		<button type="button" class="cbtn ok" onclick="sendtoParent()">확인</button>
		<button type="button" class="cbtn" onclick="javascript:window.close();">닫기</button>
	</div>
