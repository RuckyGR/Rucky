<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dog.cat.punch.util.PagingVO" %>
<%@ include file="../../dogcat_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap" rel="stylesheet">
    
<style>
       

         .product {
      width: 100%; /* 예시로 너비를 30%로 설정 */
    }

    
    .product_wrap:hover{border:2px solid #FF8551;}
    
    .product-container{
    text-align: left;
    overflow: hidden;
    padding-top: 5px;
    margin: 0 auto;
    justify-content: center;
   	grid-template-columns: 1fr 1fr 1fr;
   display: grid;
	grid-template-columns: 326px 326px 326px;
	grid-template-rows: 510px 510px 510px;
}
    
/* .product-info{ margin:20px 0 30px 0; } */
   .product-info{text-align:left; margin:0 3px;}
   .product{ width: 300px;
    height: 500px;
    padding: 7px;
  	border: 3px solid #fff;
    vertical-align: top;

	}
	
	.product_wrap {
    float:left ;
    display:inline-block;
    width: 326px;
    height: 510px;
    border: 1px solid #FAF0E4;
    background: #fff;
	}
	.dogimg {
	 text-align:center;
	 width:300px;
	 height: 300px;
	 border : 1px solid black;
	}
	
    .page-link {color: #FF8551;
    background-color: #fdfdfd;
    border: 1px solid #fde8df;}
    
    
    .page-link:hover {    
    color: #ff5006;
    background-color: #fbdfdf;
    border: 1px solid #fde8df;}
   
   div#wrapper {
   	margin-top : 30px;
   }
   .proName {
   padding-top: 20px;
	display: inline-block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	word-break: break-all;
	width: 300px;
   }
   .strPri {
   font-size: 20px;
   color: #FF8551;
   font-family: 'Nanum Gothic', sans-serif;
   }
   .inCartBtn{
   	width : 45px;
   	position : relative;
    top: -40px;
    right: -250px;
    z-index : 999;
   }
   .delivery {
    font-size: small;
    background: #ccc;
    padding: 5px 10px;
    border-radius: 5px;
    }
   
   .listTitle{
   	margin : 60px 320px;
   	font-weight : 1000;
   	border-bottom : 1px solid #ccc;
   	padding-bottom : 10px;
   	
   }
   .recimgdiv {
	width: 100px;
	position: fixed;
	top: 388px;
	right: 200px !important;
	z-index: 99999;
	border : 1px solid #FF8551;
}
@media screen and (max-width: 390px) {
	div#wrapper {
		margin: 0 auto;
		width: 100%;
	}
	.div1{
		width: 390px !important;
	}
	.proBox {
		width:500px;
	}
	.product-container{
    overflow: none;
    margin: 0 auto;
   	grid-template-columns: none;
   display: grid;
	grid-template-rows: none;
	}
	.proBox {
	margin: 0 auto;
	overflow: visible;
	}
	#goHomeHeader, #toTop {
	right: 20px;
	margin-right: 0px;
	}
	.imghom {
	margin-right: 6px !important;
	}
	footer {
	height: 500px;
	}
	.ppimg {
	height: 400px;
	}
	.proSer {
	width: 350px;
	}
	.dogimg {
	width: 150px;
	height: 150px;
	}
	.product {
	height: 250px;
	padding : 7px 0 0 7px;
	}
	.proCard {
	height: 292px;
	}
	.product-info {
    flex-direction: column;
	}
   .proName {

	width: 150px;
   }
	.proPri {
	display: inline;
	}
	.product-container {
		grid-template-columns: 1fr 1fr;
		grid-template-rows: auto; 
    }
	.product_wrap {
		width: 94%; 
		margin: 0 5px; 
	}
	.footp {
	padding-right: 0px !important;
	}
	.inCartBtn {
    top: 4px;
    right: -121px;
}
.product_wrap:hover{border:1px solid #FF8551;}
            
   .listTitle {
   	margin : 30px;
   }
}
   
    </style>

</head>

<body>
<div id="wrapper">
    <div class="div1" style="width: 85%;"> 
	<h2 class="listTitle">${map.proType }</h2>
    <div class="product-container proBox" style="width: 80%;">
  
        <c:forEach var="pro" items="${uProductsList}">
        <div class="product_wrap remove_5th_right_boder proCard" >
            <div class="product" onclick="getPro('${pro.pro_no}', '${pro.pro_name}')" style="cursor: pointer; width: 100%;">
                <img class="dogimg" src="${pageContext.request.contextPath}/resources/img/productImg/${pro.pro_filename}">
                <div class="product-info" style="text-align: left;">
                    <p class="proName">${pro.pro_name}</p>
                    <p class="proPri"><strong class="strPri">${pro.pro_price}원</strong></p>
                </div>
                <span class="delivery">독켓배송</span>
            </div>  
            <a class="header-nav-item header-icon inCartBtn" href="#" onclick="inCart(${pro.pro_no});")>
                    <img src="${pageContext.request.contextPath}/resources/img/cart.png" alt="장바구니" >
                </a>
                </div>
        </c:forEach>
    </div>
     <br><br>
   <script>
		function inCart(proNo){
		const form = {
				pro_no : proNo,
				quantity : '1'
		}
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
		}
			
	</script> 
    
 <ul class="pagination justify-content-center">
                <c:if test="${paging.startPage != 1 }">
                    <li class="page-item">
                        <a class="page-link" href="u_productsList.pro?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&pro_type=${map.proType}">Previous</a>
                    </li>
                </c:if>

                
		        <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                    <c:choose>
                        <c:when test="${p == paging.nowPage }">
					        <li class="page-item"><b class="page-link">${p }</b></li>
				        </c:when>
                        <c:when test="${p != paging.nowPage }">
                            <li class="page-item"><a class="page-link" href="u_productsList.pro?nowPage=${p }&cntPerPage=${paging.cntPerPage}&pro_type=${map.proType}">${p }</a></li>
                        </c:when>
                    </c:choose>
                </c:forEach>

                <c:if test="${paging.endPage != paging.lastPage}">
                    <li class="page-item">
                        <a class="page-link" href="u_productsList.pro?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&pro_type=${map.proType}">Next</a>
                    </li>
                </c:if>
                   
        </ul>
    </div>
</div>
<br><br>
<%@ include file="u_recProduct.jsp" %>
<%@ include file="/dogcat_footer.jsp" %>

</body>
</html>