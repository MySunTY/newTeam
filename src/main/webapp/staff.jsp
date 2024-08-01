
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>사원 등록</title>
<link rel="stylesheet" href="css/header.css">
<style>

/* 사원등록 */
.change {
	width: 600px;
	height: 400px;
	border: 1px solid black;
	margin: 0 auto;
	padding: 20px;
}

.picture {
	width: 100px;
	height: 120px;
	border: 1px solid black;
}

span {
	display: inline-block;
	width: 70px;
}

.picture_btn, .data, .btn {
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
		<jsp:include page="header.jsp"></jsp:include>
		<!-- 사원등록 -->
		<div class="contents">
			<div class="title">
				<h2>사원 등록</h2>
			</div>

			<form method="post" enctype="multipart/form-data"
				action="register.do">
				<!-- 사진과 이름, 사번 등을 감싸고 있음 -->
				<div class="change">
					<!-- 사진, 변경 버튼 감싸고 있음 -->
					<div class="picture_btn">
						<!-- 사진은 관리자가 등록하고, 변경만 직원이 가능 -->
						<div class="picture">
							<img src="">
						</div>
						<input type="file" name="photo">
					</div>
					<!-- 개인정보 내용 감싸고 있음 -->
					<div class="data">
						<span>사번</span><input type="text" name="m_num"><br> <span>이름</span><input
							type="text" name="name"><br> <span>비밀번호</span><input
							type="text" name="pw"><br> <span>입사일</span><input
							type="text" name="join_date"><br> <span>주소</span><input
							type="text" name="address"><br> <span>연락처</span><input
							type="text" name="phone"><br> <span>이메일</span><input
							type="email" name="email"><br> <span>관리자</span><input
							type="text" name="admin">
					</div>
					<!-- 버튼을 감싸고 있음 -->
					<div class="btn">
						<input type="reset" value="초기화"> <input type="submit"
							value="등록">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>