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
      
      var editForm = ""; 
      var result = ""; 
      var replyResult = "";
      
   		$(function(){
   			selectReviewList(); 
   			
   			//setInterval(selectReviewList, 1000);
   		});
   		
   		//후기 작성 ajax
   		function addReview(){
   			if($("#reviewContent").val().trim().length !=0){
   			$.ajax({
   				url:"insertReview.rev",
   				data:{
   					lessonNo:${r.lessonNo},
   					memNo:${loginUser.memNo},
   					reviewContent:$("#reviewContent").val(),
   					star:$("input:radio[name=star]:checked").val()	
   				},
   				success:function(result){
   					
   					if(result == "success"){
   						$("#reviewContent").val("");
   						$("#writeReviewArea").hide(); 
   						$("input:radio[name=star]:checked").attr("checked",false);
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
   					lessonNo:${r.lessonNo}		
   				},
   				success:function(list){
   					$("#reviewCount").text(list.length);
   					
   					result ="";
   					
   					
   					for(var i in list){
   						result += "<div class='comment-list'>" 
   						result += "<input type='hidden' class='rReply' name='reviewNo' value='" + list[i].reviewNo + "'>"
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
                       	result += "<p class='date'>" + list[i].reviewEnrollDate + "</p>"
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
                        result += "<div class='communityBtn'><a href='#' class='btn-reply text-uppercase' onclick='replyReviewSet(this); return false' data-no='"+ list[i].reviewNo +"'>" + '답장' + "</a></div>"
                        result += "<div class='communityBtn'><a href='#' class='btn-reply text-uppercase' onclick='updateReviewSet(this); return false' data-no='"+ list[i].reviewNo +"'>" + '수정' + "</a></div>"
                        result += "<div class='communityBtn'><a href='#' class='btn-reply text-uppercase' data-toggle='modal' data-target='#deleteModal' data-no='"+ list[i].reviewNo +"' onclick='deleteReviewSet(this)'>" + '삭제' + "</a></div>"
                        result += "</div>"        
                        result += "</div>"
                        result += "</div>"
                        result += "</div>"
                        result += "</div>"
                        result += "<div class='reviewReplyArea'></div>"
                       	result += "</div>"
                 			if(list[i].replyList.length != 0){
                 				for(var r=0; r<list[i].replyList.length; r++ ){
                        result += "<div class='comment-list reReply'>" 
                   		result += "<div class='single-comment justify-content-between d-flex'>"
                   		result += "<div class='user justify-content-between d-flex'>"
                   		result += "<div class='thumb1'>"
                   		result += "<img src='resources/user/assets/img/detailClassPage/replyArrow.png'>"
                   		result += "</div>"
                   		result += "<div class='desc1'>"
                   		result += "<p class='comment' id='replyCommentArea'>" + list[i].replyList[r].replyContent + "</p>"   
                   		result += "<div class='d-flex justify-content-between' style='width:670px;'>"
                   		result += "<div class='d-flex align-items-center'>"
                   		result += "<span>" + list[i].replyList[r].nickname + "</span>"
                   		result += "<p class='date'>" + list[i].replyList[r].replyEnrollDate + "</p>"
                   		result += "</div>"
                   		result += "<div class='reply-btn'>"
                   		result += "<div class='communityBtn'><a href='#' class='btn-reply text-uppercase' onclick='reply()'>" + '답장' + "</a></div>"
                   		result += "<div class='communityBtn'><a href='#' class='btn-reply text-uppercase' onclick='updateReviewReplySet(this); return false' data-no='" + list[i].replyList[r].replyNo + "'>" + '수정' + "</a></div>"
                   		result += "<div class='communityBtn'><a href='#' class='btn-reply text-uppercase' data-toggle='modal' data-target='#deleteReplyModal' data-no='"+ list[i].reviewNo + "' onclick='deleteReviewReplySet(this)'>" + '삭제' + "</a></div>"
                   		result += "</div>"        
                   		result += "</div>"
                   		result += "</div>"
                   		result += "</div>"
                   		result += "</div>"
                   		result += "</div>"
                 				}
                 			}
                   
                 		
   					}
   					
   					$(".review-area>#reviewListArea").html(result);
   
   				},
   				error:function(){
   					console.log("review fail"); 
   				}
   			});
   		}
   		
   		// 후기 댓글 작성하기 
   		function addReplyReviewSet(e){
   			var revNo = $(e).data("no");
   			
   			$.ajax({
   				url:"insertReplyReview.rev",
   				data:{
   					memNo:${loginUser.memNo},
   					reviewNo:revNo,
   					replyContent:$("#reviewReplyContent").val(),
   					replyType : '후기',
   					replyLevel : 1,
   					totalNo:revNo				
   				},
   				type:'post',
   				success:function(result){
   					
   					if(result == "success"){
   						$("#reviewReplyContent").val(""); 
   						selectReviewList();
   					}
   				},
   				error:function(){
   					console.log("reply 작성 ajax 실패")
   				}
   			})
   			
   		}
   		
   		
   		function replyReviewSet(e){
   			var revNo = $(e).data("no");
   			
   			var replyArea = "" 
			
   			replyArea += '<input type="hidden" name="reviewReplyNo" value="'+ revNo +'">'
            replyArea += '<div class="mt-10">'
            replyArea += '<textarea class="review-textarea" placeholder="후기 작성해주세요" onfocus="this.placeholder = " onblur="this.placeholder = 후기 작성해주세요" id="reviewReplyContent" required></textarea>'
        	replyArea += '</div>'
            replyArea += '<div align="right">'
        	replyArea += '<button class="genric-btn1 primary-border extrasmall" onclick="addReplyReviewSet(this);" data-no="'+revNo+'" ">'+"등록"+'</button>'
            replyArea += '<button class="genric-btn1 primary-border extrasmall" onclick="cancelReplyReview();">'+ "취소" + '</button>'
            replyArea += '</div>'
            replyArea += '<br><br>'
        	
        	$(e).parents(".comment-list").children(".reviewReplyArea").html(replyArea);
       
   			}
   			
      	function updateReviewSet(e){
			var revNo = $(e).data("no"); 
			var revContent = $(e).parents().siblings("#reviewCommentArea").text();
			editForm = "";
			
			editForm += '<input type="hidden" id="changedReviewNo" value="'+ revNo +'">'
			editForm += "<div class='mt-10'>"
            editForm += "<textarea class='review-textarea' id='changedReviewContent' required>" + revContent + "</textarea>"
            editForm += "</div>"
            editForm += "<div class='review-writeArea'>"
            editForm += "<div class='rate' id='review-writeRatting'>"
            editForm += "<input type='radio' id='star5' name='changeStar' value='5' />"
            editForm += "<label for='star5'>"+'5 stars'+"</label>"
            editForm += "<input type='radio' id='star4' name='changeStar' value='4' />"
            editForm += '<label for="star4">'+ "4 stars" +'</label>'
            editForm += '<input type="radio" id="star3" name="changeStar" value="3" />'
            editForm += '<label for="star3">'+ "3 stars" +'</label>'
            editForm += '<input type="radio" id="star2" name="changeStar" value="2" />'
            editForm += '<label for="star2">'+ "2 stars" +'</label>'
            editForm += '<input type="radio" id="star1" name="changeStar" value="1" />'
            editForm += '<label for="star1">'+ "1 stars" +'</label>'
            editForm += '</div>'
            editForm += '<div id="submitReview" align="right">'
            editForm += '<button class="genric-btn1 primary-border extrasmall" onclick="updateReview();">'+ "등록" + '</button>'
            editForm += '<button class="genric-btn1 primary-border extrasmall" onclick="cancelUpdateReview(this);">'+ "취소" + '</button>'
            editForm += '</div>'
            editForm += '</div>'
            editForm += '<br><br>'
            
            $(e).parents(".comment-list ").html(editForm);
      	}
      	
      //후기 수정 ajax
		function updateReview(){
			var changedRevNo = $("#changedReviewNo").val();
			var changedReviewContent = $("#changedReviewContent").val();
			
   			$.ajax({
   				url:"updateReview.rev",
   				data:{
   					reviewNo:changedRevNo,
   					reviewContent:changedReviewContent,
   					star:$("input:radio[name=changeStar]:checked").val()	
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
   		}
      	
      	function updateReviewReplySet(e){
			var repNo = $(e).data("no"); 
			var repContent = $(e).parents().siblings("#replyCommentArea").text();
			var repEditForm = "";
			
			repEditForm += '<input type="hidden" id="changedRepNo" value="'+ repNo +'">'
			repEditForm += '<div class="mt-10">'
            repEditForm += "<textarea class='review-textarea' id='repContent' required>" + repContent + "</textarea>"
            repEditForm += '</div>'
            repEditForm += '<div align="right">'
            repEditForm += '<button class="genric-btn1 primary-border extrasmall" onclick="updateReviewReply();">'+ "등록" + '</button>'
    		repEditForm += '<button class="genric-btn1 primary-border extrasmall" onclick="cancelUpdateReview(this);">'+ "취소" + '</button>'
    		repEditForm += '</div>'

            
            $(e).parents(".comment-list").html(repEditForm);
      	}
      	
      	//후기 댓글 수정하기
      	function updateReviewReply(){
      		var changedRepNo = $("#changedRepNo").val();
      		var repContent = $("#repContent").val();

      		$.ajax({
      			url:"updateReviewReply.rev",
      			data:{
      				replyNo:changedRepNo,
      				replyContent:repContent
      			},
      			type:'post',
      			success:function(result){
      				
      				if(result = "success"){
      					selectReviewList();
      				}
      			},
      			error:function(){
      				console.log("후기 댓글 수정하기 ajax 실패")
      			}
      		});
      	}
    	
      	// 후기 수정 취소 
		function cancelUpdateReview(e){
			 $(e).parents("#reviewListArea").html(result); 
			 selectReviewList();
		}
		
      	//후기 삭제 모달로 no 보내기
	  	function deleteReviewSet(e){
	  		$("#deleteReply").val($(e).data("no"));
	  	}
	  	
		//후기 삭제 ajax
		function deleteReply(){

			$.ajax({
				url:"deleteReview.rev",
				data:{
					reviewNo:$("#deleteReply").val()
				},
				type:'post',
				success:function(result){
					if(result == 'success'){
						alert("후기 삭제되었습니다.");
						$("#closeModal").click();
						selectReviewList(); 
						
						
					} else {
						alert("삭제 실패했습니다.");
					}
				},
				error:function(){
					console.log("ajax 댓글 삭제 처리 실패")
				}
			});
		}
		
		//모달로 
		function deleteReviewReplySet(e){
			$("#deleteReviewReply").val($(e).data("no"));
		}
		
		// 모달에서 삭제 누르면 실행
		function deleteReviewReply(){
			
			$.ajax({
				url:"deleteReviewReply.rev",
				data:{
					reviewNo:$("#deleteReviewReply").val()
				},
				type:'post',
				success:function(result){
					
					if(result == "success"){
						alert("댓글 삭제되었습니다.");
						$("#closeReplyModal").click();
						selectReviewList();
						
					} else{
						
						alert("댓글 삭제 실패했습니다.")
					}
				},
				error:function(){
					console.log("후기 댓글 삭제 ajax 실패")
				}
			});
		}
	

	</script>

	
	<!-- 후기 글 삭제 모달  -->
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
	
	<!-- 후기 댓글 삭제 모달  -->
	<div class="modal fade" id="deleteReplyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	        <div class="modal-content">
	            <div class="modal-content" align="center">
	                <!-- Modal body -->
	                <div class="modal-body">
	                    <p>삭제 하시겠습니까?</p>
	                    <input type="hidden" id="deleteReviewReply" value="">
	                    <button type="button" class="genric-btn primary small" data-dismiss="modal" id="closeReplyModal">취소</button>
	                    <button type="button" class="genric-btn primary small" onclick="deleteReviewReply();">삭제</button>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>

	
   </main>
   <jsp:include page="../common/footer.jsp" />
</body>
</html>