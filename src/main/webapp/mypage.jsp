<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>마이페이지</title>
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
                height: 800px;
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
                height: 600px;
            }


            /* 마이페이지 내용 */
            .change{
                width: 600px;
                height: 400px;
                border: 1px solid black;
                margin: 0 auto;
                padding: 20px;
            }
            .picture{
                width: 100px;
                height: 120px;
                border: 1px solid black;
            }
            span{
                display: inline-block;
                width: 70px;
            }
            .picture_btn, .data, .btn{
                width: 500px;
                margin: 0 auto;
                /* background-color: red; */
                text-align: center;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div id="wrap">
            <div class="top">
                <div class="top1">LSP주식회사</div>
                <div class="top2">${m_num }님 환영합니다</div>
            </div>
            <div class="mainmenu">
                <ul>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="onoff.one">출퇴근관리</a></li>
                    <li><a href="vacation.leave">휴가관리</a></li>
                    <li><a href="#">업무일지</a></li>
                    <li><a href="mypage.do">마이페이지</a></li>
                </ul>
            </div>
            <div class="contents">
                <h2>마이페이지</h2>
                <form method="post" action="">
                    <!-- 사진과 이름, 사번 등을 감싸고 있음 -->
                    <div class="change">
                        <!-- 사진, 변경 버튼 감싸고 있음 -->
                        <div class="picture_btn">
                            <!-- 사진은 관리자가 등록하고, 변경만 직원이 가능 -->
                            <div class="picture">
                               <img src="">
                            </div>
                            <input type="submit" value="변경">
                        </div>
                        <!-- 개인정보 내용 감싸고 있음 -->
                        <div class="data">
                            <span>이름</span><input type="text" value="${mDTO.name }" readonly><br>
                            <span>사번</span><input type="text" value="${m_num }" readonly><br>
                            <span>연락처</span><input type="text" name="phone" value="${mDTO.phone }"><br>
                            <span>이메일</span><input type="email" name="email" value="${mDTO.email }"><br>
                            <span>주소</span><input type="text" name="address" value="${mDTO.address }"><br>
                        </div>
                        <!-- 버튼을 감싸고 있음 -->
                        <div class="btn">
                            <input type="reset" value="초기화">
                            <input type="submit" value="수정">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>