<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../dogcat_header.jsp"%>
<head>
<meta charset="UTF-8">
<style>
.title-main {
	text-align: center;
}

.container {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 700px;
	width: 100%;
}

.btn {
	margin-top: 10px;
	width: 100%;
	height: 50px;
	background-color: rgba(255, 133, 81, 0.8) !important;
	color: #fff;
	border: none !important;
}

.logBox {
	margin-bottom: 50px;
}

.jumbotron {
	background-color: #fff;
	box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
}

.btn-primary {
	width: 50%;
}

h3 {
	margin-bottom: 15px;
	color: #505050;
}

/* .btn-primary:(#login-btn){ */
/* 	color: #22668d; */
/* 	background-color: white; */
/* 	border: 1px solid #22668d; */
/* } */
</style>
</head>
<body>
	<div class="container" align="center">
		<div class="jumbotron">
			<!-- 		<div class="logBox"><img src="resources/img/textlogo.png" alt="Logo" style="width: 150px;"></div> -->
			<h2 style="display: inline-block; margin-bottom: 50px">
				<b>아이디 찾기</b>
			</h2>
			<h5>아래의 메일 주소로 본인 확인 인증 메일을 전송 했습니다.</h5>
			<h3>
				<b>${email}</b>
			</h3>
			<button type="button" class="btn btn-primary" id="login-btn"
				onclick="location.href='/login.do'">로그인페이지</button>
			<button type="button" class="btn btn-primary"
				onclick="location.href='/findPwView.do'">비밀번호 찾기</button>

		</div>
	</div>
	<%@ include file="/dogcat_footer.jsp"%>
</body>
</html>