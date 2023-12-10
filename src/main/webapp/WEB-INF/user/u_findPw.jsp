<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../dogcat_header.jsp"%>
<!DOCTYPE html>
<html>
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
	margin-bottom : 50px;
}
.jumbotron {
	background-color : #fff;
	box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
	width : 50%;
}
</style>
</head>
<body>
       <h1 class="title-main">비밀번호 찾기</h1>
        <div class="container" align="center">
		<div class="jumbotron">
		<div class="logBox"><img src="resources/img/textlogo.png" alt="Logo" style="width: 150px;"></div>
  <h5> 임시 비밀번호가 전송되었습니다. </h5>
  <br/>
  	<h5>${email}을 확인해주세요.</h5>
  <button type="button" class="btn btn-primary" onclick="location.href='/login.do'">로그인페이지</button>
  <button type="button" class="btn btn-primary" onclick="location.href='Main.tot'">메인페이지</button>
  
  		</div>
	</div>
<%@ include file="/dogcat_footer.jsp"%>
</body>
</html>