<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>


<jsp:include page="./approval_sidebar.jsp" />  
<jsp:include page="./approvalMemberModal.jsp" /> 
<jsp:include page="./selectMemberModal.jsp" />  

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script type="text/javascript">
	$(document).ready(function(){
		
		$("input#datepicker").datepicker({
			 dateFormat: 'yy-mm-dd', 
		      changeMonth: true,
		      changeYear: true
		});
		
		$("input#datepicker2").datepicker({
			 dateFormat: 'yy-mm-dd', 
		      changeMonth: true,
		      changeYear: true
		});
		
		$("input[name=attach]").hide();
		
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
		
		var fileCnt = document.getElementById("attach").files.length;
		$("input[name=file]").val(fileCnt);
		
		// 첨부파일 목록 보여주기
		$("input[type=file]").change(function(){
			fileCnt = document.getElementById("attach").files.length;
			$("input[name=file]").html(fileCnt);
			
			var files = document.getElementById("attach").files;
	        var file;
	        
	        for (var i=0; i<files.length; i++) { 
	            file = files[i];
	            $("div#attachedFile").append('<span id="del'+i+'">'+file.name+'<button type="button" class="btn formBtn2 delFile" id="del'+i+'" onclick="func_delFile(this.id)">X</button></span>');
		        if(i%2==1){
	        		$("div#attachedFile").append('<br>');
	        	}
	        }
		});
	    
		
		$("button#approvalSubmit").click(function(){	// 결제요청 버튼을 누른 경우
			// 유효성 검사
	        if($("input#ap_title").val().trim() == "") {
	           alert("문서제목을 입력해주세요!");
	           return;
	        }
	        if($("textarea").val().trim() == "") {
		           alert("제출사유를 입력해주세요!");
		           return;
		    }
	        if($("td.sign").val()==null || $("td#sign").val()=="") {
	        	alert("결재라인을 선택해주세요!");
		        return;
	        }
	        
	        // 폼 전송하기
	        var frm = document.approvalSubmitForm;
	        frm.method = "POST";
	        frm.action = "<%= ctxPath%>/approvalSubmitForm.opis";
	        frm.submit();  
		});// end of $("button#approvalSubmit").click(function() -----------------------------------
	    
	}); // end of $(document).ready(function(){})---------------------------------------
	
	
	function func_attach() {
		 $("input[name=attach]").click();	
	}// end of function func_attach() ------------------------------------------
	
	
	function func_delFile(id) {
		 $("span#"+id).remove();
	}// end of function func_delFile(this.id) ---------------------------------------

</script>
</head>
<body>

	<div id="approvalContainer">
		<form name="approvalSubmitForm" enctype="multipart/form-data">
			<span class="subtitle">기안문작성</span>
			<hr>
			<div id="approvalFormStyle">   
			     	
				<div id="top">
					<button type="button" class="btn btn-success formBtn3" id="approvalMember">결재선</button>
					<button type="button" class="btn btn-success formBtn3">결재요청</button>
					<button type="button" class="btn btn-default formBtn3" onclick="location.href='<%=ctxPath%>/approvalMain.opis';">취소</button>
					<br>
					<div id="signTitle">결재라인</div><br><br>
					<table id="sign">
						<tr id="sign">
							<td class="sign"></td>
						</tr>
					</table>
				</div>
				
				<div id="center">
					<span id="subject">휴가신청서</span>
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
									<input type="text" class="form-control size1" name="ap_title" autocomplete="off"/>
								</td>
							</tr>
							<tr>
								<td>휴가신청일자</td>
								<td colspan="3">
									<input type="text" class="form-control formDetail" name="vacationStartDate" id="datepicker"/>
									<span class="space">-</span>
									<input type="text" class="form-control formDetail" name="vacationEndDate" id="datepicker2"/>
									<span class="space">총<span class="space"></span>일간</span>
								</td>
							</tr>
							<tr>
								<td>구분</td>
								<td colspan="3">
									<select class="selectCommon" id="vacationType" name="vacationType" style="margin: 0">
										<option>연차</option>
										<option>반차</option>
									</select>
									<span class="space">(남은 연차:<span class="space"></span>/<span class="space"></span>)</span>
								</td>
							</tr>
							<tr>
								<td>인수인계자</td>
								<td colspan="3">
									<input type="text" class="form-control formDetail" name="takeover" autocomplete="off"/>
									<button type="button" class="btn formBtn2" id="selectMember">선택하기</button>
								</td>
							</tr>
						</tbody>
					</table>				
				</div>
				
				<div id="bottom">
					<input type="file" name="attach" id="attach" name="attach" multiple />
					<button type="button" class="btn btn-success formBtn3" id="attachBtn" onclick="func_attach()" >파일업로드</button>			
					<div id="attachedFile"></div>
				</div>
				<br>
				
				<input type="hidden" name="ap_seq" value="${fileNo}"/>
				<input type="hidden" name="fk_apform_no" value="2"/>
				<input type="hidden" name="fk_mbr_seq" value="${sessionScope.loginuser.mbr_seq}"/>
				<input type="hidden" name="ap_dept" value="${sessionScope.loginuser.dept_detail}"/>
				<input type="hidden" name="ap_approver" />
				<input type="hidden" name="ap_manage_approver" />
				<input type="hidden" name="ap_referrer" />
				<input type="hidden" name="file" />
	
			</div>
		</form>
	</div>

</body>
</html>
