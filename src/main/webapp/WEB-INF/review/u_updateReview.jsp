<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../dogcat_header.jsp"%>
<%
	String sts = "";
	if(session.getAttribute("userId") == null){
		 sts = "disabled";
	}
%>
	<%
			if (request.getParameter("error") != null) {
				out.println("<div class='alert alert-danger'>");
				out.println("해당 글은 작성자만이 수정할 수 있습니다.");
				out.println("</div>");
			}
			%>
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<style>
.jumbotron {
    text-align: center;
    background-color: white;
    margin: 0
}
/* 별점 */
.starRateContainer {
   display: flex;
   padding: 15px 0px;
   border-top: 1px solid black;
   border-bottom: 1px solid #eee;
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
#imgBox {
	display: none;
	position: absolute;	
	top: 0;
	left: 0;
	height: 100vh !important;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 9999999;
}

#imgContentBox {
	width: 600px;
	max-height: 550px;
	overflow: auto;
	position: absolute;
	top: 30%;
	left: 30%;
	border-radius: 5px;
	z-index: 9999999;
}

#imgBoxTitleBar {
	border-bottom: 1px solid #777;
	border-radius: 5px 5px 0 0;
	background-color: #ddd;
	width: 100%;
	padding: 10px;
	text-align: right;
	font-size: 20px;
	font-weight: bolder;
}

#imgBoxImg {
	width: 100%;
	border-radius: 0 0 5px 5px;
}

#closeX {
	padding: 5px 20px;
	border-radius: 5px;
	border: 1px solid #777;
	background-color: red;
	color: #fff;
}

#closeX:hover {
	background-color: #777;
	cursor: pointer;
}

#heart {
	width: 30px;
}
#comment {
   resize : none;
}
.cons{
	font-weight: bolder;
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
  text-align: center;
  }
.v_star, .v_writer, .v_content, .v_uploadFile, .v_regdate {
width: 90px;
}

/* 사진 사이즈 */
#divImg {
	width: 20%;
/*  	display: none !important; */
}
#delbtn{
margin-bottom : 10px;
margin-left : 90px;
width : 20%;
border: 1px solid black;
}
#reviewBtn{
display : inline;
width : 20%;
height : 40px;
border-radius : 5px;
text-align : center;
background-color: #fff;
color: #22668D;
border: 1px solid #22668D;
}
#reviewBtn:hover {
    background-color: #22668D; /* 호버 시 배경색 변경 */
    color: #fff; /* 호버 시 텍스트 색상 변경 */
}
.theadbar {
  margin: 0 20px;
}
#revList{
display : inline;
width : 20%;
height : 40px;
border-radius : 5px;
text-align : center;
background-color: #fff;
color: #22668D;
border: 1px solid #22668D;
}
#revList:hover {
    background-color: #22668D; /* 호버 시 배경색 변경 */
    color: #fff; /* 호버 시 텍스트 색상 변경 */
}
.btnBox{
 display : block; 
 margin : 20px auto; 
 text-align : center; 
 box-sizing: border-box; 
 display: flex;
 flex-wrap: nowrap;
 justify-content: center;
}
#input_file {
/* display: none; */
}
#fileInfo {
/* display: none !important; */
}
#upbtn {
padding-left: 6px;
padding-top: 3px;
}
@media screen and (max-width: 390px) {
	.revConBox {
	display: block;
	}
	.picCon {
	width: 360px !important;
	}
	.repText {
	border-radius: 0px !important;
	}
	#input_file {
	height: 44px;
	padding-left: 5px;
	border-radius: 0px 5px 0px 0px;
	}
	#reviewBtn {
	width: 96px;
	}
	#delbtn {
	width:360px;
	border: 1px solid black;
	margin: 0px 0px 10px 0px;
	}
	#divImg {
	display: none !important;
	}
	#upbtn {
	width: 360px;
	padding-left: 6px;
	padding-top: 3px;
	border-top: none;
	font-size: 14px;
	}
	#resrev {
	width: 360px;
	border-radius: 5px 5px 0px 0px;
	}
}
</style>
<script>
$(function() {
	let rating = null;
    $(".star").click(function() {
       rating = $(this).val();
       location.href="#"+$(this).next().attr("id");
    });
    
    $("#reviewBtn").click(function(event) {
        // 별점이 1보다 작은 경우 (별점이 선택되지 않은 경우) 폼 제출을 방지하고 경고창을 표시합니다
        if (rating < 1) {
            event.preventDefault(); // 폼 제출 방지
            alert("별점을 주세요!");
        }
    });
});
// $(document).ready(function() {
//     // 페이지 로딩 시에 파일 선택 버튼은 숨기고 이미지와 파일 이름을 보이도록 설정합니다.
//     $("#upbtn").hide();
//     $("#fileInfo").show();
//     $("#divImg").show();

