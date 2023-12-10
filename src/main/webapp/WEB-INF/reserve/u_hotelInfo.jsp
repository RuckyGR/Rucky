<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/dogcat_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap JS and jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.calBtn {
	font-weight: bolder;
	flex: auto;
	padding: 0 5px 5px 5px;
	flex-grow: 1;
	border-radius: 10px;
	height: 20px;
	background-color: white;
	border: none;
	cursor: pointer
}

.list_box {
	list-style: none;
	padding: 0;
	text-align: center;
	width : 100%;
}

.list_mb {
	display: inline-block;
	margin: 10px;
	width : 30%;
}

.list_mb img {
	width: 180px; /* 이미지 너비 조정 */
	height: 180px; /* 이미지 높이 조정 */
}

.c_gray {
	color: gray;
}

@media ( max-width : 768px) {
	.list_mb {
		display: block;
		text-align: center;
		margin: 10px 10px;
		margin-right: 10px;
    	margin-left: 10px;
    	width: 150px;
    	padding-left: 0px;
	}
}
.container{
	margin-top : 100px;
}

  .row_col_wrap_12_inner {
    display: flex;
    justify-content: space-between;
    background-color: #faf2e1;
    float : none;
    margin: 0;
    padding: 0;
    --wp-admin-theme-color: #007cba;
    --wp-admin-theme-color-darker-10: #006ba1;
    --wp-admin-theme-color-darker-20: #005a87;
    color: #676767;
    -webkit-font-smoothing: antialiased;
    visibility: visible;
    box-sizing: border-box;

    font: inherit;
    vertical-align: baseline;
    position: relative;
    margin-left: 0 !important;
    margin-right: 0 !important;
    width: auto;
    text-align: center;
    z-index: 10;
    margin-bottom: 0!important;
    display: flex;
    flex-wrap: wrap;
    float: none;
  }
 
 .main_tit, .main_desc {
	color: #96734C; 
 }
  .vc_col-sm-4 {
   width: 33.333%;
    max-width: 33.333%;
	margin: 0;
    padding: 0;
  }
  .petImg {
  	height : 96px;
  	width : 99px;
  	margin : 0 auto;
  }
  
   .petImgContainer {
    display: inline-block;
    background-color: #faf2e1;
  }

  .petImgContainer .petImg {
    display: block;
    width: 99px;
    height: 99px;
    margin: 0 auto;
  }
  .desc_text {
  	text-align : center;
  }
  .square1, .square2, .square3 {
 	padding : 30px;
  }
  .square1{
  	background-color : #236E3C;
  }
  .square2{
  background-color : #FFC351;
  }
  .square3{
  background-color : #BA774E;
  }
  .row_col_wrap_12_inner{
 	height: 100vh;
 	
  }
  .square_desc{
  	display : inline-block;
  	color : #fff;
  }
  .square-container{
  	display : flex;
  	flex-direction: column;
  }
  
div#flexBox {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top : 50px;
}
div.square:nth-of-type(2){
	margin: 0px 20px; 
}
.square1, .square2, .square3  {
	width: 300px;
	height:310px;
	text-align : center;
	margin : 20px;
}
#flexBox {
	background-color : #faf2e1;
	height : 500px;
}
.desc_text1 {
	color : #eec987 ;	
}
.desc_text2 {
	color : #236e3c ;	
}
.desc_text3 {
	color : #ffc351 ;	
}
.contact .badge {
    padding: 30px;
    padding-top: 10px;
    padding-bottom: 10px;
    border-radius: 30px;
    margin-right: 30px;
    color: #fff100;
    font-size: 16px;
    line-height: 16px;
}
.label-withdog_03, .badge-withdog_03 {
    background-color: #96734C;
}
.pet_color_01 {
    font-size: 40px;
    color : #96734C;
}
.contact {
    margin-top: 50px;
    text-align: center;
    font-size: 30px;
}
.roomchart {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column; 
  }

  .chart1, .chart2 {
    margin: 0 auto;
    margin-top : 50px;
    text-align: center;
    display: block; 
  }
  hr{
    width: 20%;
    border: 2px solid #96734C;
}
  .chart-text{
  	color : #96734C;
  	text-align : center;
  	margin-top : 30px;
  }
.resbtn {
    border: none;
    background: #FF8551;
    padding: 10px;
    border-radius: 5px;
    width: 25%;
    color: white;
    display: block;
    margin: 20px auto; 
  }
  
