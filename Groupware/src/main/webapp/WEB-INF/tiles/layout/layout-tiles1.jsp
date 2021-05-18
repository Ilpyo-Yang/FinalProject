<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- === #24. tiles 를 사용하는 레이아웃1 페이지 만들기 === --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<%
   String ctxPath = request.getContextPath();
   //	  /board
%> 


<!DOCTYPE html>
<html>

<script type="text/javascript">
	$(function(){
		/*
		   == datatables 처리모드 ==
		     
		   datatables에는 두 가지 처리 방법이 있습니다
		   datatables 뿐만 아니라 게시판 처리 방식에 두 가지 방법이 있는 것입니다.
		   
		   "클라이언트 사이드 렌더링" 과  "서버사이드 렌더링" 2 가지 방법입니다.
		   
		   - 게시판 관점에서 바라 본 클라이언트 사이드 렌더링 -
		     => 게시판 관점에서 바라봤을 때 "클라이언트 사이드 렌더링" 은 
		             초기 페이지 로딩 시 모든 데이터를 가져와서 페이지 블럭단위만 보여준 후 나머지는 가리는 방식입니다. 
		             따라서 페이지 전환 시 서버 호출이 일어나지 않으며 오버헤드가 없기 때문에 초기 로딩을 제외하면 속도 이슈가 없습니다.
		   
		   - 게시판 관점에서 바라 본 서버 사이드 렌더링 - 
		     => 일반적으로 게시판을 만들게 되면 "서버 사이드 렌더링"으로 만들게 됩니다.
		                쉽게 페이지 전환이 일어날 경우 페이지 번호를 서버측으로 넘긴 후 특정 블럭만 가져와서 출력해주는 방식입니다.
		                초기 로딩시에도 페이지 단위의 데이터만 가져오기 때문에 리퀘스트 오버헤드를 제외하면 평균적인 속도를 얻어낼 수 있습니다. 
		   
		      위와 같이 datatables 또한 두 가지 방식을 제공합니다.
		   
		    if you are working with less than 10,000 rows use client-side processing, for greater than 100,000 rows use server-side processing
		   
		    datatables 공식 메뉴얼에서는 데이터가 10000건 이하일 때는 클라이언트 사이드 렌더링을 사용해도 된다고 권장하고있습니다.
		    하지만 데이터가 100,000건 이상이 넘어가면 무조건 서버 사이드 렌더링을 사용하라고 권장하고있습니다. 
		*/
		
		$("table#employeesTbl").DataTable({
			"dom": '<"top"lf>rt<"bottom"ip>',  // 페이지바가 우측하단에 위치, 검색이 우측상단에 위치하는 것임.  
		 // "dom": '<"top"lp>rt<"bottom"if>',  // 페이지바가 우측상단에 위치, 검색이 우측하단에 위치하는 것임.
		 	"paging"    : true,                // 우측하단에 페이지바를 보여줄것인지 아닌지를 결정하는 것
         // "paging"    : false,               // 우측하단에 페이지바를 보여줄것인지 아닌지를 결정하는 것 
         	"ordering"  : true,                // th에 나오는 값에 따라서 오름차순, 내림차순 정렬을 할것인지 말것인지를 결정하는 것  
         	"info"      : true,                // 좌측하단에 보여지는 Showing 1 to 10 of 22 entries 를 보여줄것인지 말것인지를 결정하는 것       
            "filter"    : true,                // 우측상단에 보여지는 검색을 보여줄것인지 말것인지를 결정하는 것       
            "lengthChange"   : true,           // 좌측상단에 보여지는 한페이지당 행의갯수를 결정하는 것  
       	 // "order"     : [[0, "desc"]],        // 기본 컬럼 정렬 설정  숫자 0은 첫번째 컬럼을 말하며, "asc" 또는 "desc"를 설정할 수 있다. 
            "order"     : [[2, "desc"],[0, "asc"]], // 기본 컬럼 정렬 설정  숫자 0은 첫번째 컬럼을 말하며, "asc" 또는 "desc"를 설정할 수 있다. 
            "stateSave" : false,
         // "stateSave" : true, 
         /*
                          클라이언트 사이드 렌더링의 경우 새고로침 시 페이징 현재 상태가 저장되지 않으나
              stateSave를 true로 활성화할 경우 새로고침 시에도 페이징 되어진 현재 상태가 저장되어 그대로 보여지게 된다.
              stateSave를 false로 활성화할 경우 새로고침 시에는 초기화 되어 처음의 상태로 보여지게 된다.
         */
            "pagingType" : "full_numbers",  // "full_numbers", "numbers" , "simple" , "simple_numbers" , "full" , "full_numbers" , "first_last_numbers" 
        //   "scrollX" : false,   // x 축 스크롤을 활성화 할지의 여부 
        //   "scrollY" : "250px", // y 축의 스크롤의 크기 
        //   "scrollCollapse" : true // y 축의 스크롤을 활성화 여부. 당연히 y축의 스크롤이 활성화 되면 paging이 안 일어나게 할 수도 있으므로  그렇게 하려면 "paging" 을 false로 바꿀수도 있다.
		
		});
		
	});     
</script>
<head>
<meta charset="UTF-8">
<title>게시판</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="<%=ctxPath%>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
  
  <link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/style1.css" />
  
  <%--  ===== #179. 스피너를 사용하기 위해  jquery-ui 사용하기 ===== --%>
  <link rel="stylesheet" type="text/css" href="<%= ctxPath %>/resources/jquery-ui-1.11.4.custom/jquery-ui.css" />
  <script type="text/javascript" src="<%= ctxPath %>/resources/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
</head>

<body>

   <div id="mycontainer">
      <div id="myheader">
         <tiles:insertAttribute name="header" />
      </div>
      
      <div id="mycontent">
         <tiles:insertAttribute name="content" />
      </div>
      
      <div id="myfooter">
         <tiles:insertAttribute name="footer" />
      </div>
   </div>
   
</body>
</html>