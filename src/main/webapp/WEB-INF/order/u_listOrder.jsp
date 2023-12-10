<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date,dog.cat.punch.util.PagingVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.js"></script>
<style>
.tb {
	width: 100%;
	border: none;
}

.mobtn {
	margin-left: 10px;
	height: calc(1.5em + 0.75rem + 2px);
	background-color: #AFD7DB;
	color: black;
	border: none;
}

.mobtn:hover {
	color: white;
	background-color: #22668D;
}

.monthInput {
	display: inline-block;
	margin-right: 10px;
}

#startDate {
	height: calc(1.5em + 0.75rem + 2px);
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
	margin-right: 20px;
}

#endDate {
	height: calc(1.5em + 0.75rem + 2px);
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
	margin-left: 20px;
}

.monthLabel {
	display: inline-block;
	cursor: pointer;
	padding: 10px 20px;
	background-color: #AFD7DB;
	color: black;
	border-radius: 5px;
	height: 30px;
}

strong {
	margin-right: 20px;
}

input[type="radio"]:checked+.monthLabel {
	background-color: #2980b9;
}

th, td {
	border: none;
}

.tb {
	border-bottom: 2px solid #AFD8DB;
}

.tb thead th {
	border-bottom: 1px solid #AFD7DB;
	border-top: 2px solid #AFD7DB;
}

.theadbar {
	font-weight: bold;
	font-size: 13pt;
	border-bottom: 1px solid #AFD7DB;
}

.theadbar, .tbody {
	text-align: center;
}

tr {
	height: 50px;
}

input[type="radio"] {
	display: none;
}

.sesese {
	background-color: #AFD7DB;
	border: none;
	color: black;
	margin-left: 15px;
}

.btn-success {
	color: black !important;
	background-color: #AFD7DB !important;
	border: none !important;
}

.sesese:hover {
	color: white;
	background-color: #22668D;
}

.form-container {
	display: flex;
}

.form-inline {
	margin-bottom: 20px;
}

.revWrite {
	text-decoration: none;
	border-radius: 5px;
	padding: 5px;
	border: 1px solid #AFD7DB;
}

.revWrite:hover {
	text-decoration: none;
}

.odPayName {
	display: inline-block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	word-break: break-all;
	width: 250px;
	margin-top: 11px;
}
	.odPayNameLink {
    pointer-events: none;
    text-decoration: none;
    color: inherit;
    }

@media screen and (max-width: 390px) {
	#startDate {
		width: 153px !important;
		margin-right: 2px !important;
	}
	#endDate {
		width: 153px !important;
		margin-left: 2px !important;
	}
	.orDateSub {
		margin-left: 0px;
		width: 330px;
		margin-top: 10px;
	}
	.btn {
		width: 330px;
		margin: 5px 0px;
	}
	.strDate {
		display: block;
	}
	.formDate {
		display: inline !important;
	}
	.monthLabel {
	margin-bottom: 0px;
    height: 40px;
    padding-left: 0px;
    padding-right: 0px;
    width: 70px;
    text-align: center;
	}
	.monthLabelBack {
	width: 90px;
	}
	#searchMonth {
    flex-flow: nowrap;
	}
	.sizeDel {
	display: none;
	}
	.odPayName {
	width: 150px;
	}
    .odPayNameLink {
      pointer-events: auto;
      text-decoration: underline;
      color: blue;
    }
}
</style>
<script>
$(document).ready(function(){
   $(".monthInput").on("click", function(){
      $('#searchMonth').attr( "action", "u_listOrder.od" );
      $('#searchMonth').submit();
   });
   $(".monthSixInput").on("click", function(){
      $('#searchSix').attr( "action", "u_listOrder.od" );
      $('#searchSix').submit();
   });
   
});

$("#deliverBtn").click(function () {
   $('#updateDiv').attr( "style", "display: inline" );
   $("#deliverBtn").hide();
});

$("#updateBtn").click(function () {
   if(!confirm("수정하시겠습니까?")){
      alert("주문상태가 변경되지 않았습니다.");
   }else{
      $('#updateForm').submit();
      alert("주문상태 변경 완료되었습니다.");
   }
});

$("#cancelUBtn").click(function () {
   $("#deliverBtn").show();
   $("#updateDiv").hide();
});

$("#updateDiv").hide();



function updateOrder(){
$.ajax({
   url : "updateOrder.od",
   data : {
      "od_num": $("#od_num").val(),
      "od_delivery": $("#od_delivery").val(),
      "searchCondition": "${conditionMap['a_delivery']}"
      },
   method : "POST",
   success : function(val){
      console.log(val);
      if(val==1){
         alert("수정 완료되었습니다.");
      }
      else alert("수정 실패했습니다.");
   },
   error :  function(request, status){
      alert("수정 실패했습니다. error");
   }
});
}

