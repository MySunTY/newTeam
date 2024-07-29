<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>업무일지 페이지</title>
    <style>
        *{
            margin: 0 auto;
            padding: 0;
            box-sizing: border-box;
            text-decoration: none;
        }
        #wrap{
            border: 1px solid black;
            width: 1240px;
            height: 800px;
        }
        		    
        #middle{   
            width: 1240px;            
            height: 640px;       
            background-color:azure; 		        
            display: flex;
            flex-direction: row; 
            text-align: center;    
        }
        #middle-1{flex: 2; margin-right: 30px; border-radius: 30px; border: 1px solid black; text-align: center;}
        #side{width: 80%; height: 50%; text-align: center;}
        #middle-2{width: 100%; flex: 8; display: flex; flex-direction: column; }
        #content-1{
            border: 1px solid black;
            width: 100%;
            flex: 1;          
            display: grid;
            margin-bottom: 30px;
            grid-template-columns: repeat(4, 1fr);
            grid-template-rows: repeat(2, 1fr);
            grid-template-areas: 
                "box6 box6 box6 box6"
                "box7 box8 box9 box10";
        }
        .box6{grid-area: box6;}
        #content-2{
            border: 1px solid black;
            width: 100%;
            flex: 9;           
            display: grid;
            grid-template-columns: 8fr 2fr;
            grid-template-rows: 1fr 1fr 8fr;
            grid-template-areas: 
                "box1 box1"
                "box2 box3"
                "box4 box5";
        }
        #content-2>div, #content-1>div{
            width: 100%;
            height: 100%;
            border: 1px solid black;
            text-align: center;
            line-height: 43px;
        }
        .box1{grid-area: box1;}
        .box2, .box3, .box7, .box9{background-color: #ccc;}
        textarea{
            width: 100%;
            height: 100%;
            resize: none;
        }
        #form1{
            width: 100%;
            height: 100%;
            display: inline;
            margin: 0;
            padding: 0;
        }
        #form2{
            width: 100%;
            height: 100%;
            display: inline;
            margin: 0;
            padding: 0;
            flex: 8; 
            display: flex; 
            flex-direction: column; 
        }
        input[type="button"]{
        	margin-top: 30px;
        }
    </style>
</head>

<body>
	 <div id="wrap">
	    <div id="middle">
	        <div id="middle-1">
	            <form id="form1" action="#">
	                <div id="side">
	                    <h2>업무일지 보관함</h2><br>
	                    <span>작성일자: </span><input type="date" name="getdate" id="getdate"><br>                   
	                    <input type="button" value="검색!" onclick="request_doPost()">
	                    <div id="msg"></div>
	                </div>
	            </form>
	        </div>
	
	        <div id="middle-2">
	            <form id="form2" method="get" action="sheet.do">
	                <div id="content-1">
	                    <div class="box6"><h1>업무일지</h1></div>
	                    <div class="box7">작성자</div>
	                    <div class="box8">${m_num }</div>
	                    <input type="hidden" name="m_num" value="${m_num }">
	                    <div class="box9">작성일자</div>
	                    <div class="box10"><input type="date" name="date">&nbsp;&nbsp;&nbsp;<input type="submit" value="제출"></div>
	                </div>          
	                <div id="content-2">
	                    <div class="box1"><금일 업무 내용></div>
	                    <div class="box2">업무내용</div>
	                    <div class="box3">비고</div>                    
	                    <div class="box4"><textarea name="text_area1" id="text_area1"></textarea></div>
	                    <div class="box5"><textarea name="text_area2" id="text_area2"></textarea></div>                    
	                </div>
	            </form>
	        </div>
	    </div>
	 </div>
    <script>
        var XHR;
        var type="";
        function createXMLHttpRequest(){
            if(window.ActiveXObject){ 
                XHR=new ActiveXObject("Microsoft.XMLHTTP");
            }else if(window.XMLHttpRequest){ 
                XHR=new XMLHttpRequest();
            }
        }
        function createString(){
        	var getdate=document.getElementById("getdate").value;
        	var dataString="getdate="+getdate;
        	return dataString
        }
        
        function request_doPost(){
        	createXMLHttpRequest();
        	var url="sheet.do";
        	dataString=createString();
        	XHR.onreadystatechange=handleStateChange;
        	XHR.open("POST", url, true);
        	XHR.setRequestHeader("content-Type", "application/x-www-form-urlencoded");
        	XHR.send(dataString);
        	
        }
        function handleStateChange(){
            				
            if(XHR.readyState==4){  
                if(XHR.status==200){                     
                	parseResult();
                }
            }
        }
        function parseResult(){
        	var div=document.getElementById("text_area1");
        	if(div.hasChildNodes()){
        		div.removeChild(div.childNodes[0]);
        	}
        	var text=document.createTextNode(XHR.responseText);
        	div.appendChild(text);
        	
        }
    </script>
</body>
</html>