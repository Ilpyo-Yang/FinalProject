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
				<button type="button" class="btn btn-default formBtn">취소</button>
				<br>
				<table id="sign">
					<tr>
						<td rowspan="2" id="sign1" class="sign">결재</td>
						<td id="sign2" class="sign">기안</td>
					</tr>
					<tr>
						<td class="sign"></td>
					</tr>
				</table>
			</div>
			<div id="center">
				<span id="subject">일반기안서</span>
				<table id="approvalForm">
					<tbody>
						<tr>
							<td>문서번호</td>
							<td id=""></td>
							<td>기안일자</td>
							<td id=""></td>
						</tr>
						<tr>
							<td>기안자</td>
							<td id=""></td>
							<td>기안부서</td>
							<td id=""></td>
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
							<td>제출사유</td>
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