/*   여기부터! */
.tbBox {
	border: 3px solid #96734C;
	padding: 15px;
	border-radius: 15px;
}

table {
	width: 730px;
	height: 89px;
	background-color: white;
	border-collapse: collapse;
	border-radius: 10px;
}

th, td {
	width: 250px;
	padding: 10px;
	text-align: center;
	border-right: 1px solid #96734C;
	font-size: 25px;
}

th {
	border-bottom: 1px solid #96734C;
	color: #96734C;
}

th:last-child, td:last-child {
	border-right: none;
}
.tbChart {
border: none;
}
.tbBox2 {
margin-top: 50px;
}
td > ul >li {
font-size: 18px;
}
ul {
padding-left: 30px;
}
li {
margin: 20px 0px;
}

@media screen and (max-width: 390px) {
.wpb_wrapper {
display: block !important;
margin-top: 50px;
}
.titImg {
margin-left: 45px;
}
.badge {
margin: 0px !important;
}
hr {
width: 200px;
}
.tbBox {
width: 336px;
}
.tbChart {
width: 300px;
}
td {
font-size: 18px;
}
ul{
   list-style:none;
   padding: 0px;
}
.OrImgSix {
width: 150px !important;
height: 150px !important;
}
.c_gray {
width: 150px;
}
.list_mb {
    margin-left: 10px;
    display: inline-block;
    margin-right: 10px;
    width: 150px;
    padding-left: 0px;
    padding-right: 0px;
    height: 190px;
}
.square_desc {
display: none;
}
.square1, .square2, .square3 {
    padding: 0px;
    margin: 0px;
    width: 130px;
    height: 200px;
    display: inline-block;

}
#flexBox {
margin: 0px;
height: 300px;
}
.resbtn {
margin: 20px 0px 10px 0px;
width: 390px;
border-radius: 0px !important;
}
.Carouselhh{
	font-size : 13px;
}
}
</style>
</head>
<body>
	<section>
		<!-- 캐러셀 -->
		<div id="demo" class="carousel slide" data-ride="carousel">

			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>

			<div class="carousel-inner">
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/resources/img/dogcatdelruna.png" class="carouselImg"
						alt="설명">
				</div>
				<div class="carousel-item active">
					<img src="${pageContext.request.contextPath}/resources/img/windog.jpg" class="carouselImg" alt="설명">
					<div class="carousel-caption">
						<h3 class="Carouselhh">애견과 함께하는 특별한 여정의 시작! 편안함과 즐거움이 가득한 애견 호텔에 오신 것을 환영합니다.</h3>
					</div>
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/resources/img/hotelLuna1.png" class="carouselImg"
						alt="설명">
					<div class="carousel-caption">
						<h3 class="Carouselhh">독켓델루나는 꼬리 흔들림과 행복이 만나는 곳입니다! 각기 다른 모양과 크기의 꼬리 푸슥푸슥한 친구들이
							기다리고 있어요.</h3>
					</div>
				</div>
			</div>

		</div>
	</section>

	<div class="wpb_wrapper" style="display: flex; align-items: center; justify-content: center;">
		<div style="text-align: center;">
			<h2 class="main_tit">프리미엄 애견호텔</h2><br>
			<p class="main_desc">
				최고의 반려견 전문가들이 24시간 케어하는 애견호텔입니다.<br> 독켓델루나는 작고 답답한 공간이 아닌 아늑하고
				편안하게
			</p>
			<p class="txt_screenout par_gap"></p>
			<p class="main_desc">휴식할 수 있는 넓은 객실을 갖춘 프리미엄 애견호텔 입니다.</p>
		</div>
		<img class="titImg" src="${pageContext.request.contextPath}/resources/img/DelRuna.png" width="300"
			height="300">
	</div>
	
<div class="contact dwb_Action03">
<span class="badge badge-withdog_03">호텔 체크인/아웃 가능시간</span><span class="pet_color_01">08:00~20:00</span>
</div>


<!-- 객실타입 기술하기 -->
<h2 class="chart-text">객실 타입</h2><hr>
<div class="roomchart">
<div class="tbBox">
<table class="tbChart">
<tr>
<th>소형견</th>
<th>중형견</th>
<th>대형견</th>
</tr>
<tr>
<td>디럭스</td>
<td>슈페리어</td>
<td>슈페리어 / 스위트</td>
</tr>
</table>
</div>

