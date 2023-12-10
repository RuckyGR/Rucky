<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../../dogcat_header.jsp"%>
<style>
/* .logbox{ */
/* bacground-color : white; */
/* border : none; */
/* padding-bottom: 26px; */
/* } */
.container {
   display: flex;
   align-items: center;
   justify-content: center;
   height: 800px;
   width: 100%;
}

.col-md-5 {
   background-color: #ffffff;
   border-radius: 5px;
   padding: 20px;
   box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.3);
}

.logBox {
   text-align: center;
   margin-bottom: 20px;
}

.form-signin {
   text-align: left;
}

.form-group {
   margin-bottom: 15px;
}

label {
   display: block;
   margin-bottom: 5px;
   font-weight: bold;
   color: #495057;
}

.form-control {
   width: 100%;
   padding: 10px;
   border: 1px solid #ced4da;
   border-radius: 4px;
   box-sizing: border-box;
}

.btn-success {
   margin-top: 10px;
   width: 100%; /* Make buttons full width */
   background-color: rgba(255, 133, 81, 0.8) !important;
   color: #fff;
   border: none !important;
}

.btn-success:hover {
   background-color: #FF8551 !important;
}

.alert-danger {
   background-color: #f8d7da;
   border: 1px solid #f5c6cb;
   color: #721c24;
   padding: 10px;
   border-radius: 4px;
   margin-bottom: 15px;
}

.imgbox {
   margin-top: 5px;
   text-align: center;
}

#naver_id_login, #kakao_id_login, #apple_id_login {
   cursor: pointer;
   display: inline-block;
   text-align: center;
   margin-right: 10px;
}

#naver_id_login img, #kakao_id_login img, #apple_id_login img {
   width: auto; /* 이미지 크기를 자동으로 조절 */
   max-width: 100%; /* 이미지의 최대 너비 설정 */
   height: auto; /* 이미지의 가로 세로 비율 유지 */
   max-height: 50px; /* 이미지의 최대 높이 설정 */
}

.nav-item {
   display: inline;
   margin-top: 10px;
   text-align: center;
   color: #303030;
   text-decoration: none;
}

.nav-item:hover {
   text-decoration: underline;
}

.btn-join{
   color: #303030;
   background-color: white;
   border-color: #303030;
   margin-top: 10px;
   width: 100%;
}

.btn-join:hover{
   color: white;
   background-color: #303030;;
   transition: background-color 0.1s ease;
}
</style>
<body>
   <div class="container" align="center">
      <div class="col-md-5">
         <div class="logBox">
            <h1 style="color: #303030;">
               <b>LOGIN</b>
            </h1>
         </div>

         <form class="form-signin" action="login.do" method="post">
            <div class="form-group">
               <label for="inputUserName" class="sr-only">User Name</label> <input
                  type="text" class="form-control" placeholder="ID" name="id"
                  value="${userVO.id}" required autofocus>
            </div>
            <div class="form-group">
               <label for="inputPassword" class="sr-only">Password</label> <input
                  type="password" class="form-control" placeholder="Password"
                  name="password" value="${userVO.password}" required>
            </div>
            <%
            if (request.getAttribute("error") != null) {
               out.println("<div class='alert alert-danger' align='center'>");
               out.println("아이디와 비밀번호를 확인해 주세요");
               out.println("</div>");
            }

            if (request.getParameter("result") != null) {
               out.println("<script>");
               out.println("alert('회원가입이 되었습니다.');");
               out.println("</script>");
            }
            %>
            <button class="btn btn btn-lg btn-success btn-inline" type="submit">로그인</button>
            <button class="btn btn btn-lg btn-join btn-inline"
               style="margin-bottom: 10px" type="button"
               onclick="javascript:location.href='joinForm.do'">회원가입</button>
         </form>
         <a class="nav-item" href="findIdView.do">아이디 찾기</a><span> ㅣ </span> <a
            class="nav-item" href="findPwView.do">비밀번호 찾기</a>
         <div class="imgbox" style="margin-top: 15px">
            <div id="naver_id_login" onclick="nBtn()">
               <img
                  src="${pageContext.request.contextPath}/resources/img/naver.png">
            </div>
            <div id="kakao_id_login" onclick="kakaoLogin()">
               <img
                  src="${pageContext.request.contextPath}/resources/img/kakao_loginbutton.png"
                  style="cursor: pointer;">
            </div>
         </div>
      </div>
   </div>
   <%@ include file="/dogcat_footer.jsp"%>
</body>
</html>