<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>

<script type="text/javascript">

	$(document).ready(function(){

		$("input#searchWord").bind("keydown", function(event){
			if(event.keyCode == 13){// 엔터를 했을 경우
				goSearch();
			}
		});
		
		// 검색리스트 숨기기
		$("div#displayList").hide();
		
		$("input#searchWord").keyup(function(){
			
			var wordLength = $(this).val().trim().length;
			
			if(wordLength == 0){
				$("div#displayList").hide();
			}
			else{
				$.ajax({
					url:"<%= ctxPath%>/wordSearchShow.opis",
					type:"get",
					data:{"searchType":$("select#searchType").val()
						 ,"searchWord":$("input#searchWord").val()},
					dataType:"json",
					success:function(json){
						   if(json.length > 0){
							   // 검색된 데이터가 있는 경우
							   var html = "";
							   
							   $.each(json, function(index, item){
								   var word = item.word;
								   var index = word.toLowerCase().indexOf($("input#searchWord").val().toLowerCase());
								   var len = $("input#searchWord").val().length;
								   
								   word = word.substr(0,index) + "<span style='color:blue;'>"+word.substr(index,len)+"</span>"+word.substr(index+len);
								   
								   html += "<span style='cursor:pointer;' class='word'>"+word+"</span><br>";
							   });
							   
							   $("div#displayList").html(html);
							   $("div#displayList").show();
						   }
	
					},
					error: function(request, status, error){
		                  	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		              }
				
				});
			}
		}); // end of $("input#searchWord").keyup(function(){})------------------------
		
		$(document).on("click","span.word",function(){
			$("input#searchWord").val($(this).text());// 텍스트박스에 검색된 결과의 문자열을 입력
			$("div#displayList").hide();
			goSearch();
		});
		
		// 검색시 검색조건 및 검색어값 유지
		if(${not empty requestScope.paraMap}){
			$("select#searchType").val("${requestScope.paraMap.searchType}");
			$("input#searchWord").val("${requestScope.paraMap.searchWord}");
		}
		
	}); // end of $(document).ready(function(){})---------------------------------------

</script>	
	
<!-- ========== 주소록 등록 모달창 ========== -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
     
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">주소록 등록</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
       
      <!-- Modal body -->
      <div class="modal-body" align="center">
        <form name="addFrm" id="addFrm" enctype="multipart/form-data" > 
			
	     <table id="table tblAddr">      
	        <tr>
	         	<th>이름</th>
	            <td>
	                <input type="text" name="mbr_name" placeholder="이름" class="short"/>
	                <span class="error">이름은 필수입력 사항입니다.</span>
	            </td>
	         </tr>		
	         <tr>
	         	<th>전화번호</th>
	            <td>
	             <input type="text" id="hp1" name="hp1" size="6" maxlength="3" value="010" readonly />&nbsp;&nbsp;
	             <input type="text" id="hp2" name="hp2" size="6" maxlength="4" />&nbsp;&nbsp;
	             <input type="text" id="hp3" name="hp3" size="6" maxlength="4" />
	             <span class="error">휴대폰 형식이 아닙니다.</span>  
	            </td>
	         </tr>	
	         <tr>
	         	<th>이메일</th>
	            <td>
	                <input type="text" name="mbr_email" id="email" class="short requiredInfo" placeholder="abcd@opis.com" />
	                <span id="emailCheckResult"></span>
	                <span class="error">이메일 형식에 맞지 않습니다.</span>
	            </td>
	         </tr>	         
	         <tr>
	         	<th>생일</th>
	            <td>
	                <input type="date" name="mbr_birthday" placeholder="yyyymmdd" class="short"/>       
	            </td>
	         </tr>	
	         <tr>
	         	<th>소속</th>
	            <td>
	                <input type="text" name="dept_name" placeholder="부서" class="short"/> 
	                <input type="text" name="position_name" placeholder="직책" class="short"/>      
	            </td>
	         </tr>
	         <tr>
	         	<td style="width: 20%; font-weight: bold;">우편번호</td>
	         	<td style="width: 80%; text-align: left;">
	            <input type="text" id="postcode" name="postcode" size="6" maxlength="5" />&nbsp;&nbsp;
	            <%-- 우편번호 찾기 --%>
	            <button type="button" id="zipcodeSearch" style="vertical-align: middle;"> 우편번호 검색 </button>
	            <span class="error">우편번호 형식이 아닙니다.</span>
	         </tr>
	         <tr>
	         <td style="width: 20%; font-weight: bold;">주소</td>
	         <td style="width: 80%; text-align: left;">
	            <input type="text" id="address" name="address" size="40" placeholder="주소" /><br><br>
	            <input type="text" id="detailaddress" name="detailaddress" size="36" placeholder="상세주소" />&nbsp;<input type="text" id="extraAddress" name="extraAddress" size="35" placeholder="참고항목" /> 
	            <span class="error">주소를 입력하세요</span>
	         </td>
	      	</tr>
	         <tr>
	         	<th>메모</th>
	            <td>
					<textarea rows="4" cols="100" style="width: 80%; height: 200px;" name="addrmemo" id="content" placeholder="메모를 입력해주세요"></textarea>                   
				</td>
	         </tr>	 
	      </table>
	      
          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="button" id="btnRegister" onclick="goRegister()">등록</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          </div>
   	  </form>
   
      </div>

      </div>
    </div>
  </div>
    