<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List,dog.cat.punch.products.ProductsVO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../admin/a_header.jsp"%>


<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>pro 관리자 상세보기</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.js"></script>
<script>
	function deletepro(snum) {
		if (confirm("삭제할까요?")) {
			alert("삭제되었습니다.");
			console.log(snum);

			// 페이지 이동
			location.href = "deleteProducts.pro?pro_no=" + snum;
		}
	}
</script>


<style>

.container{
   padding: 50px 5px;
}
.container-fluid{
width : 100%;
margin : 30px auto;
text-align : center;
display : block;
}
.form-control:focus {
	color: #495057;
	background-color: #fff;
	border-color:#22668D;
	outline: 0;
	box-shadow: none;
}


span {
	width: 100px;
	justify-content: center;
	align-items: center;
	display: flex;
}

.form-control {
	height: 40px;
}

.input-group-text {
	 background-color: #22668D;
  color : white!important;
  font-weight : bold;
  text-align: center;
  }
}

.form-control:disabled, .form-control[readonly] {
	background-color: #f5c4b736;
	border: 1px solid #22668D;
	opacity: 1;
}

.form-control {
	border: 1px solid #22668D;
}

.write {
	width: 100px;
	height: 50px;
	max-width: 100px;
	background-color: #fff;
	color: #22668D;
    border: 1px solid #22668D;
    cursor: pointer;
	border-radius: 5px;
	margin-right : 10px;
}

.write:hover {
	 background-color: #22668D;
     color : white;
}

.text1{
 resize : none;
}

form {
	width: 100%;
	border: rgb(249 223 236/ 73%);
}

input[type=text],textarea {  
	  box-shadow : none;
      border: 1px solid #22668D;
      width: 90%;
       transition:none;}
  #divImg {
	width: 30%;
	padding: 0px!important;
	margin : 0px!important;
}      
#delbtn{
	width: 100px;
	height: 50px;
	max-width: 100px;
	background-color: #fff;
	color: #22668D;
    border: 1px solid #22668D;
    cursor: pointer;
	border-radius: 5px;
	margin-right : 10px;
}

#delbtn:hover {
	 background-color: #22668D;
     color : white;
}
#pro_descript{
width:60%;
}

:focus-visible {
    outline: -webkit-focus-ring-color auto 0px;
}

 button:focus {outline: 0px auto -webkit-focus-ring-color;}
 

</style>

</head>
<body>
      <form action="updateProducts.pro" method="post"  enctype="multipart/form-data">
<div class="container">
	  <div class="titleContainer">
         <h2 class="ttfont">상품 수정</h2>
      </div>

   <div class="container-fluid">

         <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">번호</span>
            </div>
            <input type="text" name="pro_no" id="pro_no"
               value="${Products.pro_no}">
         </div>




         <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">상품</span>
            </div>
            <input type="text" name="pro_name" id="pro_name"
               value="${Products.pro_name}">
         </div>



         <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">가격</span>
            </div>
            <input type="text" name="pro_price" id="pro_price"
               value="${Products.pro_price}">
         </div>


         <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">상세설명</span>
            </div>
            <input type="file" id="upbtn" class="form-control innm" name="uploadFile">
               <img id="divImg" src="${pageContext.request.contextPath }/resources/img/productImg/${Products.pro_filename}">
			<input type="hidden"  name="pro_filename" value="${Products.pro_filename}">
            <textarea rows="10" class="text1" name="pro_descript" id="pro_descript">${Products.pro_descript} </textarea>
         </div>
			
					
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

         <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">원산지</span>
            </div>
            <input type="text" name="pro_country" id="pro_country"
               value="${Products.pro_country}">
         </div>


         <div class="input-group mb-3">
            <div class="input-group-prepend">
               <span class="input-group-text">유통기한</span>
            </div>
            <input type="text" name="pro_expiration_date"
               id="pro_expiration_date" value="${Products.pro_expiration_date}">
         </div>


<script>
	$(document).ready(function() {
		   if('${Products.pro_filename}' != ''  ){
		      fileHideShow("error");
		   }else{
		      fileHideShow("success");
		   }

	
		   $(document).ready(function() {
				$("#delbtn").click(function() {
			        // 파일 삭제 버튼 클릭 시
			        let proFilename = "${Products.pro_filename}";
			        if (!(proFilename == null || proFilename === "")) {
			            $.ajax({
			                url: "/deleteFile.pro",
			                data: {
			                    pro_no: $("input[name=pro_no]").val(),
			                    pro_filename: $("input[name=pro_filename]").val()
			                },
			                type: "post",
			                cache: false,
			                success: function(resval) {
			                    if (resval === 'success') {
			                        $("input[name=pro_filename]").val(""); // 파일 정보 초기화
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
     



	<div class="input-group">
		<button type="submit" class="write">수정</button>

		<button type="button" class="write"
			onclick="deletepro('${Products.pro_no}')">삭제하기</button>
			
				<button type="button" id="delbtn" >사진삭제</button>
	</div></div>
	<br>
	<br>

</div>
	</form>



</body>
</html>


