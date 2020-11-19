<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/user/assets/css/style.css">
<link rel="stylesheet" href="resources/user/assets/css/reviewDetailPage.css">
<script src="resources/user/assets/js/vendor/jquery-1.12.4.min.js"></script>
</head>
<body>

	<jsp:include page="../common/navBar.jsp" />
   
	<main>

      <!--================Blog Area =================-->
      <section class="blog_area single-post-area review-padding">
         <div class="container">
            <div class="row">
               <div class="col-lg-8">
                  <!--?댓글area-->
                  <div class="review-area">
                    <div class="review-header">
                        <div id="review-count">
                            <h2>후기 10</h2>
                        </div>
                        <div id="review-writeBtn" align="right">
                          <button type="button" class="genric-btn primary-border" onclick="writeReview();">리뷰작성</button>
                        </div>
                    </div>
                    <!-- 조건문 줘야함  수강하지 않을경우 -->
                    <script>
                        function writeReview(){
                            alert('수강 후 리뷰 작성 가능합니다.');
                        }
                    </script>
                    <!--?리뷰 작성하기 클릭시 보여지게 할 창-->
                    <br><br>
                    <div class="mt-10">
                        <textarea class="review-textarea" placeholder="Message" onfocus="this.placeholder = ''"
                        onblur="this.placeholder = 'Message'" required></textarea>
                    </div>
                    <div class="review-writeArea">
                        <div id="review-writeRatting">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <div id="submitReview" align="right"><button class="genric-btn1 primary-border extrasmall">등록</button></div>
                    </div>
                    <!--end of 리뷰 작성하기-->
                    <br><br><br>
	                     <div class="comment-list">
	                        <div class="single-comment justify-content-between d-flex">
	                           <div class="user justify-content-between d-flex">
                    			<c:forEach var="review" items="${list }"> 
	                              <div class="thumb">
	                                 <img src="${review.memPic }" alt="">
	                              </div>
	                              <div class="desc">
	                                 <p class="comment">
	                                    ${review.reviewContent }
	                                 </p>	
	                                 <div class="d-flex justify-content-between">
	                                    <div class="d-flex align-items-center">
	                                       <span>${review.nickName }</span>
	                                       <p class="date">${review.enrollDate } </p>
	                                    </div>
	                                    <div class="review-ratting">
	                                        <i class="fas fa-star"></i>
	                                        <i class="fas fa-star"></i>
	                                        <i class="fas fa-star"></i>
	                                        <i class="fas fa-star"></i>
	                                        <i class="fas fa-star"></i>
	                                    </div>
	                                    <div class="reply-btn">
	                                        <div class="communityBtn"><a href="#" class="btn-reply text-uppercase" onclick="reply();">답장</a></div>
	                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase" onclick="editReply();">수정</a></div>
	                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase" data-toggle="modal" data-target="#deleteModal">삭제</a></div>
	                                    </div>
	                                 </div>
	                              </div>
                     			</c:forEach>
	                           </div>
	                        </div>
	                     </div>
                  </div>
                  <!--? end 리뷰 area-->
            </div>
         </div>
      </section>
      <!--================ Blog Area end =================-->
	<!--후기 글 삭제-->
	<form action="deleteReview.rev">
	        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	        <div class="modal-content">
	            <div class="modal-content" align="center">
	                <!-- Modal body -->
	                <div class="modal-body">
	                    <p>삭제 하시겠습니까?</p>
	                    <button type="button" class="genric-btn primary small" data-dismiss="modal">취소</button>
	                    <button type="button" class="genric-btn primary small">삭제</button>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	</form>
   </main>
   
   <jsp:include page="../common/footer.jsp" />
</body>
</html>