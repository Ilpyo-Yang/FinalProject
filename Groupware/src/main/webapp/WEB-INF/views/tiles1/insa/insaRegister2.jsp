<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
	div#insaBar{
		height: 77px;
		width: 100%;
		border: solid 1px yellow;
	}
	div#insaBar table {
		width: 100%;
		border-collapse: collapse;
	}
	div#insaBar tr {
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
	table#insaDetailButton{
		margin: 30px;
		text-align: left;
		width: 100%;
	}
	tr#insaDetailButton{
		display: inline-block;
		text-align: center;
	}
	td.insaDetailButton{
		display:inline-block;
		width: 200px;
		height: 60px;
		border-radius: 10px;
		font-size: 28pt;
		font-weight: bold;
		padding-top: 7px;
		margin-right: 30px;
		text-align: center;
	}
	td.insaListButton{
		display:inline-block;
		width: 150px;
		height: 40px;
		border-radius: 10px;
		font-size: 16pt;
		font-weight: bold;
		padding-top: 7px;
		margin-right: 30px;
		text-align: center;
	}
	button#registerBtn{
 	  margin-left: 50px;
	  padding: 15px 25px;
	  font-size: 24px;
	  text-align: center;
	  cursor: pointer;
	  outline: none;
	  color: #fff;
	  background-color: #04AA6D;
	  border: none;
	  border-radius: 15px;
	  box-shadow: 0 9px #999;
	}
	button#registerBtn:hover{ background-color: #3e8e41}
	button#registerBtn:active{
	  background-color: #3e8e41;
	  box-shadow: 0 5px #666;
	  transform: translateY(4px);
	}
	div#midBoxGray{
		display: inline-block;
		margin-top: 10px;
		background-color: #e6e6e6;
		width: 100%;
		height: 700px;
		text-align: center;
		padding: 40px;
				}
	table.insaDetail{
		display: inline;
		margin-top: 20px;
		border-collapse: collapse;
		
	}
	table.insaDetail td {
		border: solid 1px black;
		padding: 15px 50px;
		font-size: 15pt;
	}
	table.insaDetail tr{
		border: solid 1px black;
		vertical-align: middle;
	}
	table.insaDetail input{
		height: 30px;
	}
	table#insaDetail1{
		margin-left:50px;
	}
	table#insaDetail2{
		margin-left: 60px;
	}
</style>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){

		$("button#registerBtn").click(function(){
			var frm = document.insaRegister1Frm;
			frm.method = "POST";
			frm.action = '<%=ctxPath%>/insaRegister2End.opis';
			frm.submit(); 
			
		});
	});
</script>



<div id="insa">
	<div id="insaBar">
		<table id="insaBarTable">
			<tr>
			<td class="insaBarMenu" style="text-align: left; width: 40%;">&nbsp;<i class="fa fa-bars"></i>&nbsp;&nbsp;인사관리</td>
			<td class="insaBarMenu" style="text-align: center; width: 30%;">멤버</td>
			<td class="insaBarMenu" style="text-align: center; width: 30%;">급여</td>
			</tr>
			<tr>
			<td class="insaBarMenu2" style="width: 40%; background-color: #68b658;"></td>
			<td class="insaBarMenu2" style="width: 30%; background-color: black;"></td>
			<td class="insaBarMenu2" style="width: 30%; background-color: #68b658;"></td>
			</tr>
		</table>
	</div>
	<div style="width: 100%;">
		<table id="insaDetailButton">
		<tr id="insaDetailButton">
			<td class="insaDetailButton" style="background-color: #e6e6e6" onclick="javascript:location.href='<%=ctxPath%>/insaView1.opis'">인적사항</td>
			<td class="insaDetailButton" style="background-color: #68b658">서류정보</td>
			<td class="insaDetailButton"></td>
			<td class="insaDetailButton"></td>
			<td class="insaDetailButton"></td>
			<td class="insaDetailButton"></td>
			<td class="insaListButton" style="background-color: #e6e6e6" onclick="javascript:location.href='<%=ctxPath%>/insa.opis'">사원목록</td>
		</tr>
		</table>
		<div id="midBoxGray">
		<form name="insaRegister2Frm">
			<table id="insaDetail1" class="insaDetail">
				<tr>
					<td>최종학력</td>
					<td></td>
				</tr>
				<tr>
					<td>
						<form name="edu1" id="edu1" action="/action_page.php">
				 			<select name="subject" id="subject">
						    	<option value="" selected="selected">대학원졸(박사)</option>
						    	<option value="" selected="selected">대학원졸(석사)</option>
						    	<option value="" selected="selected">대학졸(학사)</option>
						    	<option value="" selected="selected">초대졸</option>
						    	<option value="" selected="selected">고졸</option>
						    	<option value="" selected="selected">중졸</option>
						    	<option value="" selected="selected">초졸</option>
						  	</select>
						</form>
					</td>
					<td><input /></td>
				</tr>
				<tr>
					<td>
						<form name="edu2" id="edu2" action="/action_page.php">
				 			<select name="subject" id="subject">
						    	<option value="" selected="selected">대학원졸(박사)</option>
						    	<option value="" selected="selected">대학원졸(석사)</option>
						    	<option value="" selected="selected">대학졸(학사)</option>
						    	<option value="" selected="selected">초대졸</option>
						    	<option value="" selected="selected">고졸</option>
						    	<option value="" selected="selected">중졸</option>
						    	<option value="" selected="selected">초졸</option>
						  	</select>
						</form>
					</td>
					<td><input /></td>
				</tr>
				<tr>
					<td>
						<form name="edu3" id="edu3" action="/action_page.php">
				 			<select name="subject" id="subject">
						    	<option value="" selected="selected">대학원졸(박사)</option>
						    	<option value="" selected="selected">대학원졸(석사)</option>
						    	<option value="" selected="selected">대학졸(학사)</option>
						    	<option value="" selected="selected">초대졸</option>
						    	<option value="" selected="selected">고졸</option>
						    	<option value="" selected="selected">중졸</option>
						    	<option value="" selected="selected">초졸</option>
						  	</select>
						</form>
					</td>
					<td><input /></td>
				</tr>
				
			</table>
			<table id="insaDetail2" class="insaDetail">
				<tr>
					<td>휴대전화</td>
					<td class="insaDetail2td2"><input  /></td>
				</tr>
				<tr>
					<td>회사이메일</td>
					<td class="insaDetail2td2"><input  /></td>
				</tr>
				<tr>
					<td>주소</td>
					<td class="insaDetail2td2"><input  /></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td class="insaDetail2td2">
			            <select id="birthyy" name="birthyy" >
			           		<c:forEach begin="1950" end="2050" varStatus="count" >
			           			<option>${count.count}</option>
			           		</c:forEach>
			            </select>년
						<select id="birthmm" name="birthmm" >
			           		<c:forEach begin="1" end="12" varStatus="count" >
			           			<option>${count.count}</option>
			           		</c:forEach>
			            </select>월
			            <select id="birthdd" name="birthdd" >
			            		<c:forEach begin="1" end="31" varStatus="count" >
				           			<option>${count.count}</option>
				           		</c:forEach>
			         </select>일 						
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td class="insaDetail2td2">  <input type="radio" id="female" name="gender" value="female">
						  <label for="female">여</label>
						  <input type="radio" id="male" name="gender" value="male">
						  <label for="male">남</label>
					</td>
				</tr>
			</table>
			<button id="registerBtn"  type="submit">등록</button>
		   </form>
		</div>
	
	</div>
</div>