<div class="tbBox tbBox2">
<table class="tbChart">
<tr>
<th>호텔링</th>
<th>데이케어</th>
</tr>
<tr>
<td><ul><li>넓은 공간에서 여유롭게 휴식을 취할 수 있는 호텔링</li><li>반려견 전문가의 세심한 케어로 안심하고 맡길 수 있습니다.</li></ul></td>
<td><ul><li>집에서 혼자 보내는 시간이 많은 반려견에게 신나는 하루를 선물하세요!</li><li>파격적인 할인혜택과 미용 & 그루밍 서비스가 제공되는 10/20회권</li></ul></td>
</tr>
</table>
</div>
<%-- <img class="chart1" src="${pageContext.request.contextPath}/resources/img/chart1.png"> --%>
<%-- <img class="chart2" src="${pageContext.request.contextPath}/resources/img/chart2.png"> --%>
</div>

<div class="container">
  <div class="row">
    <ul class="list_box">
      <!-- 첫 번째 줄 -->
      <li class="list_mb col-lg-4 col-md-4 col-sm-6 col-12">
        <img class="OrImgSix" src="${pageContext.request.contextPath}/resources/img/frisbee.png" alt="놀이터">
        <p class="c_gray">놀이터</p>
      </li>
      <li class="list_mb col-lg-4 col-md-4 col-sm-6 col-12">
        <img class="OrImgSix" src="/resources/img/petshower.png" alt="그루밍&amp;스파">
        <p class="c_gray">그루밍&amp;스파</p>
      </li>
      <li class="list_mb col-lg-4 col-md-4 col-sm-6 col-12">
        <img class="OrImgSix" src="${pageContext.request.contextPath}/resources/img/pet-shop.png" alt="온라인몰 ">
        <p class="c_gray">온라인 몰</p>
      </li>
      <!-- 두 번째 줄 -->
      <li class="list_mb col-lg-4 col-md-4 col-sm-6 col-12">
        <img class="OrImgSix" src="${pageContext.request.contextPath}/resources/img/pet-grooming.png" alt="미용">
        <p class="c_gray">미용</p>
      </li>
      <li class="list_mb col-lg-4 col-md-4 col-sm-6 col-12">
        <img class="OrImgSix" src="${pageContext.request.contextPath}/resources/img/walk-the-pet.png" alt="스튜디오">
        <p class="c_gray">스튜디오</p>
      </li>
      <li class="list_mb col-lg-4 col-md-4 col-sm-6 col-12">
        <img class="OrImgSix" src="${pageContext.request.contextPath}/resources/img/petcafe.png" alt="카페">
        <p class="c_gray">카페</p>
      </li>
    </ul>
  </div>
</div>

<div id="flexBox">
	<div class="square1">
	  <img class="petImg" src="${pageContext.request.contextPath}/resources/img/squareservice.png" alt="Image 1">
	  <h3 class="desc_text1">Pet Total<br>Service</h3>
	  <h6 class="square_desc">반려견의 자유롭고 행복한 삶을 실현하기 위한 안전하고 편리한 반려견 복합 문화공간입니다.</h6>
	</div>
	<div class="square2">
	  <img class="petImg" src="${pageContext.request.contextPath}/resources/img/squarestyle.png" alt="Image 2">
	  <h3 class="desc_text2">Pet Care<br>Styling</h3>
	 <h6 class="square_desc">애견 미용 및 스파 등 반려견을 위한 최고의 스타일과 서비스를 제공합니다.</h6>
	</div>
	<div class="square3">
	  <img class="petImg" src="${pageContext.request.contextPath}/resources/img/squarepet-shop.png" alt="Image 3">
	  <h3 class="desc_text3">Pet products<br>Mall</h3>
	  <h6 class="square_desc">견종별 다양한 사료와 반려견을 위한 다채로운 용품을 한 곳에서 만나볼 수 있습니다.</h6>
	</div>
</div>

	

<button type="button" class="resbtn" onclick="loginCheck(event)"><strong>예약하러 가기</strong></button>

<%@ include file="/dogcat_footer.jsp" %>
<br><br>
<script>
function loginCheck(event) {
    var isLoggedIn = <%= session.getAttribute("userId") != null %>;

    if (!isLoggedIn) {
        event.preventDefault(); 
        alert("로그인이 필요한 서비스입니다."); 
        window.location.href = "login.do";
    }else{
    	location.href='reservePage.rsv';
    }
}
</script>

</body>
</html>
