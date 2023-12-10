	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dog.cat.punch.util.PagingVO"%>
<%@ include file="../../dogcat_header.jsp"%>

<style>

.jumbotron {
	background-color: #FFF;
}

#searchNav {
    display: flex;
    justify-content: space-between; 
    align-items: center; 
    margin-bottom: 20px;
}

.form-inline {
    flex: 1; 
    display: flex;
    justify-content: flex-start; 
    align-items: center; 
}

.btn, .wrBtn {
	float: right;
 	width: 100px;
    max-width: 100px;
    height:40px;
    background-color: #FF8551;
    color: #fff;
    border: none;
    border-radius: 5px;
}
  
 .form-control {  
	box-shadow : none;
	height:40px;
    border: 1px solid #FF8551;
    transition:none;
}

.table th, .table td {
	text-align:center;
	border : none;
	}

.table thead th{	
	border-bottom: 2px solid #AFD7DB;
	border-top: 2px solid #AFD7DB;
}	
.tablebar{
	border-top: 2px solid #AFD7DB;
}

.page-link {color: #FF8551;
    background-color: #fdfdfd;
    border: 1px solid #fde8df;
}

.page-link:hover {    
    color: #ff5006;
    background-color: #fbdfdf;
    border: 1px solid #fde8df;
}

.title {
	text-align: center;
	
}

.container-fluid {
	width: 58%;
}



#sel1{
border-radius: 0.25rem 0rem 0rem 0.25rem;
border-right: none;
}

input.mr-sm-2 {
border-radius: 0rem 0.25rem 0.25rem 0rem;
}

#sel1, .mr-sm-2:focus{border-color: #FF8551;
 	text-decoration-line: none;
    box-shadow : none;
    outline : none; }
@media (max-width:390px) {
.container-fluid{
	width : 100%;
}
table {
	
	font-size : 10px;
}

table th, table td {
vertical-align : middle !important;
padding-left : 1px !important;
padding-right : 1px !important;
}
.btn, .wrBtn {
width : 80px;
}

select#sel1 {padding: 0.3rem 0.3rem; max-width: 25%; max-height: 30px; font-size: 10px; }
input.mr-sm-2 { max-width: 50%; max-height: 30px; font-size: 10px;}
button.btn { max-width:50px; max-height:30px; font-size: 10px; margin:0 5px;}
button.wrBtn { max-width:50px; max-height:30px; font-size: 10px; margin:0 5px;}

.ellipsisQna {
	display : inline-block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	word-break: break-all;
	width: 100px;
	vertical-align : bottom;
}

.qnaWriter{
	padding : 0;
}

}


</style>

<body>

	<div class="jumbotron">
		<h1 class="title">Q & A</h1>
	</div>

	<div align = "center" class="container-fluid">

		<nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
			<form class="form-inline" action="u_getQnaList.qna" method="post">
				<select class="form-control" id="sel1" name="searchCondition" style="display: inline-block !important;">
					<option value="${conditionMap['제목']}">제목</option>
					<option value="${conditionMap['내용']}">내용</option>
				</select> 
					<input class="form-control mr-sm-2" type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
				<button class="btn btn-success" type="submit">검색</button>
			</form>
		<button type="button" id="qnaWrite" class="wrBtn">글쓰기</button>	
		</nav>

		<table class="table table-hover">
			<thead class="listform">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${qnaList}" var="qna">
					<c:choose>
						<c:when test="${userId ne 'admin'}">
							<tr onclick="pwChk(${qna.qna_seq})" style="cursor: pointer;">
								<td class="tdCenter" id="qnaSeq">${qna.qna_seq}</td>
								<td>
								<c:if test= "${qna.admin_content ne null}"><img src="${pageContext.request.contextPath}/resources/img/lock.png" style="width : 13px;"><span class="titleBtn ellipsisQna">${qna.qna_title}</span> <b>[답변완료]</b></c:if>
								<c:if test= "${qna.admin_content eq null}"><img src="${pageContext.request.contextPath}/resources/img/lock.png" 	style="width : 13px;"><span class="titleBtn ellipsisQna">${qna.qna_title}</span></c:if>
								</td>
								<td class="tdCenter qnaWriter" id="qnaWriter">${qna.qna_writer}</td>
								<td class="tdCenter">${qna.qna_date}</td>
								<td class="tdCenter">${qna.qna_cnt}</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr onclick="selQna1(${qna.qna_seq})" style="cursor: pointer;">
								<td class="tdCenter">${qna.qna_seq}</td>
								<td>
								<c:if test= "${qna.admin_content ne null}"><img src="${pageContext.request.contextPath}/resources/img/lock.png" style="width : 13px;"><span class="titleBtn ellipsisQna">${qna.qna_title}</span> <b>[답변완료]</b></c:if>
								<c:if test= "${qna.admin_content eq null}"><img src="${pageContext.request.contextPath}/resources/img/lock.png" style="width : 13px;"><span class="titleBtn ellipsisQna">${qna.qna_title}</span></c:if>
								</td>
								<td class="tdCenter qnaWriter">${qna.qna_writer}</td>
								<td class="tdCenter">${qna.qna_date}</td>
								<td class="tdCenter">${qna.qna_cnt}</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<tr class = "tablebar">
					<td colspan="5" style="text-align: center">
						<ul class="pagination justify-content-center">

							<c:if test="${paging.startPage != 1 }">
								<li class="page-item"><a class="page-link"
									href="u_getQnaList.qna?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">Previous</a>
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
											href="u_getQnaList.qna?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.endPage != paging.lastPage }">
								<li class="page-item"><a class="page-link"
									href="u_getQnaList.qna?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">Next</a>
								</li>
							</c:if>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
		<%@ include file="/dogcat_footer.jsp" %>
	</div>
	<script>
	$(document).ready(function(){
		var isLoggedIn = <%= session.getAttribute("userId") != null %>;	
	
		   $("#qnaWrite").click(function(){
			   if (!isLoggedIn) {
		            event.preventDefault(); 
		            alert("로그인이 필요한 서비스입니다."); 
		            window.location.href = "login.do";
		        }else{
		      location.href = "insertQna.qna";
		        }
		      });
		      });
	
	document.addEventListener("DOMContentLoaded", function() {
	    // 모든 클래스가 'innm'인 요소를 찾아서 처리
	    var buyerNameElements = document.querySelectorAll("#qnaWriter");

	    buyerNameElements.forEach(function(buyerNameElement) {
	        var buyerName = buyerNameElement.innerText;

	        // 뒤에서 2글자를 '*'로 대체
	        var maskedName = buyerName.substring(0, buyerName.length - 1) + buyerName.substring(buyerName.length - 2).replace(/./g, '*');

	        // 대체된 이름으로 업데이트
	        buyerNameElement.innerText = maskedName;
	    });
	});

	</script>

</body>
</html>
