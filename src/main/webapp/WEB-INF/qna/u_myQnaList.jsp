<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<style>
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
.btn {
	background-color : #AFD7DB !important
}

@media (max-width : 391px) {
	select.conditionMap {
		width : 27%;
	}
	.table th, .table td{
		padding : 5px 0 !important;
	}
	input.searchinput {
		width : 69%;
	}
	
	form > button.SSbtn {
		width : 100%;
		margin-top : 5%;
	}
	table.Qtable > thead.listform th{
		padding : 5px;
	}
	
	.writeMan {
		display : none;
	}
	
	tr.tablebar:hover{
		background-color : white !important;
	}
	
	.ellipsisQna {
	display : inline-block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	word-break: break-all;
	width: 50px;
	vertical-align : bottom;
}
}
</style>
</head>
<body>
      <%@ include file="../user/u_myPage_menu.jsp" %>

	<div align = "center" class="container-fluid">

		<nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
		
			<form class="form-inline" action="u_myQnaList.qna" method="post">
				<select class="form-control conditionMap" id="sel1" name="searchCondition" style="display: inline-block !important; margin-right: 10px;">
					<option value="${conditionMap['제목']}">제목</option>
					<option value="${conditionMap['내용']}">내용</option>
				</select> 
					<input class="form-control mr-sm-2 searchinput" type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
				<button class="btn SSbtn" type="submit">검색</button>
			</form>
		</nav>

		<table class="table table-hover Qtable">
			<thead class="listform">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th class="writeMan">작성자</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
		<c:forEach items="${myQnaList}" var="qna">
		<c:choose>
		<c:when test="${not empty admin_content}">
        <tr onclick="selQna1(${qna.qna_seq})" style="cursor: pointer;">
            <td class="tdCenter" id="qnaSeq">${qna.qna_seq}</td>
            <td>
            <c:if test= "${qna.admin_content ne null}"><img src="${pageContext.request.contextPath}/resources/img/lock.png" style="width : 13px;"><span class="titleBtn ellipsisQna" alt="비밀글">${qna.qna_title}</span> <b>[답변완료]</b></c:if>
			<c:if test= "${qna.admin_content eq null}"><img src="${pageContext.request.contextPath}/resources/img/lock.png" style="width : 13px;"><span class="titleBtn ellipsisQna" alt="비밀글">${qna.qna_title}</span></c:if>
            </td>
            <td class="tdCenter writeMan">${qna.qna_writer}</td>
            <td class="tdCenter">${qna.qna_date}</td>
            <td class="tdCenter">${qna.qna_cnt}</td>
        </tr>
        </c:when>
        <c:otherwise>
        	<tr onclick="selQna1(${qna.qna_seq})" style="cursor: pointer;">
        		 <td class="tdCenter" id="qnaSeq">${qna.qna_seq}</td>
            <td>
			<c:if test= "${qna.admin_content ne null}"><img src="${pageContext.request.contextPath}/resources/img/lock.png" style="width : 13px;"><span class="titleBtn ellipsisQna" alt="비밀글">${qna.qna_title}</span> <b>[답변완료]</b></c:if>
			<c:if test= "${qna.admin_content eq null}"><img src="${pageContext.request.contextPath}/resources/img/lock.png" style="width : 13px;"><span class="titleBtn ellipsisQna" alt="비밀글">${qna.qna_title}</span></c:if>
            </td>
            <td class="tdCenter writeMan">${qna.qna_writer}</td>
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
								<li class="page-item">
								<a class="page-link" href="u_myQnaList.qna?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">Previous</a>
								</li>
							</c:if>

							<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
								var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage }">
										<li class="page-item"><b class="page-link">${p }</b></li>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<li class="page-item"><a class="page-link" href="u_myQnaList.qna?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">${p }</a></li>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.endPage != paging.lastPage}">
								<li class="page-item">
								<a class="page-link" href="u_myQnaList.qna?nowPage=${paging.endPage +1 }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">Next</a>
								</li>
							</c:if>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
</div>
</body>
<%@ include file="/dogcat_footer.jsp" %>
</html>