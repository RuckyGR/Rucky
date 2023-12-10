<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../dogcat_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOGCATPUNCH : 주문서 작성</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>


	.container{width: 70%; }
	.orderSec{margin: 50px auto; }
	.secTitle {display: block; font-size: 20px; font-weight: bolder; border-bottom: 2px solid black; margin: 0; padding-bottom: 5px;}
	#orderDataDiv{display: none;}

	/* 	주문상품목록 */
	.proTable{width: 100%; text-align: center; vertical-align: middle;}
	.proImg{ width: 80px; height: 80px; }
	.proImgTd{width: 100px; padding: 10px;}
	.proTr {border-bottom: 1px solid #ccc; padding: 15px;}
	.proPriceDiv{background-color: #f8f8f8; padding: 20px;}
	.proPriceDivTitle{width: 60%; display: inline-block; float: left; font-size: 16pt; font-weight: bold; padding-left: 30px;}
	.proPriceDivInfo{width: 15%; display: inline-block; float: clear; text-align: right;}
	.totalPriceSpan{color: #FF8551; font-weight: bold; }
	
	/*input 사이즈*/
	.insInpSize1{width: 265px;}
	.insInpSize2{width: 415px;}
	
	/* 	주문 고객 정보 */
	.orderInfotTableSpace { border-collapse: separate; border-spacing: 10px;}
	.orderInfoTable th{padding-right: 30px; }
	.orderInfoTable input{border: 1px solid #8c8c8c; padding: 5px;}
	/* 	배송지 정보 */
	#addressSearchBtn{border: 1px solid #ababab; background-color: #ababab; color: white;}
	#addressSearchBtn:hover {border: 1px solid #8c8c8c; background-color: #8c8c8c; color: white;}

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
	
@media screen and (max-width: 390px) {
	.container {
	width: 100%;
	}
	.ellipsis {
	display: inline-block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	word-break: break-all;
	width: 62px;
	}
	.proPriceDivTitle {
	padding: 0px;
	width: 120px;
	}
	.proPriceDivInfo {
	width: 110px;
	display: inline;
	}
	.proPriBox {
	width: 350px;
 	display: flex;
 	justify-content: flex-start;
	}
	.insOrTr {
	display: flex;
	}
	.insOrTh {
	width: 82px;
	padding-right: 1px !important;
	}
	.insOrTd {
	width: 252px;
	}
	#od_from_address {
	width: 149px;
	}
	.adrs {
	width: 348px;
	}
	.insOrTdAdr {
	width: 268px;
	}
	.orMemo {
	width: 266px;
	}
	.orMemo {
/* 	text-overflow: ellipsis; */
	}
	.orMemo::placeholder {
	font-size: 15px;
	}
	.orPriceBox {
    display: flex;
    flex-wrap: wrap;
	}
	.orPriceName {
    width: 101px;
	}
	.orPriceTT {
	width: 82px;
	}
	.orPriceTTT {
	width: 102px;
	}
	.selectSpan {
/*  	display: flex; */
	}
	.checklabel {
	padding-left: 20px;
	}
	.checklabel1 {
	margin-bottom: 0px;
	}
	.selectSpan1 {
	display: flex;
	}
	.selectSpan2 {
	display: flex;
	}
	.agreeInfoBtn {
	margin-left: 27px;
	}
	.allCheck {
	padding-left: 20px !important;
	}
	.allCheckBox {
	padding-right: 0px !important;
	}
	#pageBack {
	width: 130px;
	}
	#check_module {
	width: 130px;
	}
	.btnDiv {
	margin: 70px 20px;
	}
	.agreeCheckboxSpan {
	margin-bottom: 10px;
	}
}
</style>
</head>
<body>
<div class="container">
<h3><strong>주문서 작성</strong></h3>

<form id="insertFrm" name="fm">

<input type="hidden" name="od_payname" id="od_payname" value="${orderInfo.od_payname }">
<input type="hidden" name="id" value="${orderUser.id}">
<input type="hidden" name="od_payment" value="card">

<section class="orderSec">

	<p class="secTitle">주문상품 목록</p>
	<table class="proTable orderProTable">
		<tr class="proTr tableThTr">
			<th colspan="2">상품정보</th>
			<th>판매가격</th>
			<th>수량</th>
			<th>주문금액</th>
		</tr>
		<c:forEach items="${orderItemList }" var="item">
			<input type="hidden" name="orders[${item.index_no}].pro_no" value="${item.pro_no }">
			<input type="hidden" name="pro_name" value="${item.pro_name }">
			<input type="hidden" name="orders[${item.index_no}].pro_price" value=${item.pro_price }>
			<input type="hidden" name="orders[${item.index_no}].od_count" value="${item.od_count }">
			<input type="hidden" name="orders[${item.index_no}].od_price" value="${item.od_price}">
			<tr>
				<td class="proImgTd">
					<img class="proImg" src="${pageContext.request.contextPath}/resources/img/productImg/${item.pro_filename}" style="float: left;">
				</td>
				<td class="ellipsis" data-toggle="modal" data-target="#productModal${item.pro_no}">
					${item.pro_name }
				</td>
				<td>
					<fmt:formatNumber value="${item.pro_price}" pattern="#,###"/> 원
				</td>
				<td>
					<fmt:formatNumber value="${item.od_count }" pattern="#,###"/> 개
				</td>
				<td>
					<fmt:formatNumber value="${item.od_price}" pattern="#,###"/> 원
				</td>
			</tr>
			<div class="modal fade" id="productModal${item.pro_no}">
			  <div class="modal-dialog modal-dialog-scrollable modal-sm">
			    <div class="modal-content">
			    
			      <div class="modal-header">
			        <h3 class="modal-title">상품명</h3>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			      
			      <div class="modal-body">
						${item.pro_name }
			      </div>
			      
			      <div class="modal-footer">
			        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
			      </div>
			      
			    </div>
			  </div>
			</div>
		</c:forEach>
	</table>
	<div class="proPriceDiv container-fluid">
		<div class="proPriceDivTitle">총 주문금액</div>
		<div class="proPriBox">
		<div class="proPriceDivInfo">
			상품 총 금액 
			<br>
			배송비 
			<br>
			<strong>결제 예정 금액 </strong>
		</div>
		<div class="proPriceDivInfo">
			<fmt:formatNumber value="${orderInfo.od_totprice}" pattern="#,###"/> 원
			<br>
			<fmt:formatNumber value="${orderInfo.od_delivercost}" pattern="#,###"/> 원
			<br>
			<span class="totalPriceSpan"><fmt:formatNumber value="${orderInfo.od_totprice + orderInfo.od_delivercost}" pattern="#,###"/></span> 원
		</div>
		</div>
	</div>
			
	

</section>
<section class="orderSec">

	<p class="secTitle">주문고객 정보</p>
	<div class="orderInfoDiv" id="orderToInfoDiv">
		<table class="toInfoTable orderInfoTable orderInfotTableSpace" >
			<tr class="insOrTr">
				<th class="insOrTh">주문자명</th>
				<td class="insOrTd">
					<input type="text" class="insInpSize1" name="od_to_name" id="od_to_name" value="${orderUser.name}" required>
				</td>
			</tr>
			<tr class="insOrTr">
				<th class="insOrTh">ID</th>
				<td class="insOrTd">
					<input type="text" class="insInpSize1" name="id" id="id" value="${orderUser.id}" disabled>
				</td>
			</tr>
			<tr class="insOrTr">
				<th class="insOrTh">전화번호</th>
				<td class="insOrTd">
					<input type="tel" class="insInpSize1" name="od_to_phone" id="od_to_phone" value="${orderUser.phone}" required>
				</td>
			</tr>
			<tr class="insOrTr">
				<th class="insOrTh">이메일</th>
				<td class="insOrTd">
					<input type="email" class="insInpSize1" name="od_to_email" id="od_to_email" value="${orderUser.email}" required>
				</td>
			</tr>
		</table>
	</div>
</section>
<section class="orderSec">

	<p class="secTitle">배송지 정보</p>
	<div class="orderInfoDiv" id="orderFromInfoDiv">
		<table class="fromInfoTable orderInfoTable orderInfotTableSpace">
			<tr class="insOrTr">
				<th class="insOrTh">수령인</th>
				<td class="insOrTd">
					<input type="text" class="insInpSize1" name="od_from_name" id="od_from_name" value="${orderUser.name}" required>
				</td>
			</tr>
			<tr class="insOrTr">
				<th class="insOrTh">전화번호</th>
				<td class="insOrTd">
					<input type="tel" class="insInpSize1" name="od_from_phone" id="od_from_phone" value="${orderUser.phone}" required>
				</td>
			</tr>
			<tr class="insOrTr">
				<th class="insOrTh" rowspan="3">배송지</th>
				<td class="insOrTd insOrTdAdr">			 
					<input type="text" name="od_from_address" onclick="sample4_execDaumPostcode()"id="od_from_address" placeholder="우편번호" >
					<input type="button" onclick="sample4_execDaumPostcode()" id="addressSearchBtn" value="우편번호 찾기" required>
				</td>
			</tr>
			<tr class="insOrTr">
				<td class="insOrTd">			 
					<input type="text" class="adrs insInpSize2" name="od_from_address2" onclick="sample4_execDaumPostcode()" id="od_from_address2" placeholder="도로명주소"><br>
				</td>
			</tr>
			<tr class="insOrTr">
				<td class="insOrTd">			 
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" class="adrs insInpSize2" name="od_from_address3" id="od_from_address3" placeholder="상세주소(동, 호수)를 입력해주세요.">
				</td>
			</tr>
			<tr class="insOrTr">
				<th class="insOrTh">배송메모</th>
				<td class="insOrTd">
					<input type="text" class="orMemo insInpSize2" name="od_from_message" id="od_from_message" maxlength=50 placeholder="배송메모를 작성해주세요.(최대 50자)" >
				</td>
			</tr>
		</table>
	</div>
</section>
<section class="orderSec">
	<div class="priceAgreeDiv priceDiv">

	<p class="secTitle">결제금액</p>
	<table class="payInfoTable orderInfotTableSpace">
		<tr class="orPriceBox">
			<td class="orPriceName">상품금액</td>
			<th class="orPriceTT">
				<fmt:formatNumber value="${orderInfo.od_totprice}" pattern="#,###"/>원
			</th>
		</tr>
		<tr class="orPriceBox">
			<td class="orPriceName">배송비</td>
			<th class="orPriceTT">
				<fmt:formatNumber value="${orderInfo.od_delivercost}" pattern="#,###"/>원
			</th>
		</tr>
		<tr class="orPriceBox">
			<td class="orPriceName"><h5><strong>결제금액</strong></h5></td>
			<th class="orPriceTT orPriceTTT">
				<span class="totalPriceSpan"><h5><strong><fmt:formatNumber value="${orderInfo.od_totprice + orderInfo.od_delivercost}" pattern="#,###"/></span> 원</strong></h5>
			</th>
		</tr>
	</table>
	
	</div>
</section>
<section class="orderSec">
	<div class="priceAgreeDiv AgreeDiv">

	<input type="hidden" name="od_totprice" value="${orderInfo.od_totprice }">
	<input type="hidden" name="od_delivercost" value="${orderInfo.od_delivercost }">
	<input type="hidden" name="od_totprice" value="${orderInfo.od_totprice}" disabled >
	<input type="hidden" name="od_delivercost" value="${orderInfo.od_delivercost }" disabled >

	<p class="secTitle">구매조건 및 약관</p>

	<div class="selectDiv">
		<table class="agreeTable orderInfoTable">
		<tr>
			<td>
				<span class="selectSpan selectSpan1 agreeCheckboxSpan">
					<input type="checkbox" name="chk" class="checkInput" id="agreeCheckbox1" value="">
					<label class="checklabel agreeCheckbox" for="agreeCheckbox1">품절 발생 시 별도의 연락 없이 결제하신 방법으로 자동 환불됩니다.</label>
<!-- 					<button type="button" class="agreeInfoBtn" onclick="window.open('https://www.danalpay.com/customer_support/terms_and_policy')">(주)다날</button> -->
				</span>
			</td>
		</tr>
		<tr>
			<td>
				<span class="selectSpan agreeCheckboxSpan">
					<div class="selectSpan2">
					<input type="checkbox" name="chk" class="checkInput" id="agreeCheckbox2" value="">
					<label class="checklabel checklabel1" class="agreeCheckbox" for="agreeCheckbox2">개인정보 제3자 제공 및 수집/이용 동의</label>
					</div>
					<button type="button" class="agreeInfoBtn" data-toggle="modal" data-target="#check2Modal">보기</button>
				</span>
				
				  <div class="modal fade" id="check2Modal">
				    <div class="modal-dialog modal-dialog-scrollable">
				      <div class="modal-content">
				      
				        <div class="modal-header">
				          <h3 class="modal-title">개인정보 제3자 제공 및 수집/이용</h3>
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				        </div>
				        
				        <div class="modal-body">
							<p>제공 항목</p>
							<p>본인확인정보, 이름, 이메일 주소, 휴대폰 번호, 전화번호, 주소, 개인통관고유번호(해외직구 상품 구매 시)</p>
							<p>이용 목적</p>
							<p>판매자 : 주문한 물품의 배송/설치 등 고객과 체결한 계약의 이행, 민원/불만/건의사항의 상담 및 처리, 서비스
							주문/결제, 관세법에 따른 세관 신고, 기타 구매 활동에 필요한 본인 확인</p>
							<p>보유 기간 : 서비스 종료 후 6개월 까지 동의 거부권 등에 대한 고지</p>
							<p>개인정보 수집은 서비스 이용을 위해 꼭 필요합니다.</p>
							<p>개인정보 수집을 거부하실 수 있으나 이 경우 서비스 이용이 제한될 수 있음을 알려드립니다.</p>
				        </div>
				        
				        <div class="modal-footer">
				          <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				        </div>
				        
				      </div>
				    </div>
				  </div>
					  
			</td>
		</tr>
		<tr>
			<td>
				<span class="selectSpan agreeCheckboxSpan">
					<div class="selectSpan2">
					<input type="checkbox" name="chk" class="checkInput" id="agreeCheckbox3" value="">
					<label class="checklabel checklabel1" class="agreeCheckbox" for="agreeCheckbox3">결제대행 서비스 약관 및 정책 동의</label>
					</div>
					<button type="button" class="agreeInfoBtn" onclick="window.open('https://www.danalpay.com/customer_support/terms_and_policy')">(주)다날</button>
				</span>
			</td>
		</tr>
		<tr>
			<th class="allCheckBox">
				<span class="selectSpan selectSpan1 agreeCheckboxSpan">
					<input type="checkbox" class="checkInput" id="agreeCheckbox" value="">
					<label class="checklabel allCheck" class="agreeCheckbox" id="agreeLabel"for="agreeCheckbox"><h5><strong>모든 내용을 확인하였으며 구매조건에 동의합니다.<strong></h5></label>
				</span>
			</th>
		</tr>
	</table>
		
	</div>

	</div>
</section>
<section class="orderSec">
	<input type="hidden" class="insInpSize1" name="amount" id="amount" value="${orderInfo.od_totprice + orderInfo.od_delivercost}"> 
	
	
	<div class="btnDiv">
		<span class="btnSpan">
			<button id="pageBack" class="bottomBtn" type="button" ><strong>« </strong>이전으로</button>
			<button id="check_module" class="bottomBtn" type="button" >결제하기</button>
		</span>
	</div>
	<div id="orderDataDiv">
		<input type="hidden" name="merchant_uid" id="merchant_uid" placeholder="merchant_uid 입력"><br>
		<button id="cancel_module" class="orderData"type="button">취소하기</button>
		<button class="myOrder_module orderData" type="button" data-val="/paid">결제완료주문내역조회</button>
		<button class="myOrder_module orderData " type="button" data-val="/cancelled">취소완료주문내역조회</button>
		<button id="all_module" class="orderData" type="button">모든목록조회</button>
	</div>

		
</section>
</form>
</div>						
<%@ include file="/dogcat_footer.jsp" %>
</body>
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


//결제

var chk = false;
$(document).ready(function(){
	
	var IMP = window.IMP; // 생략가능
// 	IMP.init('${impKey}');
	IMP.init('imp10707030');
	
	
	 	$("#check_module").click(function () {
		var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;
		if(!isMobile) {
		 	//모바일이 아닌 경우 스크립트
		 		
		 		if($("#od_to_name").val()==""){
					alert("주문자명을 입력해주세요.");
					var offset = $('#orderToInfoDiv').offset();
					$('html').animate({scrollTop : offset.top}, 400);
					$("#od_to_name").focus();
					return false
				} else if($("#od_to_phone").val()==""){
					alert("주문자 전화번호를 입력해주세요");
					var offset = $('#orderToInfoDiv').offset();
					$('html').animate({scrollTop : offset.top}, 400);
					$("#od_to_phone").focus();
					return false
				}else if($("#od_to_email").val()==""){
					alert("주문자 이메일을 입력해주세요");
					var offset = $('#orderToInfoDiv').offset();
					$('html').animate({scrollTop : offset.top}, 400);
					$("#od_to_email").focus();
					return false
				}else if($("#od_from_name").val()==""){
					alert("수취인명을 입력해주세요");
					var offset = $('#orderFromInfoDiv').offset();
					$('html').animate({scrollTop : offset.top}, 400);
					$("#od_from_name").focus();
					return false
				}else if($("#od_from_phone").val()==""){
					alert("수취인 전화번호을 입력해주세요");
					var offset = $('#orderFromInfoDiv').offset();
					$('html').animate({scrollTop : offset.top}, 400);
					$("#od_from_phone").focus();
					return false
				}else if($("#od_from_address").val()==""){
					if(confirm("주소가 입력되지 않았습니다. 주소 검색창으로 이동합니다.")){
						var offset = $('#orderFromInfoDiv').offset();
						$('html').animate({scrollTop : offset.top}, 400);
					sample4_execDaumPostcode();
					}else{
						
					}
					return false
					}else if($('#agreeCheckbox').is(":checked") == false){
					alert("구매조건에 동의해주세요.");
				}else{
	
			 		IMP.request_pay({
			  			pg: "danal_tpay.9810030929", // 자신이 설정한 pg사 설정
			 			pay_method: 'card',
			 			merchant_uid: new Date().getTime(), // 상점id
			 			name: $("#od_payname").val(), // 상품명
			 			amount: $("#amount").val(), // 결제금액
			 			buyer_email: $("#od_to_email").val() , // 구매자메일
			 			buyer_name: $("#od_to_name").val() , // 구매자
			 			}, function (rsp) {
			 				console.log(rsp);
			 				if (rsp.success) {
			 					var msg = '결제가 완료되었습니다.';
			 					msg += '\n고유ID : ' + rsp.imp_uid;
			 					msg += '\n상점 거래ID : ' + rsp.merchant_uid;
			 					msg += '\n결제 금액 : ' + rsp.paid_amount;
			 					msg += '\n카드 승인번호 : ' + rsp.apply_num;
			 					
			 					$("#merchant_uid").val(rsp.merchant_uid);
			 					
			 					chk = true;
			 				} else {
			 					var msg = '결제에 실패하였습니다.';
			 					msg += '\n에러내용 : ' + rsp.error_msg;
			 				}
			 				alert(msg);
			 				if(chk==true){
			 					//전체리스트 조회
			 					orderList();
			 					//내 주문목록 조회
			 					$(".myOrder_module").eq(0).trigger("click");
			 				}
			 		});
		 		}
		     
		 } else {
		     let rurl = "http://localhost:8090/paymobile";
		    //모바일인 경우 스크립트
		 		
		 		if($("#od_to_name").val()==""){
					alert("주문자명을 입력해주세요.");
					$("#od_to_name").focus();
					return false
				} else if($("#od_to_phone").val()==""){
					alert("주문자 전화번호를 입력해주세요");
					$("#od_to_phone").focus();
					return false
				}else if($("#od_to_email").val()==""){
					alert("주문자 이메일을 입력해주세요");
					$("#od_to_email").focus();
					return false
				}else if($("#od_from_name").val()==""){
					alert("수취인명을 입력해주세요");
					$("#od_from_name").focus();
					return false
				}else if($("#od_from_phone").val()==""){
					alert("수취인 전화번호을 입력해주세요");
					$("#od_from_name").focus();
					return false
				}else if($("#od_from_address").val()==""){
					if(confirm("주소가 입력되지 않았습니다. 주소 검색창으로 이동합니다.")){
					sample4_execDaumPostcode();
					}else{
						
					}
					return false
				}else if($('#agreeCheckbox').is(":checked") == false){
					alert("구매조건에 동의해주세요.");
				}else{
					
					var queryString = $("#insertFrm").serialize();
					let od_num = new Date().getTime();
					
			 		IMP.request_pay({
			 			pg: "danal_tpay.9810030929", // 자신이 설정한 pg사 설정
			 			pay_method: 'card',
			 			merchant_uid: od_num, // 상점id
			 			name: $("#od_payname").val(), // 상품명
			 			amount: $("#amount").val(), // 결제금액
			 			buyer_email: $("#od_to_email").val() , // 구매자메일
			 			buyer_name: $("#od_to_name").val() , // 구매자
// 			 			m_redirect_url: rurl+'?od_num='+od_num+'&'+queryString
			 			}, function (rsp) {
			 				
			 				if (rsp.success) {
			 					var msg = '결제가 완료되었습니다.';
			 					msg += '\n고유ID : ' + rsp.imp_uid;
			 					msg += '\n상점 거래ID : ' + rsp.merchant_uid;
			 					msg += '\n결제 금액 : ' + rsp.paid_amount;
			 					msg += '\n카드 승인번호 : ' + rsp.apply_num;
			 					
			 					$("#merchant_uid").val(rsp.merchant_uid);
			 					
			 					chk = true;
			 				} else {
			 					var msg = '결제에 실패하였습니다.';
			 					msg += '\n에러내용 : ' + rsp.error_msg;
			 				}
			 				alert(msg);
			 				if(chk==true){
			 					//전체리스트 조회
			 					orderList();
			 					//내 주문목록 조회
			 					$(".myOrder_module").eq(0).trigger("click");
			 				}
			 		});
			 		
			 	}
		 }
		 	});
	
	$("#cancel_module").click(function () {
		$.ajax({
			url : "/paycan",
			data : {"mid": $("#merchant_uid").val()},
			method : "POST",
			success : function(val){
				console.log(val);
				if(val==1){
					alert("취소 완료");
					$("#all_module").trigger("click");
				}
				else alert("취소 실패\n이미 취소되었거나 잘못된 정보입니다.");
			},
			error :  function(request, status){
				alert("취소가 실패하였습니다.");
			}
		});
	});
	
	
//	<button class="myOrder_module" type="button" data-val="/paid">결제완료주문내역조회</button>
	$(".myOrder_module").click(function(){
		$.ajax({
			url : "/payamount",
			data : {"mid": $("#merchant_uid").val(), "status" : $(this).attr("data-val")},
			// 파라미터 : mid = 상점 주문번호, status = /paid
			method : "GET",
//			contentType : 'application/json; charset=UTF-8',
			success : function(val){
				console.log(val);
				$("#paylist").empty();
				if(val.msg!=null){
					$("#paylist").append(val.msg);
				}else{
					$("#paylist").append("고유ID: "+val.imp_uid);
					$("#paylist").append("<br>상점 거래ID: "+val.merchant_uid);
					$("#paylist").append("<br>주문상품: "+val.name);
					$("#paylist").append("<br>주문자: "+val.buyer_name);
					$("#paylist").append("<br>결제금액: "+val.amount);
				}
			},
			error :  function(request, status){
			}
		});
	});
	
	$("#all_module").click(function(){
		$.ajax({
			url : "/paylist",
			method : "GET",
//			contentType : 'application/json; charset=UTF-8',
			success : function(val){
				console.log(val);
				$("#paylist").empty();
				$.each(val, function(i, v){
					$("#paylist").append("고유ID: "+v.imp_uid);
					$("#paylist").append("<br>상점 거래ID: "+v.merchant_uid);
					if(v.cancel_amount != 0 ) $("#paylist").append("<br><span style=\"color:red;font-weight:bold;\">주문취소</span>");
					else if(v.failed_at != 0 ) $("#paylist").append("<br><span style=\"color:pink;font-weight:bold;\">결제오류</span>");
					else $("#paylist").append("<br><span style=\"color:blue;font-weight:bold;\">결제완료</span>");
					$("#paylist").append("<br>주문상품: "+v.name);
					$("#paylist").append("<br>주문자: "+v.buyer_name);
					$("#paylist").append("<br>결제금액: "+v.amount+"<hr><br>");
				});
				
			},
			error :  function(request, status){
			}
		});
	});
	
});

function orderList(){
	let fm = document.fm;
	fm.action ="/pay";
	fm.method="post";
	fm.submit();
	
}
$(document).ready(function(){
	$("#orderDataDiv").hide();

	$("#agreeCheckbox").click(function() {
		if($("#agreeCheckbox").is(":checked")) $("input[name=chk]").prop("checked", true);
		else $("input[name=chk]").prop("checked", false);
	});
	
	$("input[name=chk]").click(function() {
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;
		
		if(total != checked) $("#agreeCheckbox").prop("checked", false);
		else $("#agreeCheckbox").prop("checked", true); 
	});
});

$("#pageBack").click(function () {
	history.back();
});
	
function getPro(val, proName){
   console.log(val, proName);
   location.href = "getproducts.pro?pro_no="+val+"&pro_name="+proName;   
}
</script>
</html>