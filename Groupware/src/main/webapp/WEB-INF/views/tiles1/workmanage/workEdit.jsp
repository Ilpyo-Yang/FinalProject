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
div#diplayList {
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
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		$("#datepicker_deadline").datepicker({
			showOn : "button",
			buttonImage : "<%=ctxPath%>/resources/images/icon_calendar.png",
			buttonImageOnly : true,
			buttonText : "Select date",
			dateFormat: 'yy-mm-dd'
		});

		var checkRadio = $("input[name=fk_wtno]:checked");
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
								
								html += "<span style='cursor:pointer;' class='word'>"+ word +"</span><br>";
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
		
		<%-- === #113. 검색어 입력시 자동글 완성하기 8 === --%>
		$(document).on("click", "span.word", function(){
			$("input#searchWord").val($(this).text()); 
			// 텍스트박스에 검색된 결과의 문자열을 입력해준다.
			
			$("div#displayList").hide();
			goSearch();
		});
		
		// 파일첨부 숨기기
		$("input[name=attach]").hide();
		
		// 첨부파일 목록 보여주기
		$("input[type=file]").change(function(){
			var files = document.getElementById("attach").files;
	        var file;
	        
	        $("div#attachedFile").html("");
	        
	        for (var i=0; i<files.length; i++) { 
	            file = files[i];
	            $("div#attachedFile").append('<span>'+file.name+'&nbsp;&nbsp;</span><br>');
	        }
		});
		
	});
	
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
		
		
		var fk_wtno = ${requestScope.workvo.fk_wtno};
		
		if (fk_wtno == 0) submitTodoRegFrm(); 
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
		
		var frm = document.workRegFrm;
		frm.action = "<%=ctxPath%>/workEditEnd.opis";
		frm.method = "post";
		frm.submit();
	}
	
	// 파일업로드 버튼클릭시
	function func_attach() {
		 $("input[name=attach]").click();	
	}
	
	
</script>

<div class="container commoncontainer">
	<h3>업무 수정</h3>
	
	<br>
	
	<form name="workRegFrm" enctype="multipart/form-data">
		<table class="table table-striped workRegtable">
			<tbody>
				<tr>
					<td>업무형태</td>
					<td>
						<c:if test="${requestScope.workvo.fk_wtno == 1}">
							<input type="hidden" value="1" id="fk_wtno" name="fk_wtno" onclick="onlyWorkInput(this);"/>
							<label for="fk_wtno">업무요청</label>
						</c:if>
						<c:if test="${requestScope.workvo.fk_wtno == 2}">
							<input type="hidden" value="2" id="fk_wtno" name="fk_wtno" onclick="onlyWorkInput(this);"/>
							<label for="fk_wtno">업무보고</label>
						</c:if>
					</td>
				</tr>
				<tr>
					<td>담당자</td>
					<td><label>${requestScope.workvo.receivers}</label></td>
				</tr>
				<tr>
					<td style="width: 10%;"><span class="star">*</span>제목</td>
					<td style="width: 70%;"><input name="subject" value="${requestScope.workvo.subject}"/></td>
				</tr>
				<tr>
					<td><span class="star">*</span>업무기한</td>
					<td><input type="text" name="deadline" id="datepicker_deadline" value="${requestScope.workvo.deadline}"/></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="contents" cols="60" rows="10">${requestScope.workvo.contents}</textarea></td>
				</tr>
				<tr>
					<td>파일</td>
					<td>
						<c:forEach var="file" items="${requestScope.fileList}" varStatus="status">
							<c:if test="${sessionScope.loginuser != null}">
								<a href="<%=ctxPath%>/download.opis?orgFilename=${file.orgFilename}&fileName=${file.fileName}">${file.orgFilename}</a>&nbsp;
							</c:if>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>추가파일 업로드</td>
					<td>
						<input type="file" name="attach" id="attach" name="attach" multiple />
						<button type="button" class="btn btn-success formBtn" id="attachBtn" onclick="func_attach()" >파일업로드</button>			
						<div id="attachedFile"></div>
					</td>
				</tr>
				<tr id="workRegBtn">
					<td colspan="2">
						<button type="button" onclick="checkStar()">수정</button>
						<button type="button" >취소</button>
					</td>
				</tr>
			</tbody>
		</table>	
		<input type="hidden" name="wmno" value="${requestScope.workvo.wmno}"/>
		<input type="hidden" name="fk_wrno" value="1"/>
		<input type="hidden" name="fk_wtno" value="${requestScope.workvo.fk_wtno}"/>
	</form>
</div>

