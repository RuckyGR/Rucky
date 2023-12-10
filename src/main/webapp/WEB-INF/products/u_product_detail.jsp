<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.js"></script>
<!--   <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script> -->
<title>상품상세정보</title>
<style>
#selectAmount {
	width: 60px !important;
	height: 35px !important;
	font-size: 13px;
	padding: 0.3rem 0.5rem;
}

.recimgdiv {
	width: 100px;
	position: fixed;
	top: 388px;
	right: 200px !important;
	z-index: 99999;
	border : 1px solid #FF8551;
}
.container {
	width: 100%;
	padding: 0 5px;
	margin: 0 auto;
}

.nav {
	margin: 20px 10px;
	max-width: 90%;
}

.tab-content {
	margin: 20px 10px;
	max-width: 90%;
}

.noti {
	margin: 50px 200px;
}

.cs-intro {
	list-style-type: none;
	color: #2e2e2f;
}

.container {
	padding: 0 20px;
}

/* 화면 전체 렙 */
.wrapper {
	width: 90%;
	margin-top: 30px;
}

.btn:focus {
	outline: 0;
	box-shadow: 0 0 0 0.0rem rgba(0, 123, 255, .25) !important;
}

button {
	text-decoration-line: none;
	box-shadow: none;
	outline: none;
}

.form-control {
	display: inline !important;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

#right {
	float: left;
	height: 600px;
	width: 50%;
}

#left {
	float: right;
	height: 600px;
	width: 50%;
}

.form-control:focus {
	color: #495057;
	background-color: #fff;
	border-color: #ced4da;
	outline: 0;
	box-shadow: 0 0 0 0rem #ced4da;
}

#selectAmount {
	width: 70px;
	height: 40px;
	text-decoration-line: none;
	box-shadow: none;
	outline: none;
	border: 1px solid lightgray;
	padding: 0 auto;
}

.move {
	color: #000 !important;
	text-decoration-line: none;
	box-shadow: none;
	outline: none;
	border: none;
	float: left;
}

.move:hover {
	color: #FF8551 !important;
	text-decoration-line: none;
	box-shadow: none;
	outline: none;
	border: none;
}

.nav-item {
	width: 50%;
	background-color: #0d81c37d;
	text-align: center;
	border-bottom: 1px solid #f3f9ff;
}

.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
	width: 100%;
	color: #fff;
	background-color: #22668D !important;
	border-radius: 0;
	margin: 0 auto;
}

.nav-link {
	color: #fff !important;
	text-decoration: none;
	text-decoration-line: none;
	box-shadow: none;
	outline: none;
	border: none;
}

.nav-link:hover {
	color: #fff !important;
}

.pil {
	width: 100%;
	margin: 0 auto;
}

img#like {
	cursor: pointer;
}

div.row {
	margin: 2px 0;
}

div.picCon {
	margin-bottom: 15px;
}

.p1 {
	font-size: 13px;
}

.form-group {
	margin-bottom: 0.1rem !important;
}

p {
	margin-bottom: 0.5rem !important;
}
.quality-section{
margin : 10px 0 ;
}
.star-rating {
   font-size: 24px;
   color: orange;
}
.totalreview {
    margin-left: 860px;
    padding: 10px;
    border-radius: 5px;
    background-color: #22668D;
    color: white;
    border: none;
}
@media ( max-width : 391px ) {
	body {
		min-width: 390px;
		font-size: 15px !important;
	}
	.noti {
		margin: 0 10px !important;
	}
	.tit {
		font-size: 21px !important;
	}
	.list-type {
		font-size: 12px !important;
		margin: 0 -30px;
		width: 350px;
	}
	.nav {
		margin: 20px 5px;
		max-width: 90%;
	}
	.tab-content {
		margin: 20px 5px;
		max-width: 90%;
	}
	#right, #left {
		width: 100%;
	}
	h1.page-header {
		display: none;
	}
	#selectAmount {
		width: 60px !important;
		height: 30px !important;
		font-size: 15px !important;
	}
	.p1 {
		font-size: 13px !important;
	}
	.btn-default {
		font-size: 15px !important;
		width: 90px !important;
		height: 40px !important;
	}
	#like {
		width: 30px !important;
		height: 30px !important;
	}
	.fa-shopping-cart {
		font-size: 10px !important;
	}
	.d-block {
		width: 350px !important;
		height: 350px !important;
	}
	.container {
		padding: 0 5px !important;
	}
	.deText {
		width: 350px;
	}
	.container {
		margin-bottom: 150px !important;
	}
	#orderBtn, #cartBtn {
		width: 141px !important;
	}
	.nav-item {
		width: 171px;
	}
 	.detimg{ 
 	width : 350px!important; 
 	height : 350px!important; 
 	} 
 	.dcimg{
 	margin : 10px 0!important;
 	width : 350px!important; 
 	height : 350px!important; 
 	}
 	.star-rating,
    .v_writer,
    .v_regdate {
      display: block;
        }
        
        .totalreview {
    margin-left: 256px;
    margin-bottom : 10px;
    padding: 7px;
    border-radius: 3px;
}
        
}
</style>
<script>
$(document).ready(function(){
	$(".like").on("click", function(){
		$.ajax({
			url : "/like.pro",
			type: "GET",
			data: {pro_no :'${Products.pro_no}'},
			cache: false,
			success:function(data){
				
				if(data == 1){
					like2 = true;
					alert("상품 찜 하셨습니다.");
					$('#like').prop("src", "/resources/img/heart_fill.png");
				}
			
			else if(data == -1){
				alert("로그인이 필요한 서비스입니다.");
			}
			else{
				like2 = false;
				alert("상품 찜 취소하셨습니다.");
				$('#like').prop("src","/resources/img/heart.png");
			}
		},
		error:function(error){
			console.log(error);
		}
		});
	});
	
	 $("#orderBtn").on("click", function(){
         let odCount = $(".quantity_input").val();
        $("form").find("input[name='orders[0].od_count']").val(odCount);
          $('form').attr( "action", "u_insertOrder.od" );
          $('form').submit();
      });
});
document.addEventListener("DOMContentLoaded", function() {
	   var starElements = document.querySelectorAll(".star-rating");
	   
	   starElements.forEach(function(starElement) {
	      var rating = starElement.getAttribute("data-rating");
	      starElement.innerHTML = "★".repeat(rating);
	   });
	});
	
