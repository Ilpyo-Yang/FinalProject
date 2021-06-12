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
		
		var managePerson = '${sessionScope.loginuser.dept_detail} ${sessionScope.loginuser.rank_detail}'
						   +' ${sessionScope.loginuser.mbr_name}';
		
		
		// 결재대기 문서 리스트 가져오기
		$.ajax({
			url:"<%=ctxPath%>/approvalNeededList.opis",
			dataType:"json",
			data:{managePerson:managePerson},
			success: function(json){	
				var html="";
				
				if(json.length>0){	
					$.each(json, function(index, item){
						/* console.log(item); */
						html += "<tr id='"+item.ap_seq+"' style='cursor:pointer;'>"+
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
		
	}); // end of $(document).ready(function(){})---------------------------------------
	
</script>
</head>
<body>

	<div id="approvalContainer">
		<span class="subtitle">결재 대기중인 문서</span>
		<hr> 	
		<div id="searchOption">
			<table>
				<tr>
					<td>기안자</td>
					<td><input type="text" class="form-control searchInput" style="width: 50%;"/></td>
					<td>기안일</td>
					<td>
						<input type="text" class="form-control searchInput" id="datepicker"/>
						<span>-</span>
						<input type="text" class="form-control searchInput" id="datepicker2"/>
					</td>
				</tr>
				<tr>
					<td>문서내용</td>
					<td colspan="3">
						<input type="text" class="form-control searchInput"/>
						<button type="button" class="btn formBtn4" id="search">조회하기</button>
					</td>
				</tr>
			</table>
		</div>
		<div id="searchList">
			<select name="listCnt" class="selectCommon" id="listCnt">
				<option>10개</option>
				<option>8개</option>
				<option>4개</option>
			</select>
			
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
		<button type="button" class="btn btn-success formBtn4" id="approval">일괄결재</button>
	</div>

</body>
</html>