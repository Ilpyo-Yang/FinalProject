<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>

<script type="text/javascript">
	$(document).ready(function(){
		
		
		
	}); // end of $(document).ready(function(){})---------------------------------------
</script>


 <div id="myModal" class="modal">

   <div class="modal-content">
       <p style="text-align: left;">
	       <span style="font-size: 12pt; font-weight: bold;">참조자 선택하기</span>
	       <span><button type="button" class="btn formBtn2" id="closeModal">X</button></span>
	       <hr>
       </p>
       
       <p style="text-align: center; line-height: 1.5;">
		   <div class="memberModal" id="memberModal1">
		   		<label><input type="checkbox"/>모두 선택/해제하기</label>
		   		<hr style="margin: 0 0 15px 0;"> 		
		   </div>
		   <div class="memberMove">
		   		<span>
			   		
		   		</span>
		   		<hr>
		   </div>
		   <div class="memberModal" id="memberModal2">
		   	<label><input type="checkbox"/>모두 선택/해제하기</label>
		   		<hr style="margin: 0 0 15px 0;">
		   		<label>영업팀</label>
		   		<label><input type="checkbox"/>모두 선택/해제하기</label>
		   		<label><input type="checkbox"/>모두 선택/해제하기</label>
		   		<label><input type="checkbox"/>모두 선택/해제하기</label>
		   		<label><input type="checkbox"/>모두 선택/해제하기</label>
		   		<label><input type="checkbox"/>모두 선택/해제하기</label>
		   		<label><input type="checkbox"/>모두 선택/해제하기</label>
		   </div>
	   </p>

   </div>

 </div>
