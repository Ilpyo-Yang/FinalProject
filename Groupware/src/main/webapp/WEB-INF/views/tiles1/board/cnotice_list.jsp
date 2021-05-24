<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>

<jsp:include page="../../sideMenu.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>전체공지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<script type="text/javascript">

	$(document).ready(function(){
		
		$("button#btnReg").click(function(){
			location.href="<%=ctxPath%>/cnotice_add.opis";
		});
		
	}); // end of $(document).ready(function(){})---------------------------------------

	function goView(cnotice_seq){
		
		location.href="<%=ctxPath%>/view.opis?cnotice_seq="+cnotice_seq;
		
	} // end of function goView(seq)---------------------------------------------------- 
	
</script>
</head>
<body>
<div class="container">        
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
      <c:forEach var="cnoticevo" items="${requestScope.boardList}" varStatus="status">
      	<tr>
			<td align="center">${cnoticevo.cnotice_seq}</td>
			<td align="left">
				<span class="title" onclick="goView('${cnoticevo.cnotice_seq}')">${cnoticevo.ctitle}</span>
			</td>
			<td align="center">관리자</td>
			<td align="center">${cnoticevo.cwritedate}</td>
			<td align="center">${cnoticevo.chit}</td>      	
      	</tr>		
      </c:forEach>
    </tbody>
  </table>
</div>

</body>
</html>
