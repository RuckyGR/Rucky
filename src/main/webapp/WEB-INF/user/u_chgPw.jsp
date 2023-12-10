<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.custom-form-label {
	font-weight: bold;
	display: block;
	margin-bottom: 5px;
}

.custom-form-control {
	width: 100%;
	padding: 8px;
	box-sizing: border-box;
	border: 1px solid #9BCDD2;
}

.custom-form-group {
	margin-bottom: 15px;
}
/* 버튼 */
.custom-btn {
	padding: 10px;
	box-sizing: border-box;
	cursor: pointer;
	margin-right: 10px;
}

.unique-btn-primary {
	border: 1px solid #22668D;
	background-color: #fff;
	color: #22668D;
}

.unique-btn-primary:hover {
	background-color: #22668D; /* 호버 시 배경색 변경 */
	color: #fff; /* 호버 시 텍스트 색상 변경 */
}
</style>
<body>
<%@ include file="u_myPage_menu.jsp"%>
   <%-- <%@ include file="../../menu.jsp" %>   --%>
   <div class="container-fluid">

      <form name="fm" action="/chgPw.do" method="post">
         
         <div class="custom-form-group">
			<div class="custom-form-label">현재 비밀번호</div>
			<input type="password" class="custom-form-control" name="currentPassword"
				value="${user.password}">
		</div>
		
		 <div class="custom-form-group">
			<div class="custom-form-label">새 비밀번호</div>
			<input type="password" class="custom-form-control" name="password1" id="passwordInput" oninput="validatePasswordAndConfirm()"><br>
				<small id="errorMessage"></small>
		</div>
		
		<div class="custom-form-group">
			<div class="custom-form-label">새 비밀번호 확인</div>
			<input type="password" class="custom-form-control" name="password2" oninput="validatePasswordAndConfirm()" id="confirmPasswordInput"><br>
				<small id="passwordMatchStatus"></small>
		</div>
      
<%
    if (request.getAttribute("error") != null) {
               out.println("<script>");
               out.println("alert('현재 비밀번호가 일치하지 않습니다');");
               out.println("</script>");
            }
%>
   <div id="footer">
      <button type="submit" class="custom-btn unique-btn-primary">비밀번호 수정</button>
		<button type="button" class="custom-btn unique-btn-primary"
               onclick="javascript:location.href='dogcat_main.jsp';">홈으로</button>
     
   </div>
   </form>
   </div>

<%@ include file = "/dogcat_footer.jsp" %>
</body>
</html>