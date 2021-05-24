<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	header#insaBar{
		height: 77px;
		width: 100%;
		border: solid 1px yellow;
	}
	header#insaBar table {
		width: 100%;
		border-collapse: collapse;
	}
	header#insaBar tr {
		width: 100%;
	}
	td.insaBarMenu{
		background-color: #68b658;
		font-size: 25pt;
		font-weight: bold;
		height: 70px;
		margin: 0px;
	}
	td.insaBarMenu2{
		height: 7px;
	}
	table#departmentButton{
		margin: 30px;
		text-align: left;
		width: 100%;
	}
	tr#departmentButton{
		display: inline-block;
		text-align: center;
	}
	td.departmentButton{
		display:inline-block;
		width: 144px;
		height: 45px;
		border-radius: 31px;
		font-size: 20pt;
		font-weight: bold;
		padding-top: 7px;
		margin-right: 30px;
		text-align: center;
	}
	div#midBoxGray{
		margin-top: 30px;
		background-color: #e6e6e6;
		margin-left: 1%;
		width: 98%;
		height: 700px;
		text-align: center;
	}
	
	/* Dropdown Button */
	.dropbtn {
	  background-color: #68b658;
	  color: white;
	  padding: 16px;
	  font-size: 16px;
	  border: none;
	  cursor: pointer;
	}
	
	/* Dropdown button on hover & focus */
	.dropbtn:hover, .dropbtn:focus {
	  background-color: #41a441;
	}
	
	/* The container <div> - needed to position the dropdown content */
	.dropdown {
	  position: relative;
	  display: inline-block;
	}
	
	/* Dropdown Content (Hidden by Default) */
	.dropdown-content {
	  display: none;
	  position: absolute;
	  background-color: #f1f1f1;
	  min-width: 160px;
	  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	  z-index: 1;
	}
	
	/* Links inside the dropdown */
	.dropdown-content a {
	  color: black;
	  padding: 12px 16px;
	  text-decoration: none;
	  display: block;
	}
	
	/* Change color of dropdown links on hover */
	.dropdown-content a:hover {background-color: #ddd}
	
	/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
	.show {display:block;}
	
	table#insaSearchTbl tr{
		display: inline-block;
		height: 50px;
	}
	
	table#insaSearchTbl td{
		display: inline-block;
		height: 50px;
		padding: 10px;
	}
	form.example{
		display: inline-block;
		float: none;
		height: 50px;
	}
	button#insaSearchButton{
		width: 50px;
		height: 35px;
		font-size: 12pt;
	}
	table#memberListTbl{
		margin-left: 40px;
		margin-top: 30px;
		border: solid 1px black;
		border-collapse: collapse;
		width: 40%;
		height: 80%;
	
	}
	table#memberListTbl tr{
		border: solid 1px red;
		width: 100%;
	}
	table#memberListTbl td{
		border: solid 1px black;
	}
	table#memberListTbl th{
		border: solid 1px black;
	}
</style>

<script type="text/javascript">
	/* When the user clicks on the button,
	toggle between hiding and showing the dropdown content */

	$(document).ready(function(){
		$("dropdown-content").click(function(event){
			console.log(event.text);
		});
		
	});
	
	
	
	function myFunction() {
	  document.getElementById("myDropdown").classList.toggle("show");
	}
	
	
	// Close the dropdown menu if the user clicks outside of it
	window.onclick = function(event) {
	  if (!event.target.matches('.dropbtn')) {
	    var dropdowns = document.getElementsByClassName("dropdown-content");
	    var i;
	    for (i = 0; i < dropdowns.length; i++) {
	      var openDropdown = dropdowns[i];
	      if (openDropdown.classList.contains('show')) {
	        openDropdown.classList.remove('show');
	      }
	    }
	  }
	}
	
/* 	window.onclick = function(event) {
	  if (!event.target.matches('.dropbtn') && !event.target.matches('.dropdown-content')) {
		    var dropdowns = document.getElementsByClassName("dropdown-content");
		    var i;
		    for (i = 0; i < dropdowns.length; i++) {
		      var openDropdown = dropdowns[i];
		        openDropdown.classList.remove('show');
		    }
		  console.log(event.target.text);
		  console.log(document.getElementsByClassName("dropbtn"));
		  console.log(document.getElementsByClassName("dropbtn").text);
		  var html = '<button onclick="myFunction()" class="dropbtn">'+event.target.text+'</button>';
		  console.log(html);
		  //document.getElementsByClassName("a#dropbtnA").innerHTML = html;
		  //console.log(document.getElementsByClassName("dropbtn").innerHTML());
		  
	  }
	} */
</script>

<div id="insa">
	<header id="insaBar">
		<table id="insaBarTable">
			<tr>
			<td class="insaBarMenu" style="text-align: left; width: 40%;">&nbsp;<i class="fa fa-bars"></i>&nbsp;&nbsp;인사관리</td>
			<td class="insaBarMenu" style="text-align: center; width: 30%;">멤버</td>
			<td class="insaBarMenu" style="text-align: center; width: 30%;">급여</td>
			</tr>
			<tr>
			<td class="insaBarMenu2" style="width: 40%; background-color: #68b658;"></td>
			<td class="insaBarMenu2" style="width: 30%; background-color: #68b658;"></td>
			<td class="insaBarMenu2" style="width: 30%; background-color: black;"></td>
			</tr>
		</table>
	</header>
	<body>
		<table id="departmentButton">
		<tr id="departmentButton">
			<td class="departmentButton" style="background-color: #68b658">전체</td>
			<td class="departmentButton" style="background-color: #e6e6e6">인사</td>
			<td class="departmentButton" style="background-color: #e6e6e6">회계</td>
			<td class="departmentButton" style="background-color: #e6e6e6">구매</td>
			<td class="departmentButton" style="background-color: #e6e6e6">영업</td>
			<td class="departmentButton" style="background-color: #e6e6e6">마케팅</td>
		</tr>
		</table>
		<div id="midBoxGray">
			<table id="insaSearchTbl">
				<tr>
					<td>
						<div class="dropdown">
						  <div onclick="myFunction()" class="dropbtn">검색분류</div>
						  <div id="myDropdown" class="dropdown-content">
						    <a href="#">사원명</a>
						    <a href="#">사원번호</a>
						    <a href="#">연차</a>
						  </div>
						</div>
					</td>
					<td>
						<form class="example" action="action_page.php" style="display: inline-block; height: 50px;">
						  <input type="text" placeholder="Search.." name="search" style="height: 40px;">
						  <button id="insaSearchButton" type="submit">검색</button>
						</form>
					</td>
				</tr>
			</table>
			<table id="memberListTbl">
				
					<tr>
						<th style="width: 25%;">사원번호</th>
						<th style="width: 25%;">사원명</th>
						<th style="width: 25%;">부서</th>
						<th style="width: 25%;">직책</th>
					</tr>
			<%-- 	</thead>
					<tbody>
					<c:forEach var="memberVO" items="${requestScope.paraMap.memberVO}">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					</c:forEach>
				</tbody> --%>
			</table>
		</div>
	
	</body>
</div>



