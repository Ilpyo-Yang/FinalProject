<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<style>
	
	h2 {
		margin-top: 15px;
		margin-left:10px;
	}
	
	table, td, tr {
		border-top: solid 1px #e6e6e6;
		border-bottom: solid 1px #e6e6e6;
		border-collapse: collapse;
		margin-left: 10px;
	}
	
	#title {
		border-right:solid 3px #006080;
		padding: 10px 20px 10px 10px;
		text-align: right;
		font-weight: bold;
	}
	
	#content {padding:0 180px 0 30px;}
	
	#btns {padding: 10px 40px 0 0;}
	
	.btn {
		margin-right: 3px;
		border: none;
		box-shadow: 2px 2px 2px gray;
		width: 50px;
		height:30px;
		border-radius: 2pt;
		cursor: pointer;
		font-size: 10pt;
		font-weight: bold;
	}
	
	.done {
		background:#ffbb33;
		color: white;
	}
	
	.del {
		background:#66d9ff;
		color: white;
	}
	
</style>

<script type="text/javascript">

	function goDelScd() {
		var bool = confirm("정말 삭제하시겠습니까?");
		
		if(bool) {
			
			var frm = document.scdDetail;
			frm.method = "POST";
			frm.action = "<%=ctxPath%>/delScd.opis";
			frm.submit();
			
		}
	}// end of function goDelScd() {}----------------------
	
	function goClose() {
		window.close();
	}
	
</script>


<div>
	<h2>일정 상세 내역</h2>
	<hr align="left" style="margin-left:10px; width:600px;">
	<br>
	
	<c:if test="${not empty requestScope.schedulevo}">
	<div class="container">
		<form name="scdDetail">
			<table>
				<tr>
					<td id="title">일정구분</td>
					<td id="content">
						<input type="hidden" name="scdno" value="${requestScope.schedulevo.scdno}"/>
						<c:if test="${requestScope.schedulevo.fk_scdno2 eq 1}">부서일정</c:if> 
						<c:if test="${requestScope.schedulevo.fk_scdno2 eq 2}">개인일정</c:if>
					</td>
				</tr>	
				<tr>
					<td id="title">일정명</td>
					<td id="content">${requestScope.schedulevo.scdsubject}</td>
				</tr>
				<tr>
					<td id="title">일자</td>
					<td id="content">${requestScope.schedulevo.scdstartdate}&nbsp;${requestScope.schedulevo.scdstartTm} ~ ${requestScope.schedulevo.scdenddate}&nbsp;${requestScope.schedulevo.scdendTm}</td>
				</tr>
				<tr>	
					<td id="title">위치</td>
					<td id="content">
						<c:if test="${requestScope.schedulevo.place eq null || requestScope.schedulevo.place eq ''}"><span>미정</span></c:if>
						<c:if test="${requestScope.schedulevo.place ne null && requestScope.schedulevo.place ne ''}">${requestScope.schedulevo.place}</c:if>
					</td>
				</tr>
				<tr>
					<td id="title">참석자</td>
					<td id="content">
						<c:if test="${requestScope.schedulevo.attendance eq null || requestScope.schedulevo.attendance eq ''}"><span>없음</span></c:if>
						<c:if test="${requestScope.schedulevo.attendance ne null && requestScope.schedulevo.attendance ne ''}">${requestScope.schedulevo.attendance}</c:if>
					</td>
				</tr>
			</table>
		</form>
	</div>
	</c:if>
	
	<c:if test="${empty requestScope.schedulevo}">
		<div>해당 일정은 존재 하지 않습니다.</div>
	</c:if>
	
		<div align="right" id="btns">
			<button type="button" class="btn done" onclick="javascript:location.href='<%=ctxPath%>/editScd.opis?scdno=${requestScope.schedulevo.scdno}'">수정</button>
			<button type="button" class="btn del" onclick="goDelScd()">삭제</button>
			<button type="button" class="btn close" onclick="goClose()">닫기</button> 
		</div>

</div>