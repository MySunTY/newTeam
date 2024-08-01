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
       img {
  			width: 100%;
  			height: 100%;
  			 
			}
        </style>
    </head>
    <body>
        <div id="wrap">
        	<jsp:include page="header.jsp"></jsp:include>
        	
			<div class="contents">
			<div class="title"> <h2>환영합니다</h2> </div>  	
			<img src="image/busniess01.png">
			
			</div>  
			
		 
        </div>
    </body>
</html>