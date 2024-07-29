<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>main.jsp</title>
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
            .admin > ul{
            	display: none;
            	position: absolute;
            }
            .admin:hover > ul{
                display: block;
            }
            .admin > ul > li:hover{
            	background-color: black;
                color: white;
                width: 100px;
                text-align: center;
            }
			.admin > ul > li > a{
                text-decoration: none;
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
	                    <li><a href="onoff.one">출퇴근관리</a></li>
	                    <li><a href="vacation.leave">휴가관리</a></li>
	                    <li><a href="sheet.do">업무일지</a></li>
	                    <li><a href="mypage.do">마이페이지</a></li>
	                    <!-- 관리자 권한이 있는 자가 로그인 했을 경우 관리자페이지 메뉴 보이기 -->
				        <c:if test="${result==1}">
							<li class="admin">
					        	관리자페이지
					        	<ul>
					        		<li><a href="#">신입사원 등록</a></li>
					        	</ul>
				        	</li>
						</c:if>
	                </ul>
	            </div>
	        </div>    
        </div>
    </body>
</html>