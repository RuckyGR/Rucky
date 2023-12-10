//회원 관련 자바스크립트 함수!!!----------------------------------

// 자세히 버튼 함수
function showDetails(textboxId, chkId) {
    var textbox = document.getElementById(textboxId);
    textbox.style.display = 'block';
    $("#"+chkId).children("a.details-link").text("[닫기]");
    $("#"+chkId).children("a.details-link").attr("onclick","hideDetails('"+textboxId+"','"+chkId+"')");
}

function hideDetails(textboxId, chkId) {
    var textbox = document.getElementById(textboxId);
    textbox.style.display = 'none';
    $("#"+chkId).children("a.details-link").text("[자세히]");
    $("#"+chkId).children("a.details-link").attr("onclick","showDetails('"+textboxId+"','"+chkId+"')");
}

//    카카오 로그인
function kakaoLogin() {
   location.href ='/getAuthUrl';
}

//네이버 로그인
function nBtn(){
	location.href = "/getNaverAuthUrl?inout=1";
}


//유저상세보기버튼
   function selUser(val){
   location.href = "selUser.do?id="+val;
}

//비밀번호 변경 버튼
   function goChgPw(val){
   location.href = "goChgPw.do?id="+val;
}


//회원 탈퇴
function delUser(val, url, msg){
   if(val == 'admin'){
      alert(msg);
   }else{
    location.href=url+"?id="+val;
   }
}

//회원가입-----------------------------------------------------------------------------------------------------------
var idConfirm = 2; //id 중복 체크
var pwdCheck = 0; //비번
var pwCheck = 0; //비번 체크
var pnoCheck = 0; //문자인증
var p_no = 0; //폰번호 전체
var phoneNumber1 = 0; //폰번호1
var phoneNumber2 = 0; //폰번호2
var checkbox = 0; //약관 체크 여부

//아이디
function validateIdInput(input) {
    var idStatus = $("#idStatus");
    var idPattern = /[^A-Za-z0-9]/;

    // 아이디 유효성 검사 - 영어와 숫자 이외의 문자 포함 여부 확인
    if (!idPattern) {
        idStatus.text("영어와 숫자 이외의 문자는 사용할 수 없습니다.");
        idStatus.css("color", "red");
    } else {
        idStatus.text(""); // 에러 메시지 지우기
    }

}

function fn_idChk() {
    var idInput = $("#id");
    var idStatus = $("#idStatus");
    var id = idInput.val();

    // 아이디 유효성 검사
    var idPattern = /^[a-zA-Z0-9]{4,15}$/; // 4자 이상, 15자 이하
    if (!idPattern.test(id)) {
        idStatus.text("아이디는 4자 이상 15자 이하의 영문 대소문자와 숫자로 구성되어야 합니다.");
        idStatus.css("color", "red");
        return;
    }

    if (idStatus.text()) {
        // 아이디에 에러 메시지가 있는 경우 중복 확인 요청을 하지 않음
        return;
    }

    $.ajax({
        url: "/idChk.do",
        type: "post",
        data: { "id": id },
        success: function (data) {
            if (data == 1) {
                idStatus.text("중복된 아이디입니다.");
                idStatus.css("color", "red");
                idConfirm = 0;
            } else if (data == 0) {
                $("#idChk").attr("value", "Y");
                idStatus.text("사용가능한 아이디입니다.");
                idStatus.css("color", "green");
                idInput.css("background-color", "#FF8551"); // 배경색 변경
                idInput.css("color", "white"); // 글자색 변경
                idConfirm = 1;
            }
        }
    });
}

//비밀번호
function validatePasswordAndConfirm() {
    var passwordInput = document.getElementById("passwordInput");
    var confirmPasswordInput = document.getElementById("confirmPasswordInput");
    var passwordMatchStatus = document.getElementById("passwordMatchStatus");
    var errorMessage = document.getElementById("errorMessage");

    var password = passwordInput.value;
    var confirmPassword = confirmPasswordInput.value;

    var regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~`!@#$%^*()_\-={}[\]|;:<>,.?/])[A-Za-z\d~`!@#$%^*()_\-={}[\]|;:<>,.?/]{8,16}$/;

    if (!password) {
        // 인풋 창에 아무 것도 입력하지 않았을 때
        errorMessage.textContent = ""; // 에러 메시지를 빈 문자열로 설정하여 숨깁니다.
    } else if (!regex.test(password)) {
        errorMessage.textContent = "비밀번호는 영문자/숫자/특수문자 조합, 8자~16자여야 합니다.";
        errorMessage.style.color = "red";
        pwdCheck = 0;
    } else {
        errorMessage.textContent = "사용 가능한 비밀번호입니다.";
        errorMessage.style.color = "green";
        pwdCheck = 1;
    }

    if (password === confirmPassword) {
        passwordMatchStatus.textContent = "일치합니다";
        passwordMatchStatus.style.color = "green";
        pwCheck = 1;
    } else {
        passwordMatchStatus.textContent = "불일치합니다";
        passwordMatchStatus.style.color = "red";
        pwCheck = 0;
    }
}

