<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin/a_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String sts = "";
if (session.getAttribute("userId") == null) {
	sts = "disabled";
}
%>
<html>

<style>
.title {
	text-align: center;
}
table th, td {
	margin : 0 auto;
	}
.jumbotron {
	background-color: #FFF;
}

.input-group-text {
	color: #FFF;
	border-color: #22668D;
	border: 1px solid #22668D;
	background-color: #22668D;
	width: 80px;  
	justify-content: center;
    align-items: center;
    
    }
 .input-group {
    display: block; 
  }
.form-control {
	border: 1px solid #22668D;
	border-color: #22668D;
	background-color: #FFF;
	height: 40px;	
	width: 100%;
}
.form-control:disabled, .form-control[readonly] {
  	background-color: #f5c4b736;
 	border: 1px solid #22668D;
	}


.btn {
	color: #FFF;
	background-color: #9BCDD2;
}

.container-fluid {
	width : 50%;
	margin : 0 auto;
	}

#comment {
	height : 300px;
	text-align : left;
	}
.Btn {
    width: 80px;
    height: 40px;
    background-color: #fff;
    color: #22668D;
    border: 1px solid #22668D;
    border-radius: 5px;
	}
.Btn:hover {
	background-color : #22668D;
	color : #fff;
	}
	.filesize{
   	width: 40%;
	height : 40%;
	}
	.divImg{
    display: block;
	width: 100%;
	height : 100%;
	}
	
</style>
<body>
	<div class="jumbotron">
		<h1 class = "title">관리자 답변</h1>
	</div>
	
	<div class="container-fluid">
		<%
		if (request.getParameter("error") != null) {
			out.println("<div class='alert alert-danger'>");
			out.println("해당 글은 작성자만이 수정할 수 있습니다.");
			out.println("</div>");
		}
		%>
		<form name="fm" action="updateRepl.qna" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="qna_seq" value="${qna.qna_seq}">

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">제목</span>
				<input type="text" class="form-control innm" name="qna_title" value="${qna.qna_title}" readonly <%=sts %>>
				</div>
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">작성자</span>
				<input type="text" class="form-control innm" name="qna_writer" value="${qna.qna_writer}" readonly <%=sts %>>
				</div>
			</div>
			
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">내용</span>
				<div class="form-control innm" id="comment" <%=sts%>>
					<div class="filesize">
			<c:if test="${not empty qna.qna_filename }">
				<img class="divImg" src="${pageContext.request.contextPath}/resources/img/${qna.qna_filename}">
			</c:if>	
			</div>
						${qna.qna_content}
					</div>
				</div>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">등록일</span>
				<input type="text" class="form-control innm" name="qna_date" value="${qna.qna_date}" readonly <%=sts %>>
				</div>
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">내용</span>
				<textarea class="form-control innm" rows="10" name="admin_content" <%=sts%>>${qna.admin_content}</textarea>
				</div>
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">등록일</span>
					<input type="text" class="form-control innm" name="admin_date" value="${qna.admin_date}" <%=sts %>>
				</div>
			</div>


			<div id="footer">
				<button type="submit" class="Btn" <%=sts%>>답변</button>
				<button id="aqnaList" type="button" class="Btn">글목록</button>
				<button id="aqnaDel" type="button" class="Btn">삭제</button>
				
			</div>
		</form>
	</div>
</body>
</html>
