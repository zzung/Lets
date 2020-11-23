<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta property="og:url" content="http://localhost:8888/ee/" />
<meta property="og:title" content="Lets Experience is Everything" />
<meta property="og:type" content="website" />
<meta property="og:description" content="요기서 배워 배우라고!!" />
<meta property="og:image" content="http://localhost:8888/ee/resources/user/assets/img/logo/logo.png" />
<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" href="resources/user/assets/css/detailClassStyle.css">
<script src='<c:url value="resources/user/assets/js/vendor/jquery-1.12.4.min.js"/>'></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>

	<jsp:include page="../common/navBar.jsp" />
	
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
		
		//FAQ slideUp / Down
       $(function() {
			$(".blog-author .media-body .faqQuestion").click(function() {
				var $p = $(this).next();
				if ($p.css("display") == "none") {
					$(this).siblings("p").slideUp();
					$p.slideDown();
				} else {
					$p.slideUp();
				}
			});
		});
	</script>
   <!-- end of 신고하기  -->
	<main>
	      <!--================Blog Area =================-->
	      <section class="blog_area single-post-area section-padding">
	         <div class="container">
	            <div class="row">
                 	<!-- value 나중에 수정해야 함. -->
                 	<input type="hidden" name="lessonNo" value="1">
	               <div class="col-lg-8 posts-list">
	                  <div class="single-post">
	                     <div class="feature-img">
	                        <img class="img-fluid" src="resources/user/assets/img/blog/single_blog_1.png" alt="">
	                     </div>
	                     <div class="blog_details">
	                        <h2 style="color: #2d2d2d;">클래스 상세 페이지 상단 타이틀 이미지</h2>
	                        <br><br>
	                        <!-- 클래스 소개 -->
	                        <div class="quote-wrapper">
	                           <div class="quotes">
	                              <h2>클래스 소개 </h2>
	                              <br>
	                              <table>
	                                 <tr>
	                                    <td width="70px;"><img src="resources/user/assets/img/detailClassPage/calendar.png"></td>
	                                    <td width="300px;"><h5>25주 수강 가능</h5></td>
	                                    <td width="70px;"><img src="resources/user/assets/img/detailClassPage/clipboard.png"></td>
	                                    <td width="200px;"><h5>15개 컨텐츠</h5></td>
	                                 </tr>
	                              </table>
	                              <br><br>
	                              <!--첫번째 소개 글과 이미지-->
	                              <img class="img-fluid" src="resources/user/assets/img/blog/single_blog_2.png" alt="">
	                              <p>
	                                 MCSE boot camps have its supporters and its detractors. Some people do not understand why you
	                                 should have to spend money on boot camp when you can get the MCSE study materials yourself at a
	                                 fraction of the camp price. However, who has the willpower
	                              </p>
	                              <!--두번째 소개 글과 이미지-->
	                              <img class="img-fluid" src="resources/user/assets/img/blog/single_blog_3.png" alt="">
	                              <p>
	                                 MCSE boot camps have its supporters and its detractors. Some people do not understand why you
	                                 should have to spend money on boot camp when you can get the MCSE study materials yourself at a
	                                 fraction of the camp price. However, who has the willpower
	                              </p>
	                              <!--세번째 소개 글과 이미지-->
	                              <img class="img-fluid" src="resources/user/assets/img/blog/single_blog_4.png" alt="">
	                              <p>
	                                 MCSE boot camps have its supporters and its detractors. Some people do not understand why you
	                                 should have to spend money on boot camp when you can get the MCSE study materials yourself at a
	                                 fraction of the camp price. However, who has the willpower
	                              </p>
	                           </div>
	                        </div>
	                        
	                        <!-- 컬리큘럼 소개 -->
	                        <div class="quote-wrapper">
	                           <div class="quotes">
	                              <h2>컬리큘럼 소개 </h2>
	                              <br>
	                              <div class="curriculum-area">
	                                 <h5><b>이 클래스에 오신것을 환경합니다.intro</b></h5>
	                              </div> 
	                              <br>
	                              <div class="ordered-list">
	                                 <h6>1. 간단한 컬리튤럼 설명회</h6>
	                                 <ol type="a" >
	                                    <li>리스트 항목</li>
	                                    <li>리스트 항목</li>
	                                    <li>리스트 항목</li>
	                                 </ol>
	                                 <h6>2. 간단한 컬리튤럼 설명회</h6>
	                                 <ol type="a">
	                                    <li>리스트 항목</li>
	                                    <li>리스트 항목</li>
	                                    <li>리스트 항목</li>
	                                 </ol>
	                                 <h6>3. 간단한 컬리튤럼 설명회</h6>
	                                 <ol type="a">
	                                    <li>리스트 항목</li>
	                                    <li>리스트 항목</li>
	                                    <li>리스트 항목</li>
	                                 </ol>
	                              </div>  
	                              <br><br>
	                           </div>
	                        </div>
	                        <!-- end of 컬리큘럼-->
	                     </div>
	                  </div>
	                  <!--? 튜터 소개 -->
	                  <div class="blog-author">
	                     <div><h2>튜터 소개</h2></div>  
	                     <br>
	                     <div class="media align-items-center">
	                        <img src="resources/user/assets/img/blog/author.png" alt="">
	                        <div class="media-body">
	                              <h4>요가킹 홍길룡</h4>
	                           <p>품고 맺어, 돋고, 품에 말이다. 유소년에게서 그들에게 곳이 피어나는 가지에 
					                              청춘에서만 것이다. 청춘의 얼마나 싹이 밝은 칼이다. 유소년에게서 그러므로 물방아 
					                              열락의 싹이 실로 힘있다. 하는 들어 이 공자는 이상의 설레는 따뜻한 피다.
					                              시들어 이상을 있는 운다. 사람은 피가 방황하였으며, 얼음과 생의 밝은 같지 오직 
					                              사막이다. 사랑의 인생을 얼음에 피에 싹이 풀이 이상, 관현악이며, 말이다. 보배를 
					                              이상 곳으로 뿐이다. 이상 영락과 가치를 안고, 쓸쓸하랴? 방지하는 석가는 가지에 
					                              얼마나 이상 무엇을 있으랴? 공자는 때까지 피어나는 운다.
					                              열락의 너의 천지는 싸인 남는 돋고, 실현에 속에서 사막이다. 
					                              우리는 인생에 청춘의 것이다. 뭇 내는 노년에게서 보이는 설레는 용기가 그것은 
					                              얼마나 약동하다. 구하지 얼음이 오직 청춘을 별과 목숨을 말이다. 
					                              광야에서 희망의 동산에는 그들을 것은 때문이다. 
					                              수 하였으며, 날카로우나 작고 긴지라 속잎나고, 별과 아름다우냐? 
					                              찬미를 같이, 그것을 희망의 새 뿐이다.
					           </p>
	                        </div>
	                     </div>
	                  </div>
	                  <!--end of 튜터 소개 -->
	                  <!--?리뷰 area-->
		                  <div class="comments-area">
		                     <div class="text-right">
		                        <i class="fas fa-plus" id="showMore"> 더보기</i>
		                     </div>
		                     <div class="container">
		                        <h4>리뷰 </h4>
		                      </div>
	                  		<c:forEach var="review" items="${list }">
			                     <div class="comment-list">
			                        <div class="single-comment justify-content-between d-flex">
			                           <div class="user justify-content-between d-flex">
			                              <div class="thumb">
			                                 <img src="resources/user/assets/img/comment/cat1.jpg" alt="">
			                              </div>
			                              <div class="desc">
			                                 <p class="comment">${review.reviewContent}</p>
			                                 <div class="d-flex justify-content-between" style="width:670px;">
			                                    <div class="d-flex align-items-center">
			                                       <span>${review.nickname}</span>
			                                       <p class="date">${review.enrollDate} </p>
			                                    </div>
			                                    <div class="review-ratting">
			                                    	<c:forEach var="s" begin="1" end="${review.star }">
			                                        <i class="fas fa-star" style="color:#fbba42"></i> 
			                                        </c:forEach>
			                                        <c:forEach var="j" begin="${review.star}" end="4">
			                                        <i class="fas fa-star" style="color:#e6e6e6"></i>
			                                        </c:forEach>
			                                    </div>
			                                 </div>
			                              </div>
			                           </div>
			                        </div>
			                     </div>
	                  		</c:forEach>
		                  </div>
	                  <!--? end 리뷰 area-->
	                  <script>
	                  	$(function(){
	                  		$("#showMore").click(function(){
	                  			location.href="showMore.rev?lessonNo=1";
	                  		})
	                  	})
	                  </script>
	                  <!--?댓글area-->
	                  <div class="comments-area">
	                     <h4>커뮤니티 3</h4>
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
	                                    <div class="reply-btn">
	                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase">답장</a></div>
	                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase">수정</a></div>
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
	                                    <div class="reply-btn">
	                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase">답장</a></div>
	                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase">수정</a></div>
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
	                                    <div class="reply-btn">
	                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase">답장</a></div>
	                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase">수정</a></div>
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
						<!--댓글 신고 모달-->
						<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-content">
										<!-- Modal body -->
										<div class="modal-body" align="center">
											<table>
												<tr>
													<td style="background: gray;" id="reportWriter"></td>
												</tr>
												<tr>
													<td style="background: gray;" id="reportContentTitle">제목
														:</td>
												</tr>
												<tr>
												<tr>
													<td style="border-bottom: 1px solid grey; padding: 5px;">
														<br> 
														<label for="report-ad" style="width: 90%;">광고</label>
														<input type="radio" name="reportType" id="report-ad" value="부적절한 게시물"> 
														<label for="report-ad"></label>
													</td>
												</tr>
												<tr>
													<td style="border-bottom: 1px solid grey; padding: 5px;">
														<label for="report-insult" style="width: 90%;">욕설</label>
														<input type="radio" name="reportType" id="report-insult" value="음란 또는 청소년에게 부적합한 내용"> 
														<label for="report-insult"></label>
													</td>
												</tr>
												<tr>
													<td style="border-bottom: 1px solid grey; padding: 5px;">
														<label for="report-obscence" style="width: 90%;">음란 또는 청소년에게 부적합한 내용</label> 
														<input type="radio" name="reportType" id="report-obscence" value="음란 또는 청소년에게 부적합한 내용">
														<label for="report-obscence"></label>
													</td>
												</tr>

												<tr>
													<td style="border-bottom: 1px solid grey; padding: 5px;">
														<label for="report-etc" style="width: 90%;">기타</label> 
														<input type="radio" name="reportType" id="report-etc" value="">
														<label for="report-etc"></label>
														<div id="reportReason"></div>
													</td>
												</tr>
												<tr>
													<th style="padding: 5px;">신고하기전에 잠깐?</th>
												</tr>
												<tr>
													<td>
														<div style="color: gray;">게시물로 인해 개인(단체)이 명예훼손 피해를
															입었거나 저작권을 침해 당한 경우에는 게시중단 서비스를 통해 신고해 주시기 바랍니다.</div>
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
						<!-- 댓글 신고 기타 사유 작성 모달 -->
						<div class="modal fade" id="etcReportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-content">
										<!-- Modal body -->
										<div class="modal-body" align="center">

											<table>
												<tr>
													<td style="border-bottom: 1px solid grey; padding: 5px;">기타사유</td>
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

						<!--댓글 글 삭제-->
						<form action="">
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
						<!-- end of 댓글 삭제 -->
						<!--?FAQ-->
	                  <div class="blog-author">
	                     <div><h2>FAQ</h2></div>  
	                     <br>
	                     <div class="media align-items-center">
								<div class="media-body">
									<c:forEach var="faq" items="${faqList }">
										<div class="faqQuestion">Q. ${faq.faqQuestion }</div>
										<p class="faqAnswer">A. ${faq.faqAnswer }</p>
										<br>
									</c:forEach>
								</div>
							</div>
	                  </div>
					<!--end of FAQ-->
	               </div>
	               <!--?right-side-blog-->
	               <!--? payment-->
	               <div class="col-lg-4">
	                  <div class="blog_right_sidebar">
	                     <!--사용할것-->
	                     <aside class="single_sidebar_widget post_category_widget">
	                        <h4 class="widget_title" style="color: #2d2d2d;">클래스 제목</h4>
	                        <table>
	                           <tr>
	                              <td class="discount-suggestion" colspan="2"><b>15</b>개월할부시</td>
	                              <td class="discount-percentage">10%</td>
	                              <td class="discount-price">월 1,390,000원</td>
	                           </tr>
	                           <tr>
	                              <td class="discount-suggestion" colspan="2"><b>총금액</b></td>
	                              <td class="discount-price" colspan="2">월 1,390,000원</td>
	                           </tr>
	                           <tr> 
	                              <td class="discount-like" colspan="2" align="center">
	                                 <button class="like-button"></button>
	                              </td>
	                              <td class="discount-share" colspan="2" align="center">
	                                <a href="javascript:;" id="kakao-link-btn"> 
								       <img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_small.png" />
								    </a>
	                              </td>
	                           </tr>
	                           <tr>
	                              <td colspan="4" align="center">
	                                 <button class="genric-btn primary discount-pay" href="payClass.le">수강하기</button>
	                              </td>
	                           </tr>
	                        </table>
	                     </aside>
	                     <!--end of payment-->
	                  </div>
	               </div>
	               <!--end of right-side-blog -->
	            </div>
	         </div>
	      </section>
	      	<!-- 카톡 공유하기 스크립트 -->
	<script>
		Kakao.init('5e8cc8871721dbc11a35361c7cb406be')
	    Kakao.Link.createDefaultButton({
	        container: '#kakao-link-btn',
	        objectType : 'feed',
	        content : {
	            title : $('meta[property="og:title"]').attr('content'),
	            description : $('meta[property="og:description"]').attr('content'),
	            imageUrl : $('meta[property="og:image"]').attr('content'),
	            link : {
	                mobileWebUrl : 'http://localhost:8888/ee',
	                webUrl : 'http://localhost:8888/ee',
	            },
	        },
	        social : {
	            likeCount : 200,
	            commentCount : 45,
	            sharedCount : 25,
	        },
	        buttons : [{
	                title : '웹으로 보기',
	                link : {
	                    mobileWebUrl : 'http://localhost:8888/ee',
	                    webUrl : 'http://localhost:8888/ee',
	                    },
	                }, ],
	    });

        document.querySelector('.like-button').addEventListener('click', e => {
            e.currentTarget.classList.toggle('liked');
          });
    </script>
	</main>
	      <!--================ Blog Area end =================-->
	   <jsp:include page="../common/footer.jsp" />
</body>
</html>