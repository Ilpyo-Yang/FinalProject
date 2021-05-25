<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<style>

  #sideMenu {
	width:20%;
	height:750px;
    background-color: #f2f2f2;
  }

  #btnReg {
    margin: 30px 40px;
    padding: 15px 50px;
    font-size: 15pt;
    box-shadow: 3px 3px 3px gray;
  }

  #menuTitle {
    height:80px;
    width:400px;
    background-color:black;
    color:white;
    font-size: 20pt;
    text-align: center;
    display:table-cell;
    vertical-align:middle;
  }

  .lside {
    margin-top:50px;
    padding:10px 0 10px 70px;
  }

  a {
    color: black;
    font-size:25px;
    text-decoration: none;
    font-weigth: bold;
  }
	
</style>

    <div id="sideMenu">
  	<div id="menuTitle"></div>
  	<div><button type="button" id="btnReg">게시글 등록</button></div>

  		<div class="lside"><a href="#">전체공지사항</a></div>
  		<div class="lside"><a href="#">부서공지사항</a></div>
  		<div class="lside"><a href="#">공통서식</a></div>

  	</div>

