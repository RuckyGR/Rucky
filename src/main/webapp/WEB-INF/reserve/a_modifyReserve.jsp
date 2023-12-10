<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../admin/a_header.jsp" %>
<style>
#searchNav{-webkit-justify-content: flex-end; justify-content: flex-end; }
.jumbotron1{
margin : 20px; 0

}
.container-fluid{
width : 70%;
margin : auto;
text-align : center;
display : block;
}
	.star-rating {
   font-size: 24px;
   color: orange;
}
.table thead th{
border-bottom: 2px solid #AFD7DB;
border-top: 2px solid #AFD7DB;
}
.tablebar{
border-top: 2px solid #AFD7DB;
}
.table th, .table td {
border : none;
}
.jumbotron {
text-align: center;
background-color: white;
margin: 0;
}
.theadbar {
font-weight : bold;
font-size : 13pt;
}
.repcon {
font-weight : bold;
}
.revcon{
font-weight : normal;
}
th,td{text-align : center!important;}

.pagination {
height: 50px;
margin: 0px;
padding: 10px 0px;
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

#cont{
text-align : center;
margin-right: 190px;
width : 100%;
}
.btn-show-rev {
    background-color: #007BFF;
    color: #fff;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
    border-radius: 5px;
}
.ope{
color : #22668D;
}
.hid{
color : #FF8551;
}
button.button_4 {
  border: 0;
  outline: none;
  width: 38px;
  height: 38px;
  border-radius: 100px;
  font-size: 8pt;
  font-weight: bold;
  margin: auto;
  box-shadow: 3px 3px 3px rgb(109, 109, 109), -3px -3px 3px rgb(237, 237, 237);
  transition: 0.3s;
  
}

button.button_4:hover {
  box-shadow: -3px -3px 3px rgb(172, 172, 172), 3px 3px 3px rgb(237, 237, 237);
  transition: 0.3s;
}
.repDel{
display : block;
width : 30%;
height : 40px;
border-radius : 5px;
margin : 0 auto;
text-align : center;
background-color: #fff;
color: #22668D;
border: 1px solid #22668D;
}
.repDel:hover {
    background-color: #22668D; /* 호버 시 배경색 변경 */
    color: #fff; /* 호버 시 텍스트 색상 변경 */
}

.pagetr:hover{
	background-color : white !important;
}
</style>
<script>
function resvDelFnc(delno){
        if (confirm('삭제하시면 복구할 수 없습니다. \n 정말로 삭제하시겠습니까?')) {
        	alert("삭제되었습니다.");
      	location.href='/deleteReserve.rsv?reserve_no='+delno;
        } else {
        	alert('취소되었습니다.');
            return false;
        }
    }

    // 폼 제출 시 알림
    $('form[action="upReserve.rsv"]').submit(function () {
        alert("적용되었습니다.");
    });

</script>
<body>
<div class="jumbotron1">
   <h1>예약접수 관리</h1>
</div>


<div class="container-fluid">
  <table class="table table-hover">
    <thead class="theadbar">
      <tr>
        <th>예약 번호</th>
        <th>성함</th>
        <th>번호</th>
        <th>체크인</th>
        <th>체크아웃</th>
<!--         <th>애견 크기</th> -->
<!--         <th>애견 이름</th> -->
        <th>미용 여부</th>
        <th>가격</th>
        <th>예약 현황</th>
        <th>상세 정보</th>
        <th class="repth">예약 처리<br></th>
        <th style="display: none;">특별 요청</th>
        <th>삭제</th>
      </tr>
    </thead>
    <tbody>
<c:forEach items="${reservationList}" var="reserve">
	<tr>
		<td class="repcon">${reserve.reserve_no}</td>
		<td class="repcon">${reserve.name}</td>
		<td class="repcon">${reserve.phone}</td>
		<td class="repcon">${reserve.checkInDate}</td>
		<td class="repcon">${reserve.checkOutDate}</td>
		                            <td class="repcon"><c:choose>
                                    <c:when test="${reserve.beautyDog == 'Y'}">
                                        O
                                    </c:when>
                                    <c:otherwise>
                                        X
                                    </c:otherwise>
                                </c:choose></td>
		<td class="repcon">${reserve.totalPrice}</td>
		                            <td class="repcon"><c:choose>
                                    <c:when test="${reserve.reserve_YN == 'W'}">
                                        예약대기
                                    </c:when>
                                    <c:when test="${reserve.reserve_YN == 'Y' }">
                                    	예약완료
                                    </c:when>                                 
                                    <c:otherwise>
                                    	예약거절
                                    </c:otherwise>
                                </c:choose></td>
