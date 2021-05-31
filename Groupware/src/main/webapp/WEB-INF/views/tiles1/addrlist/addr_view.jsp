<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 상세</title>

<jsp:include page="./addr_sidebar.jsp" />

</head>
<body>

	<!-- 게시판 제목 -->
	<div style="padding: 15px; font-size: 25px; font-weight: 600; height: 60px; width: 100%; background-color: #f2f2f2; color: #555;">
	&nbsp;&nbsp;주소록 상세
	</div>
	
	<!-- 주소록 내용 -->
	<div>
		<table>
			<tr>
				<th>이름</th>
				<td>
                	<input type="hidden" name="addr_seq" value="${requestScope.addrvo.addr_seq}" />   
            	</td>
				<td>${requestScope.addrvo.mbr_name}</td>
			</tr>
			<tr>
				<th>번호</th>
				<td>${requestScope.addrvo.mbr_phone_number}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${requestScope.addrvo.mbr_email}</td>
			</tr>
			<tr>
				<th>부서</th>
				<td>${requestScope.addrvo.dept_name}</td>
			</tr>
			<tr>
				<th>직책</th>
				<td>${requestScope.addrvo.position_name}</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>${requestScope.addrvo.mbr_birthday}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${requestScope.addrvo.address}</td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td>${requestScope.addrvo.detailaddress}</td>
			</tr>
			<tr>
				<th>메모</th>
				<td>${requestScope.addrvo.addrmemo}</td>
			</tr>
		</table>
	</div>

</body>
</html>