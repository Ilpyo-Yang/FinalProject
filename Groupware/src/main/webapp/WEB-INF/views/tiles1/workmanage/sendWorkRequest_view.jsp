<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

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
	height: 25px;
	color: white;
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
		
		$(document).on("click", ".workStatus", function () {
		     var subject = $(this).data('subject');
		     var receiver = $(this).data('receiver');
		     
		     $("h4#workStatus-title").text( subject );
		     $("#workStatusModal").find("iframe").attr("src", "workStatusModal.opis?receiver="+receiver);
		     
		     // As pointed out in comments, 
		     // it is unnecessary to have to manually call the modal.
		     // $('#workStatusModal').modal('show');
		});
		
	});
	
	function goDetailWork(wmno) {
		location.href="<%=request.getContextPath()%>/showDetailWork.opis?wmno="+wmno;
	}
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
			
			<c:forEach var="work" items="${requestScope.workList}" varStatus="status">
				<tr>
					<td><input type="checkbox" /></td>
					<td>${status.count}</td>
					<td>
						<span class="workSubject" onclick="goDetailWork('${work.wmno}')" style="cursor: pointer;">${work.subject}</span>
					</td>
					
					<td>${work.fk_receiver_seq}</td>
					<td>${work.registerday}</td>
					<td>${work.deadline}</td>
					
					<c:choose>
						<c:when test="${work.fk_statno == 0}">
							<td><button type="button" class="workStatus " data-toggle="modal" data-target="#workStatusModal" style="background-color: #ff3300;" 
										data-subject="${work.subject}" data-receiver="${work.fk_receiver_seq}" data-stat="${work.fk_statno == 0}">지연<span>+2</span></button></td>		
						</c:when>
						<c:when test="${work.fk_statno == 1}">
							<td><button type="button" class="workStatus " data-toggle="modal" data-target="#workStatusModal" style="background-color: #66ccff;"
										data-subject="${work.subject}" data-receiver="${work.fk_receiver_seq}" data-stat="${work.fk_statno == 0}">미완료</button></td>
						</c:when>
						<c:when test="${work.fk_statno == 2}">
							<td><button type="button" class="workStatus " data-toggle="modal" data-target="#workStatusModal" style="background-color: white; border: 1px solid black; color: black;"
										data-subject="${work.subject}" data-receiver="${work.fk_receiver_seq}" data-stat="${work.fk_statno == 0}">완료</button></td>
						</c:when>
					</c:choose>
					
					<c:if test="${work.checkstatus == 0}">
						<td><button type="button" class="readCheck " data-toggle="modal" data-target="#readCheckModal">읽음확인</button></td>
					</c:if>
					<c:if test="${work.checkstatus == 1}">
						<td><button type="button" class="readCheck " data-toggle="modal" data-target="#readCheckModal">미확인</button></td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- Modal -->
	<div id="workStatusModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" id="workStatus-title"></h4>
				</div>
				<div class="modal-body">
					<iframe style="border:none; width: 100%; height: 250px;" src="" ></iframe>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div id="readCheckModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">6월 1일 오늘 할 일</h4>
				</div>
				<div class="modal-body">
					<iframe style="border:none; width: 100%; height: 250px;" src="readCheckModal.opis"></iframe>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>	
</div>

