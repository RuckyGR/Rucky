<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../admin/a_header.jsp" %>
<style>
#searchNav{-webkit-justify-content: flex-end; justify-content: flex-end; }
.jumbotron1{
margin : 20px; 0

}
.container-fluid{
width : 70%;
margin : auto;
text-align : center;
display : block;
}
	.star-rating {
   font-size: 24px;
   color: orange;
}
.table thead th{
border-bottom: 2px solid #AFD7DB;
border-top: 2px solid #AFD7DB;
}
.tablebar{
border-top: 2px solid #AFD7DB;
}
.table th, .table td {
border : none;
}
.jumbotron {
text-align: center;
background-color: white;
margin: 0;
}
.theadbar {
font-weight : bold;
font-size : 13pt;
}
.repcon {
font-weight : bold;
}
.revcon{
font-weight : normal;
}
th,td{text-align : center!important; }

.pagination {
height: 50px;
margin: 0px;
padding: 10px 0px;
}

.page-link {
    color: #22668D;
    background-color: #fdfdfd;
    border: 1px solid #4692B8;
  }

  .page-link:hover {
    color: #22668D;
    background-color: #fbdfdf;
    border: 1px solid #4692B8;
  }
  
  .pagetr:hover{
	background-color : white !important;
}
 #modalBox {
        display: none;
        width: 100%;
        height: 100vh;
        background-color: rgba(0, 0, 0, 0.5);
        position: absolute;
        top: 0px;
        left: 0px;
        cursor: pointer;
        border-radius: 8px;
        border-color: #FF8551; 
    }

    #modalContent {
        width: 500px;
        height: 300px;
        background-color: #fff;
        border-radius: 8px;
        border: 2px solid #FF8551; 
        margin: 0 auto;
        margin-top: 100px; 
    }

    #modalContentText {
        padding: 20px;
        font-size: 20pt;
        overflow: scroll;
        height : 240px;
    }

    #modalClose {
        width: 100%;
        padding: 5px;
        background-color: #FF8551; 
        border-radius: 8px 8px 0 0;
        text-align: right;
        color: white;
        font-weight: bold;
        font-size: 16pt;
    }

    #modalClose:hover {
        background-color: #FF5006; 
    }
#cont{
text-align : center;
margin-right: 190px;
width : 100%;
}
.btn-show-rev {
    background-color: #007BFF;
    color: #fff;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
    border-radius: 5px;
}
.ope{
color : #22668D;
}
.hid{
color : #FF8551;
}
button.button_4 {
  border: 0;
  outline: none;
  width: 38px;
  height: 38px;
  border-radius: 100px;
  font-size: 8pt;
  font-weight: bold;
  margin: auto;
  box-shadow: 3px 3px 3px rgb(109, 109, 109), -3px -3px 3px rgb(237, 237, 237);
  transition: 0.3s;
  
}

button.button_4:hover {
  box-shadow: -3px -3px 3px rgb(172, 172, 172), 3px 3px 3px rgb(237, 237, 237);
  transition: 0.3s;
}
.repDel{
display : block;
height : 40px;
border-radius : 5px;
margin : 0 auto;
text-align : center;
background-color: #fff;
color: #22668D;
border: 1px solid #22668D;
}
.repDel:hover {
    background-color: #22668D; /* 호버 시 배경색 변경 */
    color: #fff; /* 호버 시 텍스트 색상 변경 */
}
.ttthhh{
vertical-align: middle;
}
</style>
<script src="../../resources/js/review.js"></script>
<script>
// 신고내용 가져오기
 function modalRep(content) {
        $("#cont").text("신고내용");
        $("#modalContentText").text(content);
        $("#modalBox").show();

        if ($("body").height() > $("#modalBox").height()) {
            $("body").css({
                "height": $("#modalBox").height() + "px"
            });
            $("#modalBox").css({
                "display": "flex",
                "align-items": "center",
                "justify-content": "center"
            });
        }
    }


$(function () {
    $("#modalClose").on("click", function () {
        $("#modalBox").hide();
        $("body").css({
            "height": "100%",
            "overflow": "none"
        });
    });
});

function modalRev(content) {
	$("#cont").text("리뷰내용");
    $("#modalContentText").text(content);
    $("#modalBox").show();

    if ($("body").height() > $("#modalBox").height()) {
        $("body").css({
            "height": $("#modalBox").height() + "px"
        });
        $("#modalBox").css({
            "display": "flex",
            "align-items": "center",
            "justify-content": "center"
        });
    }
}

