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
                            <h2>후기 (<span id="reviewCount"></span>)</h2>
                        </div>
                        <div id="review-writeBtn" align="right">
                          <button type="button" class="genric-btn primary-border" onclick="writeReview();">리뷰작성</button>
                        </div>
                    </div>
                    <!-- 조건문 줘야함  수강하지 않을경우 -->
                    <script>
                        function writeReview(){
                           	if($("#writeReviewArea").css("display") == "none"){
                           		//조건문 필요 >> 회원이 이 강의를 수강시 가능.
                           		$("#writeReviewArea").show();
                           	}else{
                           		$("#writeReviewArea").hide(); 
          
                           	}
                       	}
                   
                    </script>
                    <!--?리뷰 작성하기 클릭시 보여지게 할 창-->
                    <br><br>
                    <div id="writeReviewArea" style="display:none">
	                    <div class="mt-10">
	                        <textarea class="review-textarea" placeholder="후기 작성해주세요" onfocus="this.placeholder = ''"
	                        onblur="this.placeholder = '후기 작성해주세요'" id="reviewContent" required></textarea>
	                    </div>
	                    <div class="review-writeArea">
	                        <div class="rate" id="review-writeRatting">
	                            <input type="radio" id="star5" name="star" value="5" />
	                            <label for="star5">5 stars</label>
	                            <input type="radio" id="star4" name="star" value="4" />
	                            <label for="star4">4 stars</label>
	                            <input type="radio" id="star3" name="star" value="3" />
	                            <label for="star3">3 stars</label>
	                            <input type="radio" id="star2" name="star" value="2" />
	                            <label for="star2">2 stars</label>
	                            <input type="radio" id="star1" name="star" value="1" />
	                            <label for="star1">1 star</label>
                        	</div>
	                        <div id="submitReview" align="right"><button class="genric-btn1 primary-border extrasmall" onclick="addReview();">등록</button></div>
	                    </div>
                    </div>
                    <!--end of 리뷰 작성하기-->
                    <br><br><br>
                    <div id="reviewListArea"></div>
                  </div>
                  <!--? end 리뷰 area-->
            </div>
         </div>
      </section>
      <!--================ Blog Area end =================-->
      <script>
   		$(function(){
   			selectReviewList(); 
   			
   			setInterval(selectReviewList, 1000);
   		});
   		
   		//후기 작성 ajax
   		function addReview(){
   			if($("#reviewContent").val().trim().length !=0){
   			$.ajax({
   				url:"insertReview.rev",
   				data:{
   					lessonNo:1,
   					memNo:3,
   					reviewContent:$("#reviewContent").val(),
   					star:$("input:radio[name=star]:checked").val()	
   				},
   				success:function(result){
   					
   					if(result == "success"){
   						$("#reviewContent").val("");
   						$("input:radio[name=star]:checked").val("");
   						selectReviewList();
   					}
   				},
   				error:function(request,error){
   					alert("fail");
   					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   				}
   			});
   		}else{
   			alert("글 작성 후 등록 가능합니다.")
   		}
   		}
   		
   		//전체 후기 보여주는 ajax
   		function selectReviewList(){
   			$.ajax({
   				url:"showMoreReview.rev",
   				data:{
   					lessonNo:1		
   				},
   				success:function(list){
   					$("#reviewCount").text(list.length);
   					
   					var result ="";
   					
   					for(var i in list){
   						result += "<div class='comment-list'>" 
   						result += "<input type='hidden' name='reviewNo' value=" + list[i].reviewNo + ">"
                        result += "<div class='single-comment justify-content-between d-flex'>"
                        result += "<div class='user justify-content-between d-flex'>"
                        result += "<div class='thumb'>"
                        result += "<img src='resources/user/assets/img/comment/cat1.jpg'>"
                        result += "</div>"
                        result += "<div class='desc'>"
                        result += "<p class='comment' id='reviewCommentArea'>" + list[i].reviewContent + "</p>"	
                        result += "<div class='d-flex justify-content-between' style='width:670px;'>"
                        result += "<div class='d-flex align-items-center'>"
                        result += "<span>" + list[i].nickname + "</span>"
                        result += "<p class='date'>" + list[i].enrollDate + "</p>"
                        result += "</div>"
                        result += "<div class='review-ratting'>"  
	                        for(var s=0; s<list[i].star; s++){
	                        	result += "<i class='fas fa-star'></i>"	
	                        }
                        	for(var j=list[i].star; j<5; j++){
                        		result += "<i class='fas fa-star' style='color:#e6e6e6'></i>"	
                        	}
                        result += "</div>"
                        result += "<div class='reply-btn'>"
                        result += "<div class='communityBtn'><a href='#' class='btn-reply text-uppercase' onclick='reply();'>" + '답장' + "</a></div>"
                        result += "<div class='communityBtn'><a href='#' class='btn-reply text-uppercase' onclick='updateReview();'>" + '수정' + "</a></div>"
                        result += "<div class='communityBtn'><a href='#' class='btn-reply text-uppercase' data-toggle='modal' data-target='#deleteModal'>" + '삭제' + "</a></div>"
                        result += "</div>"        
                        result += "</div>"
                        result += "</div>"
                        result += "</div>"
                        result += "</div>"
                        result += "</div>"
   					}
   					$(".review-area>#reviewListArea").html(result);
   
   				},
   				error:function(){
   					console.log("review fail"); 
   				}
   			});
   		}
      </script>
	<!--후기 글 삭제-->

	   <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	        <div class="modal-content">
	            <div class="modal-content" align="center">
	                <!-- Modal body -->
	                <div class="modal-body">
	                    <p>삭제 하시겠습니까?</p>
	                    <input type="hidden" id="deleteReply" value="">
	                    <button type="button" class="genric-btn primary small" data-dismiss="modal" id="closeModal">취소</button>
	                    <button type="button" class="genric-btn primary small" onclick="deleteReply();">삭제</button>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>

	
	<script>
		//후기 삭제 ajax
		function deleteReply(){
			var $revNo = $(".comment-list input[name=reviewNo]");
			
			$.ajax({
				url:"deleteReview.rev",
				data:{
					reviewNo:$revNo.val()
				},
				type:'post',
				success:function(result){
					if(result == 'success'){
						alert("후기 삭제되었습니다.");
						$("#closeModal").click();
					} else {
						alert("삭제 실패했습니다.");
					}
				},
				error:function(){
					console.log("ajax 댓글 삭제 처리 실패")
				}
			});
		}
		
		//후기 수정 ajax
		function updateReview(){
			var revNo = $(".comment-list input[name=reviewNo]").val();
			var revComment = $("#reviewCommentArea").val();
			var editForm = "";
			
			alert(revComment); 
			
			editForm += '<input type="hidden" name=reviwNo value='+ revNo +'>'
			editForm += "<div class='mt-10'>"
            editForm += "<textarea class='review-textarea' id='reviewContent' required>	</textarea>"
            editForm += "</div>"
            editForm += "<div class='review-writeArea'>"
            editForm += "<div class='rate' id='review-writeRatting'>"
            editForm += "<input type='radio' id='star5' name='star' value='5' />"
            editForm += "<label for='star5'>"+'5 stars'+"</label>"
            editForm += "<input type='radio' id='star4' name='star' value='4' />"
            editForm += '<label for="star4">'+ "4 stars" +'</label>'
            editForm += '<input type="radio" id="star3" name="star" value="3" />'
            editForm += '<label for="star3">'+ "3 stars" +'</label>'
            editForm += '<input type="radio" id="star2" name="star" value="2" />'
            editForm += '<label for="star2">'+ "2 stars" +'</label>'
            editForm += '<input type="radio" id="star1" name="star" value="1" />'
            editForm += '<label for="star1">'+ "1 stars" +'</label>'
            editForm += '</div>'
            editForm += '<div id="submitReview" align="right"><button class="genric-btn1 primary-border extrasmall" onclick="addReview();">'+ "등록" + '</button></div>'
            editForm += '</div>'
			
           	$.ajax({
   				url: "updateReview.rev",
   				data:{
   					reviewNo: revNo,
   					reviewContent: revComment
   				},
   				type:'post',
   				success:function(result){
   					
   					if(result>0){
	   					$(".comment-list .comment").replaceWith(editForm);					
   					} else{
   						alert("수정 가져오기 실패");
   					}
   				},
   				error:function(){
   					console.log("후기 수정 ajax 넷트 실패")
   				}
   			});
			
		}
	</script>
   </main>
   <jsp:include page="../common/footer.jsp" />
</body>
</html>