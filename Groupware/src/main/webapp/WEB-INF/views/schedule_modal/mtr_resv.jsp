<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">
	
	#container {
		margin: 25px;
	}
	
	table, th, td {
		border: 1px solid gray;
		border-collapse: collapse;
		padding: 10px;
	}
	
	#resv_tbl {
		margin: 30px 100px;
	}
	
	#select_section {
		margin: 20px 0;
	}
	
	#btn_section {
		margin: 30px 0;
	}
	
	#mtrname {
		text-align:center;
		cursor:pointer;
	}
	
</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		$("button#btnReg_mtr").click(function(){
			
			var frm = document.mtr_regFrm;
			frm.method = "POST";
			frm.action = "<%=ctxPath%>/regMtrEnd.opis";
			frm.submit();
		});
		
		
		$("td#mtrname").click(function(){
			var $target = $(event.target);
			var mtrname = $target.val();
			
			$("input#mtrName").val(mtrname);
		});
		
	});
	
	$(function() {
        //input을 datepicker로 선언
        $("#datepicker").datepicker({
            dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
            ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
        });                    
        
        //초기값을 오늘 날짜로 설정
        $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
    });

</script>

<div id="container">
<h3>회의실 예약하기</h3>
<hr>

	<div id="search_date" align="right">
		<span>예약일자:</span>
		<input type="text" id="datepicker" size="10"/>
		<button type="button">조회</button>
	</div>
	
	<div>
		<span style="font-size:9pt;">*회의일자 변경 시 조회 버튼을 클릭하셔야 해당 날짜의 예약 리스트가 조회됩니다.</span>
		<table id="resv_tbl">
			<thead>
				<tr>
					<th style="padding:10px 20px;">회의실명</th>
					<th colspan="10">이용시간</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td id="mtrname">회의실1</td>
					<c:forEach var="i" begin="9" end="18">
						<td><a id="time">${i>9?i:'0'}${i>9?'':i}00</a></td>
					</c:forEach>
				</tr>
				<tr>
					<td id="mtrname">회의실2</td>
					<c:forEach var="i" begin="9" end="18">
						<td><a id="time">${i>9?i:'0'}${i>9?'':i}00</a></td>
					</c:forEach>
				</tr>
				<tr>
					<td id="mtrname">회의실3</td>
					<c:forEach var="i" begin="9" end="18">
						<td><a id="time">${i>9?i:'0'}${i>9?'':i}00</a></td>
					</c:forEach>
				</tr>
				<tr>
					<td id="mtrname">회의실4</td>
					<c:forEach var="i" begin="9" end="18">
						<td><a id="time">${i>9?i:'0'}${i>9?'':i}00</a></td>
					</c:forEach>
				</tr>
				<tr>
					<td id="mtrname">회의실5</td>
					<c:forEach var="i" begin="9" end="18">
						<td><a id="time">${i>9?i:'0'}${i>9?'':i}00</a></td>
					</c:forEach>
				</tr>
				<tr>
					<td id="mtrname">회의실6</td>
					<c:forEach var="i" begin="9" end="18">
						<td><a id="time">${i>9?i:'0'}${i>9?'':i}00</a></td>
					</c:forEach>
				</tr>
			</tbody>
		</table>
	</div>

<form name="mtr_regFrm">
	<div id="select_section" align="right">
		
		<div>
			<input type="hidden" value="${sessionScope.loginuser.mbr_seq}"/>
			<c:if test="${requestScope.mtr} eq ${requestScope.mtrhvo.mtrname}">
				<input type="text" value="${requestScope.mtrhvo.mtrname}" readonly/>
			</c:if>
			<c:if test="${requestScope.mtr} != ${requestScope.mtrhvo.mtrname}">
				<input type="text" id="mtrName" />
			</c:if>
		</div>
		
		<select>
			<option>회의실 선택</option>
			<option>회의실1</option>
			<option>회의실2</option>
			<option>회의실3</option>
			<option>회의실4</option>
			<option>회의실5</option>
			<option>회의실6</option>
		</select>&nbsp;
		<select id="time1" name="time1">
			<option>시작 시간</option>
			<c:forEach var="i" begin="9" end="18">
				<c:set var="startTm" value="${i>9?i:'0'}${i>9?'':i}"/>
				<option value="${i>9?i:'0'}${i>9?'':i}00" <c:if test="${data.startDispTm eq startTm}">selected</c:if>>${i>9?i:'0'}${i>9?'':i}:00</option>
			</c:forEach>
		</select>
		<span>&nbsp;~&nbsp;</span>
		<select id="time2" name="time2">
			<option>종료 시간</option>
			<c:forEach var="i" begin="10" end="18">
				<c:set var="endTm" value="${i>9?i:'0'}${i>9?'':i}"/>
				<option value="${i>9?i:'0'}${i>9?'':i}00" <c:if test="${data.endDispTm eq endTm}">selected</c:if>>${i>9?i:'0'}${i>9?'':i}:00</option>
			</c:forEach>
		</select>
		
	</div>
	
	<div id="btn_section" align="right">
		<button type="button" id="btnReg_mtr" onclick="">예약하기</button>
		<button type="button">취소</button>
	</div>

</form>

</div>

