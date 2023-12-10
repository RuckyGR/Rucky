<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import ="java.util.List,dog.cat.punch.products.ProductsVO" %>
    <%@ page import="dog.cat.punch.util.PagingVO" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="../admin/a_header.jsp" %>
    

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>pro 관리자 목록보기</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.js"></script>

<style>

html, body {
    	height: 100%;
    	width: 100%;
	}
	tbody{padding:100px;}

	h1{text-align:center; margin:30px;}

  input[type=submit] {
    width: 60px;
    max-width: 60px;
    background-color: #22668D;
    border: none;
    border-radius: 5px;
   }
   #totalcount{text-align:right;}
   table{width:100%;}
   
   tr{height:40px;}
   
   td{
   text-align:center; 
   border-top : none!important;
   }
   .container-fluid{
	width : 60%;
	margin : auto;
	text-align : center;
	display : block;
	}
   .thead th{
border-bottom: 2px solid #AFD7DB;
border-top: 2px solid #AFD7DB;
}

	.btn{float: right;
 	width: 100px;
    max-width: 100px;
    height:40px;
    background-color: #4692B8;
    color: #fff;
    border: none;
    border-radius: 5px;}
    
    .btn:hover {
    color: #fff;
    text-decoration: none;
     box-shadow : none;
    outline : none;
	border : none;
		}

.page-link {color: #22668D;
    background-color: #fdfdfd;
    border: 1px solid #4692B8;}
    
    
    .page-link:hover {
    cursor : pointer;    
    color: #22668D;
    background-color: #fbdfdf;
    border: 1px solid #4692B8;}
    
    input[type=text] {  
	  box-shadow : none;
      border: 1px solid #22668D;
      width: 70%;
       transition:none;}
  
  input[type=text]:focus{ 
	text-decoration-line: none;
    box-shadow : none;
    outline : none; }
    
.form-control {  box-shadow : none;
        border: 1px solid #22668D;
            transition:none;}
 .form-control:focus {border-color: #22668D;
 text-decoration-line: none;
    box-shadow : none;
    outline : none; } 
    .form-inline{
    	float : right;
    }
    
    .BTS:hover{
    	background-color : #22668D;
    }
</style>

<script>
function ProductPage(val) {
   
location.href = "a_getProducts.pro?pro_no="+val;
}
</script>
</head>
<body>
<div>
   <h1>상품목록</h1>      
</div>


<div align="center" class="container div-table1">
  <form class="form-inline" action="getproductsList.pro" method="post">
  	<select class="form-control" id="sel" name="searchCondition" style="display:inline-block!important;margin-right:10px;">

		<option value="${conditionMap['번호']}">번호</option>
		<option value="${conditionMap['품명']}">품명</option>
    </select>
    <input class="form-control mr-sm-2" type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
    <button class="btn btn-success BTS" type="submit">검색</button>
  </form>
</div>

<br><br>
    

    <div class="container-fluid">
 <table class="table table-hover">
    <tbody>
  
  <tr class="thead">
  <th >번호</th>
  <th>품명</th>
  <th>가격</th>
  <th>종류</th>
  </tr>
  
   
   <c:choose>
	<c:when test="${ProductsList ne null }">
<c:forEach items="${ProductsList}" var="pro">
   <tr onclick="ProductPage('${pro.pro_no}')" style="cursor:pointer;">
     <td class="tdCenter">${pro.pro_no}</td>
     <td class="tdCenter">${pro.pro_name}</td>
     <td class="tdCenter">${pro.pro_price}</td>
     <td class="tdCenter">${pro.pro_type}</td>

     </tr>
   
 
</c:forEach>
</c:when>
</c:choose>


 </tbody>
  </table>


<!-- 페이징 처리 -->
<colspan="11" style="text-align:center">
 <ul class="pagination justify-content-center">
            
                <c:if test="${paging.startPage != 1 }">
                    <li class="page-item">
                        <a class="page-link" href="getproductsList.pro?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">Previous</a>
                    </li>
                </c:if>

                
		        <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                    <c:choose>
                        <c:when test="${p == paging.nowPage }">
					        <li class="page-item"><b class="page-link">${p }</b></li>
				        </c:when>
                        <c:when test="${p != paging.nowPage }">
                            <li class="page-item"><a class="page-link" href="getproductsList.pro?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">${p }</a></li>
                        </c:when>
                    </c:choose>
                </c:forEach>

                <c:if test="${paging.endPage != paging.lastPage}">
                    <li class="page-item">
                        <a class="page-link" href="getproductsList.pro?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">Next</a>
                    </li>
                </c:if>
        </ul>


<!-- 페이징 처리 끝 -->

</div>


</body>
</html>

 
  