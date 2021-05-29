<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/menu.css" />	
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
		display: inline-block;
		 vertical-align: top;
	}
	table#insaDetail2{
		margin-left: 50px;
		display: inline-block;
	    vertical-align: top;
	}
	div.insaDetailDiv{
		display: inline-block;
	    vertical-align: top;
	}
	button.plusBtn{
		float: right;
	}
	
</style>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){

		var htmlEduBf = "";
		var htmlEdu = "";
		$("button#eduPlusBtn").click(function(){
		
	         var bFlag = 1;
			$(".school").each(function(){
				if($(this).val().trim() == ""){
					bFlag *= 0;
				}
			});
			if(bFlag == 0){
				alert("먼저 비어있는 학력 란을 채워주세요!!");
			}
			else{
				htmlEdu="";
			 	var eduLevel = $("#eduLevel option:selected").val();
				var school = $("input#school").val();
				var major = $("input#major").val();
				console.log(eduLevel+" "+school+" "+major);
				htmlEdu += '<tr>'+
							'<td>'+
								'<select name="eduLevel" class="eduLevel" id="eduBf">'+
									'<option value="6"';
				if(eduLevel == 6){
					htmlEdu+='selected="selected"';
				}
				htmlEdu+='>대학원(박사)</option>'+
						'<option value="5"';
				if(eduLevel == 5){
					htmlEdu+='selected="selected"';
				}
				htmlEdu+='>대학원(석사)</option>'+
						'<option value="4"';
				if(eduLevel == 4){
					htmlEdu+='selected="selected"';
				}
				htmlEdu+='>대학교(학사)</option>'+
						'<option value="3"';
				if(eduLevel == 3){
					htmlEdu+='selected="selected"';
				}
				htmlEdu+='>전문대학교</option>'+
						'<option value="2"';
				if(eduLevel == 2){
					htmlEdu+='selected="selected"';
				}
				htmlEdu+='>고등학교</option>'+
						'<option value="1"';
				if(eduLevel == 1){
					htmlEdu+='selected="selected"';
				}
				htmlEdu+='>중학교</option>'+
						'<option value="0"';
				if(eduLevel == 0){
					htmlEdu+='selected="selected"';
				}
				htmlEdu+='>초등학교</option>'+
					'</select>'+
					'</td>'+
					'<td><input id="schoolBf" class="school" style="width: 100px;" value='+school+' /></td>'+
					'<td><input id="majorBf" style="width: 100px;" value='+major+' /></td>'+
				'</tr>';
				if(htmlEduBf.trim()!=""){
					htmlEdu=htmlEduBf+htmlEdu;
				}
				var htmlEduEmpty='<tr class="eduTr">'+
							  	'<td>'+
			 						'<select name="eduLevel" class="eduLevel" id="eduLevel">'+
								    	'<option value="6" >대학원(박사)</option>'+
								    	'<option value="5" >대학원(석사)</option>'+
								    	'<option value="4" selected="selected">대학교(학사)</option>'+
								    	'<option value="3" >전문대학원</option>'+
								    	'<option value="2" >고등학교</option>'+
								    	'<option value="1" >중학교</option>'+
								    	'<option value="0" >초등학교</option>'+
								  	'</select>'+
								'</td>'+
								'<td><input id="school" class="school" style="width: 100px;" /></td>'+
								'<td><input id="major" style="width: 100px;" /> <button type="button" onclick="eduDel();">삭제</button></td>'+
							  '</tr>';

				$("input#htmlEduHidden").val(htmlEdu);
				$("tbody#insaDetail1tbody").html(htmlEdu+htmlEduEmpty);
				htmlEduBf = htmlEdu;
			}
		});
		
		// ---------------------- 학력정보 끝
		
		// ---------------------- 자격증정보 시작
       var htmlYear ="";
		for(var i=1950;i<2050;i++){
			
			htmlYear += '<option value="'+i+'" >'+i+'</option>';
		}

		$("select#certiyy").html(htmlYear);
		
			

			var htmlCertiBf = "";
			var htmlCerti = "";
			$("button#certiPlusBtn").click(function(){
		         var cFlag = 1;
				$(".certiInput").each(function(){
					if($(this).val().trim() == ""){
						cFlag *= 0;
					}
				});
				if(cFlag == 0){
					alert("먼저 비어있는 자격증란을 채워주세요!!");
				}
				else{
					htmlCerti="";
				 	var certification = $("input#certification").val();
					var certiLevel = $("input#certiLevel").val();
					var certiyy = Number($("#certiyy option:selected").val());
					var certimm = Number($("#certimm option:selected").val());
					var certidd = Number($("#certidd option:selected").val());
					
					
					
					
					
						 
					htmlCerti = '<tr>'+
									'<td>'+
										'<input id="certificationBf" class="certiInput" style="width: 80px;" value="'+certification+'"/>'+
									'</td>'+
									'<td>'+
										'<input id="certiLevelBf" class="certiInput" style="width: 70px;" value="'+certiLevel+'"/>'+
									'</td>'+
									'<td style="width: 270px;">'+
										'<select id="certiyyBf" name="certiyy" style="width: 75px; padding: 4px;">'
											+'<option value="'+certiyy+'">'+certiyy+'</option>'
										+'</select>년'+
										'<select id="certimmBf" name="certimm" style="margin-left: 2%; width: 55px; padding: 4px;">'+
										'<option value="'+certimm+'">'+certimm+'</option>'+
							            '</select>월'+
							            '<select id="certiddBf" name="certidd" style="margin-left: 2%; width: 55px; padding: 4px;">'+
							            
								            '<option value="'+certidd+'">'+certidd+'</option>'+
						        		'</select>일 <button type="button" onclick="certiDel();">삭제</button>'+
									'</td>'+
								'</tr>'; 
					if(htmlCertiBf.trim()!=""){
						htmlCerti=htmlCertiBf+htmlCerti;
					}
					var htmlCertiEmpty='<tr>'+
											'<td>'+
												'<input id="certification" class="certiInput" style="width: 80px;" />'+
											'</td>'+
											'<td>'+
												'<input id="certiLevel" class="certiInput" style="width: 70px;" />'+
											'</td>'+
											'<td style="width: 270px;">'+
											'<select id="certiyy" name="certiyy" style="width: 75px; padding: 4px;">'
												+ htmlYear+							           			
						                     '</select>년'+
											'<select id="certimm" name="certimm" style="margin-left: 2%; width: 55px; padding: 4px;">'+
								           		'<c:forEach begin="1" end="12" varStatus="count" >'+
								           			'<option value="${count.count}">${count.count}</option>'+
								           		'</c:forEach>'+
								            '</select>월'+
								            '<select id="certidd" name="certidd" style="margin-left: 2%; width: 55px; padding: 4px;">'+
								            
									            '<c:forEach begin="1" end="31" varStatus="count" >'+
									           		'<option  value="${count.count}">${count.count}</option>'+
									           	'</c:forEach>'+
							        		'</select>일 '+
										'</td>'+
									'</tr>';
					$("input#htmlCertiHidden").val(htmlCerti);
					$("tbody#insaDetail2tbody").html(htmlCerti+htmlCertiEmpty);
					htmlCertiBf = htmlCerti;
				}
			});		
			
			
			// 등록하기
			$("button#registerBtn").click(function(){
				var eduLevelResult = "";
				$(".eduLevel option:selected").each(function(index,item){
					eduLevelResult += $(this).val()+",";
				});
				console.log(eduLevelResult);
				var schoolResult = "";
				$("input#school").each(function(index,item){
					schoolResult += $(this).val()+",";
				});
				var certificationResult = "";
				$("input#certification").each(function(index,item){
					certificationResult += $(this).val()+",";
				});
				var certiLevelResult = "";
				$("input#certiLevel").each(function(index,item){
					certiLevelResult += $(this).val()+",";
				});
				

				var certiyyResult = "";
				$(".certiyy option:selected").each(function(index,item){
					certiyyResult += $(this).val()+",";
				});
				var certimmResult = "";
				$(".certimm option:selected").each(function(index,item){
					certimmResult += $(this).val()+",";
				});
				var certiddResult = "";
				$(".certidd option:selected").each(function(index,item){
					certiddResult += $(this).val()+",";
				});
	
				
		
				var frm = document.insaRegister2Frm;
				frm.method = "POST";
				frm.action = "<%=ctxPath%>/insaRegister2End.opis?eduLevelResult="+eduLevelResult+"schoolResult="+schoolResult+"certificationResult="+certificationResult+"certiLevelResult="+certiLevelResult+
							 "certiyyResult"+certiyyResult+"certimmResult"+certimmResult+"certiddResult"+certiddResult;
			
			});
	});
	function eduDel(){
		alert("go");
		var htmlDel = $("input#htmlEduHidden").val();
		$("tbody#insaDetail1tbody").html(htmlDel);
	}
	function certiDel(){
		alert("eo");
		var htmlDel = $("input#htmlCertiHidden").val();
		$("tbody#insaDetail2tbody").html(htmlDel);
	}
