<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../dogcat_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>

<head>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

<script	src="${pageContext.request.contextPath}/resources/js/summernote-ko-KR.js"></script>

<script>
	$(document).ready(
			function() {
				$('#summernote').summernote(
						{
							minHeight : 370,
							maxHeight : null,
							focus : true,
							lang : 'ko-KR',
							width : '100%',
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
  .wr, .btnlist {
   width: 70px;
 	height:40px;
    max-width: 100px;
    background-color: #fff;
    border:1px solid black;
    border-radius: 5px;
  }
  .footer {
  	width : 800px;
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
  }
.wr {
    margin-left: 200px;
  }
  .table {
    width: 100%;
    overflow-x: auto;
    }
}
  
</style>

<body>
<div class="articleForm">
	<div align="center" class="container-fluid">
		<form action="insertQna.qna" method="post" enctype="multipart/form-data">
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
									<input type="password" class="form-control" name="qna_pass" placeholder="비밀번호를 입력하세요." required>
								</div>
							</td>
						</tr>

						<tr>
							<th>
								<div>제목</div>
							</th>
							<td colspan="3">
								<div class="title">
									<input type="text" class="form-control form-title" name="qna_title" placeholder="제목을 입력하세요." required>
								</div>
							</td>
						</tr>

						<tr>
							<th>
								<div>내용</div>
							</th>
							<td colspan="3" class="text_content">
								<div>
									<textarea class="form-control" rows="1" id="summernote" name="qna_content"></textarea>
								</div>
							</td>
						</tr>

						<tr>
							<th>
								<div>첨부파일</div>
							</th>
							<td colspan="3">
								<div>
									<input type="file" class="form-control form-title" name="qna_uploadFile">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</fieldset>
			<div id="footer">
				<button id="qnaList" type="button" class="btnlist">글목록</button>
				<button type="submit" class="wr">글쓰기</button>
			</div>
		</form>
	</div>
	</div>
	<br><br><br>
<script>

    $(function(){
        $('.wr').click(function(){
            var titleValue = $('input[name="qna_title"]').val().trim();
            var contentValue = $('#summernote').summernote('code').trim();
            var passValue = $('input[name="qna_pass"]').val().trim();

            if(!titleValue || !contentValue || !passValue) { 
                alert('제목, 내용, 비밀번호를 모두 입력해주세요.');
                return false;
            } else {
                if(!confirm('게시글을 등록하시겠습니까?')){
                    return false;
                } else{
                    alert("등록되었습니다.");
                }
            }
        });
    });
</script>
	
</body>
<%@ include file="/dogcat_footer.jsp" %>
</html>	
