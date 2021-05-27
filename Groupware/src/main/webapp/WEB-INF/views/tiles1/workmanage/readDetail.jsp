<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

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