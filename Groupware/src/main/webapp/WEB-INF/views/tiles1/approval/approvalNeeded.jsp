<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>

<jsp:include page="./approval_sidebar.jsp" />  

<script type="text/javascript">
	$(document).ready(function(){
	
		$.ajax({
			url:"<%=ctxPath%>/approvalNeeded.opis?seq=${sessionScope.loginuser.mbr_seq}",
			dataType:"json",
			/* data: {mbr_seq:"${sessionScope.loginuser.mbr_seq}"}, */
			success: function(json){	
				
			}
		
	}); // end of $(document).ready(function(){})---------------------------------------
	
</script>
</head>
<body>

	<div id="approvalContainer">
		<span class="subtitle">결재대기문서</span>
		<hr> 	
		<div id="searchOption">
			<table>
				<tr>
					<td>기안자</td>
					<td><input type="text" class="form-control searchInput" style="width: 50%;"/></td>
					<td>기안일</td>
					<td>
						<input type="text" class="form-control searchInput"/>
						<span class="space">-</span>
						<input type="text" class="form-control searchInput"/>
					</td>
				</tr>
				<tr>
					<td>문서제목</td>
					<td colspan="3">
						<input type="text" class="form-control searchInput"/>
						<button type="button" class="btn formBtn4" id="search">조회하기</button>
					</td>
				</tr>
			</table>
		</div>
		<div id="searchList">
			<select>
				<option>10개</option>
				<option>8개</option>
				<option>4개</option>
			</select>
			
			<table class="table table-striped">
				<thead>
					<tr>
						<th><input type="checkbox" /></th>
						<th>종류</th>
						<th>문서제목</th>
						<th>기안자</th>
						<th>기안부서</th>
						<th>기안일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="boardvo" items="${requestScope.approvalList}" varStatus="status">
					
					</c:forEach>
					<tr>
						<td><input type="checkbox" /></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table> 			
						
			<button type="button" class="btn btn-success formBtn4" id="approval">일괄결재</button>
			
		</div>
	</div>

</body>
</html>