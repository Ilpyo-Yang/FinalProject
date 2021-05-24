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
		margin-top: 30px;
		background-color: #e6e6e6;
		margin-left: 1%;
		width: 98%;
		height: 700px;
		text-align: center;
	}
	
</style>

<script type="text/javascript">
	/* When the user clicks on the button,
	toggle between hiding and showing the dropdown content */

	$(document).ready(function(){
		 //////////////////////////////////////////////////////////////////////////////////////////////////////
	      var mmhtml = "";
	      for(var i = 1; i <= 12; i++) {
	         if(i <10) {
	            mmhtml += "<option value = '0"+i+"'>0"+i+"</option>";
	         } else {
	            mmhtml += "<option value = '"+i+"'>"+i+"</option>";
	         }         
	      }
	      
	      $("select#birthmm").html(mmhtml);
	      
	      //////////////////////////////////////////////////////////////////////////////////////////////////////
	      var ddhtml = "";
	      for(var i = 1; i <= 31; i++) {
	         if(i <10) {
	            ddhtml += "<option value = '0"+i+"'>0"+i+"</option>";
	         } else {
	            ddhtml += "<option value = '"+i+"'>"+i+"</option>";
	         }         
	      }
	      
	      $("select#birthdd").html(ddhtml);
//////////////////////////////////////////////////////////////////////////////////////////////////////
	      var hhhtml = "";
	      for(var i = 0; i <= 23; i++) {
	         if(i <10) {
	            hhhtml += "<option value = '0"+i+"'>0"+i+"</option>";
	         } else {
	            hhhtml += "<option value = '"+i+"'>"+i+"</option>";
	         }         
	      }
	      
	      $("select#birthhh").html(hhhtml);
//////////////////////////////////////////////////////////////////////////////////////////////////////
	      var mihtml = "";
	      for(var i = 0; i <= 59; i++) {
	         if(i <10) {
	            mihtml += "<option value = '0"+i+"'>0"+i+"</option>";
	         } else {
	            mihtml += "<option value = '"+i+"'>"+i+"</option>";
	         }         
	      }
	      
	      $("select#birthmi").html(mihtml);
	      
	      
	      
		
		$("button#btnSend").click(function(){
			$.ajax({// 버튼 클릭시 페이지 이동 없이 행동한다.
				url:"<%=request.getContextPath()%>/member/smsSend.up",
				type:"POST",
				data:{"mobile":"${requestScope.mvo.mobile}",
					  "smsContent" : $("textarea#smsContent").val(),
					  "birthyyyy" : $("select#birthyyyy").val(),
					  "birthmm" : $("select#birthmm").val(),
					  "birthdd" : $("select#birthdd").val(),
					  "birthhh" : $("select#birthhh").val(),
					  "birthmi" : $("select#birthmi").val()},
				dataType:"json",
				success:function(json){
					// json은 {"group_id":"R2G7b27olTV24tQf","success_count":1,"error_count":0}
					if(json.success_count == 1){
						$("div#smsResult").html("문자전송이 성공되었습니다.");
					}
					else if(json.error_count != 0){
						$("div#smsResult").html("문자전송이 실패되었습니다.");
					}
					$("div#smsResult").show();
					
				},
				error: function(request, status, error){
		               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		            }
			});		
		});
		
	});
	

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
			<td class="insaBarMenu2" style="width: 30%; background-color: black;"></td>
			<td class="insaBarMenu2" style="width: 30%; background-color: #68b658;"></td>
			</tr>
		</table>
	</header>
	<body>
		<table id="insaDetailButton">
		<tr id="insaDetailButton">
			<td class="insaDetailButton" style="background-color: #68b658">인적사항</td>
			<td class="insaDetailButton" style="background-color: #e6e6e6">서류정보</td>
		</tr>
		</table>
		<div id="midBoxGray">
			<table>
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
						  <label for="male">인사</label>
						  <input type="radio" id="accounting" name="department" value="accounting">
						  <label for="male">회계</label>
						  <input type="radio" id="purchase" name="department" value="purchase">
						  <label for="male">구매</label>
						  <input type="radio" id="business" name="department" value="business">
						  <label for="male">영업</label>
					      <input type="radio" id="marketing" name="department" value="marketing">
						  <label for="male">마케팅</label>
					</td>
				</tr>
				<tr>
					<td>직책</td>
					<td>  <input type="radio" id="boss" name="level" value="boss">
						  <label for="male">팀장</label>
						  <input type="radio" id="team" name="level" value="team">
						  <label for="male">팀원</label>
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
			            </select>월
			            <select id="birthdd" name="birthdd" style="margin-left: 2%; width: 60px; padding: 8px;">
			            </select>일 
			             <select id="birthhh" name="birthhh" style="margin-left: 2%; width: 60px; padding: 8px;">
			            </select>시
			             <select id="birthmi" name="birthmi" style="margin-left: 2%; width: 60px; padding: 8px;">
			            </select>분
						
						<i class="fa fa-calendar" style="font-size:24px"></i>
					</td>
				</tr>
				<tr>
					<td>퇴사일자</td>
					<td></td>
				</tr>
				<tr>
					<td>학력</td>
					<td></td>
				</tr>
				<tr>
					<td>재직상태</td>
					<td></td>
				</tr>
			</table>
			
		</div>
	
	</body>
</div>



