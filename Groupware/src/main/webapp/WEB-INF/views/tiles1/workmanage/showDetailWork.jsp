<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	  
<% String ctxPath = request.getContextPath(); %>  

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/content.css" />   
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/workmanage.css" />  

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<jsp:include page="./workmanage_sidebar.jsp" />

<style type="text/css">
</style>

<div class="container commoncontainer">
	<c:if test="${workType == 1}">
		<h3>내가 한 업무 요청 조회</h3>
	</c:if>
	
	<c:if test="${workType == 2}">
		<h3>내가 한 업무 보고 조회</h3>
	</c:if>

	<br>
	
	<table class="table table-striped workShowtable">
		<tbody>
			<tr>
				<td>제목</td>
				<td>${workvo.subject}</td>
				
				<td>상태</td>
				<td>
					<c:choose>
						<c:when test="${workvo.fk_statno == 0}">
							<button type="button" class="workStatus" style="background-color: #ff3300;">지연<span>+2</span></button>		
						</c:when>
						<c:when test="${workvo.fk_statno == 1}">
							<button type="button" class="workStatus" style="background-color: #66ccff;">미완료</button>
						</c:when>
						<c:when test="${workvo.fk_statno == 2}">
							<button type="button" class="workStatus" style="background-color: white; border: 1px solid black; color: black;">완료</button>
						</c:when>
						
						<c:when test="${workvo.fk_statno == 3}">
							<button type="button" class="workStatus" style="background-color: #66ccff;">미확인</button>		
						</c:when>
						<c:when test="${workvo.fk_statno == 4}">
							<button type="button" class="workStatus" style="background-color: white; border: 1px solid black; color: black;">승인완료</button>
						</c:when>
						<c:when test="${workvo.fk_statno == 5}">
							<button type="button" class="workStatus" style="background-color: #ffcc00;">반려</button>
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>지시자</td>
				<td colspan="3">${workvo.requester}</td>
			</tr>
			<tr>
				<td>업무기한</td>
				<td colspan="3">${workvo.registerday} ~ ${workvo.deadline}</td>
			</tr>
			<tr>
				<td>등록일</td>
				<td>${workvo.registerday}</td>
				
				<td>수정일</td>
				<td>2020.01.11 12:10</td>
			</tr>
			<tr>
				<td>수신자</td>
				<td colspan="3">${workvo.receivers}</td>
			</tr>
			<tr>
				<td>참조자</td>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3">${workvo.contents}</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td colspan="3"></td>
			</tr>
		</tbody>
	</table>
	
	<c:if test="${requestScope.workRole ne 2}"><jsp:include page="./readDetail.jsp" /></c:if>
	<c:if test="${requestScope.workRole eq 2}"><jsp:include page="./writeDetail.jsp" /></c:if>
</div>

