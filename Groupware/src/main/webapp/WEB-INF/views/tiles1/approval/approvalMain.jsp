<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>


<jsp:include page="./approval_sidebar.jsp" />  


<script type="text/javascript">
	$(document).ready(function(){
	
		
	}); // end of $(document).ready(function(){})---------------------------------------
	
</script>
</head>
<body>

	<div id="approvalContainer">
		<span class="subtitle">기안문작성</span>
		<hr>
		<div id="approvalForm">        	
			<div class="menu"><i class="fas fa-file-signature fa-3x icon"></i>일반기안서</div>
			<div class="menu"><i class="fas fa-file-signature fa-3x icon"></i>지출결의서</div>
			<div class="menu"><i class="fas fa-file-signature fa-3x icon"></i>휴가신청서</div>
		</div>
	</div>
	
</body>
</html>
