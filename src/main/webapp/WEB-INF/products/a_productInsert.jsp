<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin/a_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<style>
.container{
   padding: 50px 5px;
}

.container-fluid{
width : 80%;
margin : 30px auto;
text-align : center;
display : block;
}
.form-control:focus {
	color: #495057;
	background-color: #fff;
	border-color: #22668D;
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
	color: #ffffff;
	background-color: #22668D;
	border: 1px solid #22668D;
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
	margin-bottom : 15px;
}

.write:hover {
	 background-color: #22668D;
     color : white;
}

.list {
	width: 100px;
	height: 50px;
	max-width: 100px;
	background-color: #9BCDD2;
	color: #fff;
	border: none;
	border-radius: 5px;
}

.list:hover {
	color: #fff;
}

form {
	width: 80%;
	border: rgb(249 223 236/ 73%);
	 margin: 0 auto;
}
#pro_descript{
resize: none;
}

</style>
</head>
<body>
		<form action="insertProducts.pro" method="post" enctype="multipart/form-data">
<div class="container">
	  <div class="titleContainer">
         <h2 class="ttfont">상품등록</h2>
      </div>
	<div class="container-fluid">
		
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">상품명</span>
					</div>
					<input type="text" id="pro_name" name="pro_name"
						class="form-control" required>
				</div>


				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">상품가격</span>
					</div>
					<input type="number" id="pro_price" name="pro_price"
						class="form-control" required>
				</div>



				<div class="input-group mb-3">
					<div class="input-group-prepend">

						<span class="input-group-text">상품설명</span>
					</div>
					<textarea class="form-control" id="pro_descript"
						name="pro_descript" rows="10" required></textarea>
				</div>





				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">원산지</span>
					</div>
					<input type="text" class="form-control" id="pro_country"
						name="pro_country">
				</div>



				<div class="input-group mb-3">
					<div class="input-group-prepend">

						<span class="input-group-text">유통기한</span>
					</div>
					<input type="text" class="form-control" id="pro_expiration_date"
						name="pro_expiration_date">
				</div>



				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">상품종류</span>
					</div>
					<select id="pro_type" class="form-control" name="pro_type">
						<option value="사료">사료</option>
						<option value="간식">간식</option>
						<option value="장난감">장난감</option>
						<option value="옷">옷</option>
						
					</select>
				</div>


				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">파일등록</span>
					</div>
					<input type="file" class="form-control innm" name="uploadFile">
				</div>




				<div class="input-group">
					<button type="submit" id="register_Btn" class="write">등록</button>
					<button type="reset" id="res_Btn" class="write">다시쓰기</button>
				</div>
	</div>
	</div>
		</form>
<script>
document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("register_Btn").addEventListener("click", function(event) {
        event.preventDefault(); 

        var confirmRegister = confirm("등록하시겠습니까?");
        if (confirmRegister) {
            document.querySelector("form").submit();
        } else {
        }
    });
});
</script>
</body>
</html>
