
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>휴가 페이지</title>
<link rel="stylesheet" href="css/header.css">
<style>
#middle-1 {
	width: 800px;
	height: 80px;
	line-height: 80px;
	/* border: 1px solid black;*/
	display: flex;
	flex-direction: row;
}

.span {
	width: 300px;
	margin-left: 180px;
}

#middle-2 {
	width: 800px;
	height: 560px;
	display: flex;
	flex-direction: row;
	justify-content: center;
	text-align: center;
	align-items: center;
	/*border: 1px solid black;*/
}

#form-1 {
	width: 100px;
	height: 400px;
	text-align: center;
	/*border: 1px solid black;*/
	position: relative;
	top: 32px;
}

#form-1-1 {
	margin: 0 auto;
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
	/* border: 1px solid black;*/
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

button {
  		
	width: 80px;
	height: 60px;
	border-radius: 15px;
	border: 1px solid #eee;
	 
}

.form-2 {
	width: 600px;
	height: 400px;
	display: fixed;
	/* border: 1px solid black;*/
}

.text {
	
}

textarea {
	width: 100%;
	height: 300px;
	border-radius: 10px;
	resize: none;
	margin-top: 30px;
}

input[type=date], input[type=datetime-local] {
	height: 40px;
}

input[type=submit] {
	width: 100px;
}

.submitbtn{
	width: 120px;
	height:40px;
	border:none;
	border-radius: 10px;
	background-color:  #1537a7;
	color:#fff;
}


.btn input:nth-child(2n){
		}	

#form-1-1 button{
width: 150px;}

 

 

 
</style>

</head>
<body>
	<div id="wrap">
		<jsp:include page="header.jsp"></jsp:include>

		<div class="contents">
			<div class="title">
				<h2>휴가페이지</h2>
			</div>


			<div id="middle-1">
				<div class="span">사원:</div>
				<div class="span">미사용 연차:</div>
			</div>

			<div id="middle-2">
				<div id="form-1">
					<div id="form-1-1">
						<button>연차</button>
						<br>
						<button>반차</button>
						<br>
						<button>휴가</button>
						<br>
						<button>사직</button>
						<br>
					</div>
				</div>

				<!-- 연차 -->
				<form method="post" action="data1.leave" class="form-2">
					<div class="form-2-2">
						<div class="text">
							<input type="hidden" name="leavetype" value="1"> <span>날짜를
								선택하세요</span>&nbsp;&nbsp; <input type="date" name="leave_start"><br>
							<textarea name="reason" id="text_area" cols="80" rows="20"
								placeholder="사유를 입력해주세요"></textarea>
						</div>
						<input type="submit" value="제출!" class="submitbtn">
					</div>
				</form>

				<!--반차-->
				<form method="post" action="data2.leave" class="form-2">
					<div class="form-2-2">
						<div class="text">
							<input type="hidden" name="leavetype" value="2"> <span>날짜와
								시간을 선택하세요</span>&nbsp;&nbsp; <input type="date" name="leave_start">
							<select name="bancha_time">
								<option value="am">오전반차</option>
								<option value="pm">오후반차</option>
							</select>
							<textarea name="reason" id="text_area" cols="80" rows="20"
								placeholder="사유를 입력해주세요"></textarea>
						</div>
						<input type="submit" value="제출!" class="submitbtn">
					</div>
				</form>

				<!--휴가 -->
				<form method="post" action="data3.leave" class="form-2">
					<div class="form-2-2">
						<div class="text">
							<input type="hidden" name="leavetype" value="3"> <span>휴가기간을
								선택하세요</span>&nbsp;&nbsp; <input type="date" name="leave_start">
							&nbsp;~&nbsp; <input type="date" name="leave_end">
							<textarea name="reason" id="text_area" cols="80" rows="20"
								placeholder="사유를 입력해주세요"></textarea>
						</div>
						<input type="submit" value="제출!" class="submitbtn">
					</div>
				</form>

				<!--사직-->
				<form method="post" action="data4.leave" class="form-2">
					<div class="form-2-2">
						<div class="text">
							<input type="hidden" name="leavetype" value="4"> <span>사직서를
								작성해서 제출해주세요</span><br>
							<br>
							<textarea name="reason" id="text_area" cols="80" rows="20"
								placeholder="사직사유를 입력해주세요"></textarea>
						</div>
						<input type="submit" value="제출!" class="submitbtn">
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
		let btns = document.querySelectorAll("button");
		let btnDivs = document.querySelectorAll(".form-2");
		for (var i = 0; i < btnDivs.length; i++) {
			if (i == 0)
				btnDivs[i].style.display = 'block';
			else
				btnDivs[i].style.display = 'none';
		}
		for (var i = 0; i < btns.length; i++) {
			//버튼의 번호를 속성으로 저장
			btns[i].no = i;
			btns[i].addEventListener("click", function(e) {
				for (var j = 0; j < btns.length; j++) {
					btnDivs[j].style.display = 'none';
				}
				btnDivs[this.no].style.display = 'block';
			});
		}
	</script>
</body>
</html>