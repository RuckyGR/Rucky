<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dog.cat.punch.util.PagingVO" %>
<%@ include file="../admin/a_header.jsp" %>
<style>
  .jumbotron {
    background-color: #fff;
    text-align: center;
    margin-bottom: 20px;
  }

  .btn {
    float: right;
    width: 100px;
    max-width: 100px;
    height: 40px;
    background-color: #4692B8;
    color: #fff;
    border: none;
    border-radius: 5px;
  }
  
  .btn:hover{
  	background-color : #22668D;
  }

  #searchNav {
    -webkit-justify-content: flex-end;
    justify-content: flex-end;
    margin-bottom: 20px;
  }

  .form-control {
    box-shadow: none;
    height: 40px;
    border: 1px solid #22668D;
    transition: none;
  }

  .table th,
  .table td {
    text-align: center;
    border: none;
  }

  .table thead th {
    border-bottom: 2px solid #AFD7DB;
    border-top: 2px solid #AFD7DB;
  }

  .tablebar {
    border-top: 2px solid #AFD7DB;
  }

  .page-link {
    color: #22668D;
    background-color: #fdfdfd;
    border: 1px solid #4692B8;
  }

  .page-link:hover {
    color: #22668D;
    background-color: #fbdfdf;
    border: 1px solid #4692B8;
  }

	tr.pagetr:hover{
		background-color : white !important;
	}
  .container-fluid {
    width: 58%;
  }


  .imgs {
    padding: 0;
  }
  
</style>

<body>
  <div class="jumbotron">
    <h1 class="title">회원목록</h1>
  </div>

  <div align="center" class="container-fluid">
    <nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
      <form class="form-inline" action="userList.do" method="post">
        <select class="form-control" id="sel1" name="searchCondition" style="display: inline-block !important; margin-right: 10px;">
         <option value="${conditionMap['아이디']}">아이디</option>
		<option value="${conditionMap['이름']}">이름</option>
        </select>
        <input class="form-control mr-sm-2" type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
        <button class="btn btn-success" type="submit">검색</button>
      </form>
    </nav>
</div>
<div class="container-fluid">
  <table class="table table-hover">
    <thead >
      <tr>
        <th>아이디</th>
        <th>이름</th>
        <th>전화번호</th>
        <th>가입일</th>
        <th>탈퇴 여부</th>
        <th>탈퇴 일</th>
      </tr>
    </thead>
    <tbody>
<c:forEach items="${userList}" var="user">
   <tr onclick="selUser('${user.id}')" style="cursor:pointer;">
     <td class="tdCenter">${user.id}</td>
     <td class="tdCenter">${user.name}</td>
     <td class="tdCenter">${user.phone}</td>
     <td class="tdCenter">${user.regdate}</td>
     <td class="tdCenter">${user.leave_status}</td>
     <td class="tdCenter">${user.leave_date}</td>
   </tr>
</c:forEach>
<tr class="pagetr">
<td colspan="5" style="text-align:center">
 <ul class="pagination justify-content-center">
            
                <c:if test="${paging.startPage != 1 }">
                    <li class="page-item">
                        <a class="page-link" href="userList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">Previous</a>
                    </li>
                </c:if>

                
		        <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                    <c:choose>
                        <c:when test="${p == paging.nowPage }">
					        <li class="page-item"><b class="page-link">${p }</b></li>
				        </c:when>
                        <c:when test="${p != paging.nowPage }">
                            <li class="page-item"><a class="page-link" href="userList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
                        </c:when>
                    </c:choose>
                </c:forEach>

                <c:if test="${paging.endPage != paging.lastPage}">
                    <li class="page-item">
                        <a class="page-link" href="userList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">Next</a>
                    </li>
                </c:if>
        </ul>
</td>
</tr>



<!-- <tr> -->
<!-- <td> -->
<%-- <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}" step="1"> --%>
<%-- 	<a href="userList.do?nowPage=${i}">${i}</a> --%>
<%-- </c:forEach> --%>
<!-- </td> -->
<!-- </tr> -->


<!-- <div id="pageList"> -->
			
<%-- 			<% --%>

<!--  			PagingVO pv = (PagingVO) request.getAttribute("paging"); -->
<%-- %>  --%>
<%-- 			<%if(pv.getNowPage()<=1){ %>  --%>
<!-- 			<button class="page-prev-btn" type="button">&lt;</button> -->
<!-- 			&nbsp;&nbsp; -->
<%-- 			<%}else{ %> --%>
<!-- 				<button class="page-prev-btn" type="button" -->
<%-- 					onclick="location.href='./bookUListAction.book?page=<%=nowPage-1 %>';">&lt;</button> --%>
<!-- 				&nbsp;&nbsp;				 -->
<%-- 			<%} %> --%>
	
<%-- 			<%for(int a=startPage;a<=endPage;a++){ --%>
<%-- 					if(a==nowPage){%>   --%>
<%-- 						<button class="page-number-btn view-number-btn" type="button"><%=a%></button>						 --%>
<%-- 					<%}else{ %> --%>
<!-- 						<button class="page-number-btn" type="button" -->
<%-- 							onclick="location.href='./bookUListAction.book?page=<%=a %>';"><%=a%></button>						 --%>
<%-- 					<%} %> --%>
<%-- 			<%} %> --%>
	
<%-- 			<%if(nowPage>=maxPage){ %> --%>
<!-- 				&nbsp; -->
<!-- 				<button class="page-next-btn" type="button">&gt;</button>				 -->
<%-- 			<%}else{ %> --%>
<!-- 				&nbsp; -->
<!-- 				<button class="page-next-btn" -->
<%-- 					onclick="location.href='./bookUListAction.book?page=<%=nowPage+1 %>';" --%>
<!-- 					type="button">&gt;</button>				 -->
<%-- 			<%} %> --%>
<!-- 		</div> -->

    </tbody>
  </table><br><br>
</div>
</body>
</html>