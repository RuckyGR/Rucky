<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
    <title>Welcome to DogCatDelLuna</title>
    <%@ include file="/dogcat_header.jsp"%>
    <style>
.container-fluid{
width : 100%;
margin : 30px auto;
text-align : center;
display : block;
}
.wrapBox {
    text-align: center; 
}

.ResBox1, .ResBox2, .ResBox3, .ResBox4 {
    display: inline-block;
    margin: 5px; /* 여백을 필요에 따라 조절 */
    box-sizing: border-box;
    width: 15%; 
    height: 100px; 
    vertical-align: top; 
}

.reviewContainer {
    max-width: 60%;
    margin: 20px auto;
    padding: 15px;
    border: 1px solid #FF8551;
    border-radius: 8px;
}

.reviewHeaderCotainer {
/*     background-color: #f2f2f2; */
    padding: 10px;
    border-top : 2px solid #AFD7DB;
    border-bottom: 2px solid #AFD7DB;
    text-align: center;
}

.sp {
    font-weight: bold;
    color: #333;
}

.revContents {
    margin-top: 15px;
}

textarea {
    width: 100%;
    height: 100px;
    padding: 10px;
    box-sizing: border-box;
    border: 1px solid #FF8551;
    border-radius: 4px;
    resize: none;
}
textarea:focus{
	outline: none;
    border-color: #FF8551;
    box-shadow: 0 0 5px #FF8551;
}
.priBox {
    max-width: 300px; 
    margin: 10px auto; 
    padding: 15px;
    border: 1px solid #FF8551;
    border-radius: 8px;
    text-align : center;
    
}

.priBox span {
    font-weight: bold;
}

.price {
    color: #FF8551; 
}

input[type="submit"] {
    padding: 10px 15px;
    background-color: #FF8551;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #FF7141; 
}
input[type="date"]:focus {
    outline: none;
    border-color: #FF8551;
    box-shadow: 0 0 5px #FF8551;
}

input[type="text"]:focus{
	outline:none;
}

input,select{
border: 2px solid #FF8551;
    border-radius: 8px;
}

.totalPrice{
	width : 78px;
	border : none; !important;
	display : none;
	text-align : right;
	font-weight : bold;
}

#dateReserve{
color: #FF8551;
font-weight: bold;
}
h2, h3{
color : #FF8551;
}
.dog,.cat,.DE,.st{
font-size : 40pt;
font-weight : bold;
}
.dog{
color : #FF8551;
}
.cat{
color : #22668D;
}
.DE{
color : #9BCDD2;
}
.st{
color : #2BDCD6;
}
.paddin{
padding: 6px;
}
.ckdate {
	width : 150px;
}	
@media ( max-width :390px) {
h2, .h2{
	font-size : 1.4rem;
}
h3, .h3 {
    font-size: 1.4rem;
}
.dog, .cat, .DE, .st {
    font-size: 27pt;
    font-weight: bold;
}
.ResBox1, .ResBox2{
	width: 130px;
	margin-right : 30px;
}
.ResBox3{
	width: 130px;
	margin-right : 30px;
}

.ckdate {
	height : 40px;
}

#petName{
	width : 150px;
}

.ResBox4{
	width: 130px;
	margin-right : 30px;
}
.reviewContainer {
    max-width: 88%;
    margin: 20px auto;
    padding: 15px;
    border: 1px solid #FF8551;
    border-radius: 8px;
    font-size: 11.5px;
}
.priBox {
    max-width: 320px;
    }
}
    </style>
    <script>
        function setMinCheckoutDate() {
            var checkinDate = document.getElementById("checkInDate").value;
            document.getElementById("checkOutDate").min = checkinDate;
            
        }
       function todayDate(){
        var now_utc = Date.now()
        var timeOff = new Date().getTimezoneOffset()*60000;
        var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
        document.getElementById("checkInDate").setAttribute("min", today);
       }
       
       function diffDate(){
    	   var checkinDate = new Date(document.getElementById("checkInDate").value);
    	   var checkoutDate = new Date(document.getElementById("checkOutDate").value);
    	   
    	   console.log(document.getElementById("checkInDate").value);
    	   var timeDiff = checkoutDate - checkinDate;
           var nights = Math.ceil(timeDiff / (1000 * 3600 * 24));
    	  
           if( !isNaN(checkinDate)){
           document.getElementById("dateReserve").innerHTML = nights + "박" + (nights +1) + "일";
           document.getElementById("price").innerHTML = (nights * 50000).toLocaleString();
           } else {
        	   alert("체크인 날짜부터 선택해주세요.");
        	   document.getElementById("checkOutDate").value = ""; 
        	   document.getElementById('checkInDate').focus();

           }
           
           totalPrice();
       }
       
       function totalPrice(){
    	   
    	   var btprice = document.getElementById("btPrice").innerText;
    	   if(btprice == ''){
    		   
    	   var tdprice = document.getElementById("price").innerText;
    	   document.getElementById("totalPrice").value = tdprice;
    	   document.getElementById("totalWon").innerHTML = "원";
    	   document.getElementById("totalPrice").style.display = 'inline';
    	   
    	   } else if(btprice != ''){
    	   
    	   		var tdprice = parseInt(document.getElementById("price").innerText.replace(',',''));
    	   		var tbprice = parseInt(document.getElementById("btPrice").innerText.replace(',',''));
    	   		document.getElementById("totalPrice").value = (tdprice + tbprice).toLocaleString();
    	   		document.getElementById("totalWon").innerHTML = "원";
    	   		document.getElementById("totalPrice").style.display = 'inline';
    	   }
       }
       
       $(document).ready(function(){
    	   $("#beautyDog").change(function(){
    		   var checkinDate = new Date(document.getElementById("checkInDate").value);
    		   if( !isNaN(checkinDate)){
    	        if($("#beautyDog").is(":checked")){
           	document.getElementById("beautyPrice").innerHTML = "미용요금 : ";
           	document.getElementById("btPrice").innerHTML = "&nbsp;&nbsp;&nbsp;20,000";
           	document.getElementById("won").innerHTML = "원" + "<br>";
    	        }else{
    	        	document.getElementById("beautyPrice").innerHTML = "";
    	        	document.getElementById("btPrice").innerHTML = "";
    	           	document.getElementById("won").innerHTML = "";
    	        }
    	        totalPrice();
    		   } else{
    			   alert("체크인 날짜부터 선택해주세요.");
    			   $(".beautyDog").prop("checked", false);
            	   document.getElementById('checkInDate').focus();
    		   }
    	    });
       });
        
    </script>
