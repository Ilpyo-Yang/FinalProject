<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 정보 수정</title>

<jsp:include page="./addr_sidebar.jsp" />

</head>
<body>

<div class="container" style="width:1460px;">
       <form name="editFrm" id="editFrm" enctype="multipart/form-data" > 
		
     <table id="table tblAddr">      
        <tr>
         	<th>이름</th>
            <td>
                <input type="text" name="name" value="${requestScope.addrvo.mbr_name}" class="short"/>
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
                <input type="text" name="email" class="short requiredInfo" value="${requestScope.addrvo.mbr_email}" placeholder="abcd@opis.com" />
                <span id="emailCheckResult"></span>
                <span class="error">이메일 형식에 맞지 않습니다.</span>
            </td>
         </tr>	         
         <tr>
         	<th>생일</th>
            <td>
                <input type="text" name="birth" placeholder="yyyymmdd" class="short"/>       
            </td>
         </tr>	
         <tr>
         	<th>소속</th>
            <td>
                <input type="text" name="dept" placeholder="부서" class="short" value="${requestScope.addrvo.dept_name}"/> 
                <input type="text" name="position" placeholder="직책" class="short" value="${requestScope.addrvo.position_name}"/>      
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
         <input type="text" id="detailAddress" name="detailAddress" size="40" placeholder="상세주소" />&nbsp;<input type="text" id="extraAddress" name="extraAddress" size="40" placeholder="참고항목" /> 
         <span class="error">주소를 입력하세요</span>
      </td>
   	</tr>
      <tr>
      	<th>메모</th>
         <td>
			<textarea rows="4" cols="100" style="width: 80%; height: 200px;" name="content" id="content" placeholder="메모를 입력해주세요">${requestScope.addrvo.addrmemo}</textarea>                   
		</td>
      </tr>	 
   </table>
   
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" id="btnRegister">등록</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
  </form>

</div>

</body>
</html>