<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	div#midBoxGray{
		display: inline-block;
		margin-top: 10px;
		background-color: #e6e6e6;
		width: 100%;
		height: 600px;
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
		margin-left:100px;
		float: left;
	}
	table#insaDetail2{
		margin-right:100px;
		float: right;
	}
</style>

<script type="text/javascript">
	
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
	<div style="width: 90%; padding-left: 2%;">
		<table id="insaDetailButton">
		<tr id="insaDetailButton">
			<td class="insaDetailButton" style="background-color: #68b658">인적사항</td>
			<td class="insaDetailButton" style="background-color: #e6e6e6">서류정보</td>
		</tr>
		</table>
		<div id="midBoxGray">
			<table id="insaDetail1" class="insaDetail">
				<tr>
					<td>사원번호</td>
					<td><input  /></td>
				</tr>
				<tr>
					<td>사원명</td>
					<td><input  /></td>
				</tr>
				<tr>
					<td>부서</td>
					<td>  <input type="radio" id="insa" name="department" value="insa">
						  <label for="insa">인사</label>
						  <input type="radio" id="accounting" name="department" value="accounting">
						  <label for="accounting">회계</label>
						  <input type="radio" id="purchase" name="department" value="purchase">
						  <label for="purchase">구매</label>
						  <input type="radio" id="business" name="department" value="business">
						  <label for="business">영업</label>
					      <input type="radio" id="marketing" name="department" value="marketing">
						  <label for="marketing">마케팅</label>
					</td>
				</tr>
				<tr>
					<td>직책</td>
					<td>  <input type="radio" id="boss" name="level" value="boss">
						  <label for="boss">팀장</label>
						  <input type="radio" id="team" name="level" value="team">
						  <label for="team">팀원</label>
					</td>
				</tr>
				<tr>
					<td>연차</td>
					<td><input  /></td>
				</tr>
				<tr>
					<td>입사일자</td>
					<td>
			            <input type="number" id="birthyyyy" name="birthyyyy" min="2021" max="2050" step="1" value="2021" style="width: 80px;" required />년
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
					<td>퇴사일자</td>
					<td>
			            <input type="number" id="birthyyyy" name="birthyyyy" min="2021" max="2050" step="1" value="2021" style="width: 80px;" required />년
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
					<td>학력</td>
					<td>  <input type="radio" id="high" name="edu" value="high">
						  <label for="high">고졸</label>
					  	  <input type="radio" id="college" name="edu" value="college">
						  <label for="college">초대졸</label>
					  	  <input type="radio" id="univ" name="edu" value="univ">
						  <label for="univ">대졸</label>
						  <input type="radio" id="gradu" name="edu" value="gradu">
						  <label for="gradu">대학원</label>
					</td>
				</tr>
				<tr>
					<td>재직상태</td>
					<td>  <input type="radio" id="boss" name="level" value="boss">
						  <label for="boss">팀장</label>
						  <input type="radio" id="team" name="level" value="team">
						  <label for="team">팀원</label>
					</td>
				</tr>
			</table>
			<table id="insaDetail2" class="insaDetail">
				<tr>
					<td>휴대전화</td>
					<td><input  /></td>
				</tr>
				<tr>
					<td>회사이메일</td>
					<td><input  /></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input  /></td>
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
					<td>  <input type="radio" id="female" name="gender" value="female">
						  <label for="female">여</label>
						  <input type="radio" id="male" name="gender" value="male">
						  <label for="male">남</label>
					</td>
				</tr>
			</table>
		</div>
	
	</div>
</div>



