<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/dogcat_header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.js"></script>
<title>Insert title here</title>
<style>
.container {
   width: 80%;
   margin: 0 auto;
}

h2, h3 { margin-top: 100px;
   color: black;;
}

h1 {
   color: #484848;
   margin-top: 100px;
}

.carttable {
   width: 100%;
   border-collapse: collapse;
   margin-top: 20px;
}

th, td {
   padding: 10px;
   text-align: center;
}

.cart_info_td {
   position: relative;
}

.all_check_input_div {
   display: inline-block;
   margin-right: 10%;
}

.dogimg {
   max-width: 90px;
   max-height: 90px;
   margin-right: 10px;
}

.quantity {
   font-weight: bold;
}

.add, .minus {
   background-color: #FF8551;
   color: #fff;
   border: none;
   cursor: pointer;
   width: 25px;
   height: 25px;
   padding: 0px;
}

.add:hover, .minus:hover {
   background-color: #FF7141;
}

.deleteBtn {
   color: #ff6523;
   text-decoration: none;
}

.deleteBtn:hover {
   color: red;
   text-decoration: none;
}

.allDeleteBtn fbtn {
   background-color: #636363;
}

.content_total_section {
   margin-top: 20px;
   background-color: #f8f8f8;
   padding: 15px;
   border-radius: 8px;
}

.total_wrap {
   text-align: right;
}

.total_wrap p {
   /*     margin-bottom: 10px; */
   
}

.totalPrice_span, .delivery_price, .finalTotalPrice_span {
   font-size: 1.2em;
   font-weight: bold;
   margin-left: 5px;
}

.finalTotalPrice_span {
   color: #FF8551;
}

.selectDel {
   margin-top: 10px;
   padding: 10px 15px;
   background-color: #FA5858;
   color: #fff;
   border: none;
   border-radius: 4px;
   cursor: pointer;
}

.selectDel:hover {
   background-color: #FF0000;
   transition: background-color 0.3s ease;
}

.allDeleteBtn {
   margin-top: 10px;
   padding: 10px 15px;
   background-color: #999;
   color: #fff;
   border: none;
   border-radius: 4px;
   cursor: pointer;
}

.allDeleteBtn:hover {
   background-color: #808080;
   transition: background-color 0.3s ease;
}

.button-container {
   text-align: right;
}

.carttable th {
   border-bottom: 2px solid #AFD7DB;
   border-top: 2px solid #AFD7DB;
}

.carttable tr td {
   border-bottom: 1px solid #f8f8f8;
}

.price_info {
   margin-left: 850px;
   padding-bottom: 10px;
   border-bottom: 1px solid black;
   margin-bottom: 10px;
}

.order_btn {
   margin-top: 10px;
   padding: 10px 15px;
   background-color: #4692B8;
   color: #fff;
   border: none;
   border-radius: 4px;
   cursor: pointer;
}

.order_btn:hover {
   background-color: #22668D;
   transition: background-color 0.3s ease;
}

/* 체크박스 스타일 통일성 추가 */
input[type="checkbox"] {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    border: 2px solid #81BEF7; /* 체크박스 테두리 색상 */
    width: 18px; /* 체크박스 너비 */
    height: 18px; /* 체크박스 높이 */
    border-radius: 3px; /* 체크박스 모서리 둥글게 */
    outline: none;
    transition: background 0.3s;
    margin-top:6px;
}

input[type="checkbox"]:hover{
   cursor: pointer;
}

input[type="checkbox"]:checked {
    background: #81BEF7; /* 체크된 상태일 때의 색상 */
    border-color: #81BEF7; /* 체크된 상태일 때의 테두리 색상 */
}

/* 체크박스 전체 선택 버튼 스타일 */
.all_check_input {
    /* 추가 스타일 정의 */
    margin-right: 10px;
}

.all_check_input_div {
    display: inline-block;
    margin-right: 10%;
}

