<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../dogcat_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String sts = "";
if (session.getAttribute("userId") == null) {
	sts = "disabled";
}
%>
<head>
<style>
    #articleForm {
	width: 1000px;
	height: 500px;
	margin: 50px auto;
	text-align:center;
}
    #articleForm1 {
	width: 1000px;
	margin: 50px auto;
	margin-bottom : 50px;
	text-align:left;
	border : 1px solid #22668D;
	border-radius : 7px;
}
.title {
	position: relative;
	text-align: left;
	padding: 15px 5PX;
	background: #f7f7f7;
	font-weight: 600;
	font-size: 20px;
	border-top: 2px solid #22668D;
	
}
.title1 {
	height : 50px;
	position: relative;
	text-align: left;
	padding: 15px 5PX;
	background: #f7f7f7;
	border-radius : 7px;
}
.articleinfo{
	
	text-align: left;
	border-top: 1px solid #bababa;
	padding: 5px;
}


.info, .info1 {
float : left;
margin-left: 10px;
}
.info{
font-weight: 700;
font-size: 15px;
text-align : center;
}
.info1 {
	font-size: 15px;
}
.info2 {
margin-left: 10px;
float: right;
}
.list{
	float: right;
	width: 70px;
 	height:40px;
    max-width: 100px;
    background-color: #FAF0E4;
    color: #FF8551;
    border:1px solid #FF8551;
    border-radius: 5px;
	}  

   .divImg{
    display: block;
	width: 100%;
	height : 100%;
	}
   #articleContentArea{
    margin-top: 2px;
    margin-bottom: 10px;
    text-align: left;
    overflow: auto;
    border: 1px solid #bababa;
    padding: 10px 10px;
    
   }
   #articleContentArea1{
   padding: 10px 10px;
   }
   	.filesize{
   	width: 30%;
	height : 30%;
	}
   .Btn {
   	width: 70px;
 	height:40px;
    max-width: 100px;
    background-color: #fff;
    border:1px solid black;
    border-radius: 5px;
	}
	
	@media (max-width:390px) {
	#articleContentArea1{
	width : 100%;
	height : auto;
	}
	.btn_wrap{
	float:left;
	}
	.btn_wrap{
	display : contents;
	margin : 0 auto;
	text-align : center;
	}
	#articleForm, #articleForm1{
	width:96%;
	height : auto;
	}
	}  
</style>
</head>
<body>
	<div id="articleForm">
	<form name="fm">
		<input type="hidden" name="qna_seq" value="${qna.qna_seq}">
		<input type="hidden" name="qna_writer" value="${qna.qna_writer}">
		<div class="title">
		${qna.qna_title}
		</div>

		<div class="articleinfo">
			<div class="info">${qna.qna_writer}</div>
			<div class="info2">조회수 : ${qna.qna_cnt}</div>&nbsp;
			<div class="info2">${qna.qna_date}</div>&nbsp;
		</div>

		<div id="articleContentArea">
		<div class="filesize">
			<c:if test="${not empty qna.qna_filename }">
				<img class="divImg" src="${pageContext.request.contextPath}/resources/img/${qna.qna_filename}">
			</c:if>	
			</div>
			${qna.qna_content}
		</div>

		<div class="btn_wrap">
			<button id="qnaUpdate" type="button" class="Btn" <%=sts%>>글수정</button>
			<button id="qnaDel" type="button" class="Btn" <%=sts%>>글삭제</button>
			<button id="qnaList" type="button" class="Btn">글목록</button>
		</div>
</form>	
	</div>
	<!-- 관리자 답변 -->
	<c:if test="${qna.admin_content ne null }">
		<div id="articleForm1">
			<div class="title1">
				<span class="info">DogCatPunch</span>
				<span class="info1">${qna.admin_date}</span>
			</div>
			<div id="articleContentArea1">${qna.admin_content}</div><br><br><br>
		</div>
	</c:if>
<%@ include file="/dogcat_footer.jsp" %>
</body>
</html>
