<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">
	
	#container {
		margin: 20px;
	}
	
	.schedule {
		margin: 20px 0;
	}

	#title {
		font-size: 11pt;
		display: inline-block;
		width: 70px;
	}
	
	.btn {
	position: relative;
	z-index: 2;
	background-color: #fff;
	border: 2px solid #333;
	color: #333;
	line-height: 48px;
	}
	
	.btn:after {
		top: 4px;
		left: 4px;
		width: 188px;
		height: 42px;
		border: 2px solid #333;
		opacity: 0;
	}
	
	.btn:hoverz:after {
		opacity: 1;
	}
	
</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
		
		$.datepicker.regional['ko'] = {
		        closeText: '닫기',
		        prevText: '이전달',
		        nextText: '다음달',
		        currentText: '오늘',
		        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
		        '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
		        monthNamesShort: ['1월','2월','3월','4월','5월','6월',
		        '7월','8월','9월','10월','11월','12월'],
		        dayNames: ['일','월','화','수','목','금','토'],
		        dayNamesShort: ['일','월','화','수','목','금','토'],
		        dayNamesMin: ['일','월','화','수','목','금','토'],
		        weekHeader: 'Wk',
		        dateFormat: 'yy-mm-dd',
		        firstDay: 0,
		        isRTL: false,
		        showMonthAfterYear: true,
		        yearSuffix: '',
		        showOn: 'both',
		        buttonText: "달력",
		        changeMonth: true,
		        changeYear: true,
		        showButtonPanel: true,
		        yearRange: 'c-99:c+99',
		    };
		    $.datepicker.setDefaults($.datepicker.regional['ko']);

		    $('#from').datepicker();
		    $('#from').datepicker("option", "maxDate", $("#to").val());
		    $('#from').datepicker("option", "onClose", function ( selectedDate ) {
		        $("#to").datepicker( "option", "minDate", selectedDate );
		    });

		    $('#to').datepicker();
		    $('#to').datepicker("option", "minDate", $("#from").val());
		    $('#to').datepicker("option", "onClose", function ( selectedDate ) {
		        $("#from").datepicker( "option", "maxDate", selectedDate );
		    });
		
	});// end of $(document).ready(function(){}---------------------------------
	
	function mtrResv() {
		 var url = "<%=ctxPath%>/mtr_resv.opis";
		 window.open(url, "mtrResv","left=350px, top=100px, width=800px, height=650px");
		 
	 }
			
</script>

<div id="container">
<h3>일정 등록하기</h3>
<hr>

<form name="scdRegFrm">
	<div class="subject schedule">
		<span id="title">제목</span>
		<input type="text" name="subject" id="subject" size="30" placeholder="제목을 입력하세요." autocomplete="off" required />
	</div>
	
	<div class="date schedule">
		<label for="from" id="title">시작일자</label>
		<input type="text" id="from" name="from"/>
		<label for="to" id="title">종료일자</label>
		<input type="text" id="to" name="to"/>
	</div>
	
	<div class="time schedule">
		<span id="title">시간</span>
		<select id="time1" name="time1">
			<c:forEach var="i" begin="9" end="18">
				<c:set var="startTm" value="${i>9?i:'0'}${i>9?'':i}"/>
				<option value="${i>9?i:'0'}${i>9?'':i}00" <c:if test="${data.startDispTm eq startTm}">selected</c:if>>${i>9?i:'0'}${i>9?'':i}:00</option>
			</c:forEach>
		</select>
		
		<span id="title">&nbsp;부터</span>
		<select id="time2" name="time2">
			<c:forEach var="i" begin="10" end="18">
				<c:set var="endTm" value="${i>9?i:'0'}${i>9?'':i}"/>
				<option value="${i>9?i:'0'}${i>9?'':i}00" <c:if test="${data.endDispTm eq endTm}">selected</c:if>>${i>9?i:'0'}${i>9?'':i}:00</option>
			</c:forEach>
		</select>
		<span>&nbsp;까지&nbsp;</span>
	</div>
	
	<div class="place schedule">
		<span id="title">장소</span>
		<input type="text"/>
		<button type="button" onclick="mtrResv()">예약하기</button>
	</div>
	
	<div class="attandance schedule">
		<span id="title">참석자</span>
		<input type="text" />
		<button type="button">주소록</button>
	</div>

	<div style="float:right;">
		<button type="submit" class="btn">등록</button>
		<button type="button" class="btn">취소</button>
	</div>

</form>
</div>