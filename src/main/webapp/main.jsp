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
				<div class="box1">이은영님-사진</div>
				<div class="box2">신효정님-사진</div>
				<div class="box3">박상미님-사진</div>
				<div class="box4">이재민님-사진</div>
				<div class="box5">css웹디자인<br>~</div>
				<div class="box6">프론트엔드<br>~</div>
				<div class="box7">프론트엔드<br>~</div>
				<div class="box8">백엔드<br>DB설계</div>
			</div>  	
			</div>  
        </div>
    </body>
</html>