//비밀번호 눈깔
$(document).ready(function () {
  $('.main i').on('click', function () {
        $('input').toggleClass('active');
        if ($('input').hasClass('active')) {
            $(this).attr('class', "fa fa-eye-slash fa-lg")
                .prev('input').attr('type', "text");
        } else {
            $(this).attr('class', "fa fa-eye fa-lg")
                .prev('input').attr('type', 'password');
        }
    });
});


var pnoErrorMessage = $("#pnoErrorMessage");

// 전화번호1
function handlePhoneNumberInput1(input) {
    // 입력값에서 숫자 이외의 문자를 제거

    phoneNumber = input.value.replace(/[^0-9]/g, '');

    // 입력값이 4자 초과일 경우, 처음 4자까지만 유지
    if (phoneNumber.length > 4) {
        phoneNumber = phoneNumber.slice(0, 4);
    }

    // 결과를 입력 필드에 설정
    input.value = phoneNumber;
    phoneNumber1 = phoneNumber;
}

// 전화번호2
function handlePhoneNumberInput2(input) {
    // 입력값에서 숫자 이외의 문자를 제거
    phoneNumber = input.value.replace(/[^0-9]/g, '');

    // 입력값이 4자 초과일 경우, 처음 4자까지만 유지
    if (phoneNumber.length > 4) {
        phoneNumber = phoneNumber.slice(0, 4);
    }

    // 결과를 입력 필드에 설정
    input.value = phoneNumber;
    phoneNumber2 = phoneNumber;
}

// 이메일
var previousEmail = ""; // 이전 이메일 값을 저장할 변수

function updateEmailDomain() {
    var emailInput = document.getElementById("email");
    var domainSelect = document.getElementById("domain");
    var selectedDomain = domainSelect.value;

    if (selectedDomain === "custom") {
        // "직접 입력"을 선택한 경우 이전 이메일 값을 사용
        emailInput.value = previousEmail;
    } else {
        // 사용자가 선택한 도메인을 이메일 주소 뒤에 추가
        var currentEmail = emailInput.value;
        var atIndex = currentEmail.indexOf("@");
        var username = atIndex !== -1 ? currentEmail.substring(0, atIndex) : currentEmail;
        emailInput.value = username + "@" + selectedDomain;
    }

    // 현재 입력 값을 이전 이메일 값으로 업데이트
    previousEmail = emailInput.value;
}

//휴대폰 인증(인증번호 전송 버튼)
function phoneChksend() {

    p_no = "010" + "" + phoneNumber1 + "" + phoneNumber2;

    // 입력값이 4자가 아닌 경우 경고 메시지 표시
    if (phoneNumber1.length !== 4 || phoneNumber2.length !== 4) {
        alert("전화번호 형식이 올바르지 않습니다.");
    } else {
        startTimer();
        $(".signin_pass2").css("display", "inline-block"); //숨긴 인풋태그 활성화
        $(".time").css("display", "inline-block"); //숨긴 인풋태그 활성화
        $("#phoneChk1").prop('disabled', false).css('background-color', '');
        $("#phoneChk1").css("color", "#4692B8");
        $("#phoneChk1").css("margin-right", "10px");
        $.ajax({    
            type: "POST", // post 형식으로 발송
            url: "sendSMS.do", // controller 태우기
            data: { phoneNumber: p_no },
            cache: false,
            success: function (data) {  //성공시
                code2 = data; // 성공하면 데이터저장
            }
        });
    }
}

// 휴대폰 인증번호 대조(인증확인 버튼)
function checkIfTimerExpired() {

    var phoneChk1 = $("#phoneChk1");
    var PCNo = phoneChk1.val();

    if (PCNo == code2) { // 위에서 저장한 값과 비교
        clearInterval(timer); // 타이머 멈추기
        $(".time").css('color', 'green');
        $(".time").html('인증완료')
        $("#phoneChk2").css("display", "none"); //인증버튼 숨기기
        $("#phoneChk1").prop('disabled', true).css('background-color', '#4692B8').css('color', 'white').css('margin-right', '94px'); //인증완료 후 입력창 잠그기
        pnoCheck = 1;
    } else {
        alert('인증실패');
        pnoCheck = 0;
    }
}