$(function () {
    $("#modalClose").on("click", function () {
        $("#modalBox").hide();
        $("body").css({
            "height": "100%",
            "overflow": "none"
        });
    });
});
$(function () {
    $(".btn-show-rev").on("click", function () {
        let con = $(this).closest("tr").find(".revContd").text();
        modalRep(con);
    });
});

function aa (type){
	console.log(type);
}

function repDelFnc(delno){
    if (confirm('삭제하시면 복구할 수 없습니다. \n 정말로 삭제하시겠습니까?')) {
        alert("삭제되었습니다.");
        location.href='/deleteReport.rev?rep_seq='+delno;
    } else {
    	alert('취소되었습니다.');
        return false;
    }
}


</script>
<body>
<div class="jumbotron1">
   <h1>신고접수 관리</h1>
</div>


<div class="container-fluid">
  <table class="table table-hover">
    <thead class="theadbar">
      <tr>
         <th>신고번호<br>(신고내용)</th>
        <th>리뷰번호<br>(리뷰내용)</th>
        <th>구매자<br>(신고내용)</th>
        <th class="repth" style="vertical-align: middle;">신고처리<br></th>
        <th style="display: none;" class="ttthhh">리뷰내용</th>
        <th>신고삭제</th>
      </tr>
    </thead>
    <tbody>
<c:forEach items="${declarationList}" var="report">
	<tr>
        <td style="cursor: pointer;" class="repcon" onclick="modalRep('${report.rep_content}')">${report.rep_seq}</td>
        <td style="cursor: pointer;" class="revcon" onclick="modalRev('${report.rev_content}')">${report.rev_seq}</td>	
        <td style="cursor: pointer;" class="repcon" onclick="modalRep('${report.rep_content}')">${report.rev_writer}</td>
		<td class="rephid">
        <form action="updateHide.rev?rev_seq=${report.rev_seq}" method="post">
        <% System.out.println(); %>
        <c:choose>
    <c:when test="${report.rep_hide eq 'Y'}">
        <input type="radio" name="rep_hide" id="hide${report.rep_hide}_on" value="Y" class="radio" checked="checked" /><span class="ope">공개</span>&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" name="rep_hide" id="hide${report.rep_hide}_off" value="N" class="radio" /><span class="hid">비공개</span>&nbsp;
    </c:when>
    <c:otherwise>
        <input type="radio" name="rep_hide" id="hide${report.rep_hide}_on" value="Y" class="radio" /><span class="ope">공개</span>&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" name="rep_hide" id="hide${report.rep_hide}_off" value="N" class="radio" checked="checked" /><span class="hid">비공개</span>&nbsp;
    </c:otherwise>
</c:choose>
   		<button type="submit" class="button_4">적용</button>
   		</form>
        </td>
        <td class="revContd" style="display: none;">${report.rev_content}</td>
        
		<td class="DelBtn">
        <button type="button" class="repDel" onclick="repDelFnc(${report.rep_seq})">삭제</button>
        </td>
    </tr>	
</c:forEach>

  
<tr class="pagetr">
<td colspan="5" style="text-align:center">
 <ul class="pagination justify-content-center">
            
                <c:if test="${paging.startPage != 1 }">
                    <li class="page-item">
                        <a class="page-link" href="a_declarationList.rev?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">Previous</a>
                    </li>
                </c:if>

                
		        <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                    <c:choose>
                        <c:when test="${p == paging.nowPage }">
					        <li class="page-item"><b class="page-link">${p }</b></li>
				        </c:when>
                        <c:when test="${p != paging.nowPage }">
                            <li class="page-item"><a class="page-link" href="a_declarationList.rev?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
                        </c:when>
                    </c:choose>
                </c:forEach>

                <c:if test="${paging.endPage != paging.lastPage}">
                    <li class="page-item">
                        <a class="page-link" href="a_declarationList.rev?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">Next</a>
                    </li>
                </c:if>
        </ul>
</td>
</tr>
    </tbody>
  </table><br>

</div>
<div id="modalBox" style="display: none;">
    <div id="modalContent">
        <div id="modalClose"><span id="cont"></span>X</div>
        
        <div id="modalContentText"></div>
    </div>
</div>

</body>
</html>
