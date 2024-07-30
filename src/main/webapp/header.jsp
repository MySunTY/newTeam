<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		                    <li><a href="#">업무일지</a></li>
		                    <li><a href="#">마이페이지</a></li>
		                    <!-- 관리자 권한이 있는 자가 로그인 했을 경우 관리자페이지 메뉴 보이기 -->
							<c:if test="${result==1}">
								<li class="admin">
						        	관리자페이지
						        	<ul>
						        		<li><a href="staff.jsp">신입사원 등록</a></li>
						        	</ul>
					        	</li>
							</c:if>
		                </ul>
		            </div>
	</div>    