<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ include file="../../dogcat_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2{
margin-top : 100px;
}

/* 별점 */
.starRateContainer {
   display: flex;
   padding: 15px 0px;
}

.rate {
   float: left;
   height: 46px;
   padding: 0 10px;
}

.rate:not(:checked)>input {
   position: absolute;
   top: -9999px;
}

.rate:not(:checked)>label {
   float: right;
   width: 1em;
   overflow: hidden;
   white-space: nowrap;
   cursor: pointer;
   font-size: 30px;
   color: #ccc;
}

.rate:not(:checked)>label:before {
   content: '★ ';
}

.rate>input:checked ~ label {
   color: #ffc700;
}

.rate:not(:checked)>label:hover, .rate:not(:checked)>label:hover ~ label
   {
   color: #deb217;
}

.rate>input:checked+label:hover, .rate>input:checked+label:hover ~ label,
   .rate>input:checked ~ label:hover, .rate>input:checked ~ label:hover ~
   label, .rate>label:hover ~ input:checked ~ label {
   color: #c59b08;
}
.reviewContainer {
   padding: 15px 0px;
   display: flex;
   width : 100%;
}
.headerTitle {
	display: flex;
	justify-content: center; /* 수평 가운데 정렬 */
	align-items: center; /* 수직 가운데 정렬 */
  background-color: #FF8551;
  border-radius: 0.25rem 0 0 0.25rem;
  color : white!important;
  font-weight : bold;
  height : 100px;
}
.headerTitlest{
display: flex;
	justify-content: center; /* 수평 가운데 정렬 */
	align-items: center; /* 수직 가운데 정렬 */
  background-color: #FF8551;
  border-radius: 0.25rem;
  color : white!important;
  font-weight : bold;
}

.reviewContents {
/*    min-width: 70%; */
/*    max-width: 70%; */ 
   width : 100%;
   margin-left: 20px;
}
.form-control innm{
font-weight : bolder;
}

#review {
   display: flex;
   border: 1px solid #FF8551;
   border-radius: 0 0.25rem 0.25rem 0;
   width: 100%;
   height: 100px;
   resize : none;
}

.reviewBtnContainer {
   min-height: 100px;
   display: flex;
   justify-content: center;
   align-items: center;
}


#reviewBtn {
	  display:block;
  margin : 10px auto;
  width : 15%;
height : 40px;
border-radius : 5px;
text-align : center;
background-color: #22668D;
color: #fff;
border: 1px solid #22668D;
  cursor:pointer;
}
#reviewBtn:hover {
    background-color: #3A80B1; /* 호버 시 배경색 변경 */
    color: #fff; /* 호버 시 텍스트 색상 변경 */
}
input[type="submit"]:hover {
    background-color: #FF7141; 
}
.form-control:disabled, .form-control[readonly] {
     background-color: #f5c4b736;
    border: 1px solid #FF8551;
     opacity: 1;
   }
   input[type=file]{
   background-color: #f5c4b736;
    border: 1px solid #FF8551;
    opacity: 1;
    }
  .input-group-text {
  background-color: #FF8551;
  color : white!important;
  font-weight : bold;
  }
  
  .cons{
	font-weight: bolder;
}
.reviewContetns{
width : 100%
}
.v_star, .v_writer, .v_uploadFile, .v_content {
width: 90px;
}
.starScore {
height: 60px;
}
.revWrt {
display: none;
}
@media screen and (max-width: 390px) {
#reviewBtn {
width: 106px;
}
#input_file {
padding: 3px 12px 6px 5px;
}
#pro_name {
width: 241px;
border-radius: 0px 5px 5px 0px;
}
.rate {
padding-left: 0px;
}
.ttfont {
margin-top: 30px;
}
.revWrt {
display: grid;
margin-left: 0px;
margin-top: 5px;
width: 125px;
}
.reviewContainer {
padding: 0px;
}
}
</style>
<script src="../../resources/js/review.js"></script>
<script>
$(function() {
	let rating = null;
    $(".star").click(function() {
       rating = $(this).val();
       location.href="#"+$(this).next().attr("id");
    });

//          $.ajax({
//             type : "POST",
//             url : "insertReview.rev",
//             data : JSON.stringify(body),
//             success : function(data) {
//                alert("리뷰 작성 완료 !");
//                location.href = "/catalog";
//             },
//             error : function(data) {
//                alert(data.responseText);
//             },
//             contentType : "application/json"
//          });
//       });
      
//       // 리뷰 작성에 필요값 만들기
//       function createBody() {
//          let productId = $("#productId").text();
//          let productName = $("#productName").text();
//          let review = $("#review").val().trim();

//          return {
//             productId : productId,
//             productName : productName,
//             rating : rating,
//             review : review
//          };
//       }

//   		  function validation(body) {
//     	         // 별점 체크 여부
//     	         if (body.rating < 0)
//     	            throw alert("별점을 주세요!");	
//     	         // 후기 글자수
//     	         if (body.review.length < 10)
//     	            throw alert("후기를 10글자 이상 입력해주세요.");
//     	      }
//     	   });

    $("#reviewBtn").click(function(event) {
        // 별점이 1보다 작은 경우 (별점이 선택되지 않은 경우) 폼 제출을 방지합니다
        if (rating < 1) {
            event.preventDefault(); // 이로써 폼 제출이 방지됩니다
            alert("별점을 주세요!");
        }
    });

   
});
  </script>
