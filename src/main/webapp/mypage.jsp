  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>마이페이지</title>
        <link rel="stylesheet" href="css/header.css">   
           
       
        <style>
			 
            /* 마이페이지 내용 */
            .data{
           		 width:100%;}
            
            .change{
                width: 860px;
                height: 800px;
                border: 1px solid #ddd;
                margin: 0 auto;
                padding: 20px;
                border-radius:10px;
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
            img{
            	width:100px;
            	height:100px;
            }
            
            input{
            width:60%; 
            height: 40px;
            margin:10px;}
        </style>
    </head>
    <body>
        <div id="wrap">
        	<jsp:include page="header.jsp"></jsp:include>
            
            <div class="contents">
           
            <div class="title"> <h2>마이페이지</h2> </div>  	
               
              
                <form method="post" action="">
                    <!-- 사진과 이름, 사번 등을 감싸고 있음 -->
                   
                    <div class="change">
                        <!-- 사진, 변경 버튼 감싸고 있음 -->
                        <div class="picture_btn">
                            <!-- 사진은 관리자가 등록하고, 변경만 직원이 가능 -->
                            <div class="picture">
                               <img src="${mDTO.photo }">
                              
                               
                            </div>
                            <input type="submit" value="변경" class="">
                        </div>
                        <!-- 개인정보 내용 감싸고 있음 -->
                        <div class="data">
                            <span>이름</span><input type="text" value="${mDTO.name }" readonly><br>
                            <span>사번</span><input type="text" value="${m_num }" readonly><br>
                            <span>연락처</span><input type="text" name="phone" value="${mDTO.phone }"><br>
                            <span>이메일</span><input type="email" name="email" value="${mDTO.email }"><br>
                            <span>주소</span><input type="text" name="address" value="${mDTO.address }"><br>
                             <input type="text" value="${mDTO.photo }" id="hid">
                             <img src="${mDTO.getPhoto() }">
                            
                            
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
        <script>
        	
        	
        </script>
    </body>
</html> 