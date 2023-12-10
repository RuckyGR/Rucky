<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
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
html{display: grid;}
.dogimg {
   width: 20%;
   height: 20%;
}

.carttable {
   width: 100%;
   text-align: center;
}
a.deleteBtn{
	color : #ff6523;
}

a.deleteBtn:link {
   color: #ff6523;
   text-decoration : none;
}

a.deleteBtn:visited {
   color: black;
   text-decoration : none;
}

a.deleteBtn:hover {
   color: red;
   text-decoration : none;
}

a.deleteBtn:active {
   color: black;
   text-decoration : none;
}

th {
   background-color :  #FF8551;
   color : white;
   border : none;
}

.fbtn {
   background-color : #22668D;
   color : white;
   font-weight : bold;
   margin-top : 10px;
}

.payBtn {
   float : right;
}

/* 추가된 스타일 */
.container {
   width: 80%;
   margin: 0 auto;
}

h1 {
   color: #484848;
   margin-top: 20px;
}

.order_form {
   margin-top: 20px;
}

.carttable th {
   background-color: white;
   color: black;
   border-bottom: 2px solid #AFD7DB;
   border-top: 2px solid #AFD7DB;
   padding-top : 5px;
   padding-bottom : 5px;
}

.carttable td {
   border: none;
}

.button-container {
   text-align: right;
   margin-top: 20px;
}

.total_wrap {
   text-align: right;
   margin-top: 20px;
}

.price_info span {
   font-weight: bold;
   margin-left: 5px;
}

.totalPrice_span,
.delivery_price,
.finalTotalPrice_span {
   font-size: 1.2em;
   font-weight: bold;
   margin-left: 5px;
}

.finalTotalPrice_span {
   color: #FF8551;
}

.selectDel,
.allDeleteBtn,
.order_btn {
   margin-top: 10px;
   padding: 10px 15px;
   border: none;
   border-radius: 4px;
   cursor: pointer;
}

.selectDel {
   background-color: #FA5858;
   color: #fff;
   float : right;
}

.selectDel:hover {
   background-color: #FF0000;
}

.allDeleteBtn {
   background-color: #999;
   color: #fff;
}

.allDeleteBtn:hover {
   background-color: #808080;
}

.order_btn {
   background-color: #4692B8;
   color: #fff;
}

.order_btn:hover {
   background-color: #22668D;
}

/* 체크박스 스타일 통일성 추가 */
input[type="checkbox"] {
   -webkit-appearance: none;
   -moz-appearance: none;
   appearance: none;
   border: 2px solid #81BEF7; /* 체크박스 테두리 색상 */
   width: 15px; /* 체크박스 너비 */
   height: 15px; /* 체크박스 높이 */
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
#cartBtn{
	border : none;
	border-radius : 3px;
	background : #4692B8;
	color : white;
	padding : 10px;
}

@media ( max-width: 391px ) {
body{ min-width: 390px;   } 
.carttable{font-size: 10px !important;}
.dogimg{ margin: 25px 10px;}
.ke{margin:37px 0px 37px 60px !important; white-space:nowrap; overflow: hidden; text-overflow:ellipsis;width:120px;}
#cartBtn{font-size: 9px !important; padding: 5px;}
#selectDelBtn{width:70px; height:30px; font-size: 10px; padding: 5px 5px;}
[type="checkbox"]{margin-top:3px !important;}
 .carttable th {padding-left: 7px;}
 .carttable td {padding-left: 7px;}
}
</style>
<script>
$(function(){
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

const checkBoxes = document.getElementsByName('checkbx');
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

function selectDel(){
    var url = "/selectDelLike.pro";
    var valueArr = new Array();
    var list = $("input[name='checkbx']");
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
                alert("삭제 성공");
                location.href="/getLikeList.pro";
             }
          }
       });
       } else {
                alert("삭제 실패");
       }
    }
    
 }
</script>
</head>
<body>
	<%@ include file = "../user/u_myPage_menu.jsp" %>
		<h2>관심상품</h2>
		<c:choose>
			<c:when test="${map.count == 0}">
            찜한 상품이 없습니다.
        </c:when>
			<c:otherwise>

				<form action="주문" method="post">
					<table class="carttable" style="display: grid;">
						<tr>
							<th width="5%"><div class="all_check_input_div">
									<input type="checkbox" class="all_check_input input_size_20" id="checkALL" checked><label for="checkAll"></label><span class="all_chcek_span"></span>
								</div></th>
							<th width="50%">상품정보</th>
							<th width="15%">가격</th>
							<th width="10%">삭제</th>
							<th></th>
						</tr>
						<%
						int i = 0;
						%>
						<c:forEach var="like" items="${map.likeList}">
							<tr>
								<td class="cart_info_td"><input type="checkbox" id="ckbx<%=i%>" onclick="checkBoxValueChanged();" name="checkbx" value="${like.like_pro_no }" class="individual_cart_checkbox input_size_20" checked><label for="ckbx<%=i%>"></label>
								<td><img class="dogimg" src="${pageContext.request.contextPath}/resources/img/productImg/${like.pro_filename}" style="float: left; border:1px solid #ccc;"><div class="ke" style="margin:37px 0px 37px 120px; text-align:left;">${like.pro_name}</div></td>
								<td><fmt:formatNumber value="${like.pro_price}" />원</td>
								<td><a href="deletelike.pro?like_pro_no=${like.like_pro_no }" class="deleteBtn">[삭제]</a></td>
								<td><input type="hidden" class="pro_no" value="${like.pro_no }"><button id="cartBtn" type="button" onclick="cartBtnClick(${like.pro_no});">장바구니</button></td>
							</tr>
							<%
							i++;
							%>
						</c:forEach>
					</table>
					<button type="button" id="selectDelBtn" class="selectDel fbtn" onclick="selectDel();">선택삭제</button>
				</form>

			</c:otherwise>
		</c:choose>
		
	</div>
	</div>
	
	<br><br>
	<%@ include file="/dogcat_footer.jsp" %>
	<script>
	function cartBtnClick(proNo){
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
</body>
</html>