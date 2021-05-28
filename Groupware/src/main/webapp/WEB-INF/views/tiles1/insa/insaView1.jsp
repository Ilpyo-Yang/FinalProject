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
		
		$("button#modifyBtn").click(function(){
			var frm = document.insaRegister1Frm;
			frm.method = "POST";
			frm.action = "<%=ctxPath%>/insaRegister1.opis";
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
					<td></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input/></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td></td>
				</tr>
				<tr>
					<td>부서</td>
					<td></td>
				</tr>
				<tr>
					<td>직책</td>
					<td></td>
				</tr>
				<tr>
					<td>연차</td>
					<td></td>
				</tr>
				<tr>
					<td>입사일자</td>
					<td>년 월 일</td>
				</tr>
				<tr>
					<td>퇴사일자</td>
					<td>년 월 일</td>
				</tr>
				<tr>
					<td>학력</td>
					<td></td>
				</tr>
			</table>
			<table id="insaDetail2" class="table table-striped tdtable">
				<tr>
					<td>회사연락처</td>
					<td></td>
				</tr>
				<tr>
					<td>개인연락처</td>
					<td></td>
				</tr>
				<tr>
					<td>회사이메일</td>
					<td></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>년 월 일 						
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td></td>
				</tr>
			</table>
			<button class="registerBtn"  id="registerBtn" type="submit" style="display: inline-block; vertical-align: top;" onClick="javascript:location.href='<%=ctxPath%>/insaRegister1.opis'">수정</button>
			
			</form>
	
	</div>
</div>



