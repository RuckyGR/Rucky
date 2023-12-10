<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
    <title>Reservation Status - DogCatDelLuna</title>
    <%@ include file="../user/u_myPage_menu.jsp"%>
    <style>
        .container-fluid {
            width: 100%;
            margin: 30px auto;
            text-align: center;
            display: block;
        }

        .reservationStatusContainer {
            max-width: 100%;
            margin: 20px auto;
            padding: 15px;
            border: 1px solid #FF8551;
            border-radius: 8px;
        }

        .reservationStatusHeaderContainer {
            padding: 10px;
            border-top: 2px solid #AFD7DB;
            border-bottom: 2px solid #AFD7DB;
            text-align: center;
        }

        .reservationStatusTable {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .reservationStatusTable th, .reservationStatusTable td {
            border: 1px solid #FF8551;
            text-align: center;
            padding-top : 8px;
            padding-bottom : 8px;
        }

		.reservationNoteContainer {
            margin: 20px auto 100px auto;
            padding: 15px;
            border: 1px solid #FF8551;
            border-radius: 8px;
            background-color: #FDF5E6;
            max-width : 100%;
        }
        h2 {
            color: #FF8551;
        }
        .custom-btn:active{
        	outline:none;
        	border:none;
        }
        
        .custom-btn:focus {
        	outline:none;
        }
        .resDisNone {
        display: none;
        }
        .res★2 {
        display: none;
        }
        
        /* 모달 창 스타일 */
.modal-content {
    border: 1px solid #FF8551;
    border-radius: 8px;
}

.modal-header {
    background-color: #FF8551;
    color: white;
    border-bottom: 2px solid #AFD7DB;
}

.modal-body {
    padding: 20px;
}

/* 모달 닫기 버튼 스타일 */
.close {
    color: white;
}

/* [조회] 버튼 스타일 */
.custom-btn.unique-btn-danger {
    border: 1px solid #FF8551;
    background-color: #FF8551;
    color: white;
    padding: 5px 10px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.custom-btn.unique-btn-danger:hover {
    background-color: #FF6347;
}

/* 모달 배경 스타일 */
.modal-backdrop {
    background-color: #000;
    opacity: 0.5;
}
        
         @media only screen and (max-width: 390px) {
            .container-fluid {
                margin: 10px auto;
                padding : 0 5px!important;
            }

            .reservationStatusContainer {
                padding: 10px;
            }

            .reservationStatusTable th, .reservationStatusTable td {
                  font-size: 10px; /* 원하는 폰트 크기로 조절 */
                padding-top: 6px; /* 상단 여백 조절 */
                padding-bottom: 6px; /* 하단 여백 조절 */
            }
            

            .reservationNoteContainer {
               margin: 10px auto 50px auto;
                padding: 10px;
                font-size: 12px; /* 작은 화면에 맞게 폰트 크기 조절 */
            }
            .custom-btn{
            padding : 1px!important;
            }
            .resNone {
            display: none;
            }
            .resDisNone {
            display: grid;
            }
            .res★1 {
            display: none;
            }
            .res★2 {
            display: grid;
            }
        }
    </style>
</head>
<body>

    <div class="container-fluid">
        <h2 class="res★1">★ DogCatDelLuna Reservation Status ★</h2>
        <h2 class="res★2">DogCatDelLuna Reservation Status</h2>

        <div class="reservationStatusContainer">
            <div class="reservationStatusHeaderContainer">
                <span class="sp">예약 현황</span>
            </div>
			<div class="res_tbl_wrap">
            <table class="reservationStatusTable">
                <thead>
                    <tr class="proTr tableThTr">
                        <th>예약번호</th>
                        <th>성함</th>
                        <th class="resNone">번호</th>
                        <th>체크인</th>
                        <th>체크아웃</th>
<!--                         <th>애견크기</th> -->
<!--                         <th>애견이름</th> -->
                        <th class="resNone">미용여부</th>
<!--                         <th>특별요청</th> -->
                        <th class="resNone">가격</th>
                        <th>예약현황</th>
                        <th>상세정보</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="reservation" items="${reservationList}">
                        <tr>
                            <td>${reservation.reserve_no}</td>
                            <td>${reservation.name}</td>
                            <td class="resNone">${reservation.phone}</td>
                            <td>${reservation.checkInDate}</td>
                            <td>${reservation.checkOutDate}</td>
                          
                            <td class="resNone"><c:choose>
                                    <c:when test="${reservation.beautyDog == 'Y'}">
                                        O
                                    </c:when>
                                    <c:otherwise>
                                        X
                                    </c:otherwise>
                                </c:choose></td>
<%--                             <td>${reservation.request}</td> --%>
                            <td class="resNone">${reservation.totalPrice}</td>
                            <td><c:choose>
                                    <c:when test="${reservation.reserve_YN == 'W'}">
                                        예약대기
                                    </c:when>
                                    <c:when test="${reservation.reserve_YN == 'Y' }">
                                    	예약완료
                                    </c:when>                                 
                                    <c:otherwise>
                                    	예약거절
                                    </c:otherwise>
                                </c:choose></td>
                                <td><button type="button" class="custom-btn unique-btn-danger" data-toggle="modal" data-target="#detailForm${reservation.reserve_no}" style="border:none; background-color: white; color:#FF8551;">[조회]</button>
                                <div class="modal fade" id="detailForm${reservation.reserve_no}">
       							<div class="modal-dialog modal-sm">
        						<div class="modal-content">

					            <!-- Modal Header -->
					            <div class="modal-header">
					                <h4 class="modal-title">상세정보</h4>
					                <button type="button" class="close" data-dismiss="modal">&times;</button>
					            </div>

       
				                <!-- Modal body -->
				                <div class="modal-body">
				                    <div align="center">
				                    <div class="resDisNone">핸드폰 번호 : ${reservation.phone} <br></div>
				                    <div class="resDisNone">미용 여부 : <c:choose>
                                    <c:when test="${reservation.beautyDog == 'Y'}">
                                        O
                                    </c:when>
                                    <c:otherwise>
                                        X
                                    </c:otherwise>
                                </c:choose> <br> </div>
				                    <div class="resDisNone">가격 : ${reservation.totalPrice}원 <br></div>
				                        크기 : <c:choose> 
                                    <c:when test="${reservation.roomtype == 'small'}">
                                        	소형견
                                     </c:when>
                                     <c:when test="${reservation.roomtype == 'medium' }">
                                    	중형견
                                     </c:when>
                                    <c:otherwise>
                                    	대형견
                                     </c:otherwise>
                                 </c:choose> <br>
                                 애견이름 : ${reservation.petName}
				                         <br><br>
				                         특별요청 : ${reservation.request}
				                    </div>
				                </div>
       
        </div>
    </div>
</div></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            </div>
        </div>
        <p class="reservationNoteContainer">
        	계좌번호 : 카카오뱅크 3333-02-2646687 &nbsp;&nbsp;&nbsp;예금주 : 홍기락 &nbsp;&nbsp;&nbsp;예약금 10,000원 입금 주시면 예약 승인됩니다.<br>
잔여금액 결제는 현장에서 진행해 주시면 됩니다. 예약을 변경하시려면 호텔 측으로 연락 바랍니다.<br>
당일 취소/노쇼 시 예약금 환불 불가능합니다.<br>
연락처 : 010-9556-6594, 이메일 : dogcatpunch@naver.com
        </p>
    </div>
</div>
    <%@ include file="/dogcat_footer.jsp" %>
</body>
</html>
