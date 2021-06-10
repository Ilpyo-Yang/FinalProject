<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<% String ctxPath = request.getContextPath(); %>

<style type="text/css">
#processBtn > button {
	width: 80px;
	height: 25px;
	border: solid 1px black;
	background-color: white;
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		$("#processBtn > button").click(function(){
			$("#processBtn > button").each(function(index, item){
				$(item).css({"background-color": "#ffffff"});	
			});
			
			$(this).css({"background-color": "#ffcccc"});
		});
		
		$.ajax({
			
		});
	});
	
</script>

<%-- 업무요청 처리내역 --%>
<c:if test="${fk_wtno == 1}">
	<form id="workRegFrm">
		<table class="table table-striped workShowtable">
			<thead>
				<tr>
					<th colspan="4">처리내역</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>수신자</td>
					<td></td>
					
					<td>최종수정일</td>
					<td></td>
				</tr>
				<tr>
					<td>진척률</td>
					<td colspan="3" id="processBtn">
						<button type="button">0%</button>
						<button type="button">20%</button>
						<button type="button">40%</button>
						<button type="button">60%</button>
						<button type="button">80%</button>
						<button type="button">100%</button>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3"><textarea cols="70" rows="5"></textarea></td>
				</tr>
			</tbody>
		</table>
	</form>
</c:if>
	
<%-- 업무보고 처리내역 --%>
<c:if test="${fk_wtno == 2}">
	<form id="workRegFrm">
		<table class="table table-striped workShowtable">
			<thead>
				<tr>
					<th>확인내역</th>
					<th style="text-align: right;" colspan="3">
						<button type="button" class="workStatus" style="background-color: #66ccff; font-weight: normal;">처리중 40%</button>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>수신자</td>
					<td>${wmvo.fk_receiver_seq}</td>
					
					<td style="background-color: white;"></td>
					<td></td>
				</tr>
				<tr>
					<td>최종수정일</td>
					<td colspan="3">2020.01.13 12:10</td>
				</tr>
				<tr>
					<td>의견</td>
					<td colspan="3"><textarea cols="70" rows="5"></textarea></td>
				</tr>
			</tbody>
		</table>
	</form>
</c:if>    