<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>  
  
<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/menu.css" />		

<style type="text/css">

 table, th, td, input, textarea {border: solid gray 1px;}
 
 #add{
  	 margin: 30px 0 0 350px; 	
 }
 #table {
	 border-collapse: collapse;
  	 width: 1000px;
        }
 #table th, #table td{padding: 5px;}
 #table th{width: 120px; background-color: #DDDDDD;}
 #table td{width: 880px;}
 .long {width: 470px;}
 .short {width: 120px;}

</style>

<script type="text/javascript">
   $(document).ready(function(){
      // 쓰기버튼
      $("button#btnWrite").click(function(){
         
          // 글제목 유효성 검사
         var subjectVal = $("input#ctitle").val().trim();
         if(subjectVal == "") {
            alert("제목을 입력하세요!!");
            return;
         }
         
         // 글내용 유효성 검사(스마트에디터 사용 안 할시)
        
         var contentVal = $("textarea#ccontent").val().trim();
         if(contentVal == "") {
            alert("내용을 입력하세요!!");
            return;
         }
         
         // 게시판 선택
         var frm = document.addFrm;
         frm.method = "POST";
         
         if($("select#boardType").val()=="cnotice"){ // 전체공지
	         frm.action = "<%= ctxPath%>/cnotice_addEnd.opis";
	         frm.submit();   
         }
         else if($("select#boardType").val()=="dnotice"){ // 부서공지
	         frm.action = "<%= ctxPath%>/dnotice_addEnd.opis";
	         frm.submit();   
         }
         else if($("select#boardType").val()=="formboard"){ // 공통서식
	         frm.action = "<%= ctxPath%>/formboard_addEnd.opis";
	         frm.submit();   
         }
         else if($("select#boardType").val()=="default"){ // 게시판 선택 안할시
	         alert("작성하실 게시판을 선택하세요.");
	         return;
         }
      });
           
   });// end of $(document).ready(function(){})----------------
</script>

<div style="width: 1460px;">
	<!-- 사이드메뉴 -->
    <div id="sideMenu">
	  	<div id="menuTitle">게시판</div>
	  	<div><button type="button" id="btnReg">게시글 등록</button></div>
	
	  		<div class="lside"><a class="side" href="/groupware/cnotice_list.opis">전체공지사항</a></div>
	  		<div class="lside"><a class="side" href="/groupware/dnotice_list.opis">부서공지사항</a></div>
	  		<div class="lside"><a class="side" href="#">공통서식</a></div>
	</div>
	
	<!-- 게시판제목 -->
	<div style="padding: 15px; font-size: 25px; font-weight: 600; height: 60px; width: 100%; background-color: #f2f2f2; color: #555;">
	&nbsp;&nbsp;글쓰기
	</div>	
	
	<div id="add">
	<!-- insert할 게시판 선택 -->
 	<div id="selectBoard">
 		<c:choose>
 		<%-- 로그인한 유저가 관리자면 세 게시판에 작성 가능 --%>
	 	    <c:when test="${sessionScope.loginuser.fk_power_no == 1}">
			   	<select name="boardType" id="boardType" style="height: 26px; width: 30px;">
			   		<option value="default">&nbsp;게시판을 선택해주세요 &nbsp;</option>
			  		<option value="cnotice">전체 공지사항</option>
			  		<option value="dnotice">부서 공지사항</option>
			  		<option value="formboard">공통서식</option>
				</select>
			</c:when>
		<%-- 로그인한 유저가 관리자가 아니면 부서공지 게시판에만 작성 가능 --%>
			<c:otherwise>
				<select name="boardType" id="boardType"   style="height: 26px;">
			   		<option value="default">&nbsp;게시판을 선택해주세요 &nbsp;</option>
			  		<option value="dnotice">부서 공지사항</option>
				</select>
			</c:otherwise>
		</c:choose>
	</div>
 	
 	<form name="addFrm" id="addFrm" enctype="multipart/form-data" > 
 			
      <table id="table">      
      <c:choose>
      <%-- 관리자면 작성자 입력 없이 값만 넘김 --%>
 	    <c:when test="${sessionScope.loginuser.fk_power_no == 1}">
	 	    <tr>
	            <td>
	                <input type="hidden" name="fk_userid" value="${sessionScope.loginuser.mbr_id}" />
	            </td>
	         </tr>
         </c:when>
      <%-- 관리자가 아닌 경우에는 아이디 표시 --%>   
         <c:otherwise>
         <tr>
         	<th>작성자</th>
            <td>
                <input type="text" name="name" value="${sessionScope.loginuser.mbr_id}" class="short" readonly />       
            </td>
         </tr>		
		</c:otherwise>  
	</c:choose> 
	
         <tr>
            <th>제목</th>
            <td>
               <input type="text" name="ctitle" id="ctitle" class="long" />       
            </td>
         </tr>
<!--          <tr>
         	<th scope="row">첨부파일</th>
            <td><input type="file" id="files[0]" name="files[0]" value=""></td>
         </tr>	 -->
         <tr>
            <th>내용</th>
            <td>
               <textarea rows="10" cols="100" style="width: 95%; height: 450px;" name="ccontent" id="ccontent"></textarea>       
            </td>
         </tr>    
      </table>
      
      <div style="margin: 10px;">
         <button type="button" id="btnWrite">등록</button>
         <button type="button" onclick="javascript:history.back()">취소</button>
      </div>
         
   </form>
  </div> 
</div>    