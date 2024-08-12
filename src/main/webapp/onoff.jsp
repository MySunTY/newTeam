<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="DTO.OnoffDTO" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>출퇴근관리</title>
	<link rel="stylesheet" href="css/header.css">
	<style>
	
		/* 오늘 날짜 표시 */
		#today {
			width: 300px;
			height: 70px;
			text-align: center;
			line-height: 70px;
			/* background-color: lightgray;*/
			border-radius: 10px;
		}
		/* 출퇴근 후 시간 보여주는 부분 감싸고 있음*/
		.time {
			width: 420px;
			/* background-color: red; */
		}
		/* 클리어픽스 : float사용시 부모요소의 면적소실문제를 제거하는 기법 */
		.time:after {
			content: "";
			display: block;
			clear: both;
		}
		
		.ontime, .offtime {
			width: 200px;
			height: 80px;
			/*background-color: lightgray;*/
			text-align: center;
			line-height: 80px;
			float: left;
			margin: 5px;
			border-radius: 10px;
		}
		/* 출퇴근 버튼 감싸고 있음 */
		.onoff_btn {
			clear: both;
			margin: 0 auto;
			width: 540px;
			/* background-color: red; */
		}
		/* 클리어픽스 : float사용시 부모요소의 면적소실문제를 제거하는 기법 */
		.onoff_btn:after {
			content: "";
			display: block;
			clear: both;
		}
		
		.on_btn, .off_btn {
			width: 230px;
			height: 70px;
			background-color: #1537a7;
			color: white;
			text-align: center;
			line-height: 50px;
			margin: 10px;
			float: left;
			border-radius: 10px;
			box-shadow: 1px 1px 1px #ddd;
			font-size: 1.5em;
		}
		
		.off_btn {
			background-color: orange;
		}
		/* 클리어픽스 : float사용시 부모요소의 면적소실문제를 제거하는 기법 */
		.contents:after {
			content: "";
			display: block;
			clear: both;
		}
		
		table{
		width: 80%;}
		
		/* 출퇴근기록 표 */
		table, th, td {
			border: 1px solid #ddd;
			border-collapse: collapse;
		}
		
		th, td {
			width: 410px;
			height: 50px;
			text-align: center;
		}
		
		input[type="submit"] {
			border: none;
		}
	</style>
	</head>
	<body>
	
		<div id="wrap">
			<jsp:include page="header.jsp"></jsp:include>
			<a href="calendar.jsp">달력보기</a>
			<div class="contents">
				<div class="title">
					<h2>출퇴근 관리</h2>
				</div>
	
				<div id="today">
					<!-- 현재 날짜와 시간 표시될 곳 -->
				</div>
				
				<!-- 출퇴근 버튼 누르면 시간 표시됨 -->
				<!-- 
				<div class="time">
					<div class="ontime">00:00:00</div>
					<div class="offtime">00:00:00</div>
				</div>
				 -->
				<div class="onoff_btn">
					<form method="post" action="on.one">
						<input type="hidden" name="m_num" value="${m_num }"> 
						<input type="submit" value="출근" class="on_btn">
					</form>
					<form method="post" action="off.one">
						<input type="submit" value="퇴근" class="off_btn">
					</form>
				</div>
				
				

			</div>
		</div>
	
		<script>
			//날짜 가져오기
			let newDate = new Date();
			let year = newDate.getFullYear(); //연
			let month = newDate.getMonth(); //월
			let date = newDate.getDate(); //일
			let day = newDate.getDay(); //요일
			let dayList = [ '일', '월', '화', '수', '목', '금', '토' ];
			let day2 = dayList[day];
			//시간 가져오기
			//시, 분, 초를 항상 두자리씩 표현하기 위해 문자로 바꾸고 padStart 사용함.
			let hours = newDate.getHours().toString().padStart(2, "0");
			let minutes = newDate.getMinutes().toString().padStart(2, "0");
			let seconds = newDate.getSeconds().toString().padStart(2, "0");
	
			//현재 날짜와 시간 가져와서 표시하기
			function currentTime() {
				//함수 안에서 날짜와 시간을 가져와야 setInterval 사용시 1초에 한번씩 바뀜.
				//날짜 가져오기
				let newDate = new Date();
				let year = newDate.getFullYear(); //연
				let month = newDate.getMonth(); //월
				let date = newDate.getDate(); //일
				let day = newDate.getDay(); //요일
				let dayList = [ '일', '월', '화', '수', '목', '금', '토' ];
				let day2 = dayList[day];
				//시간 가져오기
				//시, 분, 초를 항상 두자리씩 표현하기 위해 문자로 바꾸고 padStart 사용함.
				let hours = newDate.getHours().toString().padStart(2, "0");
				let minutes = newDate.getMinutes().toString().padStart(2, "0");
				let seconds = newDate.getSeconds().toString().padStart(2, "0");
	
				//날짜와 시간 표시하기
				let today = document.getElementById("today");
				today.innerHTML = year + "년 " + (month + 1) + "월 " + date + "일 "
						+ day2 + "요일 " + hours + ":" + minutes + ":" + seconds;
			}
	
			
			
			//출근버튼 누르면 alert
			document.getElementsByClassName("on_btn")[0].addEventListener("click", function(){
				let newDate=new Date();
		        let hours=newDate.getHours().toString().padStart(2, "0");
		        let minutes=newDate.getMinutes().toString().padStart(2, "0");
		        let seconds=newDate.getSeconds().toString().padStart(2, "0");
		        let time=hours+":"+minutes+":"+seconds;
		        //document.querySelector(".ontime").innerText=time;
		        alert(time+" 출근!");
			});
			//퇴근버튼 누르면 alert
			document.getElementsByClassName("off_btn")[0].addEventListener("click", function(){
				let newDate=new Date();
		        let hours=newDate.getHours().toString().padStart(2, "0");
		        let minutes=newDate.getMinutes().toString().padStart(2, "0");
		        let seconds=newDate.getSeconds().toString().padStart(2, "0");
		        let time=hours+":"+minutes+":"+seconds;
		        //document.querySelector(".offtime").innerText=time;
		        alert(time+" 퇴근!");
			});
			
			
	
	
			document.addEventListener('DOMContentLoaded', function() {
				currentTime();
				setInterval(currentTime, 1000); //시간 1초에 한번씩 바뀌게 함.
			});
		</script>
	</body>
</html>