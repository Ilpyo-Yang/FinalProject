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
		width: 700px;
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
	
	#mtrname:hover {
		font-weight:bold;
	}
	
</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		drawChart();
		
		$("button#btnResv").click(function(){
			
			var frm = document.mtr_regFrm;
			frm.method = "POST";
			frm.action = "<%=ctxPath%>/resvMtrEnd.opis";
			frm.submit();
		});
		
	});
	
	google.charts.load("current", {packages:["timeline"]});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var container = document.getElementById('example5.1');
	    var chart = new google.visualization.Timeline(container);
	    var dataTable = new google.visualization.DataTable();
	    dataTable.addColumn({ type: 'string', id: 'Room' });
	    dataTable.addColumn({ type: 'string', id: 'Name' });
	    dataTable.addColumn({ type: 'date', id: 'Start' });
	    dataTable.addColumn({ type: 'date', id: 'End' });
	    
	    $.ajax({
	    	url:"<%=ctxPath%>/showRegMtr.opis",
	    	dataType:"json",
	    	success:function(json) {
	    		
	    		for(var i=0;i<json.length; i++) {
	    			
	    			var year = json[i].regDate.substring(0,4);
	    			var month = json[i].regDate.substring(5,7);
	    			var day = json[i].regDate.substring(8);
	    			
	    			var starth = json[i].startime.substring(0,2);
	    			var startm = json[i].endtime.substring(3);
	    			
	    			var endh = json[i].endtime.substring(0,2);
	    			var endm = json[i].endtime.substring(3);
	    			
		    		dataTable.addRows([
		    		[json[i].mtrname, json[i].scdsubject, new date(year,month,day,starth,startm) new date(year,month,day,endh,endm)]	
		    		]);
	    		
	    		}// end of for----------------------------	                   
	    			                   
	    		
	    	},
	    	error:function(request, status, error){
	    		alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	    	}
	    	
	    });
	   	dataTable.addRows([
	      [ '회의실1', 'Beginning JavaScript',       new Date(0,0,0,9,0,0),  new Date(0,0,0,12,00,0) ],
	      [ '회의실1', 'Intermediate JavaScript',    new Date(0,0,0,14,0,0),  new Date(0,0,0,15,00,0) ],
	      [ '회의실1', 'Advanced JavaScript',        new Date(0,0,0,16,0,0),  new Date(0,0,0,17,00,0) ],
	      [ '회의실2',   'Beginning Google Charts',    new Date(0,0,0,12,00,0), new Date(0,0,0,14,0,0) ],
	      [ '회의실2',   'Intermediate Google Charts', new Date(0,0,0,14,00,0), new Date(0,0,0,16,0,0) ],
	      [ '회의실3',   'Advanced Google Charts',     new Date(0,0,0,16,00,0), new Date(0,0,0,18,0,0) ],
	      [ '회의실4',   'Advanced Google Charts',     new Date(0,0,0,16,00,0), new Date(0,0,0,18,0,0) ],
	      [ '회의실4',   'Advanced Google Charts',     new Date(0,0,0,10,00,0), new Date(0,0,0,11,00,0) ],
	      [ '회의실5',   'Advanced Google Charts',     new Date(0,0,0,16,00,0), new Date(0,0,0,18,0,0) ],
	      [ '회의실6',   'Advanced Google Charts',     new Date(0,0,0,16,00,0), new Date(0,0,0,18,0,0) ]]);

	    var options = {
	      timeline: { colorByRowLabel: true }
	    };

	    chart.draw(dataTable, options);
	  }


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

	<div>
		<span style="font-size:9pt;">*회의일자 변경 시 조회 버튼을 클릭하셔야 해당 날짜의 예약 리스트가 조회됩니다.</span><br>
		<span style="font-size:9pt; color:red; font-weight:bold;">*회의실 이용가능 시간은 오전 9시 부터 오후 6시 까지 입니다.</span>
	</div>
	
	<div id="search_date" align="right" style="padding-bottom:10px">
		<span>예약일자:</span>
		<input type="text" id="datepicker" size="10"/>
		<button type="button">조회</button>
	</div>

	<div id="example5.1" style="height: 300px;"></div>
<form name="mtr_regFrm">
	<div id="select_section" align="right">
		
		
			<input type="hidden" value="${sessionScope.loginuser.mbr_seq}"/>
			
		<select>
			<option>회의실 선택</option>
			<option value="회의실1">회의실1</option>
			<option value="회의실2">회의실2</option>
			<option value="회의실3">회의실3</option>
			<option value="회의실4">회의실4</option>
			<option value="회의실5">회의실5</option>
			<option value="회의실6">회의실6</option>
		</select>&nbsp;
		<select id="time1" name="time1">
			<option>시작 시간</option>
			<c:forEach var="i" begin="9" end="18">
				<c:set var="startTm" value="${i>9?i:'0'}${i>9?'':i}"/>
				<option value="${i>9?i:'0'}${i>9?'':i}:00" <c:if test="${data.startDispTm eq startTm}">selected</c:if>>${i>9?i:'0'}${i>9?'':i}:00</option>
			</c:forEach>
		</select>
		<span>&nbsp;~&nbsp;</span>
		<select id="time2" name="time2">
			<option>종료 시간</option>
			<c:forEach var="i" begin="10" end="18">
				<c:set var="endTm" value="${i>9?i:'0'}${i>9?'':i}"/>
				<option value="${i>9?i:'0'}${i>9?'':i}:00" <c:if test="${data.endDispTm eq endTm}">selected</c:if>>${i>9?i:'0'}${i>9?'':i}:00</option>
			</c:forEach>
		</select>
		
	</div>
	
	<div id="btn_section" align="right">
		<button type="button" id="btnResv">예약하기</button>
		<button type="button">취소</button>
	</div>

</form>

</div>

