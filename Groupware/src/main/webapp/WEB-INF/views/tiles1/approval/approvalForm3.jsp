<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>


<!DOCTYPE html>
<html lang="en">
<head>
<title>::: Opistachio :::</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/menu.css" />		
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
  
<link rel="stylesheet" type="text/css" href="resources/css/approval.css"/>

<script type="text/javascript">
	$(document).ready(function(){
	
		
	}); // end of $(document).ready(function(){})---------------------------------------
	
</script>
</head>
<body>

<div style="display: inline-block; width: 1400px;"> 
    <div id="sideMenu">
	  	<div id="menuTitle">전자결재</div>
	
  		<div class="lside"><a class="side" href="#">결재</a></div>
  		<div class="lside"><a class="side" href="#">기안문작성</a></div>
  		<div class="lside"><a class="side" href="#">일반기안서</a></div>
  		<div class="lside"><a class="side" href="#">지출결의서</a></div>
  		<div class="lside"><a class="side" href="#">휴가신청서</a></div>
  		  		
  		<div class="lside"><a class="side" href="#">결재진행함</a></div>
  		<div class="lside"><a class="side" href="#">완료문서함</a></div>
  		<div class="lside"><a class="side" href="#">반려문서함</a></div>
  		
  		<hr>
  		
  		<div class="lside"><a class="side" href="#">설정</a></div>
  		<div class="lside"><a class="side" href="#">서명관리</a></div>
 	</div>
	
	<div id="approvalContainer">
		<span class="subtitle">기안문작성</span>
		<hr>
		<div id="approvalFormStyle">        	
			<div id="top">
				<button type="button" class="btn btn-success formBtn">결재선</button>
				<button type="button" class="btn btn-success formBtn">결재요청</button>
				<button type="button" class="btn btn-default formBtn">취소</button>
				<br>
				<table id="sign">
					<tr>
						<td rowspan="2" id="sign1" class="sign">결재</td>
						<td id="sign2" class="sign">기안</td>
					</tr>
					<tr>
						<td class="sign"></td>
					</tr>
				</table>
			</div>
			<div id="center">
				<span id="subject">휴가신청서</span>
				<table id="approvalForm">
					<tbody>
						<tr>
							<td>문서번호</td>
							<td id=""></td>
							<td>기안일자</td>
							<td id=""></td>
						</tr>
						<tr>
							<td>기안자</td>
							<td id=""></td>
							<td>기안부서</td>
							<td id=""></td>
						</tr>
						<tr>
							<td>참조자</td>
							<td id=""></td>
							<td>알림여부</td>
							<td id=""></td>
						</tr>
						<tr>
							<td>문서제목</td>
							<td id="" colspan="3">
								<input type="text" class="form-control" id="formTitle"/>
							</td>
						</tr>
						<tr>
							<td>휴가신청일자</td>
							<td id="" colspan="3">
								<input type="text" class="form-control" id="formDetail"/>
								<span class="space">-</span>
								<input type="text" class="form-control" id="formDetail"/>
								<span class="space">총<span class="space"></span>일간</span>
							</td>
						</tr>
						<tr>
							<td>구분</td>
							<td id="" colspan="3">
								<select id="vacationType">
									<option>연차</option>
									<option>반차</option>
								</select>
								<span class="space">(남은 연차:<span class="space"></span>/<span class="space"></span>)</span>
							</td>
						</tr>
						<tr>
							<td>인수인계자</td>
							<td id="" colspan="3">
								<input type="text" class="form-control" id="formDetail"/>
							</td>
						</tr>
					</tbody>
				</table>				
			</div>
			<div id="bottom">
				<button type="button" class="btn btn-success formBtn">파일업로드</button>
			</div>
		</div>
	</div>
	  	
	
	
</div>
</body>
</html>
