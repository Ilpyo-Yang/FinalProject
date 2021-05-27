<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	    

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/workmanage.css" />  

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<jsp:include page="./workmanage_sidebar.jsp" />

<style type="text/css">
</style>

<div class="container workcontainer">
	<h3>업무조회</h3>

	<br>
	
	<table class="table table-striped workShowtable">
		<tbody>
			<tr>
				<td>제목</td>
				<td>${tdvo.subject}</td>
				<td>상태</td>
				<td>
					<c:choose>
						<c:when test="${tdvo.fk_statno == 0}">
							<button type="button" class="workStatus" style="background-color: #ff3300;">지연<span>+2</span></button>		
						</c:when>
						<c:when test="${tdvo.fk_statno == 1}">
							<button type="button" class="workStatus" style="background-color: #66ccff;">미완료</button>
						</c:when>
						<c:when test="${tdvo.fk_statno == 2}">
							<button type="button" class="workStatus" style="background-color: white; border: 1px solid black; color: black;">완료</button>
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>업무기한</td>
				<td colspan="3">${tdvo.registerday} ~ ${tdvo.deadline}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3">${tdvo.contents}</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td colspan="3"></td>
			</tr>
		</tbody>
	</table>

</div>

