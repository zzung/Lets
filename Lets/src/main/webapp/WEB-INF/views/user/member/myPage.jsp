<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/user/assets/css/style.css">
<link rel="stylesheet" href="resources/user/assets/css/member.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<jsp:include page="../common/navBar.jsp" />

	<!-- 마이 페이지-->
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
						location.href="";
					}else if(num==2){
						location.href="";
					}else if(num==3){
						location.href="";
					}
				}
			</script>
            
               
            <div class="myPage-content">
                <div class="my-cont-title">현재 수강중인 클래스</div>
                <br><br>
                <div class="my-cont">

                    <!-- 없을 경우 
                    <div class="my-cont-1">
                        <br><br><br><br><br><br><br>
                        	아직 수강중인 클래스가 없어요.
                    </div>
                    -->
                    
					<!-- 수강중인 클래스 목록 띄우기(온라인) -->
                    <div class="my-cont-2">
                        <div class="class-type">
                            <!--Nav Button  -->                                            
                            <nav>                                                                             
                                <div class="nav nav_tabs" role="tablist">
                                    <a class="nav_item nav_link active" data-toggle="tab" href="#nav-online" role="tab">온라인</a>
                                    <a class="nav_item nav_link" data-toggle="tab" href="#nav-offline" role="tab">오프라인</a>
                                </div>
                            </nav>
                            <!--End Nav Button  -->
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="nav-online" role="tabpanel">
                                <div class="online-list">
                                    <div class="online-thumbnail" style="width:33.3%;">
                                        <img src="assets/img/gallery/popular_sub3.png" alt="">
                                    </div>
                                    <div class="online-thumbnail"style="width:50%; margin-top:30px;">
                                        <p style="color:grey;">2020.11.14까지 수강 완료</p>
                                        <p style="font-weight:bold; font-size:16px;">커피 빵이 몽글몽글(클래스 제목)</p>
                                        <p>커피 부르잉이 만드드느</p>
                                        <div class="w3-light-grey">
                                            <div class="w3-container w3-indigo" style="width:35%">35%</div>
                                        </div>
                                    </div>
                                    <div class="online-thumbnail" style="width:16.7%;">
                                        <button class="genric-btn primary-border">play</button>
                                    </div>
                                </div>
                                <div class="online-list">
                                    <div class="online-thumbnail" style="width:33.3%;">
                                        <img src="assets/img/gallery/popular_sub3.png" alt="">
                                    </div>
                                    <div class="online-thumbnail"style="width:50%; margin-top:30px;">
                                        <p style="color:grey;">2020.11.14까지 수강 완료</p>
                                        <p style="font-weight:bold; font-size:16px;">커피 빵이 몽글몽글(클래스 제목)</p>
                                        <p>커피 부르잉이 만드드느</p>
                                        <div class="w3-light-grey">
                                            <div class="w3-container w3-indigo" style="width:35%">35%</div>
                                        </div>
                                    </div>
                                    <div class="online-thumbnail" style="width:16.7%;">
                                        <button class="genric-btn primary-border">play</button>
                                    </div>
                                </div>
                            </div>
                            <!--two-->
                            <div class="tab-pane fade" id="nav-offline" role="tabpanel">
                                <div class="online-list">
                                    <div class="online-thumbnail" style="width:33.3%;">
                                        <img src="assets/img/gallery/popular_sub2.png" alt="">
                                    </div>
                                    <div class="online-thumbnail"style="width:50%; margin-top:30px;">
                                        <p style="color:grey;">2020.11.14까지 수강 완료</p>
                                        <p style="font-weight:bold; font-size:16px;">커피 빵이 몽글몽글(클래스 제목)</p>
                                        <p>커피 부르잉이 만드드느</p>
                                        <div class="w3-light-grey">
                                            <div class="w3-container w3-indigo" style="width:35%">35%</div>
                                        </div>
                                    </div>
                                    <div class="online-thumbnail" style="width:16.7%;">
                                        <button class="genric-btn primary-border">play</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
					
                    
				</div>
			</div>
			
            <div style="clear:both"></div>
            <br><br><br><br><br>
        </div>
        <div style="clear:both"></div>
	</main>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>