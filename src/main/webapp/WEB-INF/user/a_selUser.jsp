<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../admin/a_header.jsp" %>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>

	.input-group-text{width:70px;  
	justify-content: center;
    align-items: center;
    display: flex;}
    
	.form-control:focus {
    color: #495057;
    background-color: #fff;
    border-color: #22668D;
    outline: 0;
    box-shadow: none;
	}

	.container-fluid{     
	  display: flex;
 	 justify-content: center;
	}

	.form-control {height: 40px;}
	.input-group-text { color: #ffffff;
    background-color: #22668D;
    border: 1px solid #22668D;
	}
	.form-control:disabled, .form-control[readonly] {
  	background-color: #f5c4b736;
 	border: 1px solid #22668D;
  	opacity: 1;
	}
	
 	.form-control{ border: 1px solid #22668D;}
	#divImg {display:block; margin:0px; padding:0px; word-break:break-all; !important}
	form{width:57%; }
	
	.list{
	float: right;
	width: 70px;
 	height:40px;
   	background-color: #fff;
    color: #0193ff;
    border: 1px solid #0193ff;
    border-radius: 5px;
	}  
	  
	.list:hover{color: #0193ff;}
	
	#del{width: 300px;
 	height:40px;
    background-color: #fff;
    color: #FF8551;
    border: 1px solid #22668D;
    border-radius: 5px;
    }
   
    .btn_wrap{text-align:center;}
    
    .cel{width: 100px;
 	height:40px;
     background-color: #fff;
    color: red;
    border:1px solid red;
    border-radius: 5px;}
    
    .mo{width: 70px;
 	height:40px;
    background-color: #fff;
    color: #22668D;
    border: 1px solid #22668D;
    border-radius: 5px;}
	textarea{resize:none;}
	
	.unique-btn-secondary{
		border : 1px solid #22668D;
		background-color : white;
		width : 23%;
	}
</style>
<body>
      
<div class="container-fluid" >
 <form name="fm" action="updateUser.do" method="post">

    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">아이디</span>
      </div>
      <input type="text" class="form-control innm" name="id" value="${user.id}" >      
    </div>

   <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">이름</span>
      </div>
      <input type="text" class="form-control innm" name="name" value="${user.name}" >      
    </div>
   
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">전화번호</span>
      </div>
      <input type="text" class="form-control innm" name="phone" value="${user.phone}" >      
    </div>
   
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">Email</span>
      </div>
      <input type="text" class="form-control innm" name="email" value="${user.email}" >      
    </div>
   
   <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">종 구분</span>
      </div>
      <select class="form-control innm" name="type">
				<option disabled>종류 선택</option>
				<option value="" <c:if test="${user.type == ''}">selected</c:if>>없음</option>
				<option value="Dog" <c:if test="${user.type == 'Dog'}">selected</c:if>>강아지</option>
				<option value="Cat" <c:if test="${user.type == 'Cat'}">selected</c:if>>고양이</option>
			</select>      
    </div>
   
   <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">펫 이름</span>
      </div>
      <input type="text" class="form-control innm" name="pet_name" value="${user.pet_name}" >      
    </div>
   
   <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">펫 생일</span>
      </div>
      <input type="date" class="form-control innm" name="pet_birth" value="${user.pet_birth}" >      
    </div>
    
       <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">가입 일</span>
      </div>
      <input type="text" class="form-control innm" name="regdate" value="${user.regdate}" >      
    </div>
   
          <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">탈퇴 여부</span>
      </div>
      <input type="text" class="form-control innm" name="leave_status" value="${user.leave_status}" >      
    </div>
    
              <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">탈퇴 일</span>
      </div>
      <input type="text" class="form-control innm" name="leave_date" value="${user.leave_date}" disabled >      
    </div>
   
<div class="btn_wrap">

<button type="submit" class="mo" onclick="alert('수정 완료 되었습니다.');" ><b>수정</b></button>&nbsp;&nbsp;
<button type="button" class="cel"  data-toggle="modal" data-target="#deleteForm"><b>회원탈퇴</b></button>
<button type="button" class="list" onclick="location.href='userList.do'">목록</button>

                <div class="modal fade" id="deleteForm">
       <div class="modal-dialog modal-sm">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">회원탈퇴</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

       
                <!-- Modal body -->
                <div class="modal-body">
                    <div align="center">
                        탈퇴 후 복구가 불가능합니다. <br>
                        정말로 탈퇴 하시겠습니까? <br>
                    </div>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer" align="center">
                    <button type="button" class="btn btn-danger"
         onclick="delUser('${user.id}', 'delUser.do', '관리자는 회원탈퇴를 하실 수 없습니다.')">탈퇴하기</button>
                </div>
       
        </div>
    </div>
</div>
 
<!--  <button type="button" class="custom-btn unique-btn-danger" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button> -->

</div>
	</form> </div>


<!-- 기존 인풋태그들 -->


</body>
</html>