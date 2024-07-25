<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>출퇴근관리</title>
        <style>
            *{
                margin: 0 auto;
                padding: 0;
            }
            /* 전체를 감싸고 있음 */
            #wrap{
                border: 1px solid black;
                /* background-color: red; */
                width: 1240px;
                /* height: 800px; */
            }
            /* 로고, 로그인 부분 감싸고 있음 */
            .top{
                background-color: skyblue;
                height: 80px;
            }
            /* 로고 감싸고 있음 */
            .top1{
                width: 150px;
                height: 100%;
                float: left;
                text-align: center;
                line-height: 80px;
            }
            .top2{
                width: 150px;
                height: 100%;
                float: right;
                text-align: center;
                line-height: 80px;
            }
            .top2 > a{
                text-decoration: none;
            }
            /* 공지사항, 출퇴근관리, 휴가관리, 업무일지 등을 감싸고 있음 */
            .mainmenu{
                background-color: beige;
                height: 80px;
            }
            .mainmenu > ul{
                list-style: none; 
                width: 800px;
                text-align: center;
                line-height: 80px;
            }
            .mainmenu > ul > li{
                display: inline-block;
                width: 100px;
                text-align: center;
            }
            .mainmenu > ul > li > a{
                text-decoration: none;
            }
            .mainmenu > ul > li:hover{
                background-color: black;
                color: white;
            }

            /* 헤더 아랫쪽 내용물 감싸고 있음 */
            .contents{
                background-color: azure;    /* 영역 확인용 색깔 표시 */
                padding: 20px;
            }
            /* 오늘 날짜 표시 */
            #today{
                width: 300px;
                height: 70px;
                text-align: center;
                line-height: 70px;
                background-color: lightgray;
                border-radius: 10px;
            }
            /* 출퇴근 후 시간 보여주는 부분 감싸고 있음*/
            .time{
                width: 420px;
                /* background-color: red; */
            }
            /* 클리어픽스 : float사용시 부모요소의 면적소실문제를 제거하는 기법 */
            .time:after{
                content: "";
                display: block;
                clear: both;
            }
            .ontime, .offtime{
                width: 200px;
                height: 80px;
                background-color: lightgray;
                text-align: center;
                line-height: 80px;
                float: left;
                margin: 5px;
                border-radius: 10px;
            }
            /* 출퇴근 버튼 감싸고 있음 */
            .onoff_btn{
                clear: both;
                margin: 0 auto;
                width: 260px;
                /* background-color: red; */
            }
            /* 클리어픽스 : float사용시 부모요소의 면적소실문제를 제거하는 기법 */
            .onoff_btn:after{
                content: "";
                display: block;
                clear: both;
            }
            .on_btn, .off_btn{
                width: 120px;
                height: 50px;
                background-color: blue;
                color: white;
                text-align: center;
                line-height: 50px;
                border-radius: 10px;
                margin: 5px;
                float: left;
            }
            /* 클리어픽스 : float사용시 부모요소의 면적소실문제를 제거하는 기법 */
            .contents:after{
                content: "";
                display: block;
                clear: both;
            }

            /* 달력 */
            .calendar{
                margin: 10px auto;
            }
            .calendar, .week, .day{
                border: 1px solid black;
                clear: both;
            }
            .calendar{
                width: 800px;
            }
            .week{
                display: flex;
                justify-content: space-between;
            }
            .days{
                display: flex;
                flex-wrap: wrap;
            }
            .days > .day{
                width: calc(786px/7);
                height: 100px;
                display: inline-block;
            }
            .month{
                display: flex;
                justify-content: space-between;
            }
            .month > div{
                width: 100px;
                border: 1px solid black;
            }
        </style>
    </head>
    <body>
        <div id="wrap">
        	<div id="header">
	            <div class="top">
	                <div class="top1">LSP주식회사</div>
	                <div class="top2">${m_num }님 환영합니다</div>
	            </div>
	            <div class="mainmenu">
	                <ul>
	                    <li><a href="#">공지사항</a></li>
	                    <li><a href="onoff.jsp">출퇴근관리</a></li>
	                    <li><a href="vacation.leave">휴가관리</a></li>
	                    <li><a href="#">업무일지</a></li>
	                    <li><a href="#">관리자페이지</a></li>
	                </ul>
	            </div>
            </div>
            <div class="contents">
                <div id="today">
                    <!-- 현재 날짜와 시간 표시될 곳 -->
                </div>
                <div class="time">
                    <div class="ontime">00:00:00</div>
                    <div class="offtime">00:00:00</div>
                </div>
                <div class="onoff_btn">
                    <form method="post" action="on.one">
                    	<input type="hidden" name="m_num" value="${m_num }">
                        <input type="submit" value="출근" class="on_btn">
                    </form>
                    <form method="post" action="off.one">
                        <input type="submit" value="퇴근" class="off_btn">
                    </form>
                </div>

                <!-- 달력 -->
                <div class="calendar">
                    <div class="month">
                        <div class="before">이전 달</div>
                        <div class="year_month"><!-- 몇 년, 몇 월인지 표시됨 --></div>
                        <div class="next">다음 달</div>
                    </div>
                    <div class="week">
                        <div class="day">일</div>
                        <div class="day">월</div>
                        <div class="day">화</div>
                        <div class="day">수</div>
                        <div class="day">목</div>
                        <div class="day">금</div>
                        <div class="day">토</div>
                    </div>
                    <div class="days"><!-- 일자 표시됨 --></div>
                </div>
            </div>
        </div>
        <script>
            //날짜 가져오기
            let newDate=new Date();
            let year=newDate.getFullYear();    //연
            let month=newDate.getMonth();      //월
            let date=newDate.getDate();        //일
            let day=newDate.getDay();          //요일
            let dayList=['일', '월', '화', '수', '목', '금', '토'];
            let day2=dayList[day];
            //시간 가져오기
            //시, 분, 초를 항상 두자리씩 표현하기 위해 문자로 바꾸고 padStart 사용함.
            let hours=newDate.getHours().toString().padStart(2, "0");
            let minutes=newDate.getMinutes().toString().padStart(2, "0");
            let seconds=newDate.getSeconds().toString().padStart(2, "0");    


            //달력 만드는 함수
            function calendar(year, month){
                //현재 년, 월의 첫번째 요일 확인
                let currentDate=new Date(year,month,1);
                console.log("출력되는 연월일, 첫번째 요일: "+currentDate);
                let firstDay=currentDate.getDay();
                console.log("첫번째 요일: "+dayList[firstDay]);
                //1~12월의 마지막 일을 배열로 적음
                let last=[31,28,31,30,31,30,31,31,30,31,30,31];
                //윤년 계산 
                if(year%4==0){
                    last[1]=29;
                }else if(year%100==0){
                    last[1]=28;
                }else if(year%400==0){
                    last[1]=29;
                }

                //월의 마지막 일 구하기
                let lastDay=last[currentDate.getMonth()];
                console.log("해당 월의 마지막 일: "+lastDay);

                //달력의 주 수 : (해당월의 시작일 + 마지막 일)/7
                let weekCount=Math.ceil((firstDay+lastDay)/7);
                console.log("달력의 주 수: "+weekCount);

                //달력 상단에 년도와 월 표시
                //이전 월
                document.getElementsByClassName("before")[0].innerHTML="이전 달";
                //현재 월
                document.getElementsByClassName("year_month")[0].innerHTML=year+"년 "+(month+1)+"월";
                //다음 월
                document.getElementsByClassName("next")[0].innerHTML="다음 달";

                //달력 날짜 div 만들어서 날짜 넣기
                //날짜를 감싸고 있는 클래스 이름이 days인 div를 가져온다.
                let daysDiv=document.getElementsByClassName("days")[0];
                //첫째 날 전에는 아무것도 안적힌 div 만들어서 부모한테 붙이기
                for(let i=0; i<firstDay; i++){
                    let emptyDayDiv=document.createElement("div");
                    emptyDayDiv.classList.add("day");  //클래스 이름 추가
                    daysDiv.appendChild(emptyDayDiv);
                }
                //날짜 부분 div요소 만들어서 날짜 넣고, 부모한테 붙이기
                for(let i=1; i<=lastDay; i++){
                    let dayDiv=document.createElement("div");
                    dayDiv.className="day "+i;  //class이름 : day, i 두개 만듦
                    dayDiv.innerHTML=i;
                    daysDiv.appendChild(dayDiv);

                    //날짜 써있는 div 안에, 출퇴근 시간 들어갈 div 만들어서 부모한테 붙이기
                    let timeDiv=document.createElement("div");
                    timeDiv.className="inner_ontime";
                    timeDiv.innerHTML="00:00";
                    dayDiv.appendChild(timeDiv);
                    let timeDiv2=document.createElement("div");
                    timeDiv2.className="inner_offtime";
                    timeDiv2.innerHTML="00:00";
                    dayDiv.appendChild(timeDiv2);
                }
            }
            //페이지 접속하면 현재 달력 보여주기
            calendar(year, month);

    
            //현재 날짜와 시간 가져와서 표시하기
            function today(){
                //함수 안에서 날짜와 시간을 가져와야 setInterval 사용시 1초에 한번씩 바뀜.
                //날짜 가져오기
                let newDate=new Date();
                let year=newDate.getFullYear();    //연
                let month=newDate.getMonth();      //월
                let date=newDate.getDate();        //일
                let day=newDate.getDay();          //요일
                let dayList=['일', '월', '화', '수', '목', '금', '토'];
                let day2=dayList[day];
                //시간 가져오기
                //시, 분, 초를 항상 두자리씩 표현하기 위해 문자로 바꾸고 padStart 사용함.
                let hours=newDate.getHours().toString().padStart(2, "0");
                let minutes=newDate.getMinutes().toString().padStart(2, "0");
                let seconds=newDate.getSeconds().toString().padStart(2, "0");   

                //날짜와 시간 표시하기
                let today=document.getElementById("today");
                today.innerHTML=year+"년 "+(month+1)+"월 "+date+"일 "+day2+"요일 "+hours+":"+minutes+":"+seconds;
            }
            today();    //함수 호출
            setInterval(today, 1000);   //시간 1초에 한번씩 바뀌게 함.


            //출근 버튼 누르면 팝업 뜨고 시간 표시됨
            document.getElementsByClassName("on_btn")[0].addEventListener("click", function(){
                let nowTime=document.getElementsByClassName("ontime")[0].innerHTML;

                //출근 버튼 처음 눌렀으면 클릭시간 적어주고, 또다시 출근 버튼을 누르면 이미 출근했다고 알려주기
                if(nowTime=="00:00:00"){
                    //시간 가져오기.
                    //시, 분, 초를 항상 두자리씩 표현하기 위해 문자로 바꾸고 padStart 사용함.
                    //괄호 안에 있어야 클릭했을 때의 시간 표시됨.
                    let newDate=new Date();
                    let hours=newDate.getHours().toString().padStart(2, "0");
                    let minutes=newDate.getMinutes().toString().padStart(2, "0");
                    let seconds=newDate.getSeconds().toString().padStart(2, "0");  

                    document.getElementsByClassName("ontime")[0].innerHTML=hours+":"+minutes+":"+seconds;

                    alert("출근!");
                }else{
                    alert("이미 출근 하셨습니다.");
                }
                //출근 버튼 눌렀을 때, 달력 해당 날짜 안에 출근 시간 기록됨
                let i=date;
                console.log(i); 
                document.getElementsByClassName("inner_ontime")[i-1].innerHTML="출근 "+document.getElementsByClassName("ontime")[0].innerHTML;
            });
            
            //퇴근 버튼 누르면 팝업 뜨고 시간 표시됨
            document.getElementsByClassName("off_btn")[0].addEventListener("click", function(){
                let nowTime=document.getElementsByClassName("offtime")[0].innerHTML;

                //퇴근 버튼 처음 눌렀으면 클릭시간 적어주고, 또다시 퇴근 버튼을 누르면 이미 출근했다고 알려주기
                if(nowTime=="00:00:00"){
                    //시간 가져오기.
                    //시, 분, 초를 항상 두자리씩 표현하기 위해 문자로 바꾸고 padStart 사용함.
                    //괄호 안에 있어야 클릭했을 때의 시간 표시됨.
                    let newDate=new Date();  
                    let hours=newDate.getHours().toString().padStart(2, "0");
                    let minutes=newDate.getMinutes().toString().padStart(2, "0");
                    let seconds=newDate.getSeconds().toString().padStart(2, "0");  

                    document.getElementsByClassName("offtime")[0].innerHTML=hours+":"+minutes+":"+seconds;
                    alert("퇴근!");
                }else{
                    alert("이미 퇴근 하셨습니다.");
                }
                //퇴근 버튼 눌렀을 때, 달력 해당 날짜 안에 퇴근 시간 기록됨
                let i=date;
                document.getElementsByClassName("inner_offtime")[i-1].innerHTML="퇴근 "+document.getElementsByClassName("offtime")[0].innerHTML;
            });

            
            //이전 달 버튼 클릭
            document.getElementsByClassName("before")[0].addEventListener("click", function(){
                month=month-1;
                //console.log("이전 월: "+month);
                //alert(month+"월 달력으로 이동합니다.");
                alert("이전 달로 이동합니다.");
                
                selectCalendar(year, month);
            });

            //다음 달 버튼 클릭
            document.getElementsByClassName("next")[0].addEventListener("click", function(){
                month=month+1;
                //console.log("다음 월: "+month);
                alert("다음 달로 이동합니다.");
                selectCalendar(year, month);
            });
            
            //기존 달력 내용 지우고, 선택한 달력 보여주기
            function selectCalendar(year, month){
                document.getElementsByClassName("days")[0].innerHTML="";    //기존 달력 내용 지우기
                calendar(year, month);  //선택한 달력 보여주기
            }
        </script>
    </body>
</html>