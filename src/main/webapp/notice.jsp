<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="controller.boardServlet" %>
<%@ page import="DAO.BoardDAO" %>
<%@ page import="DTO.BoardDTO" %>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>공지사항</title>
        <link rel="stylesheet" href="css/header.css">   
           
       
        <style>
			 #boardwrap{
	            width: 100%;
	            flex: 7;
	            text-align: center;
	                   
	        }
	        table, tr, th, td{
	            border: 1px solid black;
	        }
	        #table{
	            width: 85%;
	            table-layout: fixed;
	            margin-top:50px;
	        }
	        #title{
	            width: 60%;
	            table-layout: fixed;
	        }
	        #button{
	        	width: 100px;
	        	height: 30px;
	        	position: relative;
	    		top: 35px;         	
	        	margin-right:100px;
	        }
           
        </style>
    </head>
    <body>
        <div id="wrap">
        	<jsp:include page="header.jsp"></jsp:include>
            <div class="contents">
            <div class="title"> <h2>공지사항</h2> </div>  	
            
            
             <div id="boardwrap">
                    <table id="table">                      
                        <thead>                          
                            <tr>
                                <th>번호</th>
                                <th id="title">제목</th>
                                <th>작성자</th>
                                <th>작성날짜</th>
                                <th>관리</th>                               
                            </tr>
                        </thead>
                        <tbody>
                          	<c:forEach var="data" items="${data}">
                            <tr>                           		                            	                          	
                            	<td>${data.num}</td>
                                <td><a href="post_read.jsp?num=${data.num}">${data.title}</a></td>  
  	                            <td>${data.writer}</td>
                                <td>${data.reg_date}</td>	                            	                           	
                                <td>
                                    <button type="button" value="수정" onclick="location.href='post_modify.jsp?num=${data.num}'" >수정</button>
                                    <button type="button" value="삭제" onclick="location.href='post_delete.jsp?num=${data.num}'" >삭제</button>
                                </td>                                                                       
                            </tr>
                            </c:forEach> 
   						 	                    
                        </tbody>
                     </table>
                       <%--페이징처리--%> 
                       <div style="width:100%; text-aling:center;">                       	
				            <c:if test="${currentPage !=1 }">
								<a href="board.do?currentPage=${currentPage-1 }&recordsPerPage=${recordsPerPage }">[이전페이지]</a>
							</c:if>						
							<c:forEach begin="1" end="${npage }" var="i">
								<c:choose>
									<c:when test="${currentPage eq i }">
										<b><a>[${i }]</a></b>
									</c:when>
									<c:otherwise>
										<a href="board.do?currentPage=${i }&recordsPerPage=${recordsPerPage }">[${i }]</a>
									</c:otherwise>
								</c:choose>			
							</c:forEach>						
							<c:if test="${currentPage !=npage }">
								<a href="board.do?currentPage=${currentPage+1 }&recordsPerPage=${recordsPerPage }">[다음페이지]</a>
							</c:if>
						 </div>
						<div style="width:100%; height:100px; text-align:right;">
	                		<button type="button" id="button" value="글쓰기" onclick="location.href='post_new.jsp'">글쓰기</button>
	                	</div>	                                                  
	                		
            
            
              </div>  
             </div>   
                   
                
            
       
    </body>
</html> 