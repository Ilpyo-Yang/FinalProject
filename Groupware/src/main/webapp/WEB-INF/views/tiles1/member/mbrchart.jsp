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
		var checkURL = document.location.href.indexOf("?");
		
 		if(checkURL=="-1") {	// 파라미터 값이 없는 경우, 전체 조직도 선택
 			$("span.subtitle").html("전체 조직도"); 		
 		}
 		else {	// 파라미터 값이 있는 경우, 부서별 조직도 선택
 			var chartStyle = document.location.href.split("?");
 	 		switch (chartStyle[1].substr(5)) {
 			case "0":
 				$("span.subtitle").html("영업팀 조직도");
 				break;
 			case "1":
 				$("span.subtitle").html("인사팀 조직도");
 				break;
 			case "2":
 				$("span.subtitle").html("홍보팀 조직도");
 				break;
 			case "3":
 				$("span.subtitle").html("IT팀 조직도");
 				break;
 			case "4":
 				$("span.subtitle").html("회계팀 조직도");
 				break;
 			} 
 	 		
 	 		$.ajax(){
				url:"<%=ctxPath%>/member/getChartInfo.opis",
				data: {"chartStyle":chartStyle[1].substr(5)}
				dataType:"json",
				success:function(json){					
					console.log(json);
					}
				},
				error {
					
				}
 	 		}	
 		}
 
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
		    data: [
		      ['CEO', '영업팀 팀장'],
		      ['CEO', '인사팀 팀장'],
		      ['CEO', '홍보팀 팀장'],
		      ['CEO', 'IT팀 팀장'],
		      ['CEO', '회계팀 팀장'],
		      ['영업팀 팀장', '영업팀 사원'],
		      ['인사팀 팀장', '인사팀 사원'],
		      ['홍보팀 팀장', '홍보팀 사원'],
		      ['IT팀 팀장', 'IT팀 사원'],
		      ['회계팀 팀장', '회계팀 사원'],
		    ],
		    levels: [{
		      level: 0,
		      color: 'silver',
		      dataLabels: {
		        color: 'black'
		      },
		      height: 10
		    }, {
		      level: 1,
		      color: 'silver',
		      dataLabels: {
		        color: 'black'
		      },
		      height: 10
		    }, {
		      level: 2,
		      color: '#980104'
		    }],
		    nodes: [{
		      id: 'CEO',
		      title: 'CEO',
		      name: 'Grethe Hjetland',
		      image: 'https://wp-assets.highcharts.com/www-highcharts-com/blog/wp-content/uploads/2020/03/17131126/Highsoft_03862_.jpg'
		    }, {
		      id: 'HR',
		      title: 'HR/CFO',
		      name: 'Anne Jorunn Fjærestad',
		      color: '#007ad0',
		      image: 'https://wp-assets.highcharts.com/www-highcharts-com/blog/wp-content/uploads/2020/03/17131210/Highsoft_04045_.jpg'
		    }, {
		      id: 'CTO',
		      title: 'CTO',
		      name: 'Christer Vasseng',
		      image: 'https://wp-assets.highcharts.com/www-highcharts-com/blog/wp-content/uploads/2020/03/17131120/Highsoft_04074_.jpg'
		    }, {
		      id: 'CPO',
		      title: 'CPO',
		      name: 'Torstein Hønsi',
		      image: 'https://wp-assets.highcharts.com/www-highcharts-com/blog/wp-content/uploads/2020/03/17131213/Highsoft_03998_.jpg'
		    }, {
		      id: 'CSO',
		      title: 'CSO',
		      name: 'Anita Nesse',
		      image: 'https://wp-assets.highcharts.com/www-highcharts-com/blog/wp-content/uploads/2020/03/17131156/Highsoft_03834_.jpg'
		    
		    }],
		    colorByPoint: false,
		    color: '#007ad0',
		    dataLabels: {
		      color: 'white'
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
