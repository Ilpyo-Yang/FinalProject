<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>

<jsp:include page="./approval_sidebar.jsp" />  

<script type="text/javascript">
	$(document).ready(function(){
		
		var html="";

		// 결재요청 내역 가져오기
		$.ajax({
			url:"<%=ctxPath%>/approvalSubmitList.opis",
			dataType:"json",
			data:{fk_mbr_seq:'${sessionScope.loginuser.mbr_seq}'},
			success: function(json){		
				if(json.length>0){
					$.each(json, function(index, item){
						html += "<tr>"+
						"<td><input type='checkbox' class='approvalList'/></td>"+
						"<td>"+item.apform_name+"</td>"+
						"<td>"+item.ap_title+"</td>"+
						"<td>"+item.ap_start_day+"</td>"+
						"<td>"+item.ap_manage_approver+"</td>"+
						"<td>"+item.ap_end_day+"</td>"+
						"<td>"+item.ap_progress+"</td>"+
					    "</tr>";
					});
				}
				else {
					html += "<tr><td></td><td>결재 요청한 문서가 없습니다.</td><td></td><td></td><td></td><td></td></tr>"
				}
					
				$("tbody#list").html(html);
			},
			error: function(request, status, error){
                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
            }
		}); 
		
	}); // end of $(document).ready(function(){})---------------------------------------
	
</script>
</head>
<body>

	<div id="approvalContainer">
		<span class="subtitle">결재요청문서</span>
		<hr> 	
		<div id="searchOption">
			<table>
				<tr>
					<td>기안자</td>
					<td><input type="text" class="form-control searchInput" style="width: 50%;"/></td>
					<td>기안일</td>
					<td>
						<input type="text" class="form-control searchInput"/>
						<span>-</span>
						<input type="text" class="form-control searchInput"/>
					</td>
				</tr>
				<tr>
					<td>문서제목</td>
					<td colspan="3">
						<input type="text" class="form-control searchInput"/>
						<button type="button" class="btn formBtn4" id="search">조회하기</button>
					</td>
				</tr>
			</table>
		</div>
		<div id="searchList">
			<select>
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
						<th>기안일자</th>
						<th>결재라인 현황</th>
						<th>승인/반려일자</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody id="list" ></tbody>
			</table> 					
		</div>
	</div>

</body>
</html>