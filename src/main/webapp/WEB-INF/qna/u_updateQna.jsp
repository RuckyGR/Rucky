<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../dogcat_header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sts = "";
	if(session.getAttribute("userId") == null){
		 sts = "disabled";
	}
%>
<head>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<!-- 서머노트를 위해 추가해야할 부분 -->

<script	src="${pageContext.request.contextPath}/resources/js/summernote-ko-KR.js"></script>

	
<script>
	$(document).ready(
			function() {
				$('#summernote').summernote(
						{
							minHeight : 370,
							maxHeight : null,
							width : '100%',	
							focus : true,
							lang : 'ko-KR',
	
							toolbar : [
									[ 'style', [ 'style' ] ],
									[
											'font',
											[ 'bold', 'italic', 'underline',
													'clear' ] ],
									[ 'fontname', [ 'fontname' ] ],
									[ 'color', [ 'color' ] ],
									[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
									[ 'height', [ 'height' ] ],
									[ 'table', [ 'table' ] ],
									[ 'view', [ 'fullscreen', 'codeview' ] ],
									[ 'help', [ 'help' ] ] ]
						});
			});
</script>
</head>
<body>
<style>
.jumbotron {
	background-color: #FFF;
}

.input-group-text {
		color : #FFF;
 		background-color : #FF8551; 
		}
.form-control:disabled, .form-control[readonly] {
		background-color : #FFF; 
		}
.btn{ 
	background-color : #fff;
	}
.card-header, .note-toolbar {
	background-color : #fff;
	}
.card-header.note-toolbar {
	background : #fff;
	}
.container-fluid tbody {
	width: 100%;
	padding : 20px 0 ;
}
.form-control {
	width: auto;
	}
.form-control.form-title {
	width: 100%;
}

.container-fluid tbody th, .container-fluid tbody td  {
	padding : 10px 0;
	padding-left : 15px;
}
.container-fluid input {
	height: 50px;
	}
	
  .articleForm {
  	width : 1000px;
  	margin-top : 100px;
  	text-align : center;
  	margin : 0 auto;
	margin-top : 100px;  
  }
  .wr, .de, .li {
  	width: 70px;
    height: 40px;
    max-width: 100px;
    background-color: #fff;
    border: 1px solid black;
    border-radius: 5px;
  }
  .btnlist {
    width: 70px;
    height: 40px;
    max-width: 100px;
    background-color: #FAF0E4;
    color: #FF8551;
    border: 1px solid #FF8551;
    border-radius: 5px;
  }
  .footer {
  	width : 800px;
  }
   .delf {
    width : 90px;
    height : 30px;
    border-radius : 5px;
    background-color: transparent;
    }
    
    .divImg{
    display: block;
	width: 100%;
	height : 100%;
	}
	#articleContentArea{
   width: 30%;
	height : 30%;
   }
  @media (max-width: 390px) {
  .container-fluid tbody th,
  .container-fluid tbody td {
    padding: 10px 0;
    padding-left: 15px;
    display: block;
  }
  
  .articleForm{
  	width : 100%;
  }

  .container-fluid input,
  .form-control.form-title,
  .form-control.form-title {
    height: 50px;
    width: 340px;
  }

  .text_content {
    width: 356px;
  }

  #footer {
    float: left;
    text-align: center;
    margin : 0 auto;
    vertical-align : middle;
  }
  .table {
    width: 100%;
    overflow-x: auto;
    }
    .wr, .de, .li {
    float: left;
 	margin-left : 5px;
    }
}
</style>
<div class="articleForm">
	<div align="center" class="container-fluid">
		<form action="updateQna.qna" method="post" name="fm" enctype="multipart/form-data">
		  <input type="hidden" name="qna_seq" value="${qna.qna_seq}">
			<fieldset>
				<table>
					<colgroup>
						<col width="10%">
						<col width="40%">
						<col width="10%	">
						<col width="*">
					</colgroup>
					<tbody>
					<tr>
							<th>
								<div>작성자</div>
							</th>
							<td>
								<div>
									<input type="text" class="form-control" name="qna_writer" value="<%=session.getAttribute("userName").toString()%>" readonly>
								</div>
							</td>

							<th>
								<div>비밀번호</div>
							</th>
							<td>
								<div>
									<input type="password" class="form-control" name="qna_pass" placeholder="자동잠금기능"readonly></div>
							</td>
						</tr>

						<tr>
							<th>
								<div>제목</div>
							</th>
							<td colspan="3">
								<div class="title">
									<input type="text" class="form-control form-title" name="qna_title"  value="${qna.qna_title}" required>
								</div>
							</td>
						</tr>

						<tr>
							<th>
								<div>내용</div>
							</th>
							<td colspan="3" class="text_content">
								<div>
									<textarea class="form-control" rows="10" id="summernote" name="qna_content">${qna.qna_content}</textarea>
								</div>
							</td>
						</tr>

						<tr>
							<th>
								<div>첨부파일</div>
							</th>
							<td colspan="3">	
							<div id="articleContentArea">
									<input type="file" class="form-control form-title" name="qna_uploadFile">
									<img id="viewImg" src="${pageContext.request.contextPath}/resources/img/${qna.qna_filename}" alt="첨부파일">
									<input type="hidden"  name="qna_filename" value="${qna.qna_filename}">
 								 <button type="button" id = "delfBtn" class="delf" data-toggle="modal" data-target="#myModal">파일 삭제</button>
   							</div>
   <td>
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <div class="modal-header">	
          <h6 class="modal-title">DogCatPunch</h6>
        </div>
        
        <div class="modal-body">
          파일을 삭제하시겠습니까?
        </div>
        
        <div class="modal-footer">
          <button type="button" id="delBtn" class="mBtn" data-dismiss="modal">확인</button>
          <button type="button" class="mBtn" data-dismiss="modal">취소</button>
        </div>
        
      </div>
    </div>
  </div>
   </tr>
	</tbody>
	</table>
	  	<button type="submit" class="wr" <%=sts %>>글수정</button>
	  	<button id="qnaDel" type="button" class="de" <%=sts %>>글삭제</button>
	  	<button id="qnaList" type="button" class="li">글목록</button>
