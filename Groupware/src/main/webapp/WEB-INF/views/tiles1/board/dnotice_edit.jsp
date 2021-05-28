<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String ctxPath = request.getContextPath(); %>    

<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/menu.css" />		

<style type="text/css">

   table, th, td, input, textarea {border: solid gray 1px;}
   
   #editFrm{
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
      
      // 완료버튼
      $("button#btnUpdate").click(function(){
      
          // 글제목 유효성 검사
         var subjectVal = $("input#dtitle").val().trim();
         if(subjectVal == "") {
            alert("글제목을 입력하세요!!");
            return;
         }
         
         // 글내용 유효성 검사(스마트에디터 사용 안 할시)
        
         var contentVal = $("textarea#dcontent").val().trim();
         if(contentVal == "") {
            alert("글내용을 입력하세요!!");
            return;
         }
                 
         // 폼(form) 을 전송(submit)
         var frm = document.editFrm;
         frm.method = "POST";
         frm.action = "<%= ctxPath%>/dnotice_editEnd.opis";
         frm.submit();   
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
	  		<div class="lside"><a class="side" href="/groupware/formboard_list.opis">공통서식</a></div>
	</div>
	
	<!-- 게시판제목 -->
	<div style="padding: 15px; font-size: 25px; font-weight: 600; height: 60px; width: 100%; background-color: #f2f2f2; color: #555;">
	&nbsp;&nbsp;전체 공지사항
	</div>
	
	<!-- 수정폼 -->
	<form name="editFrm" id="editFrm"> 
 
      <table id="table">

		 <tr style="display: none;"><!-- 글번호 넘기기용 -->
		 	<th>글번호</th>
		 	<td>
                <input type="text" name="dnotice_seq" value="${requestScope.dnoticevo.dnotice_seq}" readonly/>   
            </td>
		 </tr>
         <tr>
            <th>제목</th>
            <td>
               <input type="text" name="dtitle" id="dtitle" class="long" value="${requestScope.dnoticevo.dtitle}" />       
            </td>
         </tr>
<!--          <tr>
         	<th scope="row">첨부파일</th>
            <td><input type="file" id="files[0]" name="files[0]" value=""></td>
         </tr>   -->
         <tr>
            <th>내용</th>
            <td>
               <textarea rows="10" cols="100" style="width: 95%; height: 450px;" name="dcontent" id="dcontent">${requestScope.dnoticevo.dcontent}</textarea>       
            </td>
         </tr>

      </table>
      
      <div style="margin: 10px;">
         <button type="button" id="btnUpdate">완료</button>
         <button type="button" onclick="javascript:history.back()">취소</button>
      </div>
   </form>
   
</div>    