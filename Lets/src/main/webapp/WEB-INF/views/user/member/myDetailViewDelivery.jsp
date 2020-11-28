<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lets</title>
<link rel="stylesheet" href="resources/user/assets/css/member.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<jsp:include page="../common/navBar.jsp" />
	<jsp:include page="memberModal.jsp" />
	<main>
        <br><br>
        <div class="wrapper">
            <div class="myPage-menubar">
                <div class="myPage-menu1">
                    <div class="user-pic">
                    	<c:choose>
                    		<c:when test="${loginUser.memPic eq null}">
                    			<c:if test="${loginUser.gender eq 'F'}">
                    				<img src="resources/user/assets/img/member/woman.png" width="130px" height="130px">
                    			</c:if>
                    			<c:if test="${loginUser.gender eq 'M'}">
                    				<img src="resources/user/assets/img/member/man.png" width="130px" height="130px">
                    			</c:if>
                    		</c:when>
                    		<c:otherwise>
                    			 <img src="" width="130px" height="130px">
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                    <div class="user-nickname">${loginUser.nickname}</div>
                    <div class="user-info-update">
                        <a data-toggle="modal" data-target="#info-Update-Modal">정보 수정하기</a>
                    </div>
                    <div class="menu-list">
                        <img class="my-classes" onclick="myPageIndex(1);" src="resources/user/assets/img/member/classes.png">
                        <img class="my-wishlist" onclick="myPageIndex(2);" src="resources/user/assets/img/member/like.png">
                        <img class="my-order" onclick="myPageIndex(3);" src="resources/user/assets/img/member/delivery.png">
                    </div>
                    <div class="menu-list-info">
                        <div style="margin-right: 40px;">수강중</div>
                        <div style="margin-right: 22px;">좋아요 목록</div>
                        <div>주문 및 배송</div>
                    </div>
                </div>

               <!-- 할인 클래스 -->
                <div class="myPage-menu2">
                    <div>
                        <img src="assets/img/gallery/popular_sub2.png" alt="">
                    </div>
                    <div id="discount-time">할인 종료 까지 5일 남앗습니다.</div>
                    <div class="discount-info">
                        <div class="discount-category">카테고리</div>
                        <div class="discount-category">튜터 아이디</div>
                    </div>
                    <br>
                    <div class="discount-title">클래스 타이틀 (전인 아니더면, 꽃 보내는 천지는 사람은 끓는 기관과 약동하다. 눈에 대고)</div>
                </div>
          </div>
          <script>
				function myPageIndex(num){
					if(num==1){
						location.href="myPage.me";
					}else if(num==2){
						location.href="myWishList.me";
					}else if(num==3){
						location.href="myDeliveryList.me";
					}
				}
		  </script>
		  <div class="myPage-content">
                <div class="my-cont-title">주문 및 배송 / 주문 상세</div>
                <br><br>
                <div class="my-cont">
                    <!-- 주문 상세 내역-->
                    <div class="my-cont-3">
                        <div class="my-cont3-detail1">
                            <div class="my-cont3-detail1-title">${mp.paymentDate} &nbsp;&nbsp; 주문 상세 내역</div>
                            <c:if test="${mp.status eq '결제 취소'}">
                            	<div class="my-cont3-detail1-title2">결제 취소</div>
                       	    </c:if>
                       	  	<c:if test="${mp.status ne '결제 취소'}">
                            	<div class="my-cont3-detail1-title2">${mp.delStatus}</div>
                       	  	</c:if>
                        </div>
                        <hr>
                        
                        <div class="my-cont3-detail2">
                            <div class="my-cont3-detail2-title2">[ ${mp.lessonTitle} ]</div><br>
                            <div class="my-cont3-detail2-pay-status">${mp.status}</div>
                            <div class="my-cont3-detail2-cont1">결제 수단 <br>결제 완료일</div>
                            <div class="my-cont3-detail2-cont2">${mp.type} <br> ${mp.paymentDate}</div>
                        </div>
                        <br><br><hr>

                        <div class="my-cont3-detail3">
                            <div class="my-cont3-detail3-cont1">총 금액 <br> 할인 금액</div>
                            <div class="my-cont3-detail3-cont2">${mp.payTotal} 원 <br>${mp.discountPrice} 원</div>
                        </div>
                        <br><br><hr>

                        <div class="my-cont3-detail3">
                            <div class="my-cont3-detail3-cont1">총 결제 금액</div>
                            <div class="my-cont3-detail3-cont2" style="color: rgb(46, 48, 146); font-weight: bolder;">${mp.totalAmount} 원</div>
                        </div>
                        <br><br><hr>

                        <div class="my-cont3-detail2">
                            <div class="my-cont3-detail2-title">배송 정보</div>
                            <div class="my-cont3-detail2-cont1">
                                 	받는 분<br>연락처<br>배송주소<br>운송장 번호<br>택배사
                            </div>
                            <div class="my-cont3-detail2-cont2">
                                	${mp.memName}<br>${mp.phone} <br>
                                	${mp.postAddress} ${mp.detailAddress} ${mp.extraAddress} <br>
                                	${mp.delNo} <br>${mp.delName}
                            </div>
                        </div>
                        <br><br><br><br><br><br><hr>   
                    
                        <div class="my-cont3-detail2">
                            <div class="my-cont3-detail2-title">구매 물품</div>
                            <div class="my-cont3-detail2-cont1">준비물</div>
                            <c:choose>
                            	<c:when test="${!empty mp.lessonPrepare}">
                            		<div class="my-cont3-detail2-cont2">${mp.lessonPrepare}</div>
                            	</c:when>
                            	<c:otherwise>
                            		<div class="my-cont3-detail2-cont2">해당 클래스에는 준비물이 없습니다.</div>
                            	</c:otherwise>
                            </c:choose>
                            
                        </div>
                        <br><br>
                    </div>
                </div>
                <br>
                <div class="genric-btn primary radius" onclick="DeliveryList();" style="float: right;">목록으로</div>
            </div>
            <div style="clear:both"></div>
            <br><br><br><br><br>
        </div>
        <script>
        	function DeliveryList(){
        		location.href="myDeliveryList.me";
        	}
        </script>
        
	</main>
  	<jsp:include page="../common/footer.jsp" />
</body>
</html>