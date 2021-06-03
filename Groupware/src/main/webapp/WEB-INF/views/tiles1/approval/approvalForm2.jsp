<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>

<jsp:include page="./approval_sidebar.jsp" />  

<script type="text/javascript">
	$(document).ready(function(){
	
		
	}); // end of $(document).ready(function(){})---------------------------------------
	
</script>
</head>
<body>

	<div id="approvalContainer">
		<span class="subtitle">기안문작성</span>
		<hr>
		<div id="approvalFormStyle">        	
			<div id="top">
				<button type="button" class="btn btn-success formBtn">결재선</button>
				<button type="button" class="btn btn-success formBtn">결재요청</button>
				<button type="button" class="btn btn-default formBtn" onclick="location.href='<%=ctxPath%>/approvalMain.opis';">취소</button>
				<br>
				<table id="sign">
					<tr>
						<td id="sign2" class="sign">결재라인</td>
					</tr>
					<tr>
						<td class="sign"></td>
					</tr>
				</table>
			</div>
			<div id="center">
				<span id="subject">지출결의서</span>
				<table id="approvalForm">
					<tbody>
						<tr>
							<td>문서번호</td>
							<td>${fileNo}</td>
							<td>기안일자</td>
							<td>${today}</td>
						</tr>
						<tr>
							<td>기안자</td>
							<td>${sessionScope.loginuser.mbr_name}</td>
							<td>기안부서</td>
							<td>${sessionScope.loginuser.dept_detail}</td>
						</tr>
						<tr>
							<td>참조자</td>
							<td id=""></td>
							<td>알림여부</td>
							<td id=""></td>
						</tr>
						<tr>
							<td>문서제목</td>
							<td id="" colspan="3">
								<input type="text" class="form-control" id="formTitle"/>
							</td>
						</tr>
						<tr>
							<td>지출(예상)일자</td>
							<td id="" colspan="3">
								<input type="text" class="form-control" id="formDetail"/>
							</td>
						</tr>
						<tr>
							<td>지출금액</td>
							<td id="" colspan="3">
								<input type="text" class="form-control" id="formDetail"/>&nbsp;&nbsp;&nbsp;원
							</td>
						</tr>
						<tr>
							<td>지출사유</td>
							<td id="" colspan="3">
								<textarea class="form-control" rows="5" id="comment"></textarea>
							</td>
						</tr>
					</tbody>
				</table>				
			</div>
			<div id="bottom">
				<button type="button" class="btn btn-success formBtn">파일업로드</button>
			</div>
		</div>
	</div>
	  	
</body>
</html>