@media (max-width:391px){
	.container {width:100%;margin : 0;}
	h2 {margin-top : 50px;     color: black;}
	th {padding : 10px 0 !important;}
	td {padding : 0; font-size : 12px;}
	.ellipsis {
	display: inline-block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	word-break: break-all;
	width: 150px;}
	.price_info{margin-left : 0;}
	.dogimg{width : 40px; margin-top: 25px;}
	.ke{margin: 37px 0px 37px 50px !important;  white-space:nowrap; overflow: hidden; text-overflow:ellipsis;width:90px;}
	.individual_cart_checkbox{margin-left:10px;}
	.total_wrap{font-size : 12px;}
	.content_total_section {padding: 5px;}
	.selectDel, .order_btn {width : 60px; height: 30px; font-size : 10px; padding: 5px 5px;}
	th{font-size : 10px;}
	td{font-size : 9px;}
	.add, .minus {  
	width: 15px;
    height: 15px;
    padding: 0px;
    font-size: 8px;}
    .individual_cart_checkbox{margin-left: -11px !important;}
    input[type="checkbox"] { width: 10px; height: 10px; }
	}
</style>
<script>
	$(function() {
		
		$("#btnList").click(function() {
			location.href = "getproductsList.pro";
		});
		
		$("#btnDelete").click(function() {
			if (confirm("장바구니를 비우시겠습니까?")) {
				location.href = "deleteAllCart.cart";
			}
		});
		
		let totalPrice = 0;				// 총 가격
		let deliveryPrice = 0;			// 배송비
		let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)
		
		$(".cart_info_td").each(function(index, element){
			// 총 가격
			totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
		});
		
		if(totalPrice >= 50000){
			deliveryPrice = 0;
		} else if(totalPrice == 0){
			deliveryPrice = 0;
		} else {
			deliveryPrice = 5000;	
		}
		
		finalTotalPrice = totalPrice + deliveryPrice;
		
		$(".individual_cart_checkbox").on("change", function(){
			setTotalInfo();
		});

		// 총 가격
		$(".totalPrice_span").text(totalPrice.toLocaleString());
		// 배송비
		$(".delivery_price").text(deliveryPrice.toLocaleString());	
		// 최종 가격(총 가격 + 배송비)
		$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());	
		
		/* 체크박스 전체 선택 */
		$(".all_check_input").on("click", function(){

			/* 체크박스 체크/해제 */
			if($(".all_check_input").prop("checked")){
				$(".individual_cart_checkbox").prop("checked", true);
			} else{
				$(".individual_cart_checkbox").prop("checked", false);
			}
			
			setTotalInfo($(".cart_info_td"));	
			
		});
		
	});
	
	function deleteOne(cn) {
		if(confirm("상품을 삭제하시겠습니까?")){
			location.href="/deleteCart.cart?cart_no=" +cn;
			alert("삭제되었습니다.");
		} else {
			
		}
	}
	
	// 선택삭제
	function selectDel(){
		var url = "/selectDel.cart";
		var valueArr = new Array();
		var list = $("input[name='idList']");
		for (var i =0; i < list.length; i++){
			if(list[i].checked){
				valueArr.push(list[i].value);
			}
		}
		if(valueArr.length == 0){
			alert("선택된 상품이 없습니다.");
		}
		else{
			if(confirm("정말 삭제하시겠습니까?")){
			$.ajax({
				url : url,
				type : 'POST',
				traditional : true,
				data : {valueArr : valueArr},
				cache : false,
				success: function(data){
					if(data == "success"){
						alert("삭제 되었습니다.");
						location.href="/getCart.cart";
					}
				}
			});
			} else {
			}
		}
		
	}
	
	
	const checkBoxes = document.getElementsByName('idList');
	function checkBoxValueChanged(){
		  var checkedCnt = 0;
		  for(let i=0; i<checkBoxes.length;i++){
		    if(checkBoxes[i].checked){
		      checkedCnt ++;
		    }
		  }
		  if(checkedCnt == checkBoxes.length){
			  $(".all_check_input").prop("checked", true);
		  }else{
			  $(".all_check_input").prop("checked", false);
		  }
		}

	function setTotalInfo(){
		console.log("타는지??");
		let totalPrice = 0;				// 총 가격
		let deliveryPrice = 0;			// 배송비
		let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)

		
		$(".cart_info_td").each(function(index, element){
			
			if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부
				// 총 가격
				totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
			}

		});
		
		
		/* 배송비 결정 */
		if(totalPrice >= 50000){
			deliveryPrice = 0;
		} else if(totalPrice == 0){
			deliveryPrice = 0;
		} else {
			deliveryPrice = 5000;	
		}
		
			finalTotalPrice = totalPrice + deliveryPrice;
		
		/* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */
		
		// 총 가격
		$(".totalPrice_span").text(totalPrice.toLocaleString());
		// 배송비
		$(".delivery_price").text(deliveryPrice.toLocaleString());	
		// 최종 가격(총 가격 + 배송비)
		$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());		
	}
	
	function count(type, count, proNum)  {
		   let arr = document.getElementsByName('quantity').length;
		   let i = count;
		   const resultAmount = document.getElementsByName('quantity')[i];
		   const resultPrice = document.getElementsByName('total_price')[i];
		   console.log(resultPrice);
		      
		   var amount = resultAmount.innerText;
		   var price = $(resultPrice).attr("data-val");
		   var proPrice = price / amount;

		   if(type == 1) {
		      amount = parseInt(amount) + 1;
		      price =  proPrice * amount;
		   }else if(type == -1)  {
		      if(amount > 1){
		         amount = parseInt(amount) - 1;
		         price =  proPrice * amount;
		      } else { alert('최소수량입니다.'); }
		   }
		   
		   resultAmount.innerText = amount;
		   $(resultPrice).attr("data-val", price);
		   $(resultPrice).text(price.toLocaleString('ko-KR'));
		   
		   inCartUpdate(proNum, amount, price, i);
		}

		function inCartUpdate(proNum, amount, totalP, i){ 
		   $.ajax({
		      url: "/cart/"+proNum+"/"+amount+"/"+totalP,
		      type:"POST",
		      cache : false,
		      success : function(data){
		    	  console.log(data.cartList[i].quantity);
		    	  console.log(data.cartList[i].pro_price);
		    	  
		    	  var qtt = data.cartList[i].quantity;
		    	  var prc = data.cartList[i].pro_price;
		    	  totp = qtt * prc;
		    	  
		    	  $("#totalhidden"+i).prop("value", totp);
		    	  
		    	  setTotalInfo();
			    	 console.log("성공");
		      },
		      error:function(request,status){
		         alert("수량변경에 실패하였습니다.");
		      }
		   });
		}
		
		
	
