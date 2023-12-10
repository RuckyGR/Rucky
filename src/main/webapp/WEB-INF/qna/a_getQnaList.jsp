<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dog.cat.punch.util.PagingVO"%>
<%@ include file="../admin/a_header.jsp" %>

<style>
.title{
	text-align : center;
	}
#searchNav {
	-webkit-justify-content: flex-start;
	justify-content: flex-start;
	margin-bottom : 20px;
}

.jumbotron {
	background-color: #FFF;
}

.btn {
	float: right;
 	width: 100px;
    max-width: 100px;
    height:40px;
    background-color: #22668D;
    color: #fff;
    border: none;
    border-radius: 5px;
}
    
.jumbotron {
		background-color : #fff;
	}
.btn {
		color : #fff;
		background-color : #22668D;
	}
	
.form-control {  
	box-shadow : none;
	height:40px;
    border: 1px solid #22668D;
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

.tablebar:hover {
	background-color : white !important;
}

.page-link {color: #22668D;
    background-color: #fdfdfd;
    border: 1px solid #4692B8;
}

.page-link:hover {    
    color: #22668D;
    background-color: #fbdfdf;
    border: 1px solid #4692B8;
    cursor:pointer;
}	

.container-fluid {
	width: 58%;
}

 .imgs {
 	padding : 0;
 }
</style>
<body>
	<div class="jumbotron">
		<h1 class="title">Q & A</h1>
	</div>

	<div align = "center" class="container-fluid">

		<nav id="searchNav" class="navbar navbar-expand-sm navbar-dark" style="justify-content:flex-end;">
			<form class="form-inline" action="a_getQnaList.qna" method="post">
				<select class="form-control" id="sel1" name="searchCondition"
					style="display: inline-block !important; margin-right: 10px;">
					<option value="${conditionMap['제목']}">제목</option>
					<option value="${conditionMap['내용']}">내용</option>
				</select> 
					<input class="form-control mr-sm-2" type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
				<button class="btn btn-success" type="submit">검색</button>
			</form>
		</nav>

		<table class="table table-hover">
			<thead class="listform">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
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
								<c:if test= "${qna.admin_content ne null}"><img src="${pageContext.request.contextPath}/resources/img/lock.png" style="width : 13px;" class="imgs" alt="비밀글"><span class="titleBtn">${qna.qna_title}</span> <b>[답변완료]</b></c:if>
								<c:if test= "${qna.admin_content eq null}"><img src="${pageContext.request.contextPath}/resources/img/lock.png" style="width : 13px;" class="imgs" alt="비밀글"><span class="titleBtn">${qna.qna_title}</span></c:if>
								</td>
								<td class="tdCenter" id="qnaWriter">${qna.qna_writer}</td>
								<td class="tdCenter">${qna.qna_date}</td>
								<td class="tdCenter">${qna.qna_cnt}</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr onclick="selQna2(${qna.qna_seq})" style="cursor: pointer;">
								<td class="tdCenter">${qna.qna_seq}</td>
								<td>
								<c:if test= "${qna.admin_content ne null}"><img src="${pageContext.request.contextPath}/resources/img/lock.png" style="width : 13px;" class="imgs"><span class="titleBtn" alt="비밀글">${qna.qna_title}</span> <b>[답변완료]</b></c:if>
								<c:if test= "${qna.admin_content eq null}"><img src="${pageContext.request.contextPath}/resources/img/lock.png" style="width : 13px;" class="imgs"><span class="titleBtn" alt="비밀글">${qna.qna_title}</span></c:if>
								</td>
								<td class="tdCenter">${qna.qna_writer}</td>
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
									href="a_getQnaList.qna?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">Previous</a>
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
											href="a_getQnaList.qna?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.endPage != paging.lastPage}">
								<li class="page-item"><a class="page-link"
									href="a_getQnaList.qna?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">Next</a>
								</li>
							</c:if>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
		<div id="footer">
		</div>
	</div>

</body>
</html>