</fieldset><br><br>
  </form>
  </div>
</div>
<script>
 $(document).ready(function() {
 	if('${qna.qna_filename}' != ''  ){
 		fileHideShow("error");
 	}else{
 		fileHideShow("success");
 	}
	
 	$("#delBtn").click(function() {
         // 파일 삭제 버튼 클릭 시
         let qnaFilename = "${qna.qna_filename}";
         if (!(qnaFilename == null || qnaFilename === "")) {
             $.ajax({
                 url: "/deleteFile.qna",
                 data: {
                 	qna_seq: $("input[name=qna_seq]").val(),
                 	qna_filename: $("input[name=qna_filename]").val()
                 },
                 type: "post",
                 cache: false,
                 success: function(resval) {
                     if (resval === 'success') {
                         $("input[name=qna_filename]").val(""); // 파일 정보 초기화
                         fileHideShow("success");
                     } else {
                         alert("파일 삭제가 실패하였습니다.");
                     }
                 },
                 error: function() {
                     alert("에러 입니다.");
                 }
             });
         } else {
             fileHideShow("error");
         }
     });
	
 	function fileHideShow(val) {
         if (val === "success") {
             $('#upBtn').show();
             $('#viewImg').hide();
             $('#delfBtn').hide();
         } else {
             $('#upBtn').hide();
             $('#viewImg').show();
             $('#delfBtn').show();
         }
     }

 $(".mo").click(function() {
    alert("수정완료되었습니다") ;
 	});
 });
 
 
</script>

</body>
<%@ include file="/dogcat_footer.jsp" %>
</html>
