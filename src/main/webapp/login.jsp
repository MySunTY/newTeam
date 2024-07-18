<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
    <html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>로그인 페이지</title>
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
            .login{
                width: 300px;
                height: 180px;
                border: 1px solid black;
                text-align: center;
                padding: 10px;
                
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }
            span{
                display: inline-block;
                width: 80px;
            }
            input[type="submit"]{
                width: 200px;
                height: 30px;
                margin: 20px;
            }
        </style>
    </head>
    <body>
        <div id="wrap">
            <div class="login">
                <form method="post" action="login.do">
                    <h1>로그인</h1>
                    <span>사번</span><input type="text" name="m_num"><br>
                    <span>비밀번호</span><input type="password" name="pw"><br>
                    <input type="submit" value="로그인">
                    <c:if test="${result==0 }">
			        	<script>
			        		alert("비밀번호가 틀렸습니다");
			        	</script>
        			</c:if>
			        <c:if test="${result==-1 }">
			        	<script>
			        		alert("회원가입이 되어있지 않습니다");
			        	</script>
	        		</c:if>
                </form>
            </div>
        </div>
    </body>
</html>