<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>


<jsp:include page="./approval_sidebar.jsp" />  
<jsp:include page="./approvalMemberModal.jsp" /> 
<jsp:include page="./selectMemberModal.jsp" />  


<script type="text/javascript">
	$(document).ready(function(){
		
		// 결재라인 모달창 열기
		$("button#approvalMember").click(function(){			
			$('div#myModal').show();
		});
		
		// 결재라인 모달창 끄기
		$("button#closeModal").click(function(){
			$('div#myModal').hide();
		});
		
		// 참조라인 모달창 열기
		$("button#selectMember").click(function(){			
			$('div#myModal2').show();
		});
		
		// 참조라인 모달창 끄기
		$("button#closeModal2").click(function(){
			$('div#myModal2').hide();
		});
		
	}); // end of $(document).ready(function(){})---------------------------------------
</script>
</head>
<body>

	<div id="approvalContainer">
		<form name="approvalForm">
			<span class="subtitle">기안문작성</span>
			<hr>
			<div id="approvalFormStyle">   
			     	
				<div id="top">
					<button type="button" class="btn btn-success formBtn" id="approvalMember">결재선</button>
					<button type="button" class="btn btn-success formBtn">결재요청</button>
					<button type="button" class="btn btn-default formBtn" onclick="location.href='<%=ctxPath%>/approvalMain.opis';">취소</button>
					<br>
					<div id="signTitle">결재라인</div><br><br>
					<table id="sign">
						<tr id="sign">
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
								<td>
									<span id="selectedMember"></span>
									<button type="button" class="btn formBtn2" id="selectMember">선택하기</button>
								</td>
								<td>알림여부</td>
								<td></td>
							</tr>
							<tr>
								<td>문서제목</td>
								<td colspan="3">
									<input type="text" class="form-control" id="formTitle"/>
								</td>
							</tr>
							<tr>
								<td>제출사유</td>
								<td colspan="3">
									<textarea class="form-control" rows="5" id="comment"></textarea>
								</td>
							</tr>
						</tbody>
					</table>				
				</div>
				
				<div id="bottom">
					<button type="button" class="btn btn-success formBtn">파일업로드</button>
				</div>
				
				<input type="text" name=""/>
			</div>
		</form>
	</div>
	  	
</body>
</html>
