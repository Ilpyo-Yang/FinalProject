<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 <%
String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.up 페이지</title>

<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/snsmain.css"/>

<script type="text/javascript">


</script>

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
</head>
<body>
	<!-- 주소는 <span style="color: blue;">${requestScope.address}</span> 입니다. -->
	<div class=snsmaincontainer>
		<div class=userinfo>
			<div class=userinfoside>
			<img class=mainuserimg src="<%= ctxPath%>/resources/images/${sessionScope.loginuser.mbr_img}" style="margin-top: 20px; margin-left: 20px;"/>
			
			</div>
			<div class=userinfotop>
			<span class=username >${sessionScope.loginuser.mbr_name}</span>
			<c:if test="${sessionScope.loginuser.fk_rank_no == 0}"><span class=userjobgrade> 팀원</span></c:if>
			<c:if test="${sessionScope.loginuser.fk_rank_no == 1}"><span class=userjobgrade> 팀장</span></c:if>
			<c:if test="${sessionScope.loginuser.fk_rank_no == 2}"><span class=userjobgrade> 대표</span></c:if> 
		    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" style="margin-left: 10px;">유저상태
		    <span class="caret"></span></button>
		    <ul class="dropdown-menu">
		      <li><a href="#">온라인</a></li>
		      <li><a href="#">오프라인</a></li>
		      <li><a href="#">자리비움</a></li>
			</ul>
			<img src="<%= ctxPath%>/resources/images/pencel.png" style="width: 25px; height: 25px; float: right; margin-right:  60px;"/>
			</div>
			<div class=userinfobottom>
				<div class="well">${sessionScope.loginuser.mbr_stsmsg}</div>
			</div>
			
			
		</div>
		
		<div class=menu>
			<img class=menuimg src="<%= ctxPath%>/resources/images/menuuser.png" />
			<img class=menuimg src="<%= ctxPath%>/resources/images/chat.png" />
		</div>
		
		<div class="input-group">
	      <input type="text" class="form-control" placeholder="사원검색" name="Search" style="width:299px;">
	      <div class="input-group-btn">
	        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
	      </div>
	    </div>
		
		<div class=tflist>
			사원목록 대화방 목록 나오는곳
		</div>
		
	</div>
	
</body>
</html>