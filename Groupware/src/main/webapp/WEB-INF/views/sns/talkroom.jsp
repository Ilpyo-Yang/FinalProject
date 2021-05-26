<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/snsmain.css"/>
<style type="text/css">

div.snsmaincontainer {
	border: 1px solid black;
	display: inline-block;
	width: 400px;
	height: 600px;
	background-color:#b0c4d5;
}

div.roominfo {
	<!--border: 1px solid blue;-->
	display: inline-block;
	width:400px;
	height: 100px;
	background-color:#8aa9c1;
}

div.talk {
	width:400px;
	height: 400px;
}

div.talkinput {
	border: 1px solid black;
	display: inline-block;
	width:400px;
	height: 100px;
	background-color:white;
	float: bottom;
}

img.iconimg {
	width: 20px; 
	height: 20px; 
	float: left; 
	margin-left:  10px; 
	margin-top: 10px;
}

div.icon {
	<!--border: 1px solid red;-->
	float: top;
	height: 35px;
}

textarea.tArea {
	<!--border: 1px solid blue;-->
	resize: none;
	float: left;
	height: 65px;
	width: 300px;
	
}

input.inputsearch {
	width:180px; 
	float: left;
	margin-top: 20px;
	height: 30px;
}

button.btn-success {
	float: right;
	margin-top: 10px; 
	margin-right: 20px;
}

</style>

<script type="text/javascript">


</script>

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="snsmaincontainer">
	<div class="roominfo">
		<div class=userinfoside>
			<img class=mainuserimg src="<%= ctxPath%>/resources/images/nomaluserimg.png" style="margin-top: 20px; margin-left: 20px;"/>			
		</div>
		<div class=userinfotop style="height: 79px;">
			<span class=username >새로운 대화방1</span>
			<img src="<%= ctxPath%>/resources/images/search.png" style="width: 20px; height: 20px; float: right; margin-right:  10px;"/>
			<img src="<%= ctxPath%>/resources/images/bell.png" style="width: 20px; height: 20px; float: right; margin-right:  10px;"/>
			<img src="<%= ctxPath%>/resources/images/pencel.png" style="width: 20px; height: 20px; float: right; margin-right:  60px;"/>
			 <input type="text" class="inputsearch" placeholder="대화내용 검색" name="Search">
	     	<button class="btn btn-default" type="submit" style="margin-top: 20px; margin-right: 80px;"><i class="glyphicon glyphicon-search"></i></button>
	    </div>
	    

	</div>
	
	<div class="talk">
	
	</div>
	
	<div class="talkinput">
		<div class="icon">
			<img class="iconimg" src="<%= ctxPath%>/resources/images/file.png" />
			<img class="iconimg" src="<%= ctxPath%>/resources/images/emoticon.png" />
		</div>
		 	<textarea class="tArea" rows="5" id="talkuser" style="resize: none;"></textarea>
		 	<button type="button" class="btn btn-success">전송</button>
	</div>
	
</div>

</body>
</html>