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
	<div id="menuTitle">게시판</div>
	<div>
		<button type="button" id="btnReg">게시글 등록</button>
	</div>

	<div class="lside">
		<a class="side" href="/groupware/cnotice_list.opis">전체공지사항</a>
	</div>
	<div class="lside">
		<a class="side" href="/groupware/dnotice_list.opis">부서공지사항</a>
	</div>
	<div class="lside">
		<a class="side" href="/groupware/formboard_list.opis">공통서식</a>
	</div>
</div>