<%-- 		<td class="repcon">${reserve.reserve_YN}</td> --%>
	                                    <td><button type="button" class="custom-btn unique-btn-danger" data-toggle="modal" data-target="#detailForm${reserve.reserve_no}" style="border:none; background-color: white; color:#FF8551;">[조회]</button>
                                <div class="modal fade" id="detailForm${reserve.reserve_no}">
       							<div class="modal-dialog modal-md" style="margin: 5rem auto;">
        						<div class="modal-content" style="width: 500px;">

					            <!-- Modal Header -->
					            <div class="modal-header">
					                <h4 class="modal-title">상세정보</h4>
					                <button type="button" class="close" data-dismiss="modal">&times;</button>
					            </div>

       
				                <!-- Modal body -->
				                <div class="modal-body">
				                    <div align="center">
				                        크기 : <c:choose> 
                                    <c:when test="${reserve.roomtype == 'small'}">
                                        소형견
                                     </c:when>
                                     <c:when test="${reserve.roomtype == 'medium' }">
                                    	중형견
                                     </c:when>
                                    <c:otherwise>
                                    	대형견
                                     </c:otherwise>
                                 </c:choose> <br>
                                 애견이름 : ${reserve.petName}
				                         <br><br>
				                         특별요청 : ${reserve.request}
				                    </div>
				                </div>
       
        </div>
    </div>
</div></td>

		<td class="rephid">
        <form action="upReserve.rsv" method="post" >
        
        <input type="hidden" name="reserve_no" value="${reserve.reserve_no}" />
        <% System.out.println(); %>
        <c:choose>
    <c:when test="${reserve.reserve_YN eq 'N'}">
        <input type="radio" name="reserve_YN" value="Y" class="radio" /><span class="ope">승인</span>&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" name="reserve_YN" value="N" class="radio" checked="checked" /><span class="hid">거절</span>&nbsp;
    </c:when>
    <c:when test="${reserve.reserve_YN eq 'Y'}">
        <input type="radio" name="reserve_YN" value="Y" class="radio" checked="checked" /><span class="ope">승인</span>&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" name="reserve_YN" value="N" class="radio" /><span class="hid">거절</span>&nbsp;
    </c:when>
    <c:otherwise>
        <input type="radio" name="reserve_YN" value="Y" class="radio" /><span class="ope">승인</span>&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" name="reserve_YN" value="N" class="radio" /><span class="hid">거절</span>&nbsp;
    </c:otherwise>
</c:choose>
   		<button type="submit" class="button_4">적용</button>
   		</form>
        </td>
        
		<td class="DelBtn">
        <button type="button" class="resDel" onclick="resvDelFnc(${reserve.reserve_no})">삭제</button>
        
        </td>
    </tr>	
</c:forEach>

  
<tr class="pagetr">
<td colspan="11" style="text-align:center">
 <ul class="pagination justify-content-center">
            
                <c:if test="${paging.startPage != 1 }">
                    <li class="page-item">
                        <a class="page-link" href="a_modifyReserve.rsv?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">Previous</a>
                    </li>
                </c:if>

                
		        <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                    <c:choose>
                        <c:when test="${p == paging.nowPage }">
					        <li class="page-item"><b class="page-link">${p }</b></li>
				        </c:when>
                        <c:when test="${p != paging.nowPage }">
                            <li class="page-item"><a class="page-link" href="a_modifyReserve.rsv?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
                        </c:when>
                    </c:choose>
                </c:forEach>

                <c:if test="${paging.endPage != paging.lastPage}">
                    <li class="page-item">
                        <a class="page-link" href="a_modifyReserve.rsv?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">Next</a>
                    </li>
                </c:if>
        </ul>
</td>
</tr>
    </tbody>
  </table><br>


</div>

</body>
</html>
