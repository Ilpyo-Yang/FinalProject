<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
li {
	margin-bottom: 10px;
}

button {
	color: white;
	width: 100px; 
	border: none;
	font-size: 10pt;
}
	
</style>

<script type="text/javascript">
	$(document).ready(function() {
		
		$("button.workStatus").each(function(index, item){
			var statno = $(item).val();
			// console.log("statno : " + statno);
			
			if (statno == "0") {
				var delayday = ${requestScope.paraMap.delayday};
				$(item).css({"background-color":"#ff3300"});
				$(item).text('지연+'+delayday);
			}
			else if (statno == "1") {
				$(item).css({"background-color":"#66ccff"});
				$(item).text('미완료');
			}
			else  {
				$(item).css({"background-color":"white", "border":"1px solid black", "color":"black"});
				$(item).text('완료');
			}
		});
		
		$("button.workStatusMbr").each(function(index, item){
			var percent = $(item).val();
			// console.log(percent);
			
			if (percent == 0) {
				$(item).css({"background-color":"#66ccff"});
				$(item).text('검토중');
			}
			else if (percent == 100) {
				$(item).css({"background-color":"white", "border":"1px solid black", "color":"black"});
				$(item).text('완료');
			}
			else {
				$(item).css({"background-color":"#ff3300"});
				$(item).text('처리중 '+percent+'%');
			}
		});
	});
	
</script>

<div class="container">
	
	<ul style="list-style: none; padding: 0;">
		<li>■ 업무상태 : <button type="button" class="workStatus" value="${requestScope.paraMap.fk_statno}"></button></li>
		<li>■ 담당자 별 처리 현황</li>
	</ul>    
	
	<table class="table table-striped">
		<thead>
			<tr style="border-top: solid 2px #f2f2f2;">
				<th>담당자</th>
				<th>최종수정일</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="workmbr" items="${requestScope.workmbrList}">
				<tr>
					<td>${workmbr.mbr_name}</td>
					<td>${workmbr.lasteditdate}</td>
					<td><button type="button" class="workStatusMbr" value="${workmbr.mbr_workPercent}"></button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>