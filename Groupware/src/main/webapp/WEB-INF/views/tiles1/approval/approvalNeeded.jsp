<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>

<jsp:include page="./approval_sidebar.jsp" /> 

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script type="text/javascript">
	$(document).ready(function(){
		
		$("input#datepicker").datepicker({
			 dateFormat: 'yy-mm-dd', 
		      changeMonth: true,
		      changeYear: true
		});
		
		$("input#datepicker2").datepicker({
			 dateFormat: 'yy-mm-dd', 
		      changeMonth: true,
		      changeYear: true
		});	   
	
		 var frm = document.listForm;
         frm.action = "<%= ctxPath%>/approvalNeeded.opis";
         frm.submit();  
         
	}); // end of $(document).ready(function(){})---------------------------------------
	
	
	function showList() {
		var managePerson = '${sessionScope.loginuser.dept_detail} ${sessionScope.loginuser.rank_detail}'
			  			 +' ${sessionScope.loginuser.mbr_name}';

		$.ajax({
			url:"<%=ctxPath%>/approvalNeededList.opis",
			dataType:"json",
			data:{managePerson:managePerson, listCnt:$("select[name=listCnt]").val(),
				  writer:$("input[name=writer]").val(), submitStartDate:$("input[name=submitStartDate]").val(),
				  submitEndDate:$("input[name=submitEndDate]").val(), word:$("input[name=word]").val()},
			success: function(json){	
				var html="";
				
				if(json.length>0){	
					$.each(json, function(index, item){
						/* console.log(item); */
						html += "<tr id='item.ap_seq item.apform_name' style='cursor:pointer;' onclick='func_show(this.id)' >"+
								"<td><input type='checkbox' class='approvalList' /></td>"+
								"<td>"+item.apform_name+"</td>"+
								"<td>"+item.ap_title+"</td>"+
								"<td>"+item.mbr_name+"</td>"+
								"<td>"+item.ap_dept+"</td>"+
								"<td>"+item.ap_start_day+"</td>"+
							    "</tr>";
					});
				}
				else {
					html += "<tr><td></td><td>결재 대기중인 문서가 없습니다.</td><td></td><td></td><td></td><td></td></tr>"
				}
					
				$("tbody#list").append(html);
			},
			error: function(request, status, error){
                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
            }
		}); 
	}// end of function showList() ---------------------------------------
	
	
	function func_show(id) {
		var index = id.indexOf(" ");
		var apform_name = id.substr(index);
		var ap_seq = id.substr(0,index);
		
		console.log(index);
		if(apform_name=="일반기안서"){
			location.href="<%= ctxPath%>/approvalForm1.opis?ap_seq="+ap_seq;
		} else if (apform_name=="지출결의서") {
			location.href="<%= ctxPath%>/approvalForm2.opis?ap_seq="+ap_seq;
		} else {
			location.href="<%= ctxPath%>/approvalForm3.opis?ap_seq="+ap_seq;
		}
		
	}// end of function func_show() -----------------------------------------
	
	
</script>
</head>
<body>

	<div id="approvalContainer">
		<span class="subtitle">결재 대기중인 문서</span>
		<hr> 
		<form name="listForm">	
		<div id="searchOption">
			
			<table>
				<tr>
					<td>기안자</td>
					<td><input type="text" class="form-control searchInput" style="width: 50%;" id="searchWriter" name="writer" value=""/></td>
					<td>기안일</td>
					<td>
						<input type="text" class="form-control searchInput" id="datepicker" name="submitStartDate" value=""/>
						<span>-</span>
						<input type="text" class="form-control searchInput" id="datepicker2" name="submitEndDate" value=""/>
					</td>
				</tr>
				<tr>
					<td>문서내용</td>
					<td colspan="3">
						<input type="text" class="form-control searchInput" id="search" name="word" value=""/>
						<button type="button" class="btn formBtn4" id="searchWord">조회하기</button>
					</td>
				</tr>
			</table>
		</div>
		<div id="searchList">
			<select name="listCnt" class="selectCommon" name="listCnt" id="listCnt">
				<option>10개</option>
				<option>8개</option>
				<option>4개</option>
			</select>
			<button type="button" class="btn btn-success formBtn4" id="approval">일괄결재</button>
			<table class="table table-striped">
				<thead>
					<tr>
						<th><input type="checkbox" id="alllList"/></th>
						<th>종류</th>
						<th>문서제목</th>
						<th>기안자</th>
						<th>기안부서</th>
						<th>기안일</th>
					</tr>
				</thead>
				<tbody id="list" ></tbody>
			</table> 					
		</div>
		<input type="text" name="managePerson" value="${sessionScope.loginuser.dept_detail} ${sessionScope.loginuser.rank_detail} ${sessionScope.loginuser.mbr_name}"/>
		</form>
		<br>
		
		
	</div>

</body>
</html>