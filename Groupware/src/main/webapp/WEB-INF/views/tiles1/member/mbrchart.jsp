<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>


<jsp:include page="./mbrchart_sidebar.jsp" />  

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/sankey.js"></script>
<script src="https://code.highcharts.com/modules/organization.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>


<script type="text/javascript">
	$(document).ready(function(){
		
		// 조직도 크기설정하기
		var checkURL = document.location.href;
		
		// 선택된 조직도 형태(기본값 전체)
		var chartStyle = "";	
		if(checkURL.indexOf("?")!="-1"){
			chartStyle += document.location.href.substr(checkURL.length-1);
		}
		
		var link;	// 조직도 연결방식
		var memberInfoArr = []; // 조직도에 기록될 사원정보		
		
 		switch (chartStyle) {
 		case "":
 			$("span.subtitle").html("전체 조직도"); 
 			link = [['CEO 대표', '영업팀 팀장'],['CEO 대표', '인사팀 팀장'],['CEO 대표', '홍보팀 팀장'],['CEO 대표', 'IT팀 팀장'],['CEO 대표', '회계팀 팀장']
		          ,['영업팀 팀장', '영업팀 팀원'],['인사팀 팀장', '인사팀 팀원'], ['홍보팀 팀장', '홍보팀 팀원']
		          ,['IT팀 팀장', 'IT팀 팀원'],['회계팀 팀장', '회계팀 팀원']];	
			break;
		case "0":
			$("span.subtitle").html("영업팀 조직도");
			link = [['CEO 대표', '영업팀 팀장'],['영업팀 팀장', '영업팀 팀원']];
			break;
		case "1":
			$("span.subtitle").html("인사팀 조직도");
			link = [['CEO 대표', '인사팀 팀장'],['인사팀 팀장', '인사팀 팀원']];
			break;
		case "2":
			$("span.subtitle").html("홍보팀 조직도");
			link = [['CEO 대표', '홍보팀 팀장'],['홍보팀 팀장', '홍보팀 팀원']];
			break;
		case "3":
			$("span.subtitle").html("IT팀 조직도");
			link = [['CEO 대표', 'IT팀 팀장'],['IT팀 팀장', 'IT팀 팀원']];
			break;
		case "4":
			$("span.subtitle").html("회계팀 조직도");
			link = [['CEO 대표', '회계팀 팀장'],['회계팀 팀장', '회계팀 팀원']];
			break;
		} 

 		
 		$.ajax({
			url:"<%=ctxPath%>/member/getChartInfo.opis",
			dataType:"json",
			data: {chartStyle:chartStyle},
			success: function(json){					
				$.each(json, function(index, item){
					console.log(json);
					memberInfoArr.push({id: item.id,
								        title: item.title,
								        name: item.name});
				});
				
				/////////////////////////////////////////////////////////////////////////////
				Highcharts.chart('container', {
					  chart: {
					    height: 600,
					    inverted: true
					  },
					  title : {
						  text:""
					  },
					  accessibility: {
					    point: {
					      descriptionFormatter: function (point) {
					        var nodeName = point.toNode.name,
					          nodeId = point.toNode.id,
					          nodeDesc = nodeName === nodeId ? nodeName : nodeName + ', ' + nodeId,
					          parentDesc = point.fromNode.id;
					        return point.index + '. ' + nodeDesc + ', reports to ' + parentDesc + '.';
					      }
					    }
					  },
					  series: [{
					    type: 'organization',
					    name: 'Highsoft',
					    keys: ['from', 'to'],
					    data: link,
					    levels: [{
					      level: 0,
					      color: '#04AA6D',
					      dataLabels: {
					        color: 'white'
					      },
					      height: 10
					    }, {
					      level: 1,
					      color: '#e4fae6',
					      dataLabels: {
					        color: 'black'
					      },
					      height: 10
					    }, {
					      level: 2,
					      color: 'silver'
					    }],
					    nodes: memberInfoArr,
					    colorByPoint: false,
					    color: '#007ad0',
					    dataLabels: {
					      color: 'black'
					    },
					    borderColor: 'white',
					    nodeWidth: 65
					  }],
					  tooltip: {
					    outside: true
					  },
					  exporting: {
					    allowHTML: true,
					    sourceWidth: 800,
					    sourceHeight: 600
					  }
				 });
				/////////////////////////////////////////////////////////////////////////////
			
			},
			error: function(request, status, error){
                  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
            }
	 	 }); // end of $.ajax({}) --------------------------------------------------
	}); // end of $(document).ready(function(){})---------------------------------------
</script>

</head>
<body>
	<div id="mbrchartContainer">
		<span class="subtitle"></span>
		<hr>
		<figure class="highcharts-figure">
		  <div id="container"></div>
		  <p class="highcharts-description">
	
		  </p>
		</figure>
	</div>
</body>
</html>
