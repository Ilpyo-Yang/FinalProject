<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<jsp:include page="./workmanage_sidebar.jsp" />

<style type="text/css">
div.tdcontainer {
	 border: 1px solid blue;
	 margin-left: 280px;
}

ul#todoSelectCondition {
	list-style-type: none;
	display: table;
}

ul#todoSelectCondition>li {
	display: inline-block;
	margin-right: 20px;
	vertical-align: middle;
}

ul#todoSelectCondition input[type=text] {
	width: 150px;
}

div.checkWorkStatus>label, div.checkWorkStatus>input {
	width: 50px;
	text-align: center;
}

.ui-datepicker-trigger, .searchImg {
	width: 25px;
	height: 25px;
	margin-left: 5px;
}

button.workStatus {
	width: 100px;
	border: none;
}

button.readCheck {
	background-color: white;
	border-style: groove;
	border: solid 1px;
}
</style>


<script>
	$(document).ready(function() {
		
		$("#datepicker_reg").datepicker({
			showOn : "button",
			buttonImage : "<%=request.getContextPath()%>/resources/images/icon_calendar.png",
			buttonImageOnly : true,
			buttonText : "Select date"
		});
		
		$("#datepicker_dead").datepicker({
			showOn : "button",
			buttonImage : "<%=request.getContextPath()%>/resources/images/icon_calendar.png",
			buttonImageOnly : true,
			buttonText : "Select date"
		});
	});
</script>

<div class="container tdcontainer">
	<h3>내가 한 업무 요청</h3>

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
		
		<li style="width: 50px;">
			<label for="checkImp" hidden>중요</label>
			<input type="checkbox" id="checkImp" hidden/>
		</li>

		<li>
			<div class="checkWorkStatus">
				<label for="delay">지연</label> 
				<label for="noncomplete">미완료</label> 
				<label for="complete">완료</label>
			</div>
			<div class="checkWorkStatus">
				<input type="checkbox" id="delay" /> 
				<input type="checkbox" id="noncomplete" />
				<input type="checkbox" id="complete" />
			</div>
		</li>

		<li>
			<input type="text" id="datepicker_reg" /> ~ 
			<input type="text" id="datepicker_dead" />
		</li>

		<li>
			<input type="text" id="search" />
			<img class="searchImg" src="<%=request.getContextPath()%>/resources/images/icon_search.png" alt="searchImg" />
		</li>
	</ul>

	<table class="table table-striped tdtable">
		<thead>
			<tr>
				<th><input type="checkbox" /></th>
				<th>번호</th>
				<th>제목 ▲</th>
				<th>담당자</th>
				<th>등록일 ▲</th>
				<th>마감일 ▲</th>
				<th>상태</th>
				<th>확인</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="checkbox" /></td>
				<td>1</td>
				<td>계약서 작성요청</td>
				<td>박관리</td>
				<td>2021.04.21</td>
				<td>2021.05.01</td>
				<td><button type="button" class="workStatus" style="background-color: #ff3300;">지연<span>+2</span></button></td>
				<td><button type="button" class="readCheck">읽음확인</button></td>
			</tr>
			<tr>
				<td><input type="checkbox" /></td>
				<td>2</td>
				<td>6월 1일 오늘 할 일</td>
				<td>박관리</td>
				<td>2021.04.21</td>
				<td>2021.05.01</td>
				<td><button type="button" class="workStatus" style="background-color: white; border: 1px solid ">완료</button></td>
				<td><button type="button" class="readCheck">읽음확인</button></td>
			</tr>
			<tr>
				<td><input type="checkbox" /></td>
				<td>3</td>
				<td>6월 1일 오늘 할 일</td>
				<td>김관리</td>
				<td>2021.04.21</td>
				<td>2021.05.01</td>
				<!-- Trigger the modal with a button -->
				<td><button type="button" class="workStatus" data-toggle="modal" data-target="#myModal" style="background-color: #66ccff;">미완료</button></td>
				<td><button type="button" class="readCheck">읽음확인</button></td>
			</tr>
		</tbody>
	</table>
	
	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">6월 1일 오늘 할 일</h4>
				</div>
				<div class="modal-body">
					<iframe style="border:none; width: 100%; height: 250px;" src="workStatusModal.opis"></iframe>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
</div>

