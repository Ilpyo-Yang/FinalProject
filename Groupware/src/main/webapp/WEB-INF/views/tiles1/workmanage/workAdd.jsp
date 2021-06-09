<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<% String ctxPath = request.getContextPath(); %>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/workmanage.css" />
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/content.css" />     

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<jsp:include page="./workmanage_sidebar.jsp" />

<style type="text/css">
div#displayList {
	border: solid 1px gray;
	border-top: 100;
	width: 206px;
	height: 100px;
	padding: 2px;
	overflow: auto;
	position: absolute;
	z-index: 1000;
	background-color: white;
}
.receiverName {
	width: 80px;
}

.close {
  cursor: pointer;
  position: absolute;
  top: 50%;
  right: 0%;
  /* padding: 12px 16px; */
  transform: translate(0%, -50%);
}
.close:hover {background: #bbb;}

ul#setmbrList {
  list-style-type: none;
  padding: 0;
  margin: 0;
  display: inline-block;
}

ul#setmbrList li.receiverName {
  border: 1px solid #ddd;
  margin-top: -1px; /* Prevent double borders */
  margin-right: 5px;
  background-color: #f6f6f6;
  /* padding: 12px; */
  text-decoration: none;
  /* font-size: 18px; */
  color: black;
  display: inline-block;
  position: relative;
}

