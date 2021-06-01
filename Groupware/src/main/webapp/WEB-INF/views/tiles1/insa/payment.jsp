<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/menu.css" />	

<jsp:include page="./insa_sidebar.jsp" />


<style>
	/* Dropdown Button */
	.dropbtn {
	  background-color: #68b658;
	  color: white;
	  padding: 16px;
	  font-size: 16px;
	  border: none;
	  cursor: pointer;
	}
	
	/* Dropdown button on hover & focus */
	.dropbtn:hover, .dropbtn:focus {
	  background-color: #41a441;
	}
	
	/* The container <div> - needed to position the dropdown content */
	.dropdown {
	  position: relative;
	  display: inline-block;
	}
	
	/* Dropdown Content (Hidden by Default) */
	.dropdown-content {
	  display: none;
	  position: absolute;
	  background-color: #f1f1f1;
	  min-width: 160px;
	  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	  z-index: 1;
	}
	
	/* Links inside the dropdown */
	.dropdown-content a {
	  color: black;
	  padding: 12px 16px;
	  text-decoration: none;
	  display: block;
	}
	
	/* Change color of dropdown links on hover */
	.dropdown-content a:hover {background-color: #ddd}
	
	/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
	.show {display:block;}
	
	button.paymentInfoBtn{
	  display:inline-block;
 	  margin-left: 20px;
	  padding: 10px 20px;
	  font-size: 10px;
	  text-align: center;
	  cursor: pointer;
	  outline: none;
	  color: #fff;
	  background-color: #04AA6D;
	  border: none;
	  border-radius: 15px;
	  box-shadow: 0 9px #999;
	}
	button.paymentInfoBtn:hover{ background-color: #3e8e41}
	button.paymentInfoBtn:active{
	  background-color: #3e8e41;
	  box-shadow: 0 5px #666;
	  transform: translateY(4px);
	}
	table#insaSearchTbl tr{
		display: inline-block;
		height: 50px;
	}
	
	table#insaSearchTbl td{
		display: inline-block;
		height: 50px;
		padding: 10px;
	}
	form.example{
		display: inline-block;
		float: none;
		height: 50px;
	}
	button#insaSearchButton{
		width: 50px;
		height: 35px;
		font-size: 12pt;
	}
	
	table.paymentTbl{
		border-collapse: collapse;
		
	}
	div.paymentBorder{
		display: inline-block;
		margin-top: 20px;
		
	}
	table.paymentTbl td {
		border: solid 1px black;
		font-size: 10pt;
		height: 50px;	
	}
	td.tdNarrow{
		width: 100px;	
	}
	td.tdWide{
		width: 150px;	
	}
	
	table.paymentTbl tr{
		border: solid 1px black;
		vertical-align: middle;
	}
	table.paymentTbl input{
		height: 30px;
	}
	table#memberListTbl{
		margin-left:10px;
	}
	table#paymentInfo{
		margin-left: 10px;
	}
	div#paymentInfoBorder{
		display: inline-block;
		border: solid 3px #68b658;
		background-color: white;
		width: 50%;
		height: 400px;
		padding-top: 30px;
		text-align: center;
	}
	div.paymentInfoDiv{
		display: inline-block;
	}
	.green{
		background-color: #68b658; 
		font-size: 15pt;
		font-weight: bold;
	}
</style>

<script type="text/javascript">
	/* When the user clicks on the button,
	toggle between hiding and showing the dropdown content */
	
	function myFunction() {
	  document.getElementById("myDropdown").classList.toggle("show");
	}
	
	
	// Close the dropdown menu if the user clicks outside of it
	
	$(document).ready(function(){
		$("div#paymentInfoBorder").hide();
		$("dropdown-content").click(function(event){
			console.log(event.text);
		});

		$("tr.clickMemberPay").click(function(){
			$("tr.clickMemberPay").children().removeClass("green");
			$(this).children().addClass("green");
			$("input#hiddenSeq").text($(this).children("td.seq").text());
			$("div#paymentInfoBorder").show();
			
			
						
		});
		
		
		
		
	});
	
	
	function goBackPayment(){
		$("div#paymentInfoBorder").hide();
		$("tr.clickMemberPay").children().removeClass("green");
	}
	function goPaymentDetail(){
		var seq = $("input#hiddenSeq").text();
		var category = $("input#hiddenCategory").val();
		location.href='<%=ctxPath%>/paymentDetail.opis?category='+category+'&seq='+seq;
	}