</script>
</head>
<body>
   <div class="container">
      <h2>
         <b>장바구니</b>
      </h2>
      <c:choose>
         <c:when test="${map.count == 0}">
            장바구니가 비었습니다.
        </c:when>
         <c:otherwise>
            <form action="u_insertOrder.od" method="post" class="order_form">
               <table class="carttable">
                  <tr>
                     <th width="5%"><div id="check_all" class="all_check_input_div">
                           <input type="checkbox" class="all_check_input input_size_20"
                              id="checkALL" checked><label for="checkAll"></label><span
                              class="all_chcek_span"></span>
                        </div></th>
                     <th width="35%" style="padding-left: 105px;">상품정보</th>
                     <th width="15%">가격</th>
                     <th width="20%">수량</th>
                     <th width="15%">합계</th>
                     <th width="10%">삭제</th>
                  </tr>
                  <%
                  int i = 0;
                  %>
                  <c:forEach var="cart" items="${map.cartList}">
                     <tr>
                        <td class="cart_info_td"><input type="checkbox"
                           name="idList" value="${cart.cart_no }"
                           onclick="checkBoxValueChanged()" id="ckbx<%=i%>" checked
                           class="individual_cart_checkbox input_size_20" style="margin-left:-15px;"><label
                           for="ckbx<%=i%>"></label> <input type="hidden"
                           class="individual_cartPrice_input" value="${cart.pro_price}">
                           <input type="hidden" class="individual_cartCount_input"
                           name="individual_cartCount_input" value="${cart.quantity}">
                           <input type="hidden" class="individual_totalPrice_input"
                           id="totalhidden<%=i %>"
                           value="${cart.pro_price * cart.quantity}"> <input
                           type="hidden" class="individual_pro_no_input"
                           value="${cart.pro_no}"> <input type="hidden"
                           class="individual_od_count_input" value="${cart.quantity}"></td>

                        <td class="ellipsis"><img class="dogimg"
                           src="${pageContext.request.contextPath}/resources/img/productImg/${cart.pro_filename}"
                           style="float: left;"><div class="ke" style="margin:37px 0px 37px 120px; text-align:left; white-space:nowrap; overflow: hidden; text-overflow:ellipsis;width:250px;">${cart.pro_name}</div></td>
                        <td><fmt:formatNumber value="${cart.pro_price}" />원</td>
                        <td><input type="button" value=" - " class="result minus"
                           onclick='count(-1, <%=i %>, ${cart.pro_no })' />&nbsp; <span
                           name="quantity" class="quantity">${cart.quantity}</span> &nbsp;<input
                           type="button" value=" + " class="result add"
                           onclick='count(1, <%=i %>, ${cart.pro_no })' /> <input
                           type="hidden" name="cart_no" value="${cart.cart_no}" /> <input
                           type="hidden" name="pro_no" value="${cart.pro_no}" /></td>
                        <td><span name="total_price" data-val="${cart.total_price}"><fmt:formatNumber value="${cart.total_price}" /></span>원</td>
                        <td><a href="deleteCart.cart?cart_no=${cart.cart_no}"
                           class="deleteBtn">[삭제]</a></td>
                     </tr>
                     <%
                     i++;
                     %>
                  </c:forEach>
               </table>
               <div class="content_total_section">
                  <div class="total_wrap">
                     <p>
                     <div class="price_info">
                        <span>상품 가격</span> <span class="totalPrice_span">70000</span> 원<br>
                        <span>+</span> <span>배송비</span> <span
                           class="delivery_price">3000</span> 원<br>
                     </div>
                     <strong>총 결제 금액</strong> <span class="finalTotalPrice_span">70000</span>
                     원
                  </div>
                  </p>
               </div>
               <div class="button-container">
                  <button type="button" id="selectDelBtn" class="selectDel fbtn"
                     onclick="selectDel();">선택삭제</button>
