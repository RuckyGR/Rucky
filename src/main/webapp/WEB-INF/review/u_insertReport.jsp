<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../../dogcat_header.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.jumbotron2{
   padding: 50px 5px;
   display: flex;
   
}

.container-fluid{
width : 100%;
margin : 0 auto;
text-align : center;
display : block;

}
.reviewContainer {
   padding: 15px 0px;
   display: flex;
    width : 100%;
     flex-direction: column; /* 수직 방향으로 정렬합니다. */
    align-items: flex-start;
  
}
.reviewContents {
/*    min-width: 90%; */
/*    max-width: 70%; */
    width : 100%;
   margin-left: 20px;
   
}

.input-group-text{
width : 100px;
justify-content: center;
align-items : center;
display : flex;
border-radius:  0.25rem 0 0 0.25rem;
padding : 5px;
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

#reviewBtn{
display : block;
width : 20%;
height : 40px;
border-radius : 5px;
margin : 0 auto;
text-align : center;
background-color: #22668D;
color: #fff;
border: 1px solid #22668D;
}
#reviewBtn:hover {
    background-color: #3A80B1; /* 호버 시 배경색 변경 */
    color: #fff; /* 호버 시 텍스트 색상 변경 */
}
#revList{
width : 6%;
height : 40px;
background-color: #fff;
color: #22668D;
border: 1px solid #22668D;
float : right;
border-radius : 5px;
margin-left: auto;
margin-top : 20px;
}
#revList:hover {
    background-color: #22668D; /* 호버 시 배경색 변경 */
    color: #fff; /* 호버 시 텍스트 색상 변경 */
}
.form-control:disabled, .form-control[readonly] {
     background-color: #f5c4b736;
    border: 1px solid #FF8551;
     opacity: 1;
   }
   
 .input-group-text {
  background-color: #FF8551;
  color : white!important;
  font-weight : bold;
  }
  .reviewContetns{
width : 100%
}
.repLine {
	display: none;
}
/* 반응형 390 X 844 */
@media screen and (max-width: 390px) {
	#revList {
	width: 54px;
	}
	#reviewBtn {
	width: 86px;
	}
	.repIpt {
	margin-left: 11px;
	}
	.revBtnBox {
	padding-bottom: 80px;
	}
	.repIptBox {
	padding-bottom: 0px;
	}
	.repLine {
	display: grid;
	margin-top: 5px;
/* 	background-color: black; */
	}
}
</style>
</head>
<body>
	<form action="insertReport.rev" method="post" enctype="multipart/form-data">
<div class="container">
<div class="jumbotron2 repIptBox">
   <h2 class="repIpt">신고접수 <hr class="repLine"></h2>      
</div>
<div class="container-fluid">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">리뷰번호</span>
			</div>
		<input type="text" class="form-control innm" name="rev_seq" value="${reviewVO.rev_seq}" readonly> 
		</div>
		<input type="hidden" name="rev_content" value="${reviewVO.rev_content}">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">구매자</span>
			</div>
			<input type="text" class="form-control innm" name="rev_writer"
				value="${reviewVO.rev_writer}" readonly>
		</div>
		<div class="input-group mb-3">
			<div class="reviewContainer">
				<div class="reviewHeaderCotainer">
					<span class="input-group-text">신고사유</span>
				</div>
				<div class="reviewContetns">
					<textarea rows="10" id="review" name="rep_content"
						placeholder="신고하시고자 하는 내용을 적어주세요. 단 신고내용 외 개인정보(연락처,주소 등)는 절대 입력하지 말아주세요.&#10;신고해주신 내용은 관리자 검토 후 내부정책에 의거 조치가 진행됩니다." /></textarea>
				</div>
		<button id="revList" type="button" >목록</button>
			</div>
		</div>
		
		 <div class="reviewBtnContainer revBtnBox">
         <input class="revReport btn btn-primary" type="submit"  id="reviewBtn"
            name="sub" value="작성완료">
      </div>
		
	</div>
	</div>
	</form>
	<%@ include file="../../dogcat_footer.jsp"%>
</body>
</html>