<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../dogcat_header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>order</title>
<style>
.all_div {
	text-align: center;
	box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.5);
	margin-top: 20%;
	margin-left: 35%;
	margin-right: 35%;
	padding: 10px;
	padding-bottom: 40px;
	margin-top: 10%;
	border-radius: 5px;
}

.o-btn {
	text-decoration: none;
	color: white;
	padding: 7px 12px;
	border-radius: 3px;
	margin-top: 10px;
}

.o-btn:hover {
	text-decoration: none;
}

.mainbtn {
	background-color: #22668d;
}

.mainbtn:hover {
	background-color: #154560;
	color: white;
	transition: background-color 0.2s ease;
}

.orderListbtn {
	background-color: #ff8551;
}

.orderListbtn:hover {
	background-color: #ff5c16;
	color: white;
	transition: background-color 0.2s ease;
}

@media (max-width:391px){
	.all_div {
		    margin: 20% auto;
    		width: 80%;
	}
	}
</style>
</head>
<body>
	<div class="all_div">
		<br>
		<h2><b style="color: #303030;">주문 취소 내역</b></h2>
		<hr>
		<c:choose>
			<c:when test="${cancel eq 'y'}">
			<h4>주문 취소 실패하였습니다.</h4>
			<a href="Main.tot" class="mainbtn o-btn">메인으로</a>
				<a href="u_listOrder.od">주문목록확인</a>
			</c:when>
			<c:otherwise>
				<h4>${uid}님,<br>주문취소가 완료되었습니다.</h4>
				주문번호 : <b>${od_num}</b><br><br><br>

				<a href="Main.tot" class="mainbtn o-btn">메인으로</a>
				<a href="u_listOrder.od" class="orderListbtn o-btn">주문목록확인</a>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>