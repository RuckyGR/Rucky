<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../dogcat_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.div-all {
   text-align: center;
   margin-top: 10%;
   margin-left: 35%;
   margin-right: 35%;
   border: none;
   border-radius: 3px; padding : 20px;
   padding-top: 30px;
   padding-bottom: 30px;
   box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.3);
   padding: 20px;
}

.btn-findId {
   padding: 6px 10px;
   border-style: none;
   border-radius: 2px;
   cursor: pointer;
}

.btn-login {
   color: #22668d;
   background-color: white;
   border: 1px solid #22668d;
}

.btn-login:hover {
   color: white;
   background-color: #22668d;
   transition: background-color 0.2s ease;
}

.btn-main {
   color: white;
   background-color: #ff8551;
}

.btn-main:hover {
   color: white;
   background-color: #ff5c16;
   transition: background-color 0.2s ease;
}
</style>
</head>
<body>
   <div class="div-all">
      <h2>
         <b>회원님의 아이디는</b>
      </h2>
      <table class="table table-hover">
         <tbody>
            <c:forEach items="${id}" var="user">
               <tr>
                  <span id="userId_${user.id}"></span>
                  <br>
                  <script>
                     var userId = "${user.id}";
                     var hiddenPart = userId
                           .substring(userId.length - 2).replace(/./g,
                                 '*');
                     var visiblePart = userId.substring(0,
                           userId.length - 2);
                     document.getElementById("userId_${user.id}").innerHTML = visiblePart
                           + hiddenPart;
                  </script>
               </tr>
            </c:forEach>
         </tbody>
      </table>
      <h2 style="margin-bottom: 25px;">
         <b>입니다</b>
      </h2>
      <button type="button" class="btn-login btn-findId"
         onclick="location.href='/member/loginView'">
         <b>로그인하기</b>
      </button>
      <button type="button" class="btn-main btn-findId"
         onclick="location.href='/board/list'">
         <b>메인으로</b>
      </button>
   </div>
   </div>

</body>
</html>