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
			frm.action = "<%=ctxPath%>/insaRegister1End.opis";
			frm.submit(); 
			
		});
		
	});
</script>



<div id="insa" style="width: 80%; display: inline-block; margin-top: 70px; padding-left: 30px;">
		<table style="margin-bottom: 50px;">
		<tr id="insaDetailButton">
			<td><button class="registerBtn">인적사항</button></td>
			<td style="width: 10px;"></td>
			<td><button class="registerBtn" style="background-color: #e6e6e6; " onclick="javascript:location.href='<%=ctxPath%>/insaView2.opis'">서류정보</button></td>
			<td style="width: 580px;"></td>
			<td><button class="registerBtn" style="background-color: gray; " onclick="javascript:location.href='<%=ctxPath%>/insa.opis'">회원목록으로</button></td>
		</tr>
		</table> 

	
	
		<form name="insaRegister1Frm">
			<table id="insaDetail1" class="table table-striped tdtable">
				<tr>
					<td>사원번호</td>
					<td></td>
				</tr>
				<tr>
					<td>사원명</td>
					<td><input name="mbr_name"  /></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input name="mbr_id"  /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input name="mbr_pwd"  /></td>
				</tr>
				<tr>
					<td>부서</td>
					<td>  <input type="radio" id="insa" name="fk_dept_no">
						  <label for="insa">0</label>
						  <input type="radio" id="accounting" name="fk_dept_no">
						  <label for="accounting">1</label>
						  <input type="radio" id="purchase" name="fk_dept_no">
						  <label for="purchase">2</label>
						  <input type="radio" id="business" name="fk_dept_no">
						  <label for="business">3</label>
					      <input type="radio" id="marketing" name="fk_dept_no">
						  <label for="marketing">4</label>
					</td>
				</tr>
				<tr>
					<td>직책</td>
					<td>  <input type="radio" id="boss" name="fk_rank_no">
						  <label for="boss">0</label>
						  <input type="radio" id="team" name="fk_rank_no">
						  <label for="team">1</label>
					</td>
				</tr>
				<tr>
					<td>권한</td>
					<td>  <input type="radio" id="admin" name="fk_power_no">
						  <label for="admin">0</label>
						  <input type="radio" id="genMem" name="fk_power_no">
						  <label for="genMem">1</label>
					</td>
				</tr>
				<tr>
					<td>입사일자</td>
					<td>
			            <input type="number" id="enteryyyy" name="enteryyyy" min="2021" max="2050" step="1" value="2021" style="width: 80px;" required />년
        				<select id="entermm" name="entermm" style="margin-left: 2%; width: 60px; padding: 8px;">
			           		<c:forEach begin="1" end="12" varStatus="count" >
			           			<option>${count.count}</option>
			           		</c:forEach>
			            </select>월
			            <select id="enterdd" name="enterdd" style="margin-left: 2%; width: 60px; padding: 8px;">
			            
				            	<c:forEach begin="1" end="31" varStatus="count" >
				           			<option>${count.count}</option>
				           		</c:forEach>
			         
			            </select>일 						
						</td>
				</tr>
				<tr>
					<td>퇴사일자</td>
					<td>
			            <input type="number" id="quityyyy" name="quityyyy" min="2021" max="2050" step="1" value="2021" style="width: 80px;" required />년
        				<select id="quitmm" name="quitmm" style="margin-left: 2%; width: 60px; padding: 8px;">
			           		<c:forEach begin="1" end="12" varStatus="count" >
			           			<option>${count.count}</option>
			           		</c:forEach>
			            </select>월
			            <select id="quitdd" name="quitdd" style="margin-left: 2%; width: 60px; padding: 8px;">
			            
				            	<c:forEach begin="1" end="31" varStatus="count" >
				           			<option>${count.count}</option>
				           		</c:forEach>
			         
			            </select>일 	
					</td>
				</tr>
				<tr>
					<td>학력</td>
					<td>  <input type="radio" id="high" name="finalEdu">
						  <label for="high">고졸</label>
					  	  <input type="radio" id="college" name="finalEdu">
						  <label for="college">초대졸</label>
					  	  <input type="radio" id="univ" name="finalEdu">
						  <label for="univ">대졸</label>
						  <input type="radio" id="gradu" name="finalEdu">
						  <label for="gradu">대학원</label>
					</td>
				</tr>
			</table>
			<table id="insaDetail2" class="table table-striped tdtable">
				<tr>
					<td>회사연락처</td>
					<td><input name="mbr_com_number"  /></td>
				</tr>
				<tr>
					<td>개인연락처</td>
					<td><input name="mbr_phone_number"  /></td>
				</tr>
				<tr>
					<td>회사이메일</td>
					<td><input name="mbr_email"  /></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
			            <select id="birthyy" name="birthyy" style="margin-left: 2%; width: 60px; padding: 8px;">
			           		<c:forEach begin="1950" end="2050" varStatus="count" >
			           			<option>${count.count}</option>
			           		</c:forEach>
			            </select>년
						<select id="birthmm" name="birthmm" style="margin-left: 2%; width: 60px; padding: 8px;">
			           		<c:forEach begin="1" end="12" varStatus="count" >
			           			<option>${count.count}</option>
			           		</c:forEach>
			            </select>월
			            <select id="birthdd" name="birthdd" style="margin-left: 2%; width: 60px; padding: 8px;">
			            
				            	<c:forEach begin="1" end="31" varStatus="count" >
				           			<option>${count.count}</option>
				           		</c:forEach>
			         </select>일 						
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>  <input type="radio" id="female" name="mbr_gender">
						  <label for="female">0</label>
						  <input type="radio" id="male" name="mbr_gender">
						  <label for="male">1</label>
					</td>
				</tr>
			</table>
			<button class="registerBtn" id="registerBtn"  type="submit" style="display: inline-block; vertical-align: top;">등록</button>
			
			</form>
	
	</div>
</div>



