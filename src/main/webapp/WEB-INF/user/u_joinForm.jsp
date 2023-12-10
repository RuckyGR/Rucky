<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/user.js"></script>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.imghom {
   height: 90px;
   cursor: pointer;
   margin-top: 50px;
}

h1 {
   margin-top: 100px;
   color: #333333;
}

/* 비밀번호 보이기 */
span.main {
   position: relative;
}

span.main i {
   position: absolute;
   right: 22px;
   top: 5px;
   font-size: 20px;
   color: rgb(154, 154, 154);
}

/* 인풋 */
input:not(.checkBox) {
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
}

input:focus {
   outline: none;
}

input:hover {
   cursor: pointer;
}

/* 아이디인풋 */
#id {
   margin-left: 95px;
   color: #22668d;
   height: 35px;
   border-color: #22668d;
}

/* 중복확인 버튼 */
#idChk {
   height: 40px;
   background-color: #4692B8;
   color: white;
   border: 1.5px solid #4692B8;
}

#idChk:hover {
   background-color: #22668d;
   color: white;
   transition: background-color 0.3s ease;
}

/* 전화번호 인풋 */
#p_no_input, #p_no_input2, #p_no_input3 {
   width: 76px;
   color: #808080;
   text-align: center;
   vertical-align: middle;
}

#p_no_input {
   color: #FF8551;
   margin-left: 120px;
}

/* 전화번호 하이픈 */
.hypen {
   color: #FF8551;
}

/* 인증번호 전송 버튼 */
#phoneChksendbtn {
   width: 105px;
   height: 33px;
}

/* 인증확인 버튼 */
#phoneChk2 {
   background-color: #4692B8;
}

/* 인증번호 입력 인풋 */
#phoneChk1 {
   margin-left: 93px;
   border-color: #4692B8;
   color: #4692B8;
}

/* 인증번호 입력 인풋 plaeholder 색 변경 클래스 */
.ph_color_change::placeholder {
   color: white;
}

/* 인증번호 인풋, 버튼(문자인증 때) */
.signin_pass2 {
   display: none;
   border-color: #4692B8;
}

/* 이메일인풋 */
#email {
   width: 226px;
   margin-right: 15px;
   margin-left: 0;
}

/* 이메일 셀렉터 */
#domain {
   height: 40px;
   width: 105px;
   border-color: #FF8551;
   border-style: solid;
   border-radius: 2px;
   padding-left: 8px;
   padding-right: 10px;
   border-width: 1.5px;
   outline: none;
   color: #808080;
}

/* 버튼 */
button {
   width: 80px;
   height: 35px;
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
   transition: background-color 0.3s ease;
}

/* 다음 버튼 */
#next, .success {
   background-color: #4692B8;
   color: white;
}

#next:hover, .success:hover {
   background-color: #22668D;
   color: white;
   transition: background-color 0.3s ease;
}

/* 완료 버튼 */
#success {
   display: none;
}

/* 약관 동의 전체 선택 */
#agree_all {
   margin-top: 20px;
/*    margin-left: 550px; */
/*    margin-right: 550px; */
   margin-bottom: 40px;
   padding: 15px 15px;
   border: 2px solid #4692B8;
   border-radius: 2px;
   text-align: left;
   font-size: 15px;
   width: 500px;
}

/* 체크박스 전체 div */
.check_box {
/*    display: none; */
}

/* 하위 약관 선택 */
#check1, #check2, #check3 {
/*    margin-left: 600px; */
/*    margin-right: 600px; */
   margin-bottom: 20px;
   padding: 15px 20px;
   border: 1px solid #FF8551;
   border-radius: 2px;
   text-align: left;
   width: 500px;
}

.checkCh {
   position: relative;
   font-size: 13px;
}

a {
   position: absolute;
   right: 20px;
   color: gray;
   text-align: right;
}

.textbox-content {
   display: none;
   width: 100%;
   height: 100%;
   padding: 10px; /* 내용과 테두리 사이의 간격 조절 */
   box-sizing: border-box; /* 내용의 크기가 padding과 border를 포함하도록 설정 */
   resize: none;
   border: 1px solid #ff8551;
   width: 540px;
   height: 400px;
   outline: none;
}

.close {
   position: absolute;
   bottom: -25px;
   right: 5px;
   color: #4692B8;
   cursor: pointer;
}

