<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<% String ctxPath = request.getContextPath(); %> 

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/content.css" />   
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/workmanage.css" />  

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=ctxPath%>/resources/js/workmanage.js"></script>

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
</style>


<script>
	$(document).ready(function() {
		setSearchInfo();
		
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
		
		// 버튼 색상 적용하는 js 함수 호출
		$("button.workStatus").each(function(index, item){
			var delayday = $(item).prev().val();
			
			setworkStatusBtn(item, delayday);
		});
		
		// 검색시 검색조건 및 검색어 값 유지시키기
		if (${not empty requestScope.paraMap}) {
			// 검색조건 및 검색어
			$("select#searchType").val("${requestScope.paraMap.searchType}");
			$("input#searchWord").val("${requestScope.paraMap.searchWord}");
			
			// 검색 날짜 조건 
			$("input#datepicker_reg").val("${requestScope.paraMap.registerday}");
			$("input#datepicker_dead").val("${requestScope.paraMap.deadline}");
			
			// 업무 상태 조건
			var workStatusArr = "${requestScope.paraMap.str_workStatus}".split(",");
			for (var i=0; i<workStatusArr.length; i++) {
				$("input.searchWorkStatus").each(function(index, item){
					if ($(item).val() == workStatusArr[i]) {
						$(item).prop("checked", true);
					}
				});
			}
		}
	});
	
	function goDetailTodo(tdno) {
		location.href="<%=request.getContextPath()%>/showDetailTodo.opis?tdno="+tdno+"&mbr_seq=${sessionScope.loginuser.mbr_seq}";
	}
	
	// 전체선택 체크 박스를 클릭했을 때 
	function clickAllCheckbox() {
		// input#allCheckbox ==> 전체선택 체크박스  id="allCheckbox"
		// input.oneCheckbox ==> 하위선택 체크박스  class="oneCheckbox"
		
		var stat = $("input#allCheckbox").prop("checked");
		
		$("input.oneCheckbox").each(function(index, item){
			$(item).prop("checked", stat);
		});
	}
	
	// 하위 체크박스를 클릭했을 때
	function clickOneCheckbox(target) {
		// onclick="clickOneCheckbox(this)";
		
		var stat = $(target).prop("checked");
		
		if (!stat) { // 체크가 풀린 경우라면
			$("input#allCheckbox").prop("checked", false);
		}
		else {
			var check; // 다른 하위 체크박스 검사
			$("input.oneCheckbox").each(function(index, item){
				check = $(item).prop("checked");
				if (check == false) {
					return false;
				}
			});
			if (check) { // 전부 true 일 때
				$("input#allCheckbox").prop("checked", true);	
			}
		}
	}
	
	// 검색 조건을 가지고 검색하러 가는 함수 
	function goSearch() {
		// 업무 검색을 위한 체크박스 중 선택한 것들 담기
		var searchWorkStatusArr = []; 
		$("input.searchWorkStatus").each(function(index, item) {
			if ($(item).prop("checked") == true) {
				searchWorkStatusArr.push($(item).val());
			}
		});
		var str_searchWorkStatus = searchWorkStatusArr.join();
		$("input[name=workStatus]").val(str_searchWorkStatus);
		
		var frm = document.searchFrm;
		frm.method = "get";
		frm.action = "<%=ctxPath%>/workList.opis";
		frm.submit();
	}
	
	
	// 검색된 조건들 고정시키는 함수 
	function setSearchInfo() {
		// 페이지 당 만들기
		var sizePerPage = "${requestScope.sizePerPage}";
		$("select[name=sizePerPage]").val(sizePerPage);
	}
</script>

<div class="container commoncontainer">
	<h3>나의 할 일</h3>

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
			<label for="checkImp">중요</label>
			<input type="checkbox" id="checkImp" />
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
				<th>중요</th>
				<th>제목</th>
				<th>등록일</th>
				<th>마감일</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="todo" items="${requestScope.todoList}" varStatus="status">
				<tr>
					<td><input type="checkbox" /></td>
					<td>${status.count}</td>
					<td><img src="" alt="" /></td>
					<td><span class="todoSubject" onclick="goDetailTodo('${todo.tdno}')" style="cursor: pointer;">${todo.subject}</span></td>
					<td>${todo.registerday}</td>
					<td>${todo.deadline}</td>
					<td>
					<input type="hidden" value="${todo.delayday}"/>
					<button type="button" class="workStatus" value="${todo.fk_statno}"></button>
					</td>	
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- 페이지바 보여주기 -->
	<div align="center" style="width:70%; border:solid 0px gray; margin:20px auto;">
		${requestScope.pageBar}
	</div>
	
</div>

