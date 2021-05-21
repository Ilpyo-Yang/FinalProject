<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="style.css">

<style>
	div#login_container {
		margin: 12% auto;
		width: 30%;
		text-align: center;
	}
	h1 {
		font-size: 50pt;
		color: green;
		margin-bottom: 70px;
	}
	label.inputName {
		font-weight: bold;
		font-size: 15pt;
		width: 30%;
	    display: inline-block;
	    margin-bottom: 10px;
	    margin-right: 15px;
	    text-align: right;
	}
	input {
		width: 55%;
	}
	button {
		margin-top: 15px;
		width: 345px;
	}
</style>
<script type="text/javascript">
	
</script>

<html>

<head>
<title>::: Opistachio :::</title>
</head>

<body>
	<div id="login_container">
		<h1>Opistachio</h1>
		
		<label for="companyInput" class="inputName">COMPANY</label>
		<input type="text" id="companyInput" name="companyInput" /><br>
		<label for="idInput" class="inputName">ID</label>
		<input type="text" id="idInput" name="idInput" /><br>
		<label for="pwdInput" class="inputName">PASSWORD</label>
		<input type="password" id="pwdInput" name="pwdInput" /><br>
		
		<button type="submit" class="btn btn-success">Opistachio 시작하기</button>
	</div>
</body>

</html>