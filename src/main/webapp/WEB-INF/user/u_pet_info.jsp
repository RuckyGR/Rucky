<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 폼</title>
<style>
h1 {
	margin-top: 100px;
	color: 333333;
}

/* 인풋 */
input, select {
	width: 350px;
	height: 35px;
	margin: 10px;
	color: #FF8551;
	border-color: #FF8551;
	border-style: solid;
	border-radius: 2px;
	padding-left: 10px;
	padding-right: 10px;
	border-width: 1.5px;
	outline: none;
}

input:focus {
	outline: none;
}

input:hover {
	cursor: pointer;
}

/* 폼 전체 */
#form_div {
	text-align: center;
}

/* 버튼 */
button {
	width: 80px;
	height: 40px;
	margin-top: 5px;
	color: white;
	border: 0;
	outline: 0;
	background-color: #FF8551;
	border-radius: 2px;
}

button:hover {
	cursor: pointer;
	background-color: #ff6523;
}

/* 회원가입 버튼 */
#sbm1, #sbm2 {
	background-color: #4692B8;
	color: white;
}

#sbm1:hover, #sbm2:hover {
	background-color: #22668D;
	color: white;
}
</style>
</head>
<body>
	<div class="col-md-10" id="form_div">
		<h1 class="form-signin-heading">반려동물 등록하기</h1>
		<form class="form-signin" action="join.do" method="post">
			<!-- 초기 폼 그룹 -->
			<div class="form-group">
				<select class="form-control" name="type">
					<option disabled>종류 선택</option>
					<option value="">없음</option>
					<option value="Dog">강아지</option>
					<option value="Cat">고양이</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="이름 입력"
					name="pet_name">
			</div>
			<div class="form-group">
				<input type="date" class="form-control" placeholder="생일 입력"
					name="pet_birth">
			</div>
			<button class="btn btn btn-lg btn-success btn-inline" type="button"
				onclick="javascript:history.back();">이전 화면</button>
			<button class="btn btn btn-lg btn-success btn-inline" id="sbm1"
				type="submit" onclick="javascript:alert('회원가입이 완료되었습니다!');">회원가입</button>
		</form>
	</div>
</body>
</html>