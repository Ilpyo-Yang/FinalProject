<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style type="text/css">
ul#todoSelectCondition {
	list-style-type: none;
}

ul#todoSelectCondition > li {
	display: inline-block;
	margin-right: 20px;
}

div.checkWorkStatus > label,
div.checkWorkStatus > input {
	width: 50px;
	text-align: center;
}
</style>


<script>
	$(function() {
		$("#datepicker_reg").datepicker({
			showOn : "button",
			buttonImage : "/resources/images/icon_calendar.png",
			buttonImageOnly : true,
			buttonText : "Select date"
		});
		
		$("#datepicker_dead").datepicker({
			showOn : "button",
			buttonImage : "/resources/images/icon_calendar.png",
			buttonImageOnly : true,
			buttonText : "Select date"
		});
	});
</script>
</head>
<body>

<div class="container tdcontainer">
  <h2>나의 할 일</h2>
  
  <hr>
  
  <ul id="todoSelectCondition">
  	<li>
	  	<select id="selectViewCount">
	  		<option value="3" selected>3줄</option>
	  		<option value="5">5줄</option>
	  		<option value="10">10줄</option>
	  	</select>
  	</li>
  	
  	<li>전체 <span>3</span></li>
  	
  	<li>
  		<label for="checkImp">중요</label>
  		<input type="checkbox" id="checkImp"/>
  	</li>
  	
  	<li>
  		<div class="checkWorkStatus">
	  		<label for="delay">지연</label>
	  		<label for="noncomplete">미완료</label>
	  		<label for="complete">완료</label>
  		</div>
  		<div class="checkWorkStatus">
	  		<input type="checkbox" id="delay"/>
	  		<input type="checkbox" id="noncomplete"/>
	  		<input type="checkbox" id="complete"/>
  		</div>
  	</li>
  	
  	<li>
  		<input type="text" id="datepicker_reg" /> ~ 
  		<input type="text" id="datepicker_dead" />
  	</li>
  	
  	<li>
  		<input type="text" id="search" />
  		<img src="" alt="searchImg"/>
  	</li>
  </ul>
            
  <table class="table table-striped tdtable">
    <thead>
      <tr>
        <th><input type="checkbox"/></th>
        <th>번호</th>
        <th>중요 ▲</th>
        <th>제목 ▲</th>
        <th>등록일 ▲</th>
        <th>마감일 ▲</th>
        <th>상태</th>
      </tr>
    </thead>
    <tbody>
      <tr>
      	<td><input type="checkbox"/></td>
        <td>1</td>
        <td><img src="" alt=""/></td>
        <td>계약서 작성요청</td>
        <td>2021.04.21</td>
        <td>2021.05.01</td>
        <td><button type="button">미완료</button></td>
      </tr>
      <tr>
      	<td><input type="checkbox"/></td>
      	<td>2</td>
        <td><img src="" alt=""/></td>
        <td>6월 1일 오늘 할 일</td>
        <td>2021.04.21</td>
        <td>2021.05.01</td>
        <td><button type="button">미완료</button></td>
      </tr>
    </tbody>
  </table>
</div>

</body>
</html>
    