<!--                   <button type="button" id="btnDelete" class="allDeleteBtn fbtn">장바구니 -->
<!--                      비우기</button> -->
                  <button id="order_btn" class="order_btn payBtn fbtn">주문하기</button>
               </div>

            </form>

         </c:otherwise>
      </c:choose>
   </div>
   <%--    <%@ include file="/WEB-INF/products/u_recProduct.jsp" %> --%>
   </div> <br><br>
   <%@ include file="/dogcat_footer.jsp" %>
   <script>
   $(document).ready(function(){
         $("#order_btn").on("click", function(){
         let form_contents ='';
         let orderNumber = 0;
         $(".cart_info_td").each(function(index, element){
            
            if($(element).find(".individual_cart_checkbox").is(":checked") === true){   //체크여부
               
               let pro_no = $(element).find(".individual_pro_no_input").val();
               let od_count = $(element).find(".individual_od_count_input").val();
               
               $('form').attr( "action", "u_insertOrder.od" );
               
               let pro_no_input = "<input name='orders[" + orderNumber + "].pro_no' type='hidden' value='" + pro_no + "'>, ";
               form_contents += pro_no_input;
               
               let od_count_input = "<input name='orders[" + orderNumber + "].od_count' type='hidden' value='" + od_count + "'> ";
               form_contents += od_count_input;
               
               orderNumber += 1;
            }
         });

            $(".order_form").append(form_contents);
            $(".order_form").submit();
         });   
      });
   </script>
</body>
</html>