<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% String ctxPath = request.getContextPath(); %>

 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/menu.css" />
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/content.css" /> 
 <jsp:include page="./checkCmt_sidebar.jsp" />


 <div style="width: 1460px"> 
 
<c:if test="${not empty requestScope.cmtList}">
 	<div>${requestScope.cmtList.starttime}</div>
 	<div>${requestScope.cmtList.startstatus}</div>
 	<div>${requestScope.cmtList.endtime}</div>
 	<div>${requestScope.cmtList.endstatus}</div>
</c:if>
<c:if test="${empty requestScope.cmtList}">
 	등록된 출퇴근 사항이 없습니다.
</c:if>

 </div>
