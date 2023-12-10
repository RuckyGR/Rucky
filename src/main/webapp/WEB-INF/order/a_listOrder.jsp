<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date,dog.cat.punch.util.PagingVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../admin/a_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.js"></script>
<script>
$(document).ready(function(){
	
	// 검색
	$(".monthInput").on("click", function(){
		$('#searchMonth').attr( "action", "u_listOrder.od" );
		$('#searchMonth').submit();
	});
	$(".monthSixInput").on("click", function(){
		$('#searchMonth').attr( "action", "u_listOrder.od" );
		$('#searchMonth').submit();
	});
	$(".monthSixInput").on("click", function(){
		$('#searchMonth').attr( "action", "u_listOrder.od" );
		$('#searchMonth').submit();
	});
	
	
	// 취소
	$("#cancelBtn").click(function () {
		if(!confirm("정말 취소하시겠습니까?")){
			alert("취소되지 않았습니다.");
		}else{
			$('#canForm').attr( "action", "paycan" );
			$('#canForm').submit();
			alert("주문 취소 완료");
		}
	});
	
});

</script>
<style>
.mobtn{
    margin-left: 10px;
    height: calc(1.5em + 0.75rem + 2px);
    background-color: #22668D;
color: white;
border : none;
}
#startDate{
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
#endDate{
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
strong{
margin-right : 20px;
}
 .form-container {
    display: flex;
  }

input[type="radio"] {
    display: none; 
    
}

.monthInput {
    display: inline-block;
    margin-right: 10px; 
}

.monthLabel {
    display: inline-block;
    cursor: pointer;
    padding: 10px 20px;
    background-color: #22668D; 
    color: #fff; 
    border-radius: 5px; 
    height: 30px;
}

input[type="radio"]:checked + .monthLabel {
    background-color: #2980b9; 
}

.form-inline {
    margin-bottom: 20px;
}


hr {
    margin: 20px 0;
}
.trhead{
border-bottom: 1px solid #22668D;
border-top: 2px solid #22668D;
text-align : center;
}
.table{
border-bottom: 2px solid #22668D;
font-size : 15px;
}
.table th, .table td {
border : none;
text-align : center;
}
table{
padding : 11px !important;
}

#cancelBtn{
display : block;
height : 40px;
border-radius : 5px;
margin : 0 auto;
text-align : center;
background-color: #fff;
color: #22668D;
border: 1px solid #22668D;
}
#cancelBtn:hover {
    background-color: #22668D; 
    color: #fff;
}
#cancelBtn:disabled {
    background-color: #bbb;
    border: 1px solid #bbb; 
    color: #fff;
}