<body>
  <form action="insertReview.rev" method="post" enctype="multipart/form-data">
<div class="container">
      <div class="titleContainer">
         <h2 class="ttfont">리뷰작성<hr class="revWrt"></h2>
      </div>
<!--       상품정보 -->
<!--          <div> -->
<!--             <div class="productHeaderContainer"> -->
<!--                <span class="headerTitle" style="">상품</span> -->
<!--             </div> -->
<!--             <div class="productContainer"> -->
<%--                <div id="productId" th:text="${product.itemId}" --%>
<!--                   style="display: none;"></div> -->
<!--                <div class="productImageContainer"> -->
<%--                   <img th:src="@{${product.imagePath}}" alt=""> --%>
<!--                </div> -->
<!--                <div class="productInfoContainer"> -->
<%--                   <span id="productName" th:text="${product.name}"></span> --%>
<!--                </div> -->
<!--             </div> -->
<!--          </div> -->
         
<div class="container-fluid">
  <!-- 별점 -->
        <div class="input-group mb-3 starScore">
            <div class="starRateContainer">
               <span class="headerTitlest v_star"
                  style="margin-right: 10px; vertical-align: middle; line-height: 50px;">별점</span>

               <div class="rate">
                   <input type="radio" class="star" id="star5" name="rev_star" value="5" />
				                  <label for="star5" title="text" id="lb5">5 stars</label>
				                  <input type="radio" class="star" id="star4" name="rev_star" value="4" />
				                  <label for="star4" title="text" id="lb4">4 stars</label>
				                  <input type="radio" class="star" id="star3" name="rev_star" value="3" />
				                  <label for="star3" title="text" id="lb3">3 stars</label>
				                  <input type="radio" class="star" id="star2" name="rev_star" value="2" />
				                  <label for="star2" title="text" id="lb2">2 stars</label>
				                  <input type="radio" class="star" id="star1" name="rev_star" value="1" />
				                  <label for="star1" title="text" id="lb1">1 star</label>
               </div>
            </div>
            </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text v_writer">구매자</span>
      </div>
      <input type="text" class="form-control innm" name="rev_writer"  value="<%=session.getAttribute("userId").toString()%>" readonly>     
<%--       <input type="text" class="form-control innm" name="rev_writer" value="${ReviewVO.rev_writer}" readonly>       --%>
    </div>
   
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text v_writer">구매상품</span>
      </div>
 <select id="pro_name" class="paddin" name="pro_name">
   <c:forEach items="${orderList }" var="orderList">
<%--         <input type="text" class="form-control innm" name="pro_no" value="${product.pro_no}" readonly> --%>
            <option value="${orderList.pro_name}">${orderList.pro_name}</option>
<%--    <input type="text" class="form-control innm" name="pro_name" value="${orderList.pro_name}" readonly>     --%>
   </c:forEach>
   </select>
    </div>
   
    <div class="input-group mb-3">
       <div class="reviewContainer">
               <div class="reviewHeaderCotainer">
                  <span class="headerTitle v_content">상품후기</span>
               </div>
      <div class="reviewContetns">
      <textarea id="review" name="rev_content" rows="4" cols="150" maxlength="150" placeholder="다른 고객님에게 도움이 되도록 상품에 대한 솔직한 평가를 부탁 드리겠습니다. &#13;&#10; 후기 작성은 최대 100자 가능합니다." /></textarea>
    </div>
    </div>
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">리뷰사진</span>
      </div> 
      <input type="file" id="input_file" multiple class="form-control innm" name="rev_uploadFile">
    </div>
      <span style="font-size:12px; color: gray;">※첨부파일은 최대 3개까지 등록이 가능합니다.</span>     
    
	  	<div class= "reviewBtnContainer">
            <input type="submit" class="btn theadbar" id="reviewBtn" name="sub" value="작성완료"></div>
</div>
</div>
  </form>  
  <%@ include file="../../dogcat_footer.jsp"%>
</body>
</html>
