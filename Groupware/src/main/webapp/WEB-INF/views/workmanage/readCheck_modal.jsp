<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

<div class="container">
	<ul style="list-style: none; padding: 0;">
		<li>■ 업무상태 : <button type="button" class="workStatus" style="background-color: #ff3300; ">지연<span>+2</span></button></li>
		<li>■ 담당자 별 처리 현황</li>
	</ul>    
	
	<table class="table table-striped">
		<thead>
			<tr style="border-top: solid 2px #f2f2f2;">
				<th>담당자</th>
				<th>구분</th>
				<th>확인일시</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>박관리 차장</td>
				<td>담당자</td>
				<td>2018.01.11</td>
			</tr>
			<tr>
				<td>이용우 사장</td>
				<td>담당자</td>
				<td>2020.01.11</td>
			</tr>
		</tbody>
	</table>
</div>