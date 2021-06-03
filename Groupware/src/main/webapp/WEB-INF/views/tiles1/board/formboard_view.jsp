<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String ctxPath = request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/menu.css" />		

<style type="text/css">
   table, th, td, input, textarea {border: solid gray 1px;}
   
   #table, #table2 {border-collapse: collapse;
                   width: 1024px;
                  }
   #table th, #table td{padding: 5px;}
   #table th{width: 120px; background-color: #DDDDDD;}
   #table td{width: 880px;}
   .long {width: 470px;}
   .short {width: 120px;}
   
   .move {cursor: pointer;}
   .moveColor {color: #660029; font-weight: bold;}
   
   a {text-decoration: none !important;}
   
   td.comment {text-align: center;}
</style>

<jsp:include page="./board_sidebar.jsp" />
<script type="text/javascript">

	$(document).ready(function(){
		
		$("span.move").hover(function(){$(this).addClass("moveColor");},
							 function(){$(this).removeClass("moveColor");});	
		
	}); // end of $(document).ready(function(){})-----------------------------------------

</script>

<div style="width: 1460px; padding-left: 10%;">

	<!-- 게시판제목 -->
	<div style="padding: 15px; font-size: 25px; font-weight: 600; height: 60px; width: 100%; background-color: #f2f2f2; color: #555;">
	&nbsp;&nbsp;공통서식
	</div>
	<!-- 글내용 -->
   <c:if test="${not empty requestScope.formboardvo}">
   	 <table id="table">
   		<tr>
            <th>글번호</th>
            <td>${requestScope.formboardvo.form_seq}</td>
         </tr>
         <tr>
            <th>작성자</th>
            <td>관리자</td>
         </tr>
         <tr>
            <th>제목</th>
            <td>${requestScope.formboardvo.ftitle}</td>
         </tr>
         <tr>
            <th>내용</th>
            <td>
            	<p style="word-break: break-all;">${requestScope.formboardvo.fcontent}</p>
            <%-- 
                  style="word-break: break-all; 은 공백없는 긴영문일 경우 width 크기를 뚫고 나오는 것을 막는 것임. 
                                    그런데 style="word-break: break-all; 나 style="word-wrap: break-word; 은
                                    테이블태그의 <td>태그에는 안되고 <p> 나 <div> 태그안에서 적용되어지므로 <td>태그에서 적용하려면
                  <table>태그속에 style="word-wrap: break-word; table-layout: fixed;" 을 주면 된다.
             --%>
             </td>
         </tr>
         <tr>
            <th>조회수</th>
            <td>${requestScope.formboardvo.fhit}</td>
         </tr>
         <tr>
            <th>날짜</th>
            <td>${requestScope.formboardvo.fwritedate}</td>
         </tr>
   	 </table>
   	 
   	 <div style="margin-bottom:1%">이전글제목&nbsp;&nbsp;<span class="move" onclick="javascript:location.href='formboard_view.opis?form_seq=${requestScope.formboardvo.previousseq}'">${requestScope.formboardvo.previoustitle}</span></div>
   	 <div style="margin-bottom:1%">다음글제목&nbsp;&nbsp;<span class="move" onclick="javascript:location.href='formboard_view.opis?form_seq=${requestScope.formboardvo.nextseq}'">${requestScope.formboardvo.nexttitle}</span></div>   	 
   	 
   </c:if>
   
   <c:if test="${empty requestScope.formboardvo}">   		
      <div style="padding: 50px 0; font-size: 16pt; color: red;">존재하지 않습니다</div>
   </c:if>
   
   <button type="button" onclick="javascript:location.href='<%=ctxPath%>/formboard_list.opis'">전체목록보기</button>
   <c:if test="${sessionScope.loginuser.power_detail ne '사원'}">
	   <button type="button" onclick="javascript:location.href='<%=ctxPath%>/formboard_edit.opis?form_seq=${requestScope.formboardvo.form_seq}'">수정</button>
	   <button type="button" onclick="javascript:location.href='<%=ctxPath%>/formboard_del.opis?form_seq=${requestScope.formboardvo.form_seq}'">삭제</button>
	</c:if>   
</div>