</head>
<body>

   

    <form action="insertReserve.rsv" method="post">
    <div class="container-fluid">
     <div>
     <h2>★ Welcome to DogCatDelLuna ★</h2>
     <span class="st">★  </span><span class="dog">Dog</span><span class="cat">Cat</span><span class="DE">DelLuna</span><span class="st">  ★</span>
    </div>
    
    	<input type="hidden" id="id" name="id" value="${reserveUser.id }">

<!--         <label for="name">예약자 성함:</label> -->
        <input type="hidden" id="name" name="name" value="${reserveUser.name}" disabled><br>
        

<!--         <label for="phone">핸드폰 번호:</label> -->
        <input type="hidden" id="phone" name="phone" value="${reserveUser.phone}" disabled><br>
        
        
       
        <div class="wrapBox">       
        <div class="ResBox1">
        <dl>
        <dt>
        체크인
        </dt>
        <dd>
       <input type="date" id="checkInDate" class="paddin ckdate" name="checkInDate" max="9999-12-31" onchange="setMinCheckoutDate()" onclick="todayDate()" required>
        </dd>
        </dl>
		</div>
		<div class="ResBox2">
		<dl>
		<dt>체크아웃</dt>
		<dd>
        <input type="date" id="checkOutDate" class="paddin ckdate" name="checkOutDate" max="9999-12-31" onchange="diffDate()" required>&nbsp;<span id="dateReserve"></span>		
		</dd>
		</dl>
        </div>
		<div class="ResBox3">
		<dl>
		<dt>애견크기</dt>
		<dd>
        <select id="roomtype" class="paddin ckdate" name="roomtype">
            <option value="small">소형</option>
            <option value="medium">중형</option>
            <option value="big">대형</option>
        </select>
		</dd>
		</dl>
        </div>
        <div class="ResBox4">
        <dl>
        <dt>
        애견이름
        </dt>
        <dd>
        <input type="text" id="petName" class="paddin ckdate" name="petName" required><br>
        </dd>        
        <dd>
        <input type="checkbox" name="beautyDog" class="beautyDog" id="beautyDog" value="Y"><label for="beautyDog">미용 여부</label>      
        </dd>
        </dl>
       
		</div>
		</div>
		
	
			<div class="reviewContainer">
				<div class="reviewHeaderCotainer">
					<span class="sp">특별요청</span>
				</div>
				<div class="revContents">
        <textarea id="specialRequests" name="request" placeholder="안녕하세요 프리미엄 애견호텔 독켓델루나입니다!
최대 8팀만을 소수 정예 케어하고 있기에 최소 2주전에는 예약하시는걸 권장드립니다!
저희 독켓델루나는 1박 => 5만원입니다!"></textarea>
</div>
        </div>
        
      	<div class="priBox">
        <span>호텔요금 : </span><span id="price" class="price"></span><span>원</span><br>
        <span id="beautyPrice"></span><span id="btPrice" class="price"></span><span id="won"></span>
       <span>총 금액 : </span> <input type="text" name="totalPrice" id="totalPrice" class="totalPrice price"><span id="totalWon"></span>
		</div>
		<h3>★예약금 : 10,000원★</h3>
        <input type="submit" onclick="javascript:alert('예약이 완료되었습니다.');"value="예약하기" >
        </div>
       
    </form>
        <%@ include file="/dogcat_footer.jsp" %>
</body>
</html>


