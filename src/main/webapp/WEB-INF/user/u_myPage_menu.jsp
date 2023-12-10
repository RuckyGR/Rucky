<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../dogcat_header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#sideMenu {
	width: fit-content; /* 내용에 맞게 동적으로 크기 조절 */
	max-width: 100%; /* 최대 너비 설정 */
	padding-top: 20px;
	border-right: 1px solid #FF8551;
}

/* 추가적인 스타일링을 위해 컨텐츠를 감싸는 div에 스타일을 추가합니다. */
.content-wrapper {
	display: flex;
	flex-direction: column;
}

.sdMenu {
	margin-bottom: 6px;
	margin-top: 6px;
}

.sdTitle {
	border-bottom: 2px solid #FF8551;
	margin-bottom: 5px;
}

.welcome-message {
	margin-bottom: 20px;
	padding: 20px;
	/*              background-color : #808080;  */
	/*             border-radius : 5px; */
	/*              color : white;  */
	/*             border-top: 1px solid #9BCDD2; */
	padding-bottom: 8px;
	padding-top: 28px;
	border-bottom: 2px solid #9BCDD2;
}

ul.navbar__menu.active > li > a{
	color : #282828;
}
	
/*반응형*/
/*햄버거 버튼*/
.navbar__toggleBtn {
	display: none;
	position: absolute;
	right: 32px;
	top : 180px;
	font-size: 24px;
	color: var(- -accent-color);
	z-index: 999;
	color: black;
}

.navbar__toggleBtn:hover {
	color: black;
}


.navbar__menu {
	display: none;
	flex-direction: column;
	align-items: center;
	list-style: none;
	width: 100%;
	padding-left: 0;
	background: #FDF5E6;
    padding-top: 36px;
    padding-bottom : 10px;
}

.navbar__menu li:hover {
        background-color: #ff8551;
        border-radius: 4px;
}
.navbar__menu li a:hover {
        text-decoration : none;
}

.navbar__menu li a {
	font-weight : 600;
}

@media screen and (max-width: 390px) {
	nav#sideMenu {
		display: none;
	}
	.navbar__toggleBtn {
		display: block;
	}
	.navbar__menu li {
		padding : 5px;
		width: 40%;
		margin-left : 110px;
		text-align: right;
	}
	.navbar__toggleBtn {
		display: block;
	}
	
	.navbar__menu.active{
		display: flex;
	}
}
</style>
<script>
/* 반응형 햄버거 함수 */
window.onload = function() {
	const toggleBtn = document.querySelector('.navbar__toggleBtn');
	const menu = document.querySelector('.navbar__menu');

	toggleBtn.addEventListener('click', () => {
	        menu.classList.toggle('active');
	});
	};
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<nav class="col-12 col-sm-3 content-wrapper" id="sideMenu">
				<ul class="nav nav-pills flex-column">
					<li class="nav-itemB sdTitle"><h4>
							<a class="nav-link active"
								style="color: black; background-color: rgb(255, 255, 255, 0.5);"
								href="myPage.tot">마이페이지</a>
						</h4></li>
					<li class="nav-itemB sdMenu"><a class="nav-link active"
						style="color: black; background-color: rgb(255, 255, 255, 0.5);"
						href="selUser.do?id=${userId }">회원정보 수정</a></li>
					<li class="nav-itemB sdMenu"><a class="nav-link active"
						style="color: black; background-color: rgb(255, 255, 255, 0.5);"
						href="u_listOrder.od">주문내역 조회</a></li>
					<li class="nav-itemB sdMenu"><a class="nav-link active"
						style="color: black; background-color: rgb(255, 255, 255, 0.5);"
						href="getMyReserve.rev">델루나 예약조회</a></li>
					<li class="nav-itemB sdMenu"><a class="nav-link active"
						style="color: black; background-color: rgb(255, 255, 255, 0.5);"
						href="getLikeList.pro">관심상품</a></li>
					<li class="nav-itemB sdMenu"><a class="nav-link active"
						style="color: black; background-color: rgb(255, 255, 255, 0.5);"
						href="getMyReview.rev">상품리뷰관리</a></li>
					<li class="nav-itemB sdMenu"><a class="nav-link active"
						style="color: black; background-color: rgb(255, 255, 255, 0.5);"
						href="u_myQnaList.qna">내 질문목록</a></li>
			</nav>
			<a href="#" class="navbar__toggleBtn"> <i class="fas fa-bars"></i>
			</a>
			<ul class="navbar__menu">
				<li><a href="selUser.do?id=${userId }">회원정보 수정</a></li>
				<li><a href="u_listOrder.od">주문내역 조회</a></li>
				<li><a href="getMyReserve.rev">델루나 예약조회</a></li>
				<li><a href="getLikeList.pro">관심상품</a></li>
				<li><a href="getMyReview.rev">상품리뷰관리</a></li>
				<li><a href="u_myQnaList.qna">내 질문목록</a></li>
			</ul>
			<div class="col-12 col-sm-9 contentsDiv">
				<div class="welcome-message">
					<h4>${userName}님 환영합니다!</h4>
				</div>
</body>

</html>
