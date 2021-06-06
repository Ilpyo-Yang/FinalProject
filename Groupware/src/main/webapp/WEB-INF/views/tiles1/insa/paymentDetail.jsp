<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/menu.css" />	

<jsp:include page="./insa_sidebar.jsp" />


<style>
	
	
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
	table#paymentDetailBaseInfo{
		border-collapse: collapse;
	}
	
	table#paymentDetailBaseInfo td{
		height: 35px;
		padding: 5px;
		border: solid 1px black;
		width: 120px;
		font-size: 13pt;
		text-align: center;
		vertical-align: middle;
	}
	table#paymentInfo{
		margin-top: 30px;
		border-collapse: collapse;
	}
	
	table#paymentInfo td{
		height: 35px;
		padding: 5px;
		border: solid 1px black;
		width: 120px;
		font-size: 13pt;
		text-align: center;
		vertical-align: middle;
	}
	table#paymentInfo tr{
		height: 35px;
		border: solid 1px black;
		text-align: center;
		vertical-align: middle;
	}
	table#paymentInfo th{
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
	
	th.thNum{
		width: 50px !important;
	}
	th.thSort{
		width: 200px !important;
	}
	td.tdNum{
		width: 50px !important;
	}
	td.tdSort{
		width: 200px !important;
	}
	
</style>

<script type="text/javascript">
	/* When the user clicks on the button,
	toggle between hiding and showing the dropdown content */
	
	
	// Close the dropdown menu if the user clicks outside of it
	
	$(document).ready(function(){
		
		

		
		
		
		
	});
	
	
	function goBackPayment(){
		var category = $("input#hiddenCategory").val();
		var seq = $("input#hiddenSeq").val();
		console.log(category);
		console.log(seq);
		location.href='<%=ctxPath%>/payment.opis?category='+category+'&seq='+seq;
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
				<input id="hiddenSeq" type="hidden" value="${insavo.mbr_seq}" />
				<input id="hiddenCategory" type="hidden" value="${category}" />
			</div>
			<div class="paymentInfoDiv" style="vertical-align: top; float: right;">
				<button id="closeBtn" class="paymentInfoBtn" onclick="goBackPayment()">돌아가기</button>
			</div>

			<div id='paymentInfoBorder' class='paymentBorder' style="margin-top: 30px;" >
				<button id="payModiBtn" class="paymentInfoBtn" onclick="goModifyPayment()" type="button">등록</button>
				<button id="payModiBtn" class="paymentInfoBtn" onclick="goModifyPayment()" type="button">수정</button>
				<button id="payDelBtn" class="paymentInfoBtn" onclick="goPaymentDel()" type="button">삭제</button>
								
				<table id='paymentInfo' class='paymentTbl'>
					<thead>
						<tr>
							<th class="thNum">순번</th>
							<th class="thSort">항목명</th>
							<th>계</th>
							<c:forEach var="pList" items="${paymentList}">
							<th>${pList.paymonth}</th>
							</c:forEach>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="tdNum">1</td>
							<td class="tdSort">기본급</td>
							<td></td>
							<c:forEach var="pList" items="${paymentList}">
							<td>${pList.basePay}</td>
							</c:forEach>
						</tr>
						<tr>
							<td class="tdNum">2</td>
							<td class="tdSort">상여</td>
							<td></td>
							<c:forEach var="pList" items="${paymentList}">
							<td>${pList.spePay}</td>
							</c:forEach>
						</tr>
						<tr>
							<td class="tdNum">3</td>
							<td class="tdSort">연차수당</td>
							<td></td>
							<c:forEach var="pList" items="${paymentList}">
							<td>${pList.breakPay}</td>
							</c:forEach>
						</tr>
						<tr>
							<td class="tdNum">4</td>
							<td class="tdSort">식대</td>
							<td></td>
							<c:forEach var="pList" items="${paymentList}">
							<td>${pList.mealPay}</td>
							</c:forEach>
						</tr>
						<tr>
							<td class="tdNum">5</td>
							<td class="tdSort">시간 외 근무 수당</td>
							<td></td>
							<c:forEach var="pList" items="${paymentList}">
							<td>${pList.timePay}</td>
							</c:forEach>
						</tr>
						<tr>
							<td class="tdNum"></td>
							<td class="tdSort">총 계</td>
							<td></td>
							<c:forEach var="pList" items="${paymentList}">
							<td>${pList.totalPay}</td>
							</c:forEach>
						</tr>
					</tbody>
				</table>
			</div>
			
			
	
</div>



