<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/menu.css" />	

<jsp:include page="./insa_sidebar.jsp" />


<style>
	
	
	button.paymentbackBtn{
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
	button.paymentbackBtn:hover{ background-color: #3e8e41}
	button.paymentbackBtn:active{
	  background-color: #3e8e41;
	  box-shadow: 0 5px #666;
	  transform: translateY(4px);
	}
	table#paymentDetailBaseInfo{
		border-collapse: collapse;
	}
	
	table#paymentDetailBaseInfo td{
		display: inline-block;
		height: 35px;
		padding: 5px;
		border: solid 1px black;
		width: 120px;
		font-size: 13pt;
		text-align: center;
		vertical-align: middle;
	}
	div.paymentInfoDiv{
		display: inline-block;
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
		var category = $("input#hiddenCategory").val();
		location.href='<%=ctxPath%>/payment.opis?category='+category;
	}
</script>

<div id="insa" style="width: 80%; display: inline-block; margin-top: 70px; padding-left: 30px;">
						
			<div class="paymentInfoDiv" style="vertical-align: top;">
				<table id="paymentDetailBaseInfo">
					<tr>
						<td>${insavo.mbr_seq}</td>
						<td>${insavo.mbr_name}</td>
						
						<c:if test="${insavo.fk_dept_no == 0}">
						<td>영업</td>
						</c:if>
						<c:if test="${insavo.fk_dept_no == 1}">
							<td>인사</td>
						</c:if>
						<c:if test="${insavo.fk_dept_no == 2}">
							<td>홍보</td>
						</c:if>
						<c:if test="${insavo.fk_dept_no == 3}">
							<td>IT</td>
						</c:if>
						<c:if test="${insavo.fk_dept_no == 4}">
							<td>회계</td>
						</c:if>
						<c:if test="${!(insavo.fk_dept_no == 4 || insavo.fk_dept_no == 3 || insavo.fk_dept_no == 2 || insavo.fk_dept_no == 1 || insavo.fk_dept_no == 0)}">
							<td>기타</td>
						</c:if>
					
						<c:if test="${insavo.fk_rank_no == 0}">
							<td>팀장</td>
						</c:if>						
						<c:if test="${insavo.fk_rank_no == 1}">
							<td>팀원</td>
						</c:if>						
						<c:if test="${insavo.fk_rank_no == 2}">
							<td style="color: red;">대표</td>
						</c:if>	
					</tr>
				</table>
				<input id="hiddenCategory" type="hidden" value="${category}" />
			</div>
			<div class="paymentInfoDiv" style="vertical-align: top; float: right;">
				<button id="closeBtn" class="paymentbackBtn" onclick="goBackPayment()">돌아가기</button>
			</div>

			<div id='paymentInfoBorder' class='paymentBorder' >
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
			
			
	
</div>



