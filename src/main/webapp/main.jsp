 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>메인페이지</title>
        <link rel="stylesheet" href="css/header.css">  
         
        <style>
       .img {
  			width: 80%;
  			height: 40%;
  			text-align:center;
  			border:1px solid black;
  			background-size:contain;
  			background-repeat: no-repeat;
  			background-position: center;
  			background-image: url(image/busniess01.png);
		}
		.intro{
			width: 80%;
  			height: 5%;
  			text-align:center;
			line-height: 60px;
			font-size: 30px;
			font-weight: 900;
		}
		.team_member{
		  	width: 80%;
  			height: 40%;
  			text-align:center;
  			border:1px solid black;
  			display: grid;			
			grid-template-rows: 1fr 1fr ;
			grid-template-columns: 1fr 1fr 1fr 1fr;
			grid-template-areas: 
			"box1 box2 box3 box4"
			"box5 box6 box7 box8";
		}
		.team_member>div{
			width: 100%;
			height: 100%;
			text-align: center;			
			border:1px solid black;
		}
		.box1{
			border:1px solid black;
		}
		.box5, .box6, .box7, .box8{
			text-align:center;
			font-size: 23px;
			line-height: 50px;
		}
		#box1-1{
			width: 90%;
			height: 90%;
			border-radius: 50%;
			background-image: url("image/1.jpg");
			background-size:contain;
		}
		#box2-1{
			width: 90%;
			height: 90%;
			border-radius: 50%;
			background-image: url("image/2.jpg");
			background-size:contain;
		}
		
		#box3-1{
			width: 90%;
			height: 90%;
			border-radius: 50%;
			background-image: url("image/3.png");
			background-size:contain;
		}
		#box4-1{
			width: 90%;
			height: 90%;
			border-radius: 50%;
			background-image: url("image/4.png");
			background-size:contain;
		}
		
		#box1-2, #box2-2, #box3-2, #box4-2{
			width: 90%;
			height: 10%;
		}
        </style>
    </head>
    <body>
        <div id="wrap">
        	<jsp:include page="header.jsp"></jsp:include>
        	
			<div class="contents">
			<div class="title"> <h2>환영합니다</h2> </div>
			<div class="img"></div>
			<div class="intro">2024년 LSP(주) 개발팀 신입사원 소개</div>
			<div class="team_member">				
				<div class="box1"><div id="box1-1"></div><div id="box1-2">이은영</div></div>
				<div class="box2"><div id="box2-1"></div><div id="box2-2">신효정</div></div>
				<div class="box3"><div id="box3-1"></div><div id="box3-2">박상미</div></div>
				<div class="box4"><div id="box4-1"></div><div id="box4-2">이재민</div></div>
				
				<div class="box5"><b>* 웹디자인 *</b><br>반응형웹 구현<br>UI, UX 디자인<br>헤더, 푸터 제작</div>
				<div class="box6"><b>* 프론트엔드 *</b><br>공지사항 게시판<br>업무일지<br>휴가페이지</div>
				<div class="box7"><b>* 프론트엔드 *</b><br>로그인<br>마이페이지<br>출퇴근페이지</div>
				<div class="box8"><b>* 백엔드 *</b><br>팀프로젝트 총괄<br>전체 DB설계<br>캘린더</div>
			</div>  	
			</div>  
        </div>
    </body>
</html>