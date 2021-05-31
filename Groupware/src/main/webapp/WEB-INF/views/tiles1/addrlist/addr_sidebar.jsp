<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>

<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/menu.css" />

<script type="text/javascript">

	$(document).ready(function(){
		
		$("button#btnReg").click(function(){
			location.href="<%=ctxPath%>/add.opis";
		});
		
	}); // end of $(document).ready(function(){})---------------------------------------

</script>


<div id="sideMenu" style="width: 20%; border: 1px solid red;">
	<div id="menuTitle">주소록</div>
	<div>
		<button type="button" id="btnReg">주소록 등록</button>
	</div>

	<div class="lside">
		<a class="side" href="/groupware/cnotice_list.opis">전체 주소록</a>
	</div>
	<div class="lside">
		<a class="side" href="/groupware/dnotice_list.opis">개인 주소록</a>
	</div>
	<div class="lside">
		<a class="side" href="/groupware/formboard_list.opis">개인 주소록 관리</a>
	</div>
</div>
