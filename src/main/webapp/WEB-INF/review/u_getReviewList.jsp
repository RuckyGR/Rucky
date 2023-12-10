<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../dogcat_header.jsp"%>

<style>

/* 반응형 처리  */

@media (max-width: 390px) {

        .jbfont {
            font-size: 18px; /* 제목 폰트 크기 조정 */
        }

        .form-control {
            width: 100%; /* 폼 컨트롤 전체 너비로 설정 */
            margin-bottom : 5px;
        }

        .div-table1 {
            padding-left: 0; /* 왼쪽 여백 조정 */
        }

        .star-rating {
            font-size: 18px; /* 별점 폰트 크기 조정 */
        }

        .pagination {
            margin-bottom: 10px; /* 페이지네이션 아래 여백 조정 */
        }
        .star-rating,
        .v_writer,
        .v_regdate {
            display: block;
        }
        .container-md.div-table1 {
        text-align: center; 
        padding-left: 50px;
    }
    .form-inline {
/*         flex-direction: column; */
        align-items: stretch;
    }

    .btn-success {
        margin-top: 5px; 
        width: 100%;
    }
      .contp{
        width: 100%; 
        max-width: 300px; 
        display: inline-block;
        height: 100px; 
        margin-bottom: 5px;
    }
	.modidelebox {
	margin-right: 35px !important;
	}
	hr {
	width: 290px;
	}
	#sel {
	display: inline;
	width: 76px;
	padding-right: 5px;
	}
	#revSer {
    display: inline;
    width: 200px;
	}
	.revLisTit {
	width: 285px;
	}
}


/* 기본 style주기 */

.revbt{
background-color: #22668D;
color: white;
border : none;
}
.revbt:hover {
    background-color: #3A80B1; 
    color: #fff; 
}
#searchNav {
	-webkit-justify-content: flex-end;
	justify-content: flex-end;
}

.star-rating {
	font-size: 24px;
	color: orange;
}

th {
	text-align: center !important;
}

td {
	text-align: center !important;
	vertical-align: middle !important;
}

.table th, .table td {
	border: none;
}

.jumbotron {
	text-align: center;
	background-color: white;
	margin: 0;
}

li {
	list-style: none;
}

#revWrite {
	display: block;
	margin: 10px auto;
	width: 15%;
	height: 40px;
	border-radius: 5px;
	text-align: center;
	background-color: #fff;
	color: #22668D;
	border: 1px solid #22668D;
	cursor: pointer;
}

#revWrite:hover {
	background-color: #22668D; /* 호버 시 배경색 변경 */
	color: #fff; /* 호버 시 텍스트 색상 변경 */
}

.report {
	border: none;
	background-color: white;
	color: gray;
	display: inline;
	text-align: right;
}

.reportBtn {
	font-weight: bolder;
	padding: 0 5px;
	border-radius: 0;
	height: 25px;
	background-color: white;
	border: none;
}

.pagination {
	height: 50px;
	margin: 0px;
	padding: 10px 0px;
}

.page-link {
	color: #FF8551;
	background-color: #fdfdfd;
	border: 1px solid #fde8df;
}

.page-link:hover {
	color: #ff5006;
	background-color: #fbdfdf;
	border: 1px solid #fde8df;
}

.ellipsis {
	display: inline-block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	word-break: break-all;
	width: 300px;
}

.modidelebox {
	text-align: right;
	display: inline;
    float: right;
    margin-right: 65px;
	
	
}

#revUpd, .revDel {
	background-color: white;
	border: white;
	text-align: right;
}

.tdCenter2 {
	font-weight: bold;
}

.table thead th {
	border-bottom: 2px solid #AFD7DB;
	border-top: 2px solid #AFD7DB;
}

.tablebar {
	border-top: 2px solid #AFD7DB;
}

.v_prodname {
	font-size: 14pt;
	color: #777;
	font-weight: bold;
	cursor: pointer;
}

a {
	color: black;
	text-decoration: none;
}
a:hover {
  text-decoration: none;
}

.form-control {
	box-shadow: none;
	border: 1px solid #FF8551;
	transition: none;
}

.form-control:focus {
	border-color: #FF8551;
	text-decoration-line: none;
	box-shadow: none;
	outline: none;
}

.div-table1 {
	margin: 20px auto;
	width: 100%;
	text-align: left;
	padding-left: 55px;
}
.pagination{
margin-bottom : 15px;
}
/* .sude { */
/*     display: inline-flex; */
/*     align-items: center; */
/* } */

.btbt {
/*     margin-right: 5px;  */
     flex-grow: 1;
}

</style>
<script>

