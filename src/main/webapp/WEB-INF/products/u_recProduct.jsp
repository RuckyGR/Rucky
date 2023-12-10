<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOGCATPUNCH : 주문서 작성</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js"></script>
<style>
.recimg {
	display: flex;
	flex-direction: column;
	border: 1px solid black;
}

.recimg:hover{
	cursor : pointer;
}
.recimgdiv {
	width: 100px;
	position: fixed;
	top: 388px;
	right: 350px;
	z-index: 99999;
	border : 1px solid #FF8551;
}

.removeBtn {
	background-color : white;
	border : none;
	text-align : center;
	width : 100%;
	background-color : #22668D;
	color : white;
}

@media ( max-width :391px) {
	.recimgdiv {
		display: none;
	}
	.removeBtn{
		display : none;
	}
}
</style>
</head>
<body>
		<c:if test="${ not empty cookieMap.cookieList }">
	<div class="recimgdiv">
			<c:forEach items="${cookieMap.cookieList }" var="recpro">
				<a href="#" onclick="getPro('${recpro.pro_no}', '${recpro.pro_name}')"> <img id="recImg" class="recimg"
					src="${pageContext.request.contextPath}/resources/img/productImg/${recpro.pro_filename}"
					style="width: 100%;">
				</a>
			</c:forEach>
				<button class="removeBtn" onclick="removePro('${cookieList.pro_no}')">비우기</button>
	</div>
		</c:if>
	<script>
	function removePro(proNo) {
        var confirmation = confirm("정말로 비우시겠습니까?");
        if (confirmation) {
            $.ajax({
                type: "POST",
                url: "/removeProduct",
                data: { proNo: proNo },
                success: function (response) {
                    location.reload();
                },
                error: function (error) {
                    console.error("Error while removing product: " + error);
                }
            });
        }
    }
</script>
</body>
</html>