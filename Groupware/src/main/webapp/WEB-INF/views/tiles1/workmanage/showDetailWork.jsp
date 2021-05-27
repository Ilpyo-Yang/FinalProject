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
	<c:if test="${fk_wtno == 1}">
		<h3>내가 한 업무 요청 조회</h3>
	</c:if>
	
	<c:if test="${fk_wtno == 2}">
		<h3>내가 한 업무 보고 조회</h3>
	</c:if>

	<br>
	
	<table class="table table-striped workShowtable">
		<tbody>
			<tr>
				<td>제목</td>
				<td>${wmvo.subject}</td>
				
				<td>상태</td>
				<td>
					<c:choose>
						<c:when test="${wmvo.fk_statno == 0}">
							<button type="button" class="workStatus" style="background-color: #ff3300;">지연<span>+2</span></button>		
						</c:when>
						<c:when test="${wmvo.fk_statno == 1}">
							<button type="button" class="workStatus" style="background-color: #66ccff;">미완료</button>
						</c:when>
						<c:when test="${wmvo.fk_statno == 2}">
							<button type="button" class="workStatus" style="background-color: white; border: 1px solid black; color: black;">완료</button>
						</c:when>
						
						<c:when test="${wmvo.fk_statno == 3}">
							<button type="button" class="workStatus" style="background-color: #66ccff;">미확인</button>		
						</c:when>
						<c:when test="${wmvo.fk_statno == 4}">
							<button type="button" class="workStatus" style="background-color: white; border: 1px solid black; color: black;">승인완료</button>
						</c:when>
						<c:when test="${wmvo.fk_statno == 5}">
							<button type="button" class="workStatus" style="background-color: #ffcc00;">반려</button>
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>지시자</td>
				<td colspan="3">${wmvo.fk_requester_seq}</td>
			</tr>
			<tr>
				<td>업무기한</td>
				<td colspan="3">${wmvo.registerday} ~ ${wmvo.deadline}</td>
			</tr>
			<tr>
				<td>등록일</td>
				<td>${wmvo.registerday}</td>
				
				<td>수정일</td>
				<td>2020.01.11 12:10</td>
			</tr>
			<tr>
				<td>수신자</td>
				<td colspan="3">${wmvo.fk_receiver_seq}</td>
			</tr>
			<tr>
				<td>참조자</td>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3">${wmvo.contents}</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td colspan="3"></td>
			</tr>
		</tbody>
	</table>
	
	<%-- 업무요청 처리내역 --%>
	<c:if test="${fk_wtno == 1}">
	<form id="workRegFrm">
		<table class="table table-striped workShowtable">
			<thead>
				<tr>
					<th>처리내역</th>
					<th colspan="3" style="text-align: right;">
						<button type="button" class="workStatus" style="background-color: #66ccff; font-weight: normal;">처리중 40%</button>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>담당자</td>
					<td>${wmvo.fk_receiver_seq}</td>
					
					<td>최종수정일</td>
					<td>2020.01.13 12:10</td>
				</tr>
				<tr>
					<td>진척률</td>
					<td colspan="3">40%</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3"></td>
				</tr>
				
				<tr id="workShwoBtn">
				<td colspan="4">
					<button type="button" onclick="submitWorkRegFrm()">저장</button>
					<button type="button" >취소</button>
				</td>
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
					<td colspan="3"></td>
				</tr>
				
				<tr id="workShwoBtn">
				<td colspan="4">
					<button type="button" onclick="submitWorkRegFrm()">저장</button>
					<button type="button" >취소</button>
				</td>
			</tr>
			</tbody>
		</table>
	</form>
	</c:if>
</div>

