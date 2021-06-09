<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% String ctxPath = request.getContextPath(); %>  

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/content.css" />   
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/workmanage.css" />  

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=ctxPath%>/resources/js/workmanage.js"></script>

<jsp:include page="./workmanage_sidebar.jsp" />

<style type="text/css">
</style>


<script type="text/javascript">
	$(document).ready(function(){
		// 버튼 색상 적용하는 js 함수 호출
		$("button.workStatus").each(function(index, item){
			var delayday = $(item).prev().val();
			
			setworkStatusBtn(item, delayday);
		});	
		
		mbrWorkStatusChange();
		
		
	});
	
	function mbrWorkStatusChange() {
		var fk_mbr_seq = $("select#mbrListSelect").val();
		
		$.ajax({
			url:"<%=ctxPath%>/oneMbrWorkStatus.opis",
			data:{
				"fk_mbr_seq": fk_mbr_seq,
				"fk_wmno": "${workvo.wmno}",
				"fk_wrno":2},
			dataType:"json",
			success:function(json) {
				$("td#mbr_name").html(json.mbr_name);
				$("td#lasteditdate").html(json.lasteditdate);
				$("td#mbr_workPercent").html(json.mbr_workPercent);
			},
			error: function(request, status, error){
               	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
               }
		});
	}
	
	// 업무 삭제하기 
	function goWorkDel() {
		var delcheck = confirm("삭제하시겠습니까?");
		if (!delcheck) {
			return; // 삭제하지 않으면 함수 종료
		}
		
		// 삭제할 업무 전송하기 (POST 방식)
		var frm = document.delFrm;
		frm.method = "post";
		frm.action = "<%=ctxPath%>/workDel.opis";
		frm.submit();
	}
</script>


<div class="container commoncontainer">
	<c:if test="${workType == 1}">
		<h3>내가 한 업무 요청 조회</h3>
	</c:if>
	
	<c:if test="${workType == 2}">
		<h3>내가 한 업무 보고 조회</h3>
	</c:if>

	<br>
	
	<table class="table table-striped workShowtable">
		<tbody>
			<tr>
				<td>제목</td>
				<td>${workvo.subject}</td>
				
				<td>상태</td>
				<td>
					<input type="hidden" value="${workvo.delayday}"/>
					<button type="button" class="workStatus" value="${workvo.fk_statno}"></button>	
				</td>
			</tr>
			<tr>
				<td>지시자</td>
				<td colspan="3">${workvo.requester}</td>
			</tr>
			<tr>
				<td>업무기한</td>
				<td colspan="3">${workvo.registerday} ~ ${workvo.deadline}</td>
			</tr>
			<tr>
				<td>등록일</td>
				<td>${workvo.registerday}</td>
				
				<td>수정일</td>
				<td>${workvo.lasteditdate}</td>
			</tr>
			<tr>
				<td>수신자</td>
				<td colspan="3">${workvo.receivers}</td>
			</tr>
			<tr>
				<td>참조자</td>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3">${workvo.contents}</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td colspan="3"></td>
			</tr>
		</tbody>
	</table>
	
	<!-- 처리내역 테이블 만들기 (내가 요청한 업무, 참조 업무일 경우)-->
	<c:if test="${requestScope.workRole ne 2}">
	<table class="table table-striped workShowtable">
		<thead>
			<tr style="background: #f2f2f2;">
				<th colspan="4">담당자 처리내역&nbsp;
					<select id="mbrListSelect" onchange="mbrWorkStatusChange();">
					<c:forEach var="workmbr" items="${requestScope.workmbrList}" varStatus="status">
						<option value="${workmbr.fk_mbr_seq}">${workmbr.mbr_name}</option>
					</c:forEach>	
					</select>
				</th>
			</tr>		
		</thead>
		<tbody>
			<tr>
				<td>담당자</td>
				<td id="mbr_name"></td>
				
				<td>최종수정일</td>
				<td id="lasteditdate"></td>
			</tr>
			<tr>
				<td>진척률</td>
				<td colspan="3" id="mbr_workPercent">%</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3"></td>
			</tr>
		</tbody>
	</table>
	</c:if>
	
	<!-- 처리내역 테이블 만들기 (수신 업무일 경우) -->
	<c:if test="${requestScope.workRole ne 2}">
	<table class="table table-striped workShowtable">
		<thead>
			<tr style="background: #f2f2f2;">
				<th colspan="4">담당자 처리내역&nbsp;
					<select id="mbrListSelect" onchange="mbrWorkStatusChange();">
					<c:forEach var="workmbr" items="${requestScope.workmbrList}" varStatus="status">
						<option value="${workmbr.fk_mbr_seq}">${workmbr.mbr_name}</option>
					</c:forEach>	
					</select>
				</th>
			</tr>		
		</thead>
		<tbody>
			<tr>
				<td>담당자</td>
				<td id="mbr_name"></td>
				
				<td>최종수정일</td>
				<td id="lasteditdate"></td>
			</tr>
			<tr>
				<td>진척률</td>
				<td colspan="3" id="mbr_workPercent">%</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3"></td>
			</tr>
		</tbody>
	</table>
	</c:if>
	
	<!-- 업무 관련 버튼 -->
	<div align="right">
		<button type="button" class="workEditBtn" onclick="javascript:location.href='<%=ctxPath%>/workEdit.opis?wmno=${workvo.wmno}'">수정</button>
		<button type="button" class="workDeleteBtn" onclick="goWorkDel();">삭제</button>
		<button type="button" class="workListBtn" onclick="javascript:location.href='${requestScope.paraMap.gobackURL}'">목록</button>
	</div>
	
	<!-- 삭제할 업무 번호 폼 -->
	<form name="delFrm">
		<input type="hidden" name="wmnoStr" value="${workvo.wmno}"/>
		<input type="hidden" name="fk_wtno" value="${workType}"/>
		<input type="hidden" name="fk_wrno" value="${workRole}"/>
	</form>
	
	<c:if test="${requestScope.workRole ne 2}"><jsp:include page="./readDetail.jsp" /></c:if>
	<c:if test="${requestScope.workRole eq 2}"><jsp:include page="./writeDetail.jsp" /></c:if>
</div>

