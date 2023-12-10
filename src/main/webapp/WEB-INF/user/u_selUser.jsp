<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.container-fluid {
	margin-top: 20px;
}

.custom-form-group {
	margin-bottom: 15px;
}

.custom-form-label {
	font-weight: bold;
	display: block;
	margin-bottom: 5px;
}

.custom-form-control {
	width: 100%;
	padding: 8px;
	box-sizing: border-box;
	border: 1px solid #9BCDD2;
}

.custom-btn {
	padding: 10px;
	box-sizing: border-box;
	cursor: pointer;
	margin-right: 10px;
}

.unique-footer {
	margin-top: 15px;
}

.unique-btn-primary {
	border: 1px solid #22668D;
	background-color: #fff;
	color: #22668D;
}

.unique-btn-primary:hover {
	background-color: #22668D; /* 호버 시 배경색 변경 */
	color: #fff; /* 호버 시 텍스트 색상 변경 */
}

.unique-btn-danger {
	background-color: #DC3545;
	border: 1px solid #DC3545;
	color: white;
}

.unique-btn-secondary {
	/*             width: 100%; */
	padding: 8px;
	box-sizing: border-box;
	border: 1px solid #9BCDD2;
}

.unique-btn-secondary:hover {
	background-color: #6C757D;
	border: 1px solid #6C757D;
	color: white;
}
</style>

<body>
	<%@ include file="u_myPage_menu.jsp"%>

	<form name="fm" action="updateUser.do" method="post">

		<div class="custom-form-group">
			<div class="custom-form-label">아이디</div>
			<input type="text" class="custom-form-control" id="id" name="id"
				value="${user.id}" readonly>
		</div>

		<div class="custom-form-group">
			<div class="custom-form-label">비밀번호</div>
			<button type="button" class="custom-btn unique-btn-secondary"
				onclick="location.href='goChgPw.do?id=${user.id}'">비밀번호 변경</button>
		</div>

		<div class="custom-form-group">
			<div class="custom-form-label">이름</div>
			<input type="text" class="custom-form-control" name="name"
				value="${user.name}">
		</div>

		<div class="custom-form-group">
			<div class="custom-form-label">전화번호</div>
			<input type="text" class="custom-form-control" name="phone"
				value="${user.phone}">
		</div>

		<div class="custom-form-group">
			<div class="custom-form-label">Email</div>
			<input type="text" class="custom-form-control" name="email"
				value="${user.email}">
		</div>

		<div class="custom-form-group">
			<div class="custom-form-label">종류 구분</div>
			<select class="custom-form-control" name="type">
				<option disabled>종류 선택</option>
				<option value="" <c:if test="${user.type == ''}">selected</c:if>>없음</option>
				<option value="Dog" <c:if test="${user.type == 'Dog'}">selected</c:if>>강아지</option>
				<option value="Cat" <c:if test="${user.type == 'Cat'}">selected</c:if>>고양이</option>
			</select>
		</div>

		<div class="custom-form-group">
			<div class="custom-form-label">펫 이름</div>
			<input type="text" class="custom-form-control" name="pet_name"
				value="${user.pet_name}">
		</div>

		<div class="custom-form-group">
			<div class="custom-form-label">펫 생일</div>
			<input type="date" class="custom-form-control" name="pet_birth"
				value="${user.pet_birth}">
		</div>

		<div class="unique-footer">
			<button type="submit" class="custom-btn unique-btn-primary" onclick="alert('수정 완료 되었습니다.');">정보수정</button>
			<%--                 <button type="button" class="custom-btn unique-btn-danger" onclick="delUser('${user.id}', 'delUser.do', '관리자는 회원탈퇴를 하실 수 없습니다.')">회원탈퇴</button> --%>
			<button type="button" class="custom-btn unique-btn-danger"
				data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
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
								탈퇴 후 복구가 불가능합니다. <br> 정말로 탈퇴 하시겠습니까? <br>
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

			<button type="button" class="custom-btn unique-btn-secondary"
				onclick="javascript:location.href='dogcat_main.jsp';">홈으로</button>
		</div>

	</form>

	</div>
	</div>
	<%@ include file = "/dogcat_footer.jsp" %>

</body>
</html>