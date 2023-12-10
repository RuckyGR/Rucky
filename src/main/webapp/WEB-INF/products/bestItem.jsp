<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@media (max-width:391px){
        .wekul {
            list-style: none;
            padding: 0;
            overflow-x: auto;
            white-space: nowrap;
        }
        .wekli {
            display: inline-block;
            margin-left: 10px;
        }
        ::-webkit-scrollbar {
            display: none;
        }
        
        }
    </style>
    <script>
        $(document).ready(function(){
            $('.wekul').slick({
                slidesToShow: 2,
                slidesToScroll: 1,
                infinite: true,
                dots: true
            });
        });
    </script>
</head>
<body>

		<ul class="wekul">
	<c:forEach items="${product }" var="pro">
			<li class="wekli"><a href="#" onclick="getPro('${pro.pro_no}', '${pro.pro_name}');" id="include-img">
			<img class="imgli" src="${pageContext.request.contextPath}/resources/img/productImg/${pro.pro_filename}">
			</a></li>
	</c:forEach>
		</ul>

</body>
</html>