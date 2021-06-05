<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String ctxPath = request.getContextPath(); %>

<script type="text/javascript">
	$(document).ready(function(){
		
		
		
	}); // end of $(document).ready(function(){})---------------------------------------
</script>


 <div id="myModal" class="modal">

   <div class="modal-content">
       <div style="text-align: left;">
	       <span style="font-size: 12pt; font-weight: bold;">참조자 선택하기</span>
	       <span><button type="button" class="btn formBtn2" id="closeModal">X</button></span>
	       <hr>
       </div>
       
       <div id="modal" style="line-height: 1.5;">
		   <div class="memberModal" id="memberModal1" 
		        style="width: 40%;  height: 90%; margin: 0 10px; display: inline-block;">
		   		<label><input type="checkbox"/>&nbsp;&nbsp;모두 선택/해제하기</label>
		   		<hr style="margin: 0 0 15px 0;"> 	
		   		
		   		<div style="border: solid 1px #f2f2f2; padding: 2%; overflow: scroll; height: 380px;">
		   
		   		<c:forEach var="memberVO" items="${memberList}" varStatus="status">
		   			<c:if test="${memberVO.dept_detail eq 'CEO'}">
			        	<label><input type="checkbox"/>&nbsp;&nbsp;${memberVO.dept_detail}&nbsp;${memberVO.mbr_name}</label><br>
		   			</c:if>
		   		</c:forEach>
		   		<hr class="division"> 
		   		
		   		<label><input type="checkbox"/>&nbsp;&nbsp;영업팀</label><br>		   		
		   		<c:forEach var="memberVO" items="${memberList}" varStatus="status">
		   			<c:if test="${memberVO.dept_detail eq '영업팀'}">
			        	<label><input type="checkbox"/>&nbsp;&nbsp;└─&nbsp;${memberVO.mbr_name}&nbsp;${memberVO.rank_detail}</label><br>
		   			</c:if>
		   		</c:forEach>	
		   		<hr class="division">
		   		
		   		<label><input type="checkbox"/>&nbsp;&nbsp;인사팀</label><br>		   		
		   		<c:forEach var="memberVO" items="${memberList}" varStatus="status">
		   			<c:if test="${memberVO.dept_detail eq '인사팀'}">
			        	<label><input type="checkbox"/>&nbsp;&nbsp;└─&nbsp;${memberVO.mbr_name}&nbsp;${memberVO.rank_detail}</label><br>
		   			</c:if>
		   		</c:forEach>
		   		<hr class="division">
		   		
		   		<label><input type="checkbox"/>&nbsp;&nbsp;홍보팀</label><br>		   		
		   		<c:forEach var="memberVO" items="${memberList}" varStatus="status">
		   			<c:if test="${memberVO.dept_detail eq '홍보팀'}">
			        	<label><input type="checkbox"/>&nbsp;&nbsp;└─&nbsp;${memberVO.mbr_name}&nbsp;${memberVO.rank_detail}</label><br>
		   			</c:if>
		   		</c:forEach>
		   		<hr class="division">
		   		
		   		<label><input type="checkbox"/>&nbsp;&nbsp;IT팀</label><br>		   		
		   		<c:forEach var="memberVO" items="${memberList}" varStatus="status">
		   			<c:if test="${memberVO.dept_detail eq 'IT팀'}">
			        	<label><input type="checkbox"/>&nbsp;&nbsp;└─&nbsp;${memberVO.mbr_name}&nbsp;${memberVO.rank_detail}</label><br>
		   			</c:if>
		   		</c:forEach>
		   		<hr class="division">
		   		
		   		<label><input type="checkbox"/>&nbsp;&nbsp;회계팀</label><br>		   		
		   		<c:forEach var="memberVO" items="${memberList}" varStatus="status">
		   			<c:if test="${memberVO.dept_detail eq '회계팀'}">
			        	<label><input type="checkbox"/>&nbsp;&nbsp;└─&nbsp;${memberVO.mbr_name}&nbsp;${memberVO.rank_detail}</label><br>
		   			</c:if>
		   		</c:forEach>
				</div>
		   </div>
		   
		   <div id="memberMove" 
		        style="width: 10%;  height: 90%; display: inline-block; text-align: center; align-items: center;">
		   		<i class="fas fa-arrow-right fa-2x"></i><br>
		   		<i class="fas fa-arrow-left fa-2x"></i>
		   </div>
		   
		   <div class="memberModal" id="memberModal2" 
		   		style="width: 40%;  height: 90%; margin: 0 10px; display: inline-block;">
		   		<label><input type="checkbox"/>&nbsp;&nbsp;모두 선택/해제하기</label>
		   		<hr style="margin: 0 0 15px 0;"> 	
		   		
		   		<div style="border: solid 1px #f2f2f2; padding: 2%; overflow: scroll;">
				</div>

		   </div>
	   </div>

   </div>

 </div>