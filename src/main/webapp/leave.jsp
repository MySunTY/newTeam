<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>휴가 페이지</title>
		<style>
		    *{
		        margin: 0 auto;
		        padding: 0;
		        /* border: 1px solid black; */
		        box-sizing: border-box;
		        text-decoration: none;
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
		    /* 공지사항, 출퇴근관리, 휴가관리, 업무일지 등을 감싸고 있음 */
		    .mainmenu{
		        background-color: beige;
		        height: 80px;
		    }
		    #menu{
		        width: 800px;
		        height: 80px;
		        margin: 0 auto;
		    }
		    #menu > ul{
		        list-style: none; 
		        width: 800px;       
		        line-height: 80px;
		        float: left;
		        text-align: center;
		    }
		    #menu > ul > li{
		        display: inline-block;
		        text-align: center;
		        width: 100px;
		        margin-left: 30px;
		        
		    }
		    #menu > ul > li:hover{
		        background-color: black;
		        color: white;
		    }
		
		    /* 휴가페이지만 */
		    #middle{   
		        width: 1240px;            
		        height: 640px;       
		        background-color:azure; 
		        border: 1px solid black;     
		    }
		    #middle-1{
		        width: 800px;
		        height: 80px;
		        line-height: 80px;
		        border: 1px solid black;
		        display: flex;
		        flex-direction: row;
		    }
		    .span{
		        width: 300px;
		        
		    }
		    #middle-2{       
		        width: 800px;
		        height: 560px;       
		        display: flex;
		        flex-direction: row;
		        justify-content: center;
		        text-align: center;
		        align-items: center;
		        border: 1px solid black;
		    }
		    #button{        
		        width: 100px;
		        height: 400px;
		        display: flex;
		        flex-direction: column;
		        align-items: center;
		        text-align: center;
		        border: 1px solid black;                  
		    }
		    
		    .form-2{
		        width: 600px;
		        height: 400px;
		        border: 1px solid black;
		    }
		    textarea {
		        width: 100%;
		        height: 300px;
		        border-radius: 10px; 
		        resize: none;
		    }
		    input[type=date], input[type=datetime-local] {
		        margin-bottom: 20px;
		        height: 40px;
		    }
		    button{
		        width: 80px;
		        height: 100px;
		        border-radius: 15px;
		    }
		    input[type=submit]{
		        width: 100px;
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
	            <div id="menu">
	                <ul>
	                    <li><a href="#">공지사항</a></li>
	                    <li><a href="onoff.one">출퇴근관리</a></li>
	                    <li><a href="leave.do">휴가관리</a></li>
	                    <li><a href="#">업무일지</a></li>
	                    <li><a href="#">관리자페이지</a></li>
	                </ul>
	            </div>
	        </div>
        </div>
        <div id="middle">
            <div id="middle-1">
                <div class="span">사원: </div>
                <div class="span">미사용 연차: </div>
            </div>

            <div id="middle-2">
                <div id="button">                   
                    <button>연차</button><br>
                    <button>반차</button><br>
                    <button>휴가</button><br>
                    <button>사직</button><br>
                </div> 
                
                <!-- 연차 -->
                <form method="post" action="data1.leave" >                
                    <div class="form-2">
                        <div class="text">
                        	<input type="hidden" name="leavetype" value="1">
                            <span>날짜를 선택하세요</span>&nbsp;&nbsp;  
                                <input type="date" name="leave_start"><br>
                            <textarea name="reason" id="text_area" cols="80" rows="20" placeholder="사유를 입력해주세요"></textarea>
                        </div>
                        <input type="submit" value="제출!">
                    </div>
                 </form>
                 
                 <!--반차-->
                 <form method="post" action="data2.leave" >                   
                    <div class="form-2" >
                        <div class="text">
                        	<input type="hidden" name="leavetype" value="2">
                        	
                            <span>날짜와 시간을 선택하세요</span>&nbsp;&nbsp;  
                                <input type="date" name="leave_start">
                            <select name="bancha_time">
                            	<option value="am">오전반차</option>
                            	<option value="pm">오후반차</option>
                            </select>
                            <textarea name="reason" id="text_area" cols="80" rows="20" placeholder="사유를 입력해주세요"></textarea>
                        </div>
                        <input type="submit" value="제출!">
                    </div>
                </form>
                
                <!--휴가 -->
				<form method="post" action="data3.leave" >                    
                    <div class="form-2">
                        <div class="text">
                        	<input type="hidden" name="leavetype" value="3">
                            <span>휴가기간을 선택하세요</span>&nbsp;&nbsp;  
                                <input type="date" name="leave_start">
                                &nbsp;~&nbsp;
                                <input type="date" name="leave_end">
                            <textarea name="reason" id="text_area" cols="80" rows="20" placeholder="사유를 입력해주세요"></textarea>
                        </div>
                        <input type="submit" value="제출!">
                    </div>
                </form>
                
                <!--사직-->
				<form method="post" action="data4.leave" >                   
                    <div class="form-2">
                        <div class="text">
                        	<input type="hidden" name="leavetype" value="4">
                            <span>사직서를 작성해서 제출해주세요</span><br><br>
                            <textarea name="reason" id="text_area" cols="80" rows="20" placeholder="사직사유를 입력해주세요"></textarea>
                        </div>
                        <input type="submit" value="제출!">
                    </div>
                </form>

            </div>
        </div>
    </div>

    <script>
        let btns=document.querySelectorAll("button");
        let btnDivs=document.querySelectorAll(".form-2");  
        
        for(var i=0;i<btnDivs.length;i++){
            if(i==0)btnDivs[i].style.display='block';
            else btnDivs[i].style.display='none';
        }
        
        for(var i=0;i<btns.length;i++){
            //버튼의 번호를 속성으로 저장
            btns[i].no=i;
            btns[i].addEventListener("click", function(e){
                for(var j=0;j<btns.length;j++){
                    btnDivs[j].style.display='none';
                }
                btnDivs[this.no].style.display='block';
            });
        }
    </script>
		
	
	</body>
</html>