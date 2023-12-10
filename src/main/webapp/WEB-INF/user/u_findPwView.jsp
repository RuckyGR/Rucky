<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../dogcat_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var msg = "${msg}";

	if (msg != "") {
		alert(msg);
	}
</script>
<style>
.container {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 700px;
	width: 100%;
}

.col-md-5 {
	background-color: #fff;
	border-radius: 8px;
	padding: 50px;
	box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
}

.btn {
	margin-top: 10px;
	width: 100%;
	height: 50px;
	background-color: rgba(255, 133, 81, 0.8) !important;
	color: #fff;
	border: none !important;
}

.form-control {
	height: 52px;
}

.form-group label {
	text-align: left;
	display: block;
	margin-bottom: 5px;
}

.title-main {
	text-align: center;
}

.tf_required {
	margin-top: 50px;
}
</style>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		var pw_st = "${pw_st}";
		
		if (pw_st === "n") {
			alert("입력하신 정보를 다시 확인해주세요.");
		}
	});
</script>
</head>
<body>
	<div class="container" align="center">
		<div class="col-md-5">
			<h1 class="title-main">비밀번호 찾기</h1>
			<div id="dogcatContent" class="text-center" role="main"></div>

			<form class="user" action="/findPw" method="post">
				<div class="form-group">
					<label for="email" class="tf_required">아이디</label> <input
						type="text" class="form-control form-control-user" id="id"
						aria-describedby="IdHelp" name="id" placeholder="아이디를 입력하세요.">
				</div>

				<div class="form-group">
					<label for="email" class="tf_required1">이메일</label> <input
						type="email" class="form-control form-control-user" id="email"
						aria-describedby="emailHelp" name="email" placeholder="이메일을 입력하세요">
				</div>

				<button type="submit" class="btn btn-primary btn-user btn-block">확인</button>
			</form>
		</div>
	</div>

	<%@ include file="/dogcat_footer.jsp"%>
</body>
</html>