ul#setmbrList li.receiverName:hover {
  background-color: #eee;
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		$("input[name=workType]").each(function(index, item){
			if (index == "${workType}") {
				$(item).attr("checked",true);
			}
		});
		
		$("#datepicker_deadline").datepicker({
			showOn : "button",
			buttonImage : "<%=ctxPath%>/resources/images/icon_calendar.png",
			buttonImageOnly : true,
			buttonText : "Select date",
			dateFormat: 'yy-mm-dd'
		});

		var checkRadio = $("input[name=workType]:checked");
		onlyWorkInput(checkRadio);
		
		<%-- === #107. 검색어 입력시 자동글 완성하기 2 === --%>
		$("div#displayList").hide();
		
		$("input#searchWord").keyup(function(event){
			var wordlen = $(this).val().trim().length;
			
			if (wordlen == 0) {
				$("div#displayList").hide();
			}
			else {
				$.ajax({
					url:"<%=ctxPath%>/memberSearchShow.opis",
					type:"get",
					data:{"searchWord":$("input#searchWord").val()},
					dataType:"json",
					success:function(json){
						if (json.length > 0) {
							
							var html = "";
							
							$.each(json, function(index, item) {
								var word = item.word;
								// word ==> "글쓰기 첫번째  java 연습입니다"
								// word ==> "글쓰기 두번째 JaVa 연습입니다"
								
								var index = word.toLowerCase().indexOf($("input#searchWord").val().toLowerCase());
								// word ==> "글쓰기 첫번째 java 연습입니다"
								// word ==> "글쓰기 두번째 java 연습입니다"
								// 만약에 검색어가 "jAVa" 이라면 index 는 8 이 된다.
								
								var len = $("input#searchWord").val().length;
								// 검색어의 길이 len = 4
								
								word = word.substr(0,index) + "<span style='color:blue;'>"+ word.substr(index,len) +"</span>" + word.substr(index+len);
								
								html += "<span style='cursor:pointer;' class='word'>"+ word +"</span><span hidden>"+item.seq+"</span><br>";
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
			
		});
		
		<%-- === 검색어 입력시 자동글 완성하기 === --%>
		$(document).on("click", "span.word", function(){
			// 텍스트박스에 검색된 결과의 문자열을 입력해준다.
			var html = "";
			html += '<li type="text" class="receiverName">'+$(this).text();
			html += '<input type="hidden" class="receiverName" value="'+$(this).text()+'"/>';
			html += '<input type="hidden" class="receiverSeq" value="'+$(this).next().text()+'"/>';
			html += '<span class="close" onclick="nameDel(this);">&times;</span></li>';
			$("ul#setmbrList").append(html);
			
			$("input#searchWord").val("").focus();
			$("div#displayList").hide();
		});
		
		
	});
	
	function nameDel(item) {
		$(item).parent().remove();
	} 
	
	
	// == 업무 요청, 업무 보고 일 경우에만 담당자, 참조자  input 보여주기 == //
	function onlyWorkInput(item) {
		var checkVal = $(item).val();
		
		if (checkVal == 0) {
			$("tr.onlyWorkInput").hide();
		} 
		else {
			$("tr.onlyWorkInput").show();
		}
	}
	
	// == 필수 입력 사항 작성했는지 확인 하기 == //
	function checkStar() {
		// 제목 확인
		var subject = $("input[name=subject]").val().trim();
		if (subject == "") {
			alert("제목을 입력하세요");
			return;
		}
		
		// 업무기한
		var deadline = $("input[name=deadline]").val().trim();
		if (deadline == "") {
			alert("업무기한을 입력하세요");
			return;
		}
		
		// 담당자
		var workType = $("input[name=workType]:checked").val();
		if (workType != 0) {
			var rcvlen = $("input.receiverName").length;
			
			if (rcvlen == 0) {
				alert("담당자를 한명 이상 지정해주세요");
				return;
			}
		}
		
		$("input[name=fk_wtno]").val(workType); // DB 컬럼명이랑 맞추기
		
		if (workType == 1) {
			$("input[name=fk_statno]").val("1");
		}
		else if (workType == 2) {
			$("input[name=fk_statno]").val("3");
		}
		
		if (workType == 0) submitTodoRegFrm(); 
		else submitWorkRegFrm();
	}
	
	// == ToDo 정보 폼 전송하기 == //
	function submitTodoRegFrm() {
		var frm = document.workRegFrm;
		
		frm.action = "<%=ctxPath%>/workAddTodoEnd.opis";
		frm.method = "post";
		frm.submit();
	}
	
	// == 업무 정보 폼 전송하기 == //
	function submitWorkRegFrm() {
		// reciever의 name, seq 문자열로 보내기
		var receiverNames = [];
		var receiverSeqs = [];
		
		$("input.receiverName").each(function(index, item){
			receiverNames.push($(item).val());
		});
		$("input.receiverSeq").each(function(index, item){
			receiverSeqs.push($(item).val());
		});
		
		$("input[name=receivers]").val(receiverNames.join());
		$("input[name=receiverSeqs]").val(receiverSeqs.join());
		
		$("input[name=referrers]").val('');
		$("input[name=referrerSeqs]").val();
		
		var frm = document.workRegFrm;
		frm.action = "<%=ctxPath%>/workAddEnd.opis";
		frm.method = "post";
		frm.submit();
	}
</script>

<div class="container commoncontainer">
	<h3>업무 등록</h3>
	
	<br>
	
	<form name="workRegFrm" enctype="multipart/form-data">
		<table class="table table-striped workRegtable">
			<tbody>
				<tr>
					<td style="width: 10%;"><span class="star">*</span>제목</td>
					<td style="width: 70%;"><input name="subject"/></td>
				</tr>
				<tr>
					<td><span class="star">*</span>업무형태</td>
					<td>
						<input type="radio" id="mytodo" value="0" name="workType" onclick="onlyWorkInput(this);"/> 
						<label for="mytodo">나의 할일</label> 
							
						<input type="radio" id="workRequest" value="1" name="workType" onclick="onlyWorkInput(this);"/> 
						<label for="workRequest">업무 요청</label>
	
						<input type="radio" id="workReport" value="2" name="workType" onclick="onlyWorkInput(this);"/>
						<label for="workReport">업무 보고</label>
					</td>
				</tr>
				<tr>
					<td><span class="star">*</span>업무기한</td>
					<td><input type="text" name="deadline" id="datepicker_deadline" /></td>
				</tr>
				
				<tr class="onlyWorkInput">
					<td><span class="star">*</span>담당자</td>
					<td>
						<input type="text" id="searchWord" name="searchWord" placeholder="사용자"  autocomplete="off" />
						<ul id="setmbrList"></ul>
						<div id="displayList"></div>
					</td>
				</tr>
				
				<tr class="onlyWorkInput">
					<td>참조자</td>
					<td>
						
						<input name="fk_referrer_seq" placeholder="사용자" />
					</td>
				</tr>
			
				<tr>
					<td>파일 업로드</td>
					<td><input type="file" name="attach" /></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="contents" cols="60" rows="10"></textarea></td>
				</tr>
				<tr id="workRegBtn">
					<td colspan="2">
						<button type="button" onclick="checkStar()">저장</button>
						<button type="button" >취소</button>
					</td>
				</tr>
			</tbody>
		</table>	
		<input type="hidden" name="requester" value="${sessionScope.loginuser.mbr_name}"/><input type="hidden" name="requesterSeq" value="5"/>
		<input type="hidden" name="receivers" /><input type="hidden" name="receiverSeqs" />
		<input type="hidden" name="referrers" /><input type="hidden" name="referrerSeqs" />
		<input type="hidden" name="fk_wrno" value="1"/>
		<input type="hidden" name="fk_wtno" />
		<input type="hidden" name="fk_statno" />
	</form>
</div>

