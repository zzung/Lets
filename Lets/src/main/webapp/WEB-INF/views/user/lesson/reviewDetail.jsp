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
	<!-- 신고하기 모달 -->
	<script>
		//기타 사유 클릭시 보여질 모달 창 
        $(function(){
           $('#report-etc').on('change', function(){
               if($(this).is(':checked')){
                   $('#etcReportModal').modal();
               }
           }); 
       });

		// 기타 사유 작성후 신고 모달 화면에서 작성한 글 보이게끔 
       function getReason(){
        var reason = $("#reportReasonArea").val();

        $("#report-etc").val(reason);
        $("#reportReason").text(reason);
       }
   </script>
   <!-- end of 신고하기  -->
   
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
                              <div class="thumb">
                                 <img src="resources/user/assets/img/comment/cat1.jpg" alt="">
                              </div>
                              <div class="desc">
                                 <p class="comment">
                                    Multiply sea night grass fourth day sea lesser rule open subdue female fill which them
                                    Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser
                                 </p>
                                 <div class="d-flex justify-content-between">
                                    <div class="d-flex align-items-center">
                                       <span>Emilly Blunt</span>
                                       <p class="date">December 4, 2017 at 3:12 pm </p>
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
                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase" data-toggle="modal" data-target="#reportModal">신고</a></div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="comment-list">
                        <div class="single-comment justify-content-between d-flex">
                           <div class="user justify-content-between d-flex">
                              <div class="thumb">
                                 <img src="resources/user/assets/img/comment/comment_2.png" alt="">
                              </div>
                              <div class="desc">
                                 <p class="comment">
                                    Multiply sea night grass fourth day sea lesser rule open subdue female fill which them
                                    Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser
                                 </p>
                                 <div class="d-flex justify-content-between">
                                    <div class="d-flex align-items-center">
                                       <span>Emilly Blunt</span>
                                       <p class="date">December 4, 2017 at 3:12 pm </p>
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
                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase" data-toggle="modal" data-target="#reportModal">신고</a></div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="comment-list">
                        <div class="single-comment justify-content-between d-flex">
                           <div class="user justify-content-between d-flex">
                              <div class="thumb">
                                 <img src="resources/user/assets/img/comment/comment_3.png" alt="">
                              </div>
                              <div class="desc">
                                 <p class="comment">
                                    Multiply sea night grass fourth day sea lesser rule open subdue female fill which them
                                    Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser
                                 </p>
                                 <div class="d-flex justify-content-between">
                                    <div class="d-flex align-items-center">
                                       <span>Emilly Blunt</span>
                                       <p class="date">December 4, 2017 at 3:12 pm </p>
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
                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase" data-toggle="modal" data-target="#reportModal">신고</a></div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <!--? end 리뷰 area-->
            </div>
         </div>
      </section>
      <!--================ Blog Area end =================-->
       <!--신고 모달-->
      <div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-content">
                    <!-- Modal body -->
                    <div class="modal-body" align="center">
                            <table>
                                <tr> <td style="background: gray;" id="reportWriter"></td></tr>
                                <tr><td style="background: gray;" id="reportContentTitle">제목 : </td></tr>
                                <tr> 
                                <tr>
                                    <td style="border-bottom:1px solid grey;padding:5px;">
                                        <br>
                                        <label for="report-ad" style="width: 90%;">광고</label>
                                        <input type="radio" name="reportType" id="report-ad" value="부적절한 게시물">
                                        <label for="report-ad"></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-bottom:1px solid grey; padding:5px;">
                                        <label for="report-insult" style="width: 90%;">욕설</label>
                                        <input type="radio" name="reportType" id="report-insult" value="음란 또는 청소년에게 부적합한 내용">
                                        <label for="report-insult"></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-bottom:1px solid grey;padding:5px;">
                                        <label for="report-obscence" style="width: 90%;">음란 또는 청소년에게 부적합한 내용</label>
                                        <input type="radio" name="reportType" id="report-obscence" value="음란 또는 청소년에게 부적합한 내용">
                                        <label for="report-obscence"></label>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td style="border-bottom:1px solid grey;padding:5px;">
                                        <label for="report-etc" style="width: 90%;">기타</label>
                                        <input type="radio" name="reportType" id="report-etc" value="">
                                        <label for="report-etc"></label>
                                        <div id="reportReason"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th style="padding:5px;">신고하기전에 잠깐?</th>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="color: gray;">게시물로 인해 개인(단체)이 명예훼손 피해를 입었거나 저작권을 침해 당한
                                            경우에는 게시중단 서비스를 통해 신고해 주시기 바랍니다.</div>
                                    </td>
                                </tr>
                            </table>
                            <br>
                        <input id="reportReplyNo" type="hidden" name="no" value="">
                        <input id="reportedMemNo" type="hidden" name="no" value="">
                        <button type="button" class="genric-btn primary small" data-dismiss="modal">취소</button>
                        <button type="submit" class="genric-btn primary small" data-dismiss="modal" onclick="reportRequest()">신고하기</button>

                    </div>
                </div>
            </div>
        </div>
    </div>
     <!--end of reportModal--> 
    <!-- 신고 기타 사유 작성 모달 -->
    <div class="modal fade" id="etcReportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-content">
                <!-- Modal body -->
                <div class="modal-body" align="center">
                    
                    <table>
                        <tr>
                            <td style="border-bottom:1px solid grey;padding:5px;">기타사유</td>
                        </tr>
                        <tr>
                            <td><textarea id="reportReasonArea" cols="50" rows="4" style="resize: none;"></textarea></td>
                        </tr>
                    </table>

                    <button type="button" class="genric-btn primary-border small" data-dismiss="modal">취소</button>
                    <button type="button" class="genric-btn primary-border small" data-dismiss="modal" onclick="getReason();">확인</button>

                </div>
            </div>
        </div>
    </div>
</div>

<!--후기 글 삭제-->
<form action="">
        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-content" align="center">
                <!-- Modal body -->
                <div class="modal-body">
                    <p>삭제 하시겠습니까?</p>
                    <button type="button" class="genric-btn primary small" data-dismiss="modal">취소</button>
                    <button type="button" class="genric-btn primary small" >삭제</button>
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