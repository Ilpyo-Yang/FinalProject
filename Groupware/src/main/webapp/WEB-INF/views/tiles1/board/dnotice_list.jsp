<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/menu.css" />		
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<script type="text/javascript">

	$(document).ready(function(){
		
		$("button#btnReg").click(function(){
			location.href="<%=ctxPath%>/add.opis";
		});
		
		
	}); // end of $(document).ready(function(){})---------------------------------------

	function goView(seq){
		
		location.href="<%=ctxPath%>/view.opis?dnotice_seq="+dnotice_seq;
		
	} // end of function goView(seq)---------------------------------------------------- 
	
</script>
</head>
<body>

<div style="width: 1460px;"> 
	<!-- 사이드메뉴 -->
    <div id="sideMenu">
  	<div id="menuTitle">게시판</div>
  	<div><button type="button" id="btnReg">게시글 등록</button></div>

  		<div class="lside"><a class="side" href="/groupware/cnotice_list.opis">전체공지사항</a></div>
  		<div class="lside"><a class="side" href="/groupware/dnotice_list.opis">부서공지사항</a></div>
  		<div class="lside"><a class="side" href="#">공통서식</a></div>
	</div>
	
	<!-- 게시판제목 -->
	<div style="padding: 15px; font-size: 25px; font-weight: 600; height: 60px; width: 100%; background-color: #f2f2f2; color: #555;">
	&nbsp;&nbsp;부서 공지사항
	</div>
	
	<!-- 본문(게시판) -->       
	<div class="container" style=" border: 1px solid blue; float: right; width: 700px; margin: 50px 200px; ">
	  <table class="table table-striped">
	    <thead>
	      <tr>
	        <th style="width: 70px;  text-align: center;">번호</th>
	        <th style="width: 360px; text-align: center;">제목</th>
	        <th style="width: 70px;  text-align: center;">등록자</th>
	        <th style="width: 150px; text-align: center;">등록일</th>
	        <th style="width: 70px;  text-align: center;">조회수</th>
	      </tr>
	    </thead>
	    <tbody>
	      <c:forEach var="dnoticevo" items="${requestScope.boardList}" varStatus="status">
	      	<tr>
				<td align="center">${dnoticevo.dnotice_seq}</td>
				<td align="left">
					<span class="title" onclick="goView('${dnoticevo.dnotice_seq}')">${dnoticevo.dtitle}</span>
				</td>
				<td align="center">관리자</td>
				<td align="center">${dnoticevo.cwritedate}</td>
				<td align="center">${dnoticevo.chit}</td>      	
	      	</tr>		
	      </c:forEach>
	    </tbody>
	  </table>
  </div>
</div>

</body>
</html>