/* 미디어 쿼리 추가 */
@media screen and (max-width: 390px) {
   .imghom {
      margin-top: 30px;
   }
   #idChk {
      width: 86%;
      margin-top: 0px;
      background-color: #4692B8;
      color: white;
      border: 1.5px solid #4692B8;
      padding-left: 10px;
      padding-right: 10px;
   }
   .signin_pass2 {
      display: none;
      border-color: #4692B8;
   }
   input:not(.checkBox) {
      width: 80%;
      height: 35px;
      color: #FF8551;
      border-color: #FF8551;
      border-style: solid;
      border-radius: 2px;
      padding-left: 10px;
      padding-right: 10px;
      border-width: 1.5px;
   }
   #id {
      margin-left: 10px;
      margin-bottom: 0px;
      color: #22668d;
      height: 35px;
      border-color: #22668d;
      color: #22668d;
   }
   #idChk {
      height: 35px;
      width: 86%;
      margin-top: 5px;
      background-color: #22668d;
      color: white;
      border: 1.5px solid #22668d;
      padding-left: 10px;
      padding-right: 10px;
   }
   #p_no_input {
      color: #FF8551;
      margin-left: 10px;
   }
   #phoneChksendbtn {
      width: 86%;
      height: 33px;
   }
   #phoneChk1 {
      margin-left: 10px;
      margin-bottom: 0px;
      border-color: #4692B8;
      color: #4692B8;
   }
   #phoneChk2 {
      width: 86%;
      background-color: #4692B8;
   }
   #check1, #check2, #check3 {
      text-align: left;
      margin-left: 0px;
      margin-right: 0px;
      margin-bottom: 5px;
      border-radius: 2px;
      border: 1px solid #FF8551;
      border-radius: 2px;
      border: 1px solid #FF8551;
      padding: 10px 15px;
      width: 77%;
   }
   #agree_all {
      width: 77%;
      margin-top: 20px;
      margin-left: 0px;
      margin-right: 0px;
      margin-bottom: 0px;
      padding: 10px 15px;
      border: 2px solid #4692B8;
      border-radius: 2px;
      margin-bottom: 40px;
   }
   #email {
      width: 175px;
   }
   #p_no_input, #p_no_input2, #p_no_input3 {
      width: 59px;
      margin-bottom: 0px;
   }
   div.check_box {
      margin-bottom: 20px;
   }
   .textbox-container {
      position: relative;
      margin-top: 10px;
      border: 1px solid #ff8551;
      height: 600px;
      display: none;
      overflow-y: auto;
   }
   .textbox-content {
      width: 84%;
      height: 100%;
      padding: 10px;
      box-sizing: border-box;
      resize: none;
      height: 500px;
   }
}
</style>
</head>