//     // 파일 선택 버튼 클릭 시에 이미지를 숨기고 파일 선택과 파일 이름을 보이도록 설정합니다.
//     $("#upbtn").click(function() {
//         $("#divImg").hide();
//         $("#fileInfo").show();
//     });

//     // 파일 삭제 버튼 클릭 시
//     $("#delbtn").click(function() {
//         // 파일 삭제 로직은 여기에 추가
//         // ...

//         // 파일 삭제 후 이미지를 숨기고 파일 선택과 파일 이름을 보이도록 설정합니다.
//         $("#upbtn").hide();
//         $("#divImg").hide();
//         $("#fileInfo").show();
//     });
// });

</script>
<body>
	<section id="joinformArea">

		<div class="jumbotron">
			<h1>구매 후기 수정</h1>
		</div>
		<div class="container">
			<%
			if (request.getParameter("error") != null) {
				out.println("<div class='alert alert-danger'>");
				out.println("해당 글은 작성자만이 수정할 수 있습니다.");
				out.println("</div>");
			}
			%>
			<form action="/u_updateReview.rev" method="post" enctype="multipart/form-data">
				<input type="hidden" name="rev_seq" value="${review.rev_seq}" <%=sts %>>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text v_star">평점</span>
					</div>
<%-- 					<div class="star-rating" data-rating="${review.rev_star}"></div> --%>
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
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text v_writer">구매자</span>
			</div>
			<input type="text" class="form-control innm cons" name="rev_writer"
				value="${review.rev_writer}" <%=sts %> readonly>
		</div>
		<div class="input-group mb-3 revConBox">
			<div class="input-group-prepend">
				<span id="resrev" class="input-group-text v_content">상품후기</span>
			</div>		
              <input type="file" id="upbtn" class="form-control innm" name="rev_uploadFile" ></span>
					<img id="divImg" src="/resources/img/${review.rev_filename}" <%=sts %>>
					<input type="hidden"  name="rev_filename" value="${review.rev_filename}"<%=sts %>>

			<textarea class="form-control innm picCon repText" rows="10" id="comment"
				name="rev_content">${review.rev_content}<%=sts %></textarea>
		</div>
						<button type="button" id="delbtn" >사진삭제</button>


<!--                <input type="file" id="upbtn" class="form-control innm" name="rev_uploadFile"> -->
<%--                <img id="divImg" src="/resources/img/${review.rev_filename}"<%=sts %>> --%>
<%--                <input type="hidden"  name="rev_filename" value="${review.rev_filename}"<%=sts %>> --%>

<!--          <textarea class="form-control innm" rows="10" id="comment" -->
<%--             name="rev_content">${review.rev_content}<%=sts %></textarea> --%>
<!--       </div> -->
<!--             <button type="button" id="delbtn" >사진삭제</button> -->


				  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">   
          <h6 class="modal-title">DogCatPunch</h6>
<!--           <button type="button" class="close" data-dismiss="modal">×</button> -->
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          파일을 삭제하시겠습니까?
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" id="delfbtn" class="btn" data-dismiss="modal">확인</button>
          <button type="button" class="close" data-dismiss="modal">취소</button>
        </div>
        
      </div>
    </div>
  </div>
				
				
	<script>
	$(document).ready(function() {
		   if('${review.rev_filename}' != ''  ){
		      fileHideShow("error");
		   }else{
		      fileHideShow("success");
		   }

	
		   $(document).ready(function() {
				$("#delbtn").click(function() {
			        // 파일 삭제 버튼 클릭 시
			        let revFilename = "${review.rev_filename}";
			        if (!(revFilename == null || revFilename === "")) {
			            $.ajax({
			                url: "/deleteFile.rev",
			                data: {
			                    rev_seq: $("input[name=rev_seq]").val(),
			                    rev_filename: $("input[name=rev_filename]").val()
			                },
			                type: "post",
			                cache: false,
			                success: function(resval) {
			                    if (resval === 'success') {
			                        $("input[name=rev_filename]").val(""); // 파일 정보 초기화
			                        alert("파일이 삭제되었습니다.");
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
			});
				
				 function fileHideShow(val) {
				        if (val === "success") {
				            $('#upbtn').show();
				            $('#divImg').hide();
				            $('#delbtn').hide();
				        } else {
				            $('#upbtn').hide();
				            $('#divImg').show();
				            $('#delbtn').show();
				        }
				    }
			 });

   

</script>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text v_regdate">등록일</span>
			</div>
			<input type="text" class="form-control innm cons" name="rev_regdate"
				value="${review.rev_regdate}" readonly>
		</div>
		<div class="btnBox">
		<input class="revUpdate btn theadbar " type="submit" id="reviewBtn" value="수정하기">
		<button id="revList" type="button" >목록</button>
</div>
</div>

		</form>
		</div>
	</section>
	<%@ include file="/dogcat_footer.jsp"%>
</body>
</html>