.sesese{
background-color: #22668D;
color: white;
border : none;
}
</style>
</head>
<body>
<div class="container">
	<br>
	<h1>주문배송조회</h1>
	<h4>전체주문 ${itemLength }회</h4>
	<hr>
	
	<div>
	
	<form class="form-inline" action="" method="post">
		<strong>기간조회</strong>
		<input type="hidden" name="searchCondition" value="${conditionMap['기간선택']}">
		<span><label class="monthLabel1" for="startDate"></label><input type="date" name="searchKeyword" id="startDate" value=""></span>
		<span> ~</span>
		<span><label class="monthLabel1" for="endDate"></label><input type="date" name="searchKeyword2" id="endDate" value=""></span>
		<button class="btn btn-success mobtn" type="submit">검색</button>
	</form>
	
	
	<form class="form-inline" action="u_listOrder.od" id="searchDelivery" method="post">
		<strong>주문상태</strong>
		<input type="hidden" name="searchCondition" value="${conditionMap['주문상태']}">
		<select class="form-control" id="sel1" name="searchKeyword" style="display: inline-block !important; margin-right: 10px;">
			<option value="결제완료">결제완료</option>
			<option value="상품준비중">상품준비중</option>

			<option value="배송중">배송중</option>
			<option value="배송완료">배송완료</option>
			<option value="주문취소">주문취소</option>
		</select> 
		<button class="btn btn-success sesese" type="submit">검색</button>
	</form>
	
	
	<form class="form-inline" action="" id="searchInfo" method="post">
		<strong>검색</strong>
		<select class="form-control" id="sel1" name="searchCondition" style="display: inline-block !important; margin-right: 10px;">
			<option value="${conditionMap['아이디']}">아이디</option>
			<option value="${conditionMap['주문자명']}">주문자명</option>
			<option value="${conditionMap['이메일']}">이메일</option>
			<option value="${conditionMap['전화번호']}">전화번호</option>
			<option value="${conditionMap['주문번호']}">주문번호</option>
		</select> 
			<input class="form-control mr-sm-2" type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
		<button class="btn btn-success sesese" type="submit">검색</button>
	</form>
	
	</div>
		<div class="form-container">
	<form class="form-inline" action="" id="searchMonth" method="post">
		<input type="hidden" name="searchCondition" value="${conditionMap['기간조회']}">
		<span class="monthInput"><input type="radio" name="searchKeyword" id="oneMonth" value="1"><label class="monthLabel" for="oneMonth">1개월</label></span>
		<span class="monthInput"><input type="radio" name="searchKeyword" id="ThreeMonth" value="3"><label class="monthLabel" for="ThreeMonth">3개월</label></span>
		<span class="monthInput"><input type="radio" name="searchKeyword" id="sixMonth" value="6"><label class="monthLabel" for="sixMonth">6개월</label></span>
	</form>
	<form class="form-inline" action="" id="searchSix" method="post">
		<input type="hidden" name="searchCondition" value="${conditionMap['6개월']}">
		<span class="monthInput"><input type="radio" name="searchKeyword" id="beforeSix" value=""><label class="monthLabel" for="beforeSix">6개월 이전</label></span>
	</form>
		
	</div> 
	
	<table class="table table-hover">
		<tr class="trhead">
			<th>주문번호</th>
			<th>ID</th>
			<th>주문자</th>
			<th>주문명</th>
			<th>결제금액</th>
			<th>주문상태</th>
			<th>주문일자</th>
			<th>취소일자</th>
			<th>주문취소</th>
		</tr>
		<c:choose>
		    <c:when test="${fn:length(orderList) == 0}">
				<tr>
					<td colspan="5">조회 결과가 없습니다.</td>
				</tr>
		    </c:when>
		    <c:otherwise>
				<c:forEach items="${orderList }" var="item">
					<tr>
						<td>
							<a href="detailOrder.od?od_num=${item.od_num }">
							${item.od_num }
							</a>
						</td>
						<td>
							${item.id}
						</td>
						<td>
							${item.od_to_name}
						</td>
						<td>
							${item.od_payname}
						</td>
						<td>
							<fmt:formatNumber value="${item.od_payprice }" pattern="#,###"/>원
						</td>
						<td>
							${item.od_delivery }
						</td>
						<td>
							${item.od_date }
						</td>
						<td>
							${item.od_cdate }
						</td>
						<td>
							<form id="canForm" action="paycan" method="post" >
								<input type="hidden" name="mid" value="${item.od_num }">
								<button type="submit" id="cancelBtn"  <c:if test ="${item.od_check eq 'C'}">disabled</c:if> >
									<c:if test ="${item.od_check eq 'C'}">취소완료</c:if>
									<c:if test ="${item.od_check eq 'Y'}">취소하기</c:if>
								</button>
							</form>
						</td>
					</tr>
				</c:forEach>
		    </c:otherwise> 
		</c:choose>
	</table>
	
	
	<br><br><br>
	
	
<!-- 페이징 처리 -->
	<colspan="5" style="text-align: center">
			<ul class="pagination justify-content-center">

				<c:if test="${paging.startPage != 1 }">
					<li class="page-item"><a class="page-link"
						href="a_listOrder.od?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}"> 
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
								href="a_listOrder.od?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
						</c:when>
					</c:choose>
				</c:forEach>

				<c:if test="${paging.endPage != paging.lastPage}">
					<li class="page-item"><a class="page-link"
						href="a_listOrder.od?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}"> 
						<span aria-hidden="true">&raquo;</span></a>
					</li>
				</c:if>
			</ul>
		
	<br><br>
<!-- 페이징 처리 끝 -->
</div>

</body>
</html>