</script>

<div id="insa" style="width: 80%; display: inline-block; margin-top: 70px; padding-left: 30px;">
			<table style="margin-bottom: 30px;">
				<tr>
					<td>
						<form name="form1" id="form1" action="/action_page.php">
				 			<select name="subject" id="subject">
						    	<option value="" selected="selected">사원번호</option>
						    	<option value="" selected="selected">사원명</option>
						    	<option value="" selected="selected">부서명</option>
						  	</select>
						  	<input type="text" placeholder="Search.." name="search" style="height: 20px;">
						 	<input type="submit" value="검색">
						</form>

					</td>
				</tr>
			</table>
			<div style="display:inline-block; width: 48%; vertical-align: top;">
			<table id="insaListaTbl" class="table table-striped tdtable">
					<thead>
					<tr>
						<th style="width: 25%; ">사원번호</th>
						<th style="width: 25%; ">사원명</th>
						<th style="width: 25%; ;">부서</th>
						<th style="width: 25%; ">직책</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="insaList" items="${requestScope.insaList}">
					<tr class="clickMemberPay" >
						<td class="seq">${insaList.mbr_seq}</td>
						<td>${insaList.mbr_name}</td>
						<c:if test="${insaList.fk_dept_no == 0}">
							<td>영업</td>
						</c:if>
						<c:if test="${insaList.fk_dept_no == 1}">
							<td>인사</td>
						</c:if>
						<c:if test="${insaList.fk_dept_no == 2}">
							<td>홍보</td>
						</c:if>
						<c:if test="${insaList.fk_dept_no == 3}">
							<td>IT</td>
						</c:if>
						<c:if test="${insaList.fk_dept_no == 4}">
							<td>회계</td>
						</c:if>
						<c:if test="${!(insaList.fk_dept_no == 4 || insaList.fk_dept_no == 3 || insaList.fk_dept_no == 2 || insaList.fk_dept_no == 1 || insaList.fk_dept_no == 0)}">
							<td>기타</td>
						</c:if>
						
						<c:if test="${insaList.fk_rank_no == 0}">
							<td>팀장</td>
						</c:if>						
						<c:if test="${insaList.fk_rank_no == 1}">
							<td>팀원</td>
						</c:if>						
						<c:if test="${insaList.fk_rank_no == 2}">
							<td style="color: red;">대표</td>
						</c:if>	
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<input id="hiddenSeq" type="hidden" />
			<input id="hiddenCategory" type="hidden" value="${category}" />
			</div>
			<div id='paymentInfoBorder' class='paymentBorder' >
				<div class="paymentInfoDiv" style="width: 100%; ">
				<table id='paymentInfo' class='paymentTbl'>
					<tr>
						<td class="tdNarrow">주민등록번호</td><td colspan='3'></td>
					</tr>
					<tr>
						<td class="tdNarrow">입사일</td><td class="tdWide"></td><td class="tdNarrow">퇴사일</td><td class="tdWide"></td>
					</tr>
					<tr>
					<td class="tdNarrow">급여계정과목</td><td class="tdWide"></td><td class="tdNarrow">이달급여</td><td class="tdWide"></td>
					</tr>
					<tr>
					<td class="tdNarrow">상여계정과목</td><td class="tdWide"></td><td class="tdNarrow">상여금</td><td class="tdWide"></td>
					</tr>
					<tr>
					<td class="tdNarrow">은행</td><td class="tdWide">계좌번호</td><td class="tdNarrow">예금주</td><td class="tdWide"></td>
					</tr>
					<tr>
					<td class="tdNarrow"></td><td class="tdWide"></td><td class="tdNarrow"></td><td class="tdWide"></td>
					</tr>
				</table>
				</div>
				<div class="paymentInfoDiv" style="vertical-align: top;">
					<button id="closeBtn" class="paymentInfoBtn" onclick="goBackPayment()">닫기</button>
					<button id="payDetailBtn" class="paymentInfoBtn" onclick="goPaymentDetail()">자세히</button>
				</div>
			</div>
			
			
	
</div>