<body>

   <div class="container" align="center">
      <div class="col-md-10">
         <!--          <div class="jumbotron"> -->
         <!--             <h1 class="form-signin-heading">회원가입</h1> -->
         <!--          </div> -->
         <div align="center">
            <img
               src="${pageContext.request.contextPath}/resources/img/joinLogo.png"
               onclick="location.href='dogcat_main.jsp'" alt="Logo" class="imghom">
         </div>

         <form class="form-signin" id="u_join.do" action="u_join.do"
            method="post">
            <div class="form-group" id="idInput">
               <input type="text" class="form-control" title="아이디 입력"
                  placeholder="ID" id="id" name="id" oninput="validateIdInput(this)"
                  required autofocus>
               <button class="idChk" type="button" id="idChk" onclick="fn_idChk()"
                  value="N">중복확인</button>
               <br> <small id="idStatus"></small>

            </div>
            <div class="form-group">
               <input type="text" id="name" class="form-control" title="이름 입력"
                  placeholder="Name" name="name" required>
            </div>
            <div>
               <span class="main"> <input type="password"
                  id="passwordInput" class="form-control" name="password"
                  title="비밀번호 입력" placeholder="Password" required
                  oninput="validatePasswordAndConfirm()"> <i
                  class="fa fa-eye fa-lg"></i>
               </span> <br> <small id="errorMessage"></small>
            </div>
            <div class="form-group">
               <input type="password" id="confirmPasswordInput"
                  class="form-control" title="비밀번호 확인"
                  placeholder="Confirm Password" required
                  oninput="validatePasswordAndConfirm()"> <br> <small
                  id="passwordMatchStatus"></small>
            </div>
            <div class="form-group">
               <input type="text" class="form-control" id="p_no_input" value="010"
                  placeholder="010" readonly name="phone1" required> <span
                  class="hypen">-</span> <input type="text" class="form-control"
                  id="p_no_input2" title="전화번호 입력" placeholder="* * * *"
                  oninput="handlePhoneNumberInput1(this)" name="phone2" required>
               <span class="hypen">-</span> <input type="text"
                  class="form-control" id="p_no_input3" title="전화번호 입력"
                  placeholder="* * * *" oninput="handlePhoneNumberInput2(this)"
                  name="phone3" required>
               <button type="button" class="signin_pass" id="phoneChksendbtn"
                  onclick="phoneChksend()">인증번호 전송</button>
               <!--                   phoneChk 클릭시 함수 발동 -->
            </div>
            <div>
               <div>
                  <input class="signin_pass2" id="phoneChk1" type="text"
                     name="phone" title="인증번호 입력" placeholder="Certification Number">
                  <button type="button" class="signin_pass2" id="phoneChk2"
                     onclick="checkIfTimerExpired()">인증확인</button>
                  <!--                phoneChk 클릭시 함수 발동 -->
               </div>
               <div>
                  <small class="time" id="time"></small>
               </div>
            </div>
            <div class="form-group">
               <div class="form-group">
                  <input type="text" class="id" id="email" name="email"
                     title="이메일 입력" placeholder="Email" required> <select
                     id="domain" name="domain" onchange="updateEmailDomain()">
                     <option value="custom">직접 입력</option>
                     <option value="gmail.com">gmail.com</option>
                     <option value="naver.com">naver.com</option>
                     <option value="yahoo.com">yahoo.com</option>
                     <option value="hotmail.com">hotmail.com</option>
                     <option value="outlook.com">outlook.com</option>
                  </select>
               </div>
            </div>
            <div class="check_box" align="center">
               <div id="agree_all">
                  <label for="checkAll"> <input class="checkBox"
                     type="checkbox" name="agree_all" onclick="allchk()" id="checkAll">
                     <span>모두 동의합니다</span></label>
               </div>
               <div id="check1" class="checkCh">
                  <label for="checkInput1"> <input class="checkBox"
                     type="checkbox" name="agree" value="1" onclick="unChk()"
                     id="checkInput1"> <span>이용약관 동의<strong
                        style="color: gray">(필수)</strong></span></label> <a class="details-link"
                     onclick="showDetails('textbox1', 'check1')">[자세히]</a>
               </div>
                  <textarea id="textbox1" class="textbox-content textbox-container" readonly>
                       <%@ include file="/WEB-INF/user/u_agree1.jsp"%>
                   </textarea>
               <br>
               <div id="check2" class="checkCh">
                  <label for="checkInput2"> <input class="checkBox"
                     type="checkbox" name="agree" value="2" onclick="unChk()"
                     id="checkInput2"> <span>개인정보 수집, 이용 동의<strong
                        style="color: gray">(필수)</strong></span></label> <a class="details-link"
                     onclick="showDetails('textbox2', 'check2')">[자세히]</a>
               </div>
                  <textarea id="textbox2" class="textbox-content textbox-container" readonly>
                       <%@ include file="/WEB-INF/user/u_agree2.jsp"%>
                   </textarea>
               <br>
               <div id="check3" class="checkCh">
                  <label for="checkInput3"> <input class="checkBox"
                     type="checkbox" name="agree" value="3" onclick="unChk()"
                     id="checkInput3"> <span>이벤트, 혜택정보 수신동의<strong
                        class="select_disable" style="color: gray">(선택)</strong></span></label>
               </div>
            </div>
            <div style="margin-bottom: 50px;">
               <button type="button" class="btn btn btn-lg btn-success btn-inline"
                  id="next" onclick="activateSignupbtn()">
                  <b>다음</b>
               </button>
               <button type="button" class="btn btn btn-lg btn-success btn-inline"
                  id="success" onclick="isCheckboxChecked()">
                  <b>완료</b>
               </button>
               <button class="btn btn btn-lg btn-success btn-inline" type="button"
                  onclick="javascript:history.back();">
                  <b>취소</b>
               </button>
            </div>
         </form>
      </div>
   </div>
</body>

</html>