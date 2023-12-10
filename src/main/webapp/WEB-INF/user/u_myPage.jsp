<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Date,dog.cat.punch.util.PagingVO"%>
<%@ include file="u_myPage_menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
/* 신규 스타일링 추가 */
.name {
	border: none;
	width: 100px;
	height: 30px;
	background-color: transparent;
	color: black;
	font-weight: bold;
	font-size: 20px;
	outline: 0;
	box-shadow: none;
}

.birth {
	border: none;
	width: 100px;
	height: 30px;
	background-color: transparent;
	color: white;
	font-weight: bold;
	font-size: 15px;
	outline: 0;
	box-shadow: none;
}

.section5 {
	margin-top: 20px;
}

/* 테이블 스타일 */
.custom-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
}

.custom-table th, .custom-table td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

.custom-table th {
	background-color: #FF8551;
	color: white;
}

/* 1:1 질문 목록 스타일 */
.qna-list {
	margin-top: 20px;
}

.qna-item {
	border-bottom : 2px solid #AFD7DB;
	border-top : 2px solid #AFD7DB;
	padding: 10px;
	margin-bottom: 10px;
}

.qna-item p {
	color: #555;
}

#catdog {
	border-radius: 150px;
	height: 110px;
	margin: 5px;
}

label {
	display: none;
}



.write {
	margin: 5px 10px;
	font-size: 30px;
	font-weight: bolder;
}

.col {
	margin: 25px -45px;
}

.v-line {
	border-left: thin solid #fff;
	margin: 20px 45px;
	height: 70px;
}

#hidFile {display: none;}
.Photo{display : flex; flex-wrap: nowrap;}
img.myPetImg {width: 100px!important; 
				height: 100px !important; 
				margin: 5px;
				vertical-align: middle;
				border-style: none;
				}
.plus{ vertical-align: bottom;   margin:5px -35px; cursor:pointer;}
.type{margin:0 -10px;}
.likeList {
	border-top : 2px solid #9BCDD2;
	border-bottom : 2px solid #9BCDD2;
	padding : 10px;
	width : 265px;
}

.likeImg {
	border: 1px solid pink; 
	width:100px;
	margin-right : 20px;
	margin-bottom : 10px;
}

.more:hover {
	color : #FF8551;
	text-decoration : none;
}

.more {
	color : #22668D;
}

.moreDiv {
	text-align : right;
	width : 100%;
}
.moreDiv1 {
	text-align : right;
	width : 98%;
}

.qnaTitle{
	color : black;
}

.qnaTitle:hover {
	color : #FF8551;
	text-decoration : none;
}
.custom-table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 10px;
  border-bottom : 2px solid #AFD7DB;
}

.custom-table th, .custom-table td {
  border: none;
  padding: 8px;
  text-align: left;
}

.custom-table th {
  background-color: white;
  color: black;
  border-bottom: 1px solid #AFD7DB;
border-top: 2px solid #AFD7DB;
}

.likesection {
    float: left;
    width: 32%;
    margin-right: 4%;
}

.section6 {
    float: left;
    width: 63%; 
    margin-top : 20px;
}

.section5::after,
.likesection::after,
.section6::after {
    content: "";
    display: table;
    clear: both;
}

.dogcatDiv{
	clear : both;
}

.ellipsisQna {
	display : inline-block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	word-break: break-all;
	width: 275px;
	vertical-align : bottom;
}

.titleTd{
	padding : 5px 100px 5px 5px;
}

.Td{
	padding-right : 45px;
}

@media (max-width:391px){
		.custom-table{
			font-size: 12px;
			
		}
		.odNo{
			display : none;
		}
		
		.custom-table th, .custom-table td{
			padding : 8px 0;
		}
		
		.ellipsis {
	display: inline-block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	word-break: break-all;
	width: 150px;
}

.ellipsisQna {
	display : inline-block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	word-break: break-all;
	width: 190px;
	vertical-align : bottom;
}

.section6, .likesection {
	clear : both;
	width : 100%;
}


div.likesection > h4 {
	width : 85% !important;
}
.qna-item {
	border : 2px solid #AFD7DB;
}

.titleTd{
	padding : 5px;
}

.Td > b{
	display : inline-block;
	width : 92px;
}
.Td { 
	padding-left : 20px;
	padding-right : 35px;
}


.likeList{
	padding : 10px 10px 10px 50px;
	width : 337px;
}

}

</style>

<script>
function fileChange(val){
 if(confirm("파일을 변경하시겠습니다.")){
	 $("#hidfnm").val(val);
	 $("#hidFile").click();
 }else{
	 alert("파일이 변경되지 않았습니다.");
	 return false;
 }
}

