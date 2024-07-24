<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>
    <!--   -->

    <style>
        * {
            margin: 0 auto;
            padding: 0;
        }

        a {
            text-decoration: none;
            color: #c5c4c4;
            font-size: 0.9em;
        }
        /* 전체를 감싸고 있음 */
        body {}

        #wrap {
            width: 100%;
            height: 1000px;
        }

        h1 {
            color: #0e2d92;
            margin-bottom: 20px;
        }

        .login {
            width: 300px;
            height: 180px;
             
            text-align: center;
            padding: 15px;

            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #efeff0;
            border-radius: 20px;
            height: 300px;           
            padding: 30px;
        }

        span {
            display: inline-block;
            width: 80px;
        }

        input[type="submit"] {
            width: 200px;
            height: 30px;
            margin: 20px;
        }

        input {
            /* 테두리 없앰 */
            border-width: 0;
            border-bottom: 1px solid #ddd;
            width: 220px;
            height: 40px;
            border-radius: 20px;
            padding-left: 30px;
        }

        span {
            margin-bottom: 25px;
        }

        #sub {
            background: #0e2d92;
            color: #FFF;
            width: 250PX;
            height: 50px;
            border-radius: 23px;
            margin-top: 30px;
          
            /* 추후 수정예정 : 원인 불명 */
            padding-right: 30px;


        }
    </style>
</head>

<body>
    <div id="wrap">

        <div class="login">
            <form method="post" action="login.do">
                <h1>로그인</h1>
               
                <p></p>
                <span> </span><input type="text" name="m_num" autofocus placeholder="사번 "><br>
                <span> </span><input type="password" name="pw" placeholder="비밀번호 "> <br>

                <input id="sub" type="submit" value="로그인">

               


                <c:if test="${result==0 }">
                    <script>
                        let text = document.getElementById("sub");
                        text.style.fontSize = '1.2em';

                        // alert("비밀번호가 틀렸습니다");
                    </script>
                </c:if>
                <c:if test="${result==-1 }">
                    <script>
                        // alert("회원가입이 되어있지 않습니다");


                    </script>
                </c:if>
            </form>
        </div>
    </div>
</body>

</html>