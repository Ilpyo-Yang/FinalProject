<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	div#login_container {
		margin: 0 auto;
		width: 70%;
	}
	h2 {
		font-weight: bold;
		color: green;
	}
	label.inputName {
		width: 50px;
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
		<h2>Opistachio</h2>
		
		<label for="companyInput" class="inputName">COMPANY</label>
		<input type="text" id="companyInput" name="companyInput"/><br>
		<label for="idInput" class="inputName">ID</label>
		<input type="text" id="idInput" name="idInput"/><br>
		<label for="pwdInput" class="inputName">PASSWORD</label>
		<input type="password" id="pwdInput" name="pwdInput"/><br>
		
		<button type="submit">Opistachio 시작하기</button>
	</div>
</body>

</html>