document.addEventListener("DOMContentLoaded", function() {
    // 모든 클래스가 'innm'인 요소를 찾아서 처리
    var buyerNameElements = document.querySelectorAll("#buyerName");

    buyerNameElements.forEach(function(buyerNameElement) {
      var buyerName = buyerNameElement.innerText;

   // 뒤에서 4자를 '*'로 대체
      var maskedName = buyerName.substring(0, buyerName.length - 7) + '*'.repeat(4);


      // 대체된 이름으로 업데이트
      buyerNameElement.innerText = maskedName;
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
function loginCheck(event) {
    var isLoggedIn = <%=session.getAttribute("userId") != null%>;

    if (!isLoggedIn) {
        event.preventDefault(); 
        alert("로그인이 필요한 서비스입니다."); 
        window.location.href = "login.do";
    }
}
</script>

<body>
	<div class="jumbotron">
		<h1 class="jbfont">구매 후기</h1>
	</div>

	<div align="right" class="container-md div-table1" style="padding-right: 50px;">
		<form class="form-inline" action="getReviewList.rev" method="post">
			<select class="form-control" id="sel" name="searchCondition"
				style="display: inline-block !important; margin-right: 10px;">
				<option value="${conditionMap['품명']}">품명</option>
				<option value="${conditionMap['내용']}">내용</option>
			</select> <input id="revSer" class="form-control mr-sm-2" type="text" name="searchKeyword"
				placeholder="검색어를 입력하세요.">
			<button class="btn btn-success revbt" type="submit">검색</button>
		</form>
	</div>

	<!-- <form action="/selectReview.rev" method="post" enctype="multipart/form-data"> -->
	<div class="container">

		<c:set var="publicCount" value="0" />
		<c:forEach items="${getReviewList}" var="review" varStatus="loop">
			<!-- 'Y'인 경우에만 처리 -->
			<c:if test="${review.rep_hide eq 'Y'}">
				<c:if test="${publicCount lt 10}">
					<ul>
						<li>
							<div class="revLisTit">
								<input type="hidden" name="rev_seq" value="${review.rev_seq}">
								<div>
									<span class="v_prodname "
										onclick="getPro('${review.pro_no}', '${review.pro_name}')">${review.pro_name}</span>
								</div>
								<div style="display: inline;">

									<div class="star-rating cons" style="display: inline;"
										data-rating="${review.rev_star}" readonly></div>
									<div style="display: inline;" class="starpoint">${review.rev_star}
										</div>
									<span class="v_writer" id="buyerName">구매자 : ${review.rev_writer}</span> 
										<span class="v_regdate">등록일 : ${review.rev_regdate}</span>
								</div>
							</div> <br>
							<div style="margin-bottom: 15px;">
								<div class="innm"
									style="width: 40%; height: 200px; resize: none; vertical-align: middle; display: inline; border: none;"
									id="comment" name="rev_content">
									<p class="contp"
										style="width: 850px; display: inline-block; height: 100px; margin-bottom: 0px;">${review.rev_content}</p>
								</div>
								<div style="display: inline; width: 20%">
									<c:choose>
										<c:when test="${empty review.rev_filename}">
										</c:when>
										<c:otherwise>
											<!-- 동적으로 생성된 ID 사용 -->
											<img id="divImg${loop.index}"
												style="width: 150px; height: 150px; cursor: pointer;"
												onclick="seeImg('${review.rev_filename}', ${loop.index})"
												src="${pageContext.request.contextPath }/resources/img/${review.rev_filename}">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div style="display: inline;" class="dibox">
								<div style="display: inline;">
									<button type="button" class="report"
										onclick="location.href='/insertReport.rev?rev_seq=${review.rev_seq}&rev_writer=${review.rev_writer}&rev_content=${review.rev_content}'">
										신고<img class="reportBtn"
											src="${pageContext.request.contextPath }/resources/img/report.png" />
									</button>
								</div>
								<div class="modidelebox">
									<c:if test="${review.rev_writer eq userId}">
										<input type="hidden" name="rev_seq_writer"
											value="${review.rev_seq}_${review.rev_writer}">
<!-- 											<div class="sude"> -->
										<a href="/selectReview.rev?rev_seq=${review.rev_seq}" class="btbt">수정</a>
										<span>│</span>
										<button class="revDel btbt" type="button" style="padding:0px;">삭제</button>
<!-- 										</div> -->
									</c:if>
								</div>
							</div>
						</li>
					</ul>
					<hr>
					<c:set var="publicCount" value="${publicCount + 1}" />
				</c:if>
			</c:if>
		</c:forEach>


		<ul class="pagination justify-content-center">

			<c:if test="${paging.startPage != 1 }">
				<li class="page-item"><a class="page-link"
					href="getReviewList.rev?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">Previous</a>
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
							href="getReviewList.rev?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
					</c:when>
				</c:choose>
			</c:forEach>

			<c:if test="${paging.endPage != paging.lastPage}">
				<li class="page-item"><a class="page-link"
					href="getReviewList.rev?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">Next</a>
				</li>
			</c:if>
		</ul>
	</div>

	<div id="footer">
		<!--   	<input type="submit"  class="btn btn-primary" value="수정"> -->
		<%--   	<button type="button" id="conDel" class="btn btn-primary" onclick="delrev('${admin.admin_Id}')">삭제</button> --%>
		<!--   	<button type="button" id="revWrite" class="btn theadbar">구매후기작성</button> -->

	</div>
	<!-- </form> -->

	<%@ include file="../../dogcat_footer.jsp"%>
</body>
</html>