var timer;
var isRunning = false; // isRunning 변수를 전역 범위에서 정의

// 타이머
function startTimer() {
    var display = $(".time"); // display 변수 설정
    var leftSec = 180; // 유효시간 설정 (예시로 20으로 설정)

    // 이미 타이머가 실행 중인 경우 중지
    if (isRunning) {
        clearInterval(timer);
    }

    isRunning = true;

    // startTimer 함수 호출
    timer = setInterval(function () {
        var minutes = parseInt(leftSec / 60, 10);
        var seconds = parseInt(leftSec % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.html(minutes + ":" + seconds);
        display.css('color', 'red');

        // 타이머 끝
        if (--leftSec < 0) {
            clearInterval(timer);
            display.css('color', 'red');
             display.html('시간초과');
            $("#phoneChk1").val("").prop('disabled', true).css('background-color', '#4692B8').css("margin-right", "94px");
            // $("#phoneChk1").toggleClass('ph_color_change');
            //$("#phoneChk1").attr("placeholder", "time out").toggleClass('ph_color_change');
            $("#phoneChk2").css("display", "none"); //인증버튼 숨기기
            $("#phoneChksendbtn").text("재전송").css("width", "80px").css('margin-right', '25px');
            //display.css("display", "none"); //시간 숨기기
            isRunning = false;
        }
    }, 1000);
}

//유효성 전체 확인
function activateSignupbtn() {
    var form = document.getElementById('joinform');
    /* alert(
        "idConfirm" + idConfirm +
        "pwdCheck" + pwdCheck +
        "pwCheck" + pwCheck +
        "pnoCheck" + pnoCheck
    ) */

    if (idConfirm == 1 && pwdCheck == 1 && pwCheck == 1 && pnoCheck == 1 && checkbox == 0) {
        $("#next").css("display", "none"); //다음 버튼 숨기기
        $(".check_box").css("display", "inline-block"); //숨긴 약관 표시
        $("#success").css("display", "inline-block"); //숨긴 완료 버튼 표시
    } else {
        if (idConfirm == 2) {
            alert("아이디 중복확인을 해주세요.");
        } else {
            alert("작성 양식을 다시 확인해주세요.")
        }
    }
}


//전체 체크박스 체크 시 전체 체크
function allchk() {
    var checkbox1 = document.getElementById('checkInput1');
    var checkbox2 = document.getElementById('checkInput2');
    var checkbox3 = document.getElementById('checkInput3');
    var checkboxAll = document.getElementById('checkAll') // 체크박스의 ID를 사용

    if (checkboxAll.checked) {
        checkbox1.checked = true;
        checkbox2.checked = true;
        checkbox3.checked = true;
    } else if(!checkboxAll.checked){
        checkbox1.checked = false;
        checkbox2.checked = false;
        checkbox3.checked = false;
    }
}

//밑 체크박스 전체 선택 시 전체 체크박스 체크
//밑 체크박스 해제 시 전체 해제
function unChk() {
    var checkbox1 = document.getElementById('checkInput1');
    var checkbox2 = document.getElementById('checkInput2');
    var checkbox3 = document.getElementById('checkInput3');
    var checkboxAll = document.getElementById('checkAll') // 체크박스의 ID를 사용

    if (!checkbox1.checked || !checkbox2.checked || !checkbox3.checked) {
        checkboxAll.checked = false;
    }else if (checkbox1.checked && checkbox2.checked && checkbox3.checked) {
        checkboxAll.checked = true;
    }
}

//약관 동의 여부
function isCheckboxChecked() {
    // 체크박스 요소를 가져옴
    var checkbox1 = document.getElementById('checkInput1');
    var checkbox2 = document.getElementById('checkInput2'); // 체크박스의 ID를 사용
    var buttonElement = document.getElementById('next');
    var form = document.getElementById('u_join.do');

    // 체크박스가 선택되었는지 확인
    if (checkbox1.checked && checkbox2.checked) {
        buttonElement.type = 'submit';
        form.submit(); // 폼 제출
    } else {
        alert("이용 약관을 확인해주세요");
    }
}



//회원관련 끝-------------------------------------------------------------