</script>
</head>
<body>
<%@ include file="../user/u_myPage_menu.jsp" %>
<div class="container">
   <br>
   <h1>주문배송조회</h1>
   <h4>주문횟수 ${itemLength }</h4>
   <hr>
   
   <div>
   
   <form class="form-inline formDate" action="" method="post">
      <strong class="strDate">기간조회</strong>
      <input type="hidden" name="searchCondition" value="${conditionMap['u기간선택']}">
      <span><label class="monthLabel1" for="startDate"></label><input type="date" name="searchKeyword" id="startDate" value=""></span>
      <span> ~</span>
      <span><label class="monthLabel1" for="endDate"></label><input type="date" name="searchKeyword2" id="endDate" value=""></span>
      <button class="btn btn-success mobtn orDateSub" type="submit">검색</button>
   </form>
   
      <div class="form-container">
   <form class="form-inline" action="" id="searchMonth" method="post">
      <input type="hidden" name="searchCondition" value="${conditionMap['u기간조회']}">
      <span class="monthInput"><input type="radio" name="searchKeyword" id="oneMonth" value="1"><label class="monthLabel" for="oneMonth">1개월</label></span>
      <span class="monthInput"><input type="radio" name="searchKeyword" id="ThreeMonth" value="3"><label class="monthLabel" for="ThreeMonth">3개월</label></span>
      <span class="monthInput"><input type="radio" name="searchKeyword" id="sixMonth" value="6"><label class="monthLabel" for="sixMonth">6개월</label></span>
   </form>
   <form class="form-inline" action="" id="searchSix" method="post">
      <input type="hidden" name="searchCondition" value="${conditionMap['u6개월']}">
      <span class="monthSixInput"><input type="radio" name="searchKeyword" id="beforeSix" value=""><label class="monthLabel monthLabelBack" for="beforeSix">6개월 이전</label></span>
   </form>
      </div> 
   
   <form class="form-inline" action="u_listOrder.od" id="searchDelivery" method="post">
      <strong>주문상태</strong>
      <input type="hidden" name="searchCondition" value="${conditionMap['u주문상태']}">
      <select class="form-control" id="sel1" name="searchKeyword" onchange="deliverySearch()" >
         <option value="결제완료" <c:if test ="${searchKeyword eq '결제완료'}">selected="selected"</c:if>>결제완료</option>
         <option value="상품준비중" <c:if test ="${searchKeyword eq '상품준비중'}">selected="selected"</c:if>>상품준비중</option>
         <option value="배송중" <c:if test ="${searchKeyword eq '배송중'}">selected="selected"</c:if>>배송중</option>
         <option value="배송완료" <c:if test ="${searchKeyword eq '배송완료'}">selected="selected"</c:if>>배송완료</option>
         <option value="주문취소" <c:if test ="${searchKeyword eq '주문취소'}">selected="selected"</c:if>>주문취소</option>
      </select> 
      <button class="btn btn-success sesese" type="submit">검색</button>
   </form>
</div>
   
   <br>
   <table class="tb" border="1">
   <thead class="theadbar">
      <tr>
         <th class="sizeDel">주문번호</th>
         <th>주문일자</th>
         <th>주문상품</th>
         <th class="sizeDel">총구매금액</th>
         <th>주문상태</th>
         <th class="sizeDel">구매후기</th>
      </tr>
   </thead>
      <c:choose>
          <c:when test="${fn:length(orderList) == 0}">
            <tr>
               <td colspan="6">조회 결과가 없습니다.</td>
            </tr>
          </c:when>
          <c:otherwise>
            <c:forEach items="${orderList }" var="item">
            <tbody class="tbody">
               <tr>
                  <td class="sizeDel">
                     <a href="detailOrder.od?od_num=${item.od_num }">
                     ${item.od_num }
                     </a>
                  </td>
                  <td>
                     ${item.od_date }
                  </td>
                  <td class="odPayName">
                     <a class="odPayNameLink" href="detailOrder.od?od_num=${item.od_num }">
                     ${item.od_payname}
                     </a>
                  </td>
                  <td class="sizeDel">
                     <fmt:formatNumber value="${item.od_payprice }" pattern="#,###"/>원
                  </td>
                  <td>
                     ${item.od_delivery}
                  </td>
                  <td class="sizeDel">
                  <a href="insertReview.rev?od_num=${item.od_num }" class="revWrite">후기작성</a>
                  </td>
               </tr>
               </tbody>
            </c:forEach>
          </c:otherwise> 
      </c:choose>
   </table>
   <br><br><br>
   
   
   <colspan="5" style="text-align: center">
         <ul class="pagination justify-content-center">

            <c:if test="${paging.startPage != 1 }">
               <li class="page-item"><a class="page-link"
                  href="u_listOrder.od?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}"> 
                  <span aria-hidden="true">&laquo;</span></a>
               </li>
            </c:if>


            <c:forEach begin="${paging.startPage }" end="${paging.endPage }"
               var="p">
               <c:choose>
                  <c:when test="${p == paging.nowPage }">
                     <li class="page-item"><b class="page-link">${p }</b></li>
                  </c:when>
                  <c:when test="${p != paging.nowPage }">
                     <li class="page-item"><a class="page-link"
                        href="u_listOrder.od?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
                  </c:when>
               </c:choose>
            </c:forEach>

            <c:if test="${paging.endPage != paging.lastPage}">
               <li class="page-item"><a class="page-link"
                  href="u_listOrder.od?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}"> 
                  <span aria-hidden="true">&raquo;</span></a>
               </li>
            </c:if>
         </ul>
      
   <br><br>
</div>
</div>
<%@ include file="/dogcat_footer.jsp" %>

</body>
</html>