$(document).ready(function(){
	$("#hidFile").change(function(){
	 document.myPageFrm.submit();
	});
});
</script> 
</head>
<body>
                <!-- 최근 주문 내역 -->
                <div class="section5">
                    <h4>최근 주문 내역</h4>
                    <table class="custom-table">
	<thead class="theadbar">
		<tr>
			<th class="odNo">주문번호</th>
			<th>주문일자</th>
			<th>주문상품</th>
			<th>총구매금액</th>
			<th>주문상태</th>
		</tr>
	</thead>
				<c:forEach items="${orderList }" var="item">
				<tbody class="tbody">
					<tr>
						<td class="odNo">
							<a href="detailOrder.od?od_num=${item.od_num }">
							${item.od_num }
							</a>
						</td>
						<td>
							${item.od_date }
						</td>
						<td class="ellipsis">
							${item.od_payname}
						</td>
						<td>
							<fmt:formatNumber value="${item.od_payprice }" pattern="#,###"/>원
						</td>
						<td>
							${item.od_delivery}
						</td>
					</tr>
					</tbody>
				</c:forEach>
	</table>
                    <div class="moreDiv">
                    <a class="more" href="u_listOrder.od">더보기</a>
                    </div>
                </div>

                <!-- 찜 목록 -->
                <div class="section5 likesection">
                    <h4 style="width:40%;">관심상품</h4>
                    <div class="likeList">
                    <c:forEach items="${likeList }" var="like">
                    	<a href="#" onclick="getPro('${like.pro_no}', '${like.pro_name}')"><img class="likeImg" src="${pageContext.request.contextPath}/resources/img/productImg/${like.pro_filename}" /></a>
                    </c:forEach>
                    </div>
                    <div class="moreDiv1">
                    <a class="more" href="getLikeList.pro">더보기</a>
                    </div>
                </div>
                
                
                <div class="section6">
                    <h4>1:1 질문 목록</h4>
                    <table class="qna-item">
                    <c:forEach items="${qnaList }" var="qna">
                        <tr><td class="titleTd"><a class="qnaTitle ellipsisQna" href="#" onclick="pwChk(${qna.qna_seq});">${qna.qna_title }</a></td>
                    	<td class="Td"><c:choose>
                        <c:when test="${qna.admin_content == null}">
                        <b> (답변대기중)</b>
                        </c:when>
                        <c:otherwise><b> (답변완료)</b></c:otherwise>
                        </c:choose></td></tr>
                    </c:forEach>
                    </table>
                    <div class="moreDiv1">
                    <a class="more" href="u_myQnaList.qna">더보기</a>
                    </div>
              </div>

        
        <br><br>
        
        
        
        
        
        
        
        
        
        
<div class="dogcatDiv">     
        <h4 style="margin:0 5px;">나의 반려동물</h4><br>
            
    
<c:choose>
	<c:when test="${user.type eq 'Cat'}">
		<div class="row" id="catdog" style="width:300px;max-width:90%; background-color: #FF8551;">
		<c:choose>
			<c:when test="${not empty user.filename }">
				<div class="profile-btn-area Photo"  style="vertical-align:middle;"> 
				<div class="imgs">	
				<img src="${pageContext.request.contextPath }/resources/img/${user.filename}"  class="rounded-circle myPetImg">
				<img src="${pageContext.request.contextPath }/resources/img/plusbtn_orange.png"  onclick="fileChange('${user.filename}')" alt="더하기" style="width:30px;" class="plus"></div>		
					<div class='v-line'></div>
					<div class="col">
						<label>이름:</label><input type="text" class="name" name="pet_name" value="${user.pet_name}(${user.type})" readonly><br>
						<label>생일:</label><input type="text" class="birth" name="pet_birth" value="${user.pet_birth}" readonly>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="Photo"  style="vertical-align:middle;"> 
				<div class="imgs">
					<img alt="Photo" src="${pageContext.request.contextPath}/resources/img/cat1.png" class="rounded-circle myPetImg" >
					<img src="${pageContext.request.contextPath }/resources/img/plusbtn_orange.png" alt="더하기" onclick="fileChange('${user.filename}')" style="width:30px;" class="plus"></div>
					<div class='v-line'></div>
					<div class="col">
						<label>이름:</label><input type="text" class="name" name="pet_name"value="${user.pet_name}(${user.type})" readonly><br>
						<label>생일:</label><input type="text" class="birth" name="pet_birth" value="${user.pet_birth}" readonly>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
		</div><br>
	</c:when>
	
	<c:when test="${user.type eq 'Dog'}">
	
		<div class="row" id="catdog" style="width:300px;max-width:90%; background-color: #9BCDD2;">
			<c:choose>
				<c:when test="${not empty user.filename }">
					<div class="Photo profile-btn-area"> 
						<label for="imageInput">이미지 선택</label>
						<div class="imgs">
						<img src="${pageContext.request.contextPath }/resources/img/${user.filename}" class="rounded-circle myPetImg">
						<img src="${pageContext.request.contextPath }/resources/img/plusbtn_blue.png" alt="더하기" onclick="fileChange('${user.filename}')" style="width:30px;" class="plus"></div>
						<div class='v-line'></div>
						<div class="col">
							<label>이름:</label><input type="text" class="name" name="pet_name"value="${user.pet_name}(${user.type})" readonly><br>
							<label>생일:</label><input type="text" class="birth" name="pet_birth" value="${user.pet_birth}" readonly>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="Photo" style="vertical-align:middle;">
					<div class="imgs">
						<img alt="Photo" src="${pageContext.request.contextPath}/resources/img/dog2.png"   class="rounded-circle myPetImg" >
						<img src="${pageContext.request.contextPath }/resources/img/plusbtn_blue.png"  onclick="fileChange('${user.filename}')" alt="더하기" style="width:30px;" class="plus"></div>
						<div class='v-line'></div>
						<div class="col">
							<label>이름:</label><input type="text" class="name" name="pet_name"value="${user.pet_name}(${user.type})" readonly><br>
							<label>생일:</label><input type="text" class="birth" name="pet_birth" value="${user.pet_birth}" readonly>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</c:when>
</c:choose>
       <br>
     
		<form action="/updateFilename" method="post" name="myPageFrm" id ="profileFrm" enctype="multipart/form-data">
			<input type="hidden" name="filename" id="hidfnm" >
			<input type="file" name="uploadFile" id="hidFile">
		</form>
      <br><br>
    </div>
       
       
    <%@ include file="/dogcat_footer.jsp" %>
</body>
</html>