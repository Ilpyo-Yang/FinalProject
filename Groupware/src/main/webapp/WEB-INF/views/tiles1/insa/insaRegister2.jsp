<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/menu.css" />	
<link rel="stylesheet" href="/resources/demos/style.css">	
<jsp:include page="./insa_sidebar.jsp" />

<style>
		
	.registerBtn{
 	  margin-left: 20px;
	  padding: 10px 20px;
	  font-size: 15px;
	  text-align: center;
	  cursor: pointer;
	  outline: none;
	  color: #fff;
	  background-color: #04AA6D;
	  border: none;
	  border-radius: 15px;
	  box-shadow: 0 9px #999;
	}
	.registerBtn:hover{ background-color: #3e8e41 !important;}
	.registerBtn:active{
	  background-color: #3e8e41 !important;
	  box-shadow: 0 5px #666;
	  transform: translateY(4px);
	}
	table#insaDetail1{
		width: 40%;
		display: inline-block;
		 vertical-align: top;
	}
	table#insaDetail2{
		margin-left: 20px;
		width: 40%;
		display: inline-block;
	    vertical-align: top;
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



<div id="insa" style="width: 80%; display: inline-block; margin-top: 70px; padding-left: 30px;">
<table style="margin-bottom: 50px;">
		<tr id="insaDetailButton">
			<td><button class="registerBtn" style="background-color: #e6e6e6; " onclick="javascript:location.href='<%=ctxPath%>/insaView1.opis'">인적사항</button></td>
			<td style="width: 10px;"></td>
			<td><button class="registerBtn" >서류정보</button></td>
			<td style="width: 580px;"></td>
			<td><button class="registerBtn" style="background-color: gray; " onclick="javascript:location.href='<%=ctxPath%>/insa.opis'">회원목록으로</button></td>
		</tr>
		</table> 
		<form name="insaRegister2Frm">
			<table id="insaDetail1" class="table table-striped tdtable">
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
						<form name="edu3" id="edu3" class="table table-striped tdtable">
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
			<table id="insaDetail2" class="table table-striped tdtable">
				<thead>
					<tr>
						<th colspan="3">자격증</th>
					</tr>
					<tr>
						<th>자격증명</th>
						<th>점수/급수</th>
						<th>취득일자</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input style="width: 80px;" /></td>
						<td><input style="width: 80px;" /></td>
						<td style="width: 200px;">
							<select id="birthyy" name="birthyy" style="margin-left: 2%; width: 30px; padding: 3px;">
			           		<c:forEach begin="1950" end="2050" varStatus="count" >
			           			<option>${count.count}</option>
			           		</c:forEach>
				            </select>년
							<select id="birthmm" name="birthmm" style="margin-left: 2%; width: 30px; padding: 3px;">
				           		<c:forEach begin="1" end="12" varStatus="count" >
				           			<option>${count.count}</option>
				           		</c:forEach>
				            </select>월
				            <select id="birthdd" name="birthdd" style="margin-left: 2%; width: 30px; padding: 3px;">
				            
					            	<c:forEach begin="1" end="31" varStatus="count" >
					           			<option>${count.count}</option>
					           		</c:forEach>
			        		</select>일 	
						</td>
					</tr>
				</tbody>
			</table>
			<button class="registerBtn" id="registerBtn"  type="submit" style="display: inline-block; vertical-align: top;">등록</button>
		   </form>
	</div>
</div>