//이미지 클릭시 확대 및 축소
let isZoomed = false;

function seeImg(filename, index) {
    const img = document.getElementById('divImg' + index);

    if (isZoomed) {
        // 이미지가 확대된 상태이면 원래 크기로 돌아감
        img.style.width = '150px';
        img.style.height = '150px';
    } else {
        // 이미지가 확대되지 않은 상태이면 1.5배 확대
        img.style.width = '285px';
        img.style.height = '285px';
    }

    // 확대/축소 상태를 업데이트
    isZoomed = !isZoomed;
} 
	</script>
</head>



<body>
	<%@ include file="../../dogcat_header.jsp"%>
	<div class="wrapper">
		<form method="post">
			<input type="hidden" name="orders[0].pro_no"
				value="${Products.pro_no}"> <input type="hidden"
				name="orders[0].od_count" class="odCountInput" value="">

			<div class="container-fluid">

				<h1 class="page-header"
					style="text-align: left; margin-bottom: 50px; margin-left: 380px;">${Products.pro_name}</h1>
				<input type="hidden" value="${Products.pro_no}" name="pro_no">
			</div>



			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-5 picCon">
					<img
						src="${pageContext.request.contextPath}/resources/img/productImg/${Products.pro_filename}"
						style="max-width: 350px; height: 350px; margin-right: 80px !important; border-radius: 5%; border: 1px solid black;"
						class="mx-auto d-block" />
				</div>

				<div class="col-sm-5">
					<h3 class="page-header">
						<span>${Products.pro_name}</span><br> <small
							style="color: #22668D; font-size: 13px;">${Products.pro_descript}</small>
					</h3>


					<div class="form-group"
						style="text-align: left; font-weight: bold;">
						<label>가격 : </label><span>&nbsp;<fmt:formatNumber
								value="${Products.pro_price}" type="number" /></span><span>&nbsp;원
							<input type="hidden" value="${Products.pro_price}"
							id="resultPrice" name="pro_price">
					</div>

					<div class="form-group" style="text-align: left;">
						<label>배송비 : </label><span>&nbsp;5000원</span>
						<p class="p1" style="font-weight: bolder">( ※5만원 이상 결제시 무료배송 )</p>
						<p class="p1">
							<a class="move"
								href="u_productsList.pro?pro_type=${Products.pro_type}">배송비
								절약하기▶</a>
						</p>
						<br>

						<p class="p1" style="margin: 7px 0;">
							<i class="fas fa-clock" style="color: #FF8551"></i>&nbsp;오후 3시 이전
							주문 시 오늘출발
						</p>
					</div>

					<div class="form-horizontal" style="text-align: left;">

						<label>구매수량 : </label> <select class="form-control quantity_input"
							name="quantity" id="selectAmount">
							<c:forEach begin="1" end="10" var="count">
								<option value="${count}">${count}</option>
							</c:forEach>
						</select>
					</div>

					&nbsp;&nbsp;&nbsp;&nbsp;
					<div class="row">
						<button id="cartBtn" class="btn btn-default"
							style='font-size: 15px; background-color: #fff; border: 1px solid #22668D; border-radius: 0; width: 120px; height: 50px; color: #22668D;'>
							<i class='fas fa-shopping-cart'
								style='font-size: 15px; color: #22668D'></i>&nbsp;장바구니
						</button>
						<button id="orderBtn" class="btn btn-default"
							style='font-size: 15px; background-color: #22668D; border: 1px solid #22668D; border-radius: 0; width: 120px; height: 50px; color: #fff;'>주문하기</button>

						&nbsp;&nbsp;
						<div class="selected_option" style="text-align: right;"></div>
						<c:if test="${like != null}">

							<a class=like> <c:if test="${like.like_check == 0 }">
									<img id="like" class="l1"
										src="${pageContext.request.contextPath}/resources/img/heart.png"
										style="width: 40px; height: 40px; margin-top: 5px;">
								</c:if> <c:if test="${like.like_check == 1 }">
									<img id="like" class="l1"
										src="${pageContext.request.contextPath}/resources/img/heart_fill.png"
										style="width: 40px; height: 40px; margin-top: 5px;">
								</c:if>
							</a>
						</c:if>
						&nbsp;&nbsp;
					</div>
				</div>
				<br>

			</div>

		</form>
		<div class="col-sm-1"></div>

	</div>


	<br>
	<br>


	<div class="container" style="margin-bottom: 300px;">

		<br>
		<div class="pil">
			<ul class="nav nav-pills" role="tablist">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="pill" href="#home"><b>상품상세</b></a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="pill"
					href="#menu1"><b>리뷰</b></a></li>
			</ul>

			<div class="tab-content">
				<div id="home" class="container tab-pane active">
					<br>
					<h3>상품상세</h3>
					<img class="dcimg" style="max-width: 350px; height: 350px; margin-right : 80px; border-radius: 5%; border: 1px solid #ddd;" src="${pageContext.request.contextPath}/resources/img/productImg/bestquality.png"/>
					<img class="dcimg" style="max-width: 350px; height: 350px; border-radius: 5%; border: 1px solid #ddd;" src="${pageContext.request.contextPath}/resources/img/productImg/brand.png"/><br>
				<div class="quality-section">
        			<p style="font-weight: bold; font-size: 1.8em;">Quality 100%</p>
       				<p style="font-size: 1.3em;">고객님에게 최상의 품질을 제공하기 위해 항상 100%의 헌신을 다하고 있습니다. </p>
        			<p style="font-size: 1.3em;">우리 제품은 최고 품질의 소재로 만들어져 있습니다. 고객님의 반려동물에게 최고의 경험을 선사합니다.</p>
       				<p style="font-weight: bold; font-size: 1.8em;">자체생산 차별화된 품질</p>
        			<p style="font-size: 1.3em;">우리는 자체적으로 제품을 생산하여 다른 쇼핑몰과의 차별화된 품질을 유지합니다. 고객님의 만족을 위해 최선을 다하겠습니다.</p>
        			
    			</div>
					<img class="detimg" style="max-width: 800px; height: 800px; border-radius: 5%; border: 1px solid #ddd;" src="${pageContext.request.contextPath}/resources/img/productImg/${Products.pro_filename}"/>
					<p style="font-size: 1.55em; margin : 10px 0;">${Products.pro_descript}</p>
				</div>
				<div id="menu1" class="container tab-pane fade">
					<br>
					<button class="totalreview" onclick="location.href='getReviewList.rev'">전체목록</button>
					<c:forEach items="${reviewList}" var="review" varStatus="loop">
						<c:if test="${review.rep_hide eq 'Y'}">
							<ul>
								<li>
									<div>
										<input type="hidden" name="rev_seq" value="${review.rev_seq}">
										<div>
											<span class="v_prodname "
												onclick="getPro('${review.pro_no}', '${review.pro_name}')">${review.pro_name}</span>
										</div>
										<div style="display: inline;">
										
											<div class="star-rating cons" style="display: inline;"
												data-rating="${review.rev_star}" readonly></div>
												
											<div style="display: inline;" class="starpoint">${review.rev_star}</div>
											<span class="v_writer" id="buyerName">구매자 :
												${review.rev_writer}</span> <span class="v_regdate">등록일 :
												${review.rev_regdate}</span>
										</div>
									</div> <br>
									<div style="margin-bottom: 15px;">
										<div class="innm"
											style="width: 40%; height: 200px; resize: none; vertical-align: middle; display: inline; border: none;"
											id="comment" name="rev_content" readonly>
											<p class="revCo"
												style="display: inline-block; height: 150px; margin-bottom: 0px;">${review.rev_content}</p>
										</div>
										<div style="display: inline; width: 20%">
											<c:choose>
												<c:when test="${empty review.rev_filename}">
												</c:when>
												<c:otherwise>
													<img id="divImg${loop.index}"
														style="width: 150px; height: 150px; cursor: pointer;"
														onclick="seeImg('${review.rev_filename}', ${loop.index})"
														src="${pageContext.request.contextPath }/resources/img/${review.rev_filename}">
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<div style="display: inline;">
										<div class="modidelebox">
											<c:if test="${review.rev_writer eq userId}">
												<input type="hidden" name="rev_seq_writer"
													value="${review.rev_seq}_${review.rev_writer}">
												<div class="sude">
													<a href="/selectReview.rev?rev_seq=${review.rev_seq}"
														class="btbt">수정</a> │
													<button class="revDel btbt" type="button"
														style="padding: 0px;">삭제</button>
												</div>
											</c:if>
										</div>
									</div>
								</li>
							</ul>
							<hr>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>



	</div>
	<hr>
	<div class="noti">
		<div class="sec type03" style="border-radius: 5px;">
			<h1 class="tit type02 cs-intro"
				style="font-size: 17px; font-weight: 500;">★배송정보</h1>
			<ul class="list-type type02 cs-intro" style="font-size: 13px">
				<li class="deText">5만원 이상 구매 시 무료배송됩니다. (부피, 무게 무관)</li>
				<li class="deText">제주, 도서산간 지역은 3,000원 택배비 추가됩니다.</li>
				<li class="deText">독켓펀치 출고상품 경우 [평일 오후 3시 까지, 토요일 낮 12시 결제건] 까지
					당일출고됩니다.</li>
				<li class="deText">택배 업체 상황에 따라 [CJ대한통운, 롯태택배] 로 출고될수 있습니다.</li>
				<li class="deText">업체 배송에 경우 1~3일가량 추가로 소요될 수 있습니다.</li>
				<li class="deText">천재지변, 물량 수급 변동 등 예외적인 사유 발생 시, 지연될 수 있는 점 양해
					부탁드립니다.</li>
			</ul>
		</div>
		<div class="sec type03" style="border-radius: 5px; margin-top: 20px;">
			<h1 class="tit type02 cs-intro"
				style="font-size: 17px; font-weight: 500;">★교환, 반품 안내</h1>
			<ul class="list-type type02 cs-intro" style="font-size: 13px">
				<li class="deText">단순변심에 의한 환불은 제품 수령후 7일이내에 신청 가능합니다. (왕복배송비
					고객부담)</li>
				<li class="deText">단순변심에 의한 반품시 배송박스 수량에 따라 반품 택배비가 추가됩니다.</li>
				<li class="deText">포장개봉, 조립, 사용 등으로 인해 재판매가 불가능할 경우 반품이 불가능 할 수
					있습니다.</li>
				<li class="deText">제품 하자의 경우 물품 수령 후 30일이내 반품 가능합니다.</li>
			</ul>
		</div>
		<div class="sec type03" style="border-radius: 5px; margin-top: 20px;">
			<h1 class="tit type02 cs-intro"
				style="font-size: 17px; font-weight: 500;">★네이버페이 결제시 교환/반품
				주의사항</h1>
			<ul class="list-type type02 cs-intro" style="font-size: 13px">
				<li class="deText">독켓펀치에서는 자체 물류 운영으로 물류센터의 상품 출고지와 교환 및 반품지
					주소가 서로 다릅니다.</li>
				<li class="deText">네이버페이 결제시 반품/교환시 택배 자동수거설정이 불가한점 양해부탁드립니다.</li>
				<li class="deText">네이버페이로 주문하신 고객님은 상품 반품 및 교환 요청시 카톡상담 또는 1:1
					게시판을 통해<br> 요청해주시면 빠르게 접수 후 저희가 제품 회수 접수를 도와드리도록 하겠습니다.
				</li>
			</ul>
		</div>
	</div>


	<br>
	<br>
	<%@ include file="u_recProduct.jsp"%>
	<%@ include file="/dogcat_footer.jsp"%>

	<script>
		const form = {
				pro_no : '${Products.pro_no}',
				quantity : ''
		}
		
		$("#cartBtn").on("click", function(e){
			form.quantity = $(".quantity_input").val();
			$.ajax({
				url : '/insertCart.cart',
				type : "POST",
				data : form,
				cache : false,
				success : function(result){
					if(result == '0'){
						alert("장바구니에 추가 하지 못하였습니다.");
					} else if(result == '1'){
						alert("장바구니에 추가되었습니다.");
						if(confirm("장바구니로 이동하시겠습니까?")){
							location.href="/getCart.cart"
						}
					} else if(result == '2'){
						alert("장바구니에 이미 추가되어져 있습니다.");
					} else if(result == '5'){
						alert("로그인이 필요합니다.");	
					}
				}
			})
			
		});
	</script>
</body>
</html>