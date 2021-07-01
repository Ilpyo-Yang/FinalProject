<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>

<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/menu.css" />
<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/boardButtons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

<script type="text/javascript">

	$(document).ready(function(){
		
		var now = new Date();   	//현재시간
		
		var hour = now.getHours();   	//현재 시간 중 시간
		if((hour+"").length < 2){
			hour="0"+hour;      
		}
		
		var minutes = now.getMinutes();	// 현재 시간 중 분
		if((minutes+"").length < 2){
			minutes="0"+minutes;      
		}
		
		// 출근 버튼 클릭시
		$("button#startWork").click(function(){			
			
			var status = null;
			
			if(hour == '09'){
				if(minutes <= '10'){
					status = '정상';
				} else{
					status = '지각';
				}
			} else if (hour < '09'){
				if(hour >= '07'){
					status = '정상';
				}
				else{
					alert("출근 등록이 불가능한 시간입니다.");
				}
			} else{
				status = '지각';
			}
			
			if(status != null){
				$.ajax({
					type:"POST",
					url:"<%=ctxPath%>/startWork.opis",
					data:{"startstatus" : status},
					dataType:"String",
					success: function(json){
						var n = json.n;  
						
						if(n==0){
							alert("출근 등록을 실패했습니다.");
						}
						else{
							alert("출근 등록을 완료했습니다.");
							location.reload();
						}
					},
					error: function(request, status, error){
		                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		            }		
				});
			}
		}); // end of $("button#startWork").click(function(){})-------------------------
		
		// 퇴근 버튼 클릭시
		$("button#endWork").click(function(){
			
			var status = null;
			
			if(hour == '18'){
				status = '정상';				
			} else if (hour < '18'){
				status = '조퇴';
			} 
			
			if(status != null){
				$.ajax({
					type:"POST",
					url:"<%=ctxPath%>/endWork.opis",
					data:{"endstatus" : status},
					success: function(json){
						var n = json.n;  
						
						if(n==0){
							alert("퇴근 등록을 실패했습니다.");
						}
						else{
							alert("퇴근 등록을 완료했습니다.");
							location.reload();
						}
					},
					error: function(request, status, error){
		                alert("출근 기록이 조회되지 않습니다.");
		            }		
				});
			}
		
		}); // end of $("button#endWork").click(function(){})---------------------------
		
	}); // end of $(document).ready(function(){})---------------------------------------
	
</script>


<div id="sideMenu">
	<div id="menuTitle">개인 근태 관리</div>

	<div style="margin-top: 30px; text-align: center;">
		<i class="far fa-smile fa-5x"></i><br><br>
		<span style="color: blue; font-size: 20px;">${sessionScope.loginuser.mbr_name}</span> 님 환영합니다.
	</div>
	
	<div class="lside" style="margin-top: 20px; text-align: center;">
		<button type="button" class="btn-ok" style="margin-right: 10px;" id="startWork">출근</button>
		<button type="button" class="btn-basic" id="endWork">퇴근</button>
	</div>
</div>
