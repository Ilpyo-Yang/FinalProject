<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">

	#listup {
		overflow:auto;
		margin: 10px;
		height: 270px;
		width: 560px;
		margin-left:30px;
	}
	
	table, th, td, tr {
		text-align: center !important;
		border-collapse: collapse;
		font-size: 11pt;
	}
	
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
	
	#sendBtn {padding-left: 40px;}
	
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="<%=ctxPath%>/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$("input:checkbox[name=email]").click(function() {
			var emailArr = [];
			var nameArr = [];
			var bool = $(this).prop("checked");

			if (bool) {
				emailArr.push($(this).val());
				nameArr.push($(this).parent().next().next().text());
			} 
			
			var emailList = emailArr.join();
			var nameList = nameArr.join();
			
			console.log(emailList);
			console.log(nameList);
			
			$("input.getEmail").val(emailList);
			$("input.getName").val(nameList);
		});
		
		$("input#searchWord").bind("keydown", function(){
			if(event.keyCode == 13) {
				goSearch();
			}
		});
		
		// 검색시 검색조건 및 검색어 값 유지시키기
		if(${not empty requestScope.paraMap}){
			$("select#searchType").val("${requestScope.paraMap.searchType}");
			$("input#searchWord").val("${requestScope.paraMap.searchWord}");
		}
		
		
		
	});// end of $(document).ready(function() {}---------------------------------- 
	
	function goSearch() {
		var frm = document.searchFrm;
		frm.action = "<%=ctxPath%>/scd_searchAddr.opis";
		frm.submit();
	}		
			
	function sendtoParent() {
		opener.document.getElementById("attendance").value = document.getElementById("mbr_name").value;
	}
	
	function sendMail() {
		var frm = document.pInfoFrm;
		frm.method = "POST";
		frm.action = "show_addresslist.opis";
		frm.submit();
	}
	
</script>

<div id="container">
<h3 style="margin-top:20px; margin-left:20px;">주소록</h3>
<hr>
	
	<div id="search">	
		<form name="searchFrm">
			<select name="searchType" id="searchType" >
				<option>선택</option>
				<option value="dept_name">부서</option>
				<option value="mbr_name">이름</option>
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
			
			<c:forEach var="address" items="${requestScope.addrList}">
				<tr>
					<td><input type="checkbox" id="chkbox" name="email" value="${address.mbr_email}" /></td>
					<td>${address.addr_seq}</td>
					<td>${address.mbr_name}</td>
					<td>${address.dept_name}</td>
					<td>${address.mbr_email}</td>
					<td id="phonenum">${address.mbr_phone_number}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>	

<form name="pInfoFrm">
	<div id="sendBtn">
		<input type="text" name="mbr_email" class="getEmail" id="getEmail"/>&nbsp;
		<button type="button" onclick="sendMail()">초대메일 전송</button>
	</div>
	
	<input type="hidden" class="getName" id="mbr_name" name="mbr_name" />
	<input type="hidden" name="myName" id="myName" value="${sessionScope.loginuser.mbr_name}"/>
	<input type="text" id="scdSubject" name="scdSubject"/>
</form>
	
	<div id="btns">
		<button type="button" class="cbtn ok" onclick="sendtoParent()">확인</button>
		<button type="button" class="cbtn" onclick="javascript:window.close();">닫기</button>
	</div>
	