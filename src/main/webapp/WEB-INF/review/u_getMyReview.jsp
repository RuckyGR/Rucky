
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%
	String sts = "";
	if(session.getAttribute("userId") == null){
		 sts = "disabled";
	}
%>

<style>
/* 반응형 처리  */

@media (max-width: 390px) {

        .jbfont {
            font-size: 18px; 
        }

        .form-control {
            width: 100%; 
            margin-bottom : 5px;
        }

        .div-table1 {
            padding-left: 0; 
        }

        .star-rating {
            font-size: 18px; 
        }

        .pagination {
            margin-bottom: 20px; 
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
        flex-direction: column;
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
    .revCo {
    width: 300px !important;
    height: auto !important;
    }
	
}

/* 기본 style주기 */

    .star-rating {
        font-size: 24px;
        color: orange;
    }

    th {
        text-align: center!important;
    }

    td {
        text-align: center!important;
        vertical-align: middle!important;
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
        background-color: #22668D;
        color: #fff;
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
        display: inline;
    }

    #revUpd, .revDel {
        background-color: white;
        border: none;
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
    .updbtn{
    color : black;
    }
    .v_prodname {
	font-size: 14pt;
	color: #777;
	font-weight: bold;
	cursor: pointer;
}
.btbt{
	color: black;
	text-decoration: none;
}
.btbt:hover {
  text-decoration: none;
}
</style>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        var starElements = document.querySelectorAll(".star-rating");

        starElements.forEach(function (starElement) {
            var rating = starElement.getAttribute("data-rating");
            starElement.innerHTML = "★".repeat(rating);
        });
    });

    let isZoomed = false;

    function seeImg(filename, index) {
        const img = document.getElementById('divImg' + index);

        if (isZoomed) {
            img.style.width = '150px';
            img.style.height = '150px';
        } else {
            img.style.width = '285px';
            img.style.height = '285px';
        }

        isZoomed = !isZoomed;
    }

    function loginCheck(event) {
        var isLoggedIn = <%= session.getAttribute("userId") != null %>;

        if (!isLoggedIn) {
            event.preventDefault();
            alert("로그인이 필요한 서비스입니다.");
            window.location.href = "login.do";
        }
    }
</script>

<body>
<%@ include file="../user/u_myPage_menu.jsp" %>

    <form action="/selectReview.rev" method="post" enctype="multipart/form-data">
        <div class="container">
            <c:set var="publicCount" value="0" />
            <c:forEach items="${reviewList}" var="review" varStatus="loop">
             <!-- 'Y'인 경우에만 처리 -->
                <c:if test="${review.rep_hide eq 'Y'}">
                    <c:if test="${publicCount lt 10}">
                        <ul>
                            <li>
                                <div>
                                    <input type="hidden" name="rev_seq" value="${review.rev_seq}">
                                    <div>
									<span class="v_prodname "
										onclick="getPro('${review.pro_no}', '${review.pro_name}')">${review.pro_name}</span>
								</div>
                                    <div style="display: inline;">
                                        <div class="star-rating cons" style="display: inline;" data-rating="${review.rev_star}" readonly></div>  
                                        <div style="display: inline;" class="starpoint">${review.rev_star}</div>     
                                      <span class="v_writer" id="buyerName">구매자 : ${review.rev_writer}</span> 
										<span class="v_regdate">등록일 : ${review.rev_regdate}</span>
								</div>
							</div> <br>
                                <div style="margin-bottom: 15px;">
                                    <div class="innm" style=" width: 40%; height: 200px; resize: none; vertical-align: middle; display: inline; border: none;" id="comment" name="rev_content" readonly>
                                        <p class="revCo" style="width: 750px; display: inline-block;height: 150px;margin-bottom: 0px;">${review.rev_content}</p>
                                    </div>
                                    <div style="display: inline; width:20%">
                                        <c:choose>
                                            <c:when test="${empty review.rev_filename}">
                                            </c:when>
                                            <c:otherwise>
                                                <img id="divImg${loop.index}" style="width: 150px; height: 150px; cursor:pointer;" onclick="seeImg('${review.rev_filename}', ${loop.index})" src="${pageContext.request.contextPath }/resources/img/${review.rev_filename}" >
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <div style="display: inline;">
                                    <div class="modidelebox">
                                        <c:if test="${review.rev_writer eq userId}">
                                            <input type="hidden" name="rev_seq_writer" value="${review.rev_seq}_${review.rev_writer}">
										<a href="/selectReview.rev?rev_seq=${review.rev_seq}" class="btbt">수정</a> │
										<button class="revDel btbt" type="button" style="padding:0px;">삭제</button>
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
                    <li class="page-item">
                        <a class="page-link" href="getMyReview.rev?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">Previous</a>
                    </li>
                </c:if>

                
		        <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                    <c:choose>
                        <c:when test="${p == paging.nowPage }">
					        <li class="page-item"><b class="page-link">${p }</b></li>
				        </c:when>
                        <c:when test="${p != paging.nowPage }">
                            <li class="page-item"><a class="page-link" href="getMyReview.rev?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
                        </c:when>
                    </c:choose>
                </c:forEach>

                <c:if test="${paging.endPage != paging.lastPage}">
                    <li class="page-item">
                        <a class="page-link" href="getMyReview.rev?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">Next</a>
                    </li>
                </c:if>
        </ul>
        </div>

        <div id="footer">
<!--             <button type="button" id="revWrite" class="btn theadbar">구매후기작성</button> -->
        </div>
    </form>
    <%@ include file="../../dogcat_footer.jsp"%>
</body>
</html>