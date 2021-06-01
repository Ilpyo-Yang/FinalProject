<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<% String ctxPath = request.getContextPath(); %>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/workmanage.css" />
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/content.css" />     

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<jsp:include page="./workmanage_sidebar.jsp" />

<style type="text/css">
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		$("#datepicker_deadline").datepicker({
			showOn : "button",
			buttonImage : "<%=ctxPath%>/resources/images/icon_calendar.png",
			buttonImageOnly : true,
			buttonText : "Select date",
			dateFormat: 'yy-mm-dd'
		});

		var checkRadio = $("input[name=workType]:checked");
		onlyWorkInput(checkRadio);
		
	});
	
	// == 업무 요청, 업무 보고 일 경우에만 담당자, 참조자  input 보여주기 == //
	function onlyWorkInput(item) {
		var checkVal = $(item).val();
		
		if (checkVal == 0) {
			$("tr.onlyWorkInput").hide();
		} 
		else {
			$("tr.onlyWorkInput").show();
		}
	}
	
	// == 필수 입력 사항 작성했는지 확인 하기 == //
	function checkStar() {
		// 제목 확인
		var subject = $("input[name=subject]").val().trim();
		if (subject == "") {
			alert("제목을 입력하세요");
			return;
		}
		
		// 업무기한
		var deadline = $("input[name=deadline]").val().trim();
		if (deadline == "") {
			alert("업무기한을 입력하세요");
			return;
		}
		
		// 담당자
		var workType = $("input[name=workType]:checked").val();
		if (workType != 0) {
			var manager = $("input[name=fk_receiver_seq]").val().trim();
			
			if (manager == "") {
				alert("담당자를 입력하세요");
				return;
			}
		}
		
		$("input[name=fk_wtno]").val(workType); // DB 컬럼명이랑 맞추기
		
		if (workType == 1) {
			$("input[name=fk_statno]").val("1");
		}
		else if (workType == 2) {
			$("input[name=fk_statno]").val("3");
		}
		
		if (workType == 0) submitTodoRegFrm(); 
		else submitWorkRegFrm();
	}
	
	// == ToDo 정보 폼 전송하기 == //
	function submitTodoRegFrm() {
		var frm = document.workRegFrm;
		
		frm.action = "<%=ctxPath%>/workAddTodoEnd.opis";
		frm.method = "post";
		frm.submit();
	}
	
	// == 업무 정보 폼 전송하기 == //
	function submitWorkRegFrm() {
		var frm = document.workRegFrm;
		
		frm.action = "<%=ctxPath%>/workAddEnd.opis";
		frm.method = "post";
		frm.submit();
	}
</script>

<div class="container commoncontainer">
	<h3>업무 등록</h3>
	
	<br>
	
	<form name="workRegFrm">
		<table class="table table-striped workRegtable">
			<tbody>
				<tr>
					<td style="width: 10%;"><span class="star">*</span>제목</td>
					<td style="width: 70%;"><input name="subject"/></td>
				</tr>
				<tr>
					<td><span class="star">*</span>업무형태</td>
					<td>
						<input type="radio" id="mytodo" value="0" name="workType" onclick="onlyWorkInput(this);" checked="checked"/> 
						<label for="mytodo">나의 할일</label> 
							
						<input type="radio" id="workRequest" value="1" name="workType" onclick="onlyWorkInput(this);"/> 
						<label for="workRequest">업무 요청</label>
	
						<input type="radio" id="workReport" value="2" name="workType" onclick="onlyWorkInput(this);"/>
						<label for="workReport">업무 보고</label>
					</td>
				</tr>
				<tr>
					<td><span class="star">*</span>업무기한</td>
					<td><input type="text" name="deadline" id="datepicker_deadline" /></td>
				</tr>
				
				<tr class="onlyWorkInput">
					<td><span class="star">*</span>담당자</td>
					<td><input name="fk_receiver_seq" placeholder="사용자" /></td>
				</tr>
				
				<!-- <tr>
					<td><span class="star">*</span>담당자</td>
					<td>
						<div class="autocomplete" style="width:300px;">
		    				<input id="myInput" type="text" name="Receiver" placeholder="사용자">
		  				</div>
  					</td>
  				</tr> -->
				
				<tr class="onlyWorkInput">
					<td>참조자</td>
					<td><input name="fk_referrer_seq" placeholder="사용자" /></td>
				</tr>
			
				<tr>
					<td>파일 업로드</td>
					<td><button name="addfile" type="button">파일추가</button></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="contents" cols="60" rows="10"></textarea></td>
				</tr>
				<tr id="workRegBtn">
					<td colspan="2">
						<button type="button" onclick="checkStar()">저장</button>
						<button type="button" >취소</button>
					</td>
				</tr>
			</tbody>
		</table>	
		
		<input type="hidden" name="workRole" value="1"/>
		<input type="hidden" name="fk_wtno" />
		<input type="hidden" name="fk_statno" />
		<input type="hidden" name="fk_mbr_seq" value="${sessionScope.loginuser.mbr_seq}"/><!-- 나의 할 일 등록할 때 사용 -->
		<input type="hidden" name="fk_requester_seq" value="${sessionScope.loginuser.mbr_seq}"/><!-- 업무 요청,보고할 때 사용 -->
	</form>
</div>

