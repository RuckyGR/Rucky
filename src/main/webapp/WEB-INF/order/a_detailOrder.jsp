<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../admin/a_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.js"></script>
<style>
  @media (max-width: 390px) {   
        span{display: block;}
        .lili{color : white!important;}
        div.container{width : 100%;}
        #od_from_address2{width : 193px;}
        #od_from_address3{width : 193px; display: block;}
        #od_from_message{width : 193px;}
        hr{display: none;}
         .ellipsis {
	display: inline-block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	word-break: break-all;
	width: 175px;
}
    }
	.container{width: 70%; }
	.orderSec{margin: 50px auto; }
	.secTitle {display: block; font-size: 20px; font-weight: bolder; border-bottom: 2px solid black; margin: 10px 0; padding-bottom: 5px;}
	#orderDataDiv{display: none;}
/* 	#toBtn,#fromBtn{margin-bottom : 20px;} */
	.allbtn{background-color: white; color: #22668d; border : 1px solid #22668d; padding : 5px 10px; border-radius: 3px;}
	.allbtn:hover{background-color: #22668d; color : white; transition: background-color 0.3s ease;}
	button.canbtn{background-color: white; color : red; border : 1px solid red;  }
	button.canbtn:hover{background-color: red; color: white; transition: background-color 0.3s ease;}
	/* 	주문상품목록 */
	.proTable{width: 100%; text-align: center; vertical-align: middle;}
	.proImg{  height: 80px; padding: 0; }
	.proTr {border-bottom: 1px solid #ccc; padding: 15px;}
	.proPriceDiv{background-color: #f8f8f8; padding: 20px;}
	.proPriceDivTitle{width: 60%; display: inline-block; float: left; font-size: 16pt; font-weight: bold; padding-left: 30px;}
	.proPriceDivInfo{width: 15%; display: inline-block; float: clear; text-align: right;}
	.totalPriceSpan{color: #FF8551; font-weight: bold; }
	
	/* 	주문 고객 정보 */
	.orderInfotTableSpace { border-collapse: separate; border-spacing: 10px;}
	.orderInfoTable th{padding-right: 30px; }
	.orderInfoTable input{border: 1px solid #8c8c8c; padding: 5px;}
	
	/* 	배송지 정보 */
	#addressSearchBtn{border: 1px solid #ababab; background-color: #ababab; color: white;}
	#addressSearchBtn:hover {border: 1px solid #8c8c8c; background-color: #8c8c8c; color: white;}
	.tdmar{margin-right : 30px;}

	/* 약관 */
	.selectDiv{margin-top: 10px;}
	.selectSpan{display: block; }
	.checklabel:hover, .checkInput:hover{cursor: pointer;}
	.agreeInfoBtn{border: none; background-color: #fff; text-decoration: underline;}
	.agreeInfoBtn:hover, .agreeInfoBtn:active{border: none; background-color: #fff; text-decoration: underline; font-weight: bold;}
	/* 금액 */
	.payInfoTable td{padding-right: 20px;}
	
	/* 금액 + 약관*/
	.priceAgreeDiv{float: left;}
	.priceDiv{width: 40%;}
	.AgreeDiv{width: 60%;}
	#agreeLabel{padding: 5px;}
		
	/*  하단버튼  */
	.btnDiv{text-align: center; margin: 70px;}
	.bottomBtn {padding: 10px; border: none; width: 20%; padding: 20px;}
	#check_module { background-color: #4692B8; color: white; font-weight: bold;}
	#pageBack{background-color: #ababab; color: white;}
	#check_module:hover { color: white;  background-color: #22668D; text-decoration: none; }
	#pageBack:hover { color: white;  background-color: #8c8c8c; text-decoration: none; font-weight: bold;}
</style>
<script>
//주소 api
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            document.getElementById('od_from_address').value = data.zonecode;
            document.getElementById("od_from_address2").value = roadAddr;
            document.getElementById("od_from_address3").value = "";

            var guideTextBox = document.getElementById("guide");
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

$(document).ready(function(){
   
   $("#cancelBtn").click(function () {
      if(!confirm("정말 취소하시겠습니까?")){
         alert("취소되지 않았습니다.");
      }else{
         alert("주문 취소 true");
         $('#canForm').submit();
      }
   });

   $("#fromCancelBtn").hide();
   $("#fromUpdateBtn").hide();   
   $("#toCancelBtn").hide();
   $("#toUpdateBtn").hide();
   
   // 주문자 정보수정 입력
   $("#toBtn").click(function () {
      $("#toCancelBtn").show();
      $("#toUpdateBtn").show();
      $("#toBtn").hide();
      $('#od_to_name').prop("readonly", false);
      $('#od_to_phone').prop("readonly", false);
      $('#od_to_email').prop("readonly", false);
   });
   // 주문자 정보수정 취소
   $("#toCancelBtn").click(function () {
      $("#toBtn").show();
      $("#toCancelBtn").hide();
      $("#toUpdateBtn").hide();
      $('#od_to_name').val("${orderInfo.od_to_name}");
      $('#od_to_phone').val("${orderInfo.od_to_phone}");
      $('#od_to_email').val("${orderInfo.od_to_email}");
   });
   // 주문자 정보수정 하기
   $("#toUpdateBtn").click(function () {
      $("#toBtn").show();
      $("#toCancelBtn").hide();
      $("#toUpdateBtn").hide();
      updateOrder();
   });
   
   // 수취인 정보수정 입력
   $("#fromBtn").click(function () {
      $("#fromBtn").hide();
      $("#fromCancelBtn").show();
      $("#fromUpdateBtn").show();
      $('#addressAPI').attr( "type", "button" );
      $("#od_from_name").prop("readonly", false);
      $("#od_from_phone").prop("readonly", false);
      $("#od_from_address3").prop("readonly", false);
      $("#od_from_message").prop("readonly", false);
   });
   // 수취인 정보수정 취소
   $("#fromCancelBtn").click(function () {
      $("#fromBtn").show();
      $("#fromCancelBtn").hide();
      $("#fromUpdateBtn").hide();
      $('#addressAPI').attr( "type", "hidden" );
      $('#od_from_address').val("${orderInfo.od_from_address}");
      $('#od_from_address2').val("${orderInfo.od_from_address2}");
      $('#od_from_address3').val("${orderInfo.od_from_address3}");
      $('#od_from_message').val("${orderInfo.od_from_message}");
   });
   
   // 수취인 정보수정 하기
   $("#fromUpdateBtn").click(function () {
      $("#fromBtn").show();
      $("#fromCancelBtn").hide();
      $("#fromUpdateBtn").hide();
      updateOrder();
   });

   $("#updateBtn").click(function () {
      updateOrderDelivery();
   });

   // 주문상태 변경
   $("#deliverBtn").click(function () {
      $('#updateDiv').attr( "style", "display: inline" );
      $("#deliverBtn").hide();
   });
   

   
   $("#cancelUBtn").click(function () {
      $("#deliverBtn").show();
      $("#updateDiv").hide();
   });
   
});

//   "od_delivery": $("#od_delivery option:selected").text(),
function updateOrderDelivery(){
   $.ajax({
      url : "updateOrder.od",
      data : {
         "od_num": $("#od_num").val(),
         "od_delivery": $("select[name=od_delivery]").val(),
         "searchCondition": "${conditionMap['a_delivery']}"
         },
      method : "POST",
      success : function(val){
         console.log(val);
         if(val==1){
            alert("수정 완료되었습니다.");
            $('#cancelUBtn').hide();
            $('#updateBtn').hide();
            location.reload();
         }
         else alert("수정 실패했습니다.");
      },
      error :  function(request, status){
         alert("수정 실패했습니다. error");
      }
   });
}

    
function updateOrder(){
   $.ajax({
      url : "updateOrder.od",
      data : {
         "od_num": $("#od_num").val(),
         "od_to_name": $("#od_to_name").val(),
         "od_to_phone": $("#od_to_phone").val(),
         "od_to_email": $("#od_to_email").val(),
         "od_from_name": $("#od_from_name").val(),
         "od_from_phone": $("#od_from_phone").val(),
         "od_from_address": $("#od_from_address").val(),
         "od_from_address2": $("#od_from_address2").val(),
         "od_from_address3": $("#od_from_address3").val(),
         "od_from_message": $("#od_from_message").val(),
         "searchCondition": "${conditionMap['a_info']}"
         },
      method : "POST",
      success : function(val){
         console.log(val);
         if(val==1){
            alert("변경 완료되었습니다.");
         }
         else alert("변경 실패했습니다.");
      },
      error :  function(request, status){
         alert("수정 실패했습니다. error");
      }
   });
}

</script>
</head>
<body>
<div class="container">
	<br>
<section class="detailSec orderInfoSec">
	<h1>주문상세내역</h1> <br><br>
	<span>
		주문일자 <b>${orderInfo.od_date}</b>&nbsp; <span style="color : #ccc;" class="lili">|</span>
		주문번호 <b>${orderInfo.od_num}</b>&nbsp; <span style="color : #ccc;" class="lili">|</span>
		주문상태 <b>${orderInfo.od_delivery }</b></span>
		<c:if test="${ orderInfo.od_delivery ne '주문취소'}"> <button type="button" id="deliverBtn" class="allbtn">상태변경</button>&nbsp; </c:if>
		
		<div id="updateDiv" style="display: none;">
         <form class="form-inline" method="post" action="updateOrder.od" id="updateForm">
            <input type="hidden" id="od_num" name="od_num" value="${orderInfo.od_num }">
            <select class="form-control" id="sel1" name="od_delivery" id="od_delivery" >
               <option value="결제완료" >결제완료</option>
               <option value="상품준비중">상품준비중</option>
               <option value="배송중">배송중</option>
               <option value="배송완료">배송완료</option>
            </select>&nbsp;
               <button type="button" id="updateBtn" class="allbtn">변경</button>&nbsp;
					<button type="button" id="cancelUBtn" class="allbtn">취소</button>
         </form>
      </div>
</section>	
	

	<br><hr><br>
<section class="detailSec orderProSec">
	<p class="secTitle">주문상품정보</p>
	<p>주문 상품종류 <b>${itemLength }</b>개</p>		
	<table class="proTable orderProTable">
		<tr class="proTr tableThTr">
			<th>제품명</th>
			<th>판매가</th>
			<th>수량</th>
			<th>구매금액</th>
		</tr>
		<c:forEach items="${orderItem }" var="item">
			<tr>
				<td class="ellipsis"><br>
					<img class="proImg" src="${pageContext.request.contextPath}/resources/img/productImg/${item.pro_filename}" style="float: left;">
					${item.pro_name }
				</td>
				<td>
					<fmt:formatNumber value="${item.pro_price }" pattern="#,###"/>원
				</td>
				<td>
					<fmt:formatNumber value="${item.od_count }" pattern="#,###"/> 개
				</td>
				<td>
					<fmt:formatNumber value="${item.od_price }" pattern="#,###"/>원
				</td>
			</tr>
		</c:forEach>
	</table>
</section>	
	<br><hr><br>
<section class="detailSec orderPaySec">
	<p class="secTitle">결제정보</p>
	<br>		

	<table class="proTable orderProTable">
		<tr>
			<th>주문금액</th>
			<th>배송비</th>
			<th>결제금액</th>
			<th>결제수단</th>
		</tr>
			<tr>
				<td>
					<fmt:formatNumber value="${orderInfo.od_totprice }" pattern="#,###"/>원
				</td>
				<td>
					<fmt:formatNumber value="${orderInfo.od_delivercost }" pattern="#,###"/>원
				</td>
				<td>
					<fmt:formatNumber value="${orderInfo.od_payprice }" pattern="#,###"/>원
				</td>
				<td>
					${orderInfo.od_payment}
				</td>
			</tr>
	</table>
</section>
	
	<br><hr>
	
<section class="orderSec">	
	<p class="secTitle">구매자정보</p>
		<div class="orderInfoDiv" id="orderToInfoDiv">
		<table class="toInfoTable orderInfoTable orderInfotTableSpace" >
		<tr>
				<th>주문자</th>
				<td>
					<input type="text" size="30" name="od_to_name" id="od_to_name" value="${orderInfo.od_to_name}" readonly>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="email" size="30" name="od_to_email" id="od_to_email" value="${orderInfo.od_to_email}" placeholder="이메일을 입력해주세요." readonly>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="tel" size="30" name="od_to_phone" id="od_to_phone" value="${orderInfo.od_to_phone}" placeholder="전화번호를 입력해주세요." readonly>
				</td>
				</tr>
	</table>
	</div>
	<br>
	<button type="button" id="toBtn" class="allbtn">구매자 정보변경</button><br>
	<button type="button" id="toUpdateBtn" class="allbtn">확인</button>
	<button type="button" id="toCancelBtn" class="allbtn">취소</button>
</section>

	<hr>
	
<section class="orderSec">
	<h3>배송지정보</h3>
	<p class="secTitle">배송지정보</p>
		<div class="orderInfoDiv" id="orderFromInfoDiv">
		<table class="fromInfoTable orderInfoTable orderInfotTableSpace">
		<tr>
			<td  class="tdmar">받는 사람</td>
			<th>
				<input type="text" size="30" name="od_from_name" id="od_from_name" value="${orderInfo.od_from_name}" placeholder="수취인명을 입력해주세요." readonly>
			</th>
		</tr>
		<tr>
			<td  class="tdmar">전화번호</td>
			<th>
				<input type="text" size="30" name="od_from_phone" id="od_from_phone" value="${orderInfo.od_from_phone}" placeholder="전화번호를 입력해주세요." readonly>
			</th>
		</tr>
		<tr>
			<td  class="tdmar">주소</td>
			<th>
				<input type="text" size="30" name="od_from_address" id="od_from_address" placeholder="우편번호" value="${orderInfo.od_from_address}" readonly>
		<input type="hidden" onclick="sample4_execDaumPostcode()" id="addressAPI" value="우편번호 찾기"><br>
		<input type="text"  name="od_from_address2" size=50 id="od_from_address2" style="margin-top : 10px;"placeholder="도로명주소" value="${orderInfo.od_from_address2}" readonly>
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text"  name="od_from_address3" id="od_from_address3" style="margin-top : 10px;" placeholder="상세주소를 입력해주세요." value="${orderInfo.od_from_address3}" readonly>
			</th>
		</tr>
		<tr>
			<td  class="tdmar">배송 요청사항</td>
			<th>
				<input type="text" name="od_from_message" id="od_from_message" size=50 placeholder="배송메모를 입력해주세요." value="${orderInfo.od_from_message}" readonly>
			</th>
		</tr>
		
</table>
	</div>
	<br>
	<button type="button" id="fromBtn" class="allbtn">배송지 정보변경</button>
	<button type="button" id="fromUpdateBtn" class="allbtn">확인</button>
	<button type="button" id="fromCancelBtn" class="allbtn">취소</button>
</section>		
		<br><hr>
	
<form id="canForm" action="paycan?mid=${item.od_num }" method="post" >
	<button type="submit" id="cancelBtn" class="allbtn canbtn">주문취소</button>
</form>

</div>
<br>
</body>
</html>