</script>



<div id="insa" style="width: 80%; display: inline-block; margin-top: 70px; padding-left: 30px;">
<form name="insaRegister2Frm">
<table style="margin-bottom: 50px;">
		<tr id="insaDetailButton">
			<td><button class="registerBtn" style="background-color: #e6e6e6; " onclick="javascript:location.href='<%=ctxPath%>/insaRegister1.opis'">인적사항</button></td>
			<td style="width: 10px;"></td>
			<td><button class="registerBtn" >서류정보</button></td>
			<td style="width: 360px;"></td>
			<td><button class="registerBtn" id="registerBtn"  type="submit" style="display: inline-block; vertical-align: top;">등록</button></td>
			<td><button class="registerBtn" style="background-color: gray; " onclick="javascript:location.href='<%=ctxPath%>/insa.opis'">회원목록으로</button></td>
		</tr>
		</table> 
		
			<div class="insaDetailDiv">
				<table id="insaDetail1" class="table table-striped tdtable">
					<thead>
						<tr>
							<th>최종학력</th>
							<th colspan="2"></th>
						</tr>
					</thead>
					<tbody id="insaDetail1tbody">
						<tr class="eduTr">
							<td>
						 			<select name="eduLevel" class="eduLevel" id="eduLevel">
								    	<option value="6" >대학원(박사)</option>
								    	<option value="5" >대학원(석사)</option>
								    	<option value="4" selected="selected">대학교(학사)</option>
								    	<option value="3" >전문대학원</option>
								    	<option value="2" >고등학교</option>
								    	<option value="1" >중학교</option>
								    	<option value="0" >초등학교</option>
								  	</select>
							</td>
							<td><input id="school" class="school" style="width: 100px;" /></td>
							<td><input id="major" style="width: 80px;" /></td>
						</tr>
					</tbody>
		   		</table>
					<br>
				<button class="plusBtn" id="eduPlusBtn" style="display: inline-block;" type="button">+추가</button>
				<input type="hidden" id="htmlEduHidden" />
			</div>
			<div class="insaDetailDiv">
				<table id="insaDetail2" class="table table-striped tdtable">
					<thead>
						<tr>
							<th colspan="3" style="text-align: center;">자격증</th>
						</tr>
						<tr>
							<th>자격증명</th>
							<th>점수/급수</th>
							<th>취득일자</th>
						</tr>
					</thead>
					<tbody id="insaDetail2tbody">
						<tr>
							<td><input id="certification" class="certiInput" style="width: 80px;" /></td>
							<td><input id="certiLevel" class="certiInput" style="width: 70px;" /></td>
							<td style="width: 270px;">
								<select id="certiyy" name="certiyy" style="width: 75px; padding: 4px;">
				           			
					            </select>년
								<select id="certimm" name="certimm" style="margin-left: 2%; width: 55px; padding: 4px;">
					           		<c:forEach begin="1" end="12" varStatus="count" >
					           			<option value="${count.count}">${count.count}</option>
					           		</c:forEach>
					            </select>월
					            <select id="certidd" name="certidd" style="margin-left: 2%; width: 55px; padding: 4px;">
					            
						            	<c:forEach begin="1" end="31" varStatus="count" >
						           			<option value="${count.count}">${count.count}</option>
						           		</c:forEach>
				        		</select>일 	
							</td>
						</tr>
					</tbody>
				</table><br>
				<button class="plusBtn" id="certiPlusBtn"  style="display: inline-block;" type="button">+추가</button>
				<input type="hidden" id="htmlEduHidden" />
			</div>
			</form>
</div>



