<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="resources/user/assets/css/style.css">
<style>
div{
    box-sizing: border-box;
}
.main{
    padding: 20px;
    padding-bottom: 80px;
    margin-left: 20%;
    margin-right: 20%;
}
.main>div{
    padding: 10px;
}
.main>span{
    font-size: 22px;
    font-weight: bold;
    margin-right: 20px;
}
.main>hr{
    margin-top: 20px;
    margin-bottom: 20px;
}
.main textarea{
	outline: 1px solid lightgray;
}
.main button{
	color: white;
	background-color: rgb(46, 48, 146);
 	border: none;
 	border-radius: 5px;
 	font-size: 15px;
}
#main_qna_box{
    width: 70%;
    margin-top: 50px;
    margin-left: 15%;
}
#main_qna_box>h1{
    color: rgb(46, 48, 146);
    font-size: 35px;
}
#detail_qna_box{
    border: 1px solid gray;
    padding: 20px;
}
.question{
    width: 100%;
    height: 80px;
}
.question>div{
    float: left;
    height: 100%;
}
.user_img{
    width: 15%;
    text-align: center;
}
.blank{width: 5%;}
.question_box{
    width: 80%;
    position: relative;
}
.question_box>p{
    font-size: 15px;
    font-weight: 500;
}
.question_box span{
    font-size: 13px;
    font-weight: 500;
    margin-right: 0;
}
.enter{
    position: absolute;
    right: 20px;
    bottom: 5px;
}
.answer{
    display: none;
    margin-left: 20%;
    width: 80%;
    position: relative;
}
.answer>button{
    position: absolute;
}
.answer_div{
    padding: 10px;
    margin-top: 5px;
    margin-left: 5px;
    border: none;
    height: 100%;
    resize: none;
    width: 70%;
}
.div_close{
	width: 50px;
    bottom: 10px;
    right: 10px;
}
.send{
	width: 50px;
    bottom: 10px;
    right: 65px;
}
#reply_box{
    height: 80px;
    width: 100%;
}
#reply_box>div{
    float: left;
    height: 100%;
}
#question_area{
    padding: 10px;
    box-sizing: border-box;
    width: 80%;
    height: 100%;
    border: none;
    resize: none;
}
#question_send{
    box-sizing: border-box;
    position: absolute;
    width: 60px;
    right: 10px;
    bottom: 0;
}
.margin_box{
    margin-top: 10px;
    margin-bottom: 10px;
}
.tutor{
    border-radius: 10px;
    background-color: lightgray;
}

.button:hover{
	cursor: pointer;
	filter: brightness(80%);
}
.curriculumn{
	padding-left: 10%;
	padding-right: 10%;
	height: 300px;
	background-color: rgb(46, 48, 146);
}
.curriculumn>div{
    float: left;
    height: 100%;
}
#curri_img{width: 30%;}
#curri_img>img{
    padding: 10%;
    box-sizing: border-box;
}
#curri_info{
    width: 50%;
    color: white;
}
#curri_info>h1{
    margin-top: 40px; 
    margin-bottom: 40px;
}
#info{
    margin-right: 10px;
    font-size: 20px;
    font-weight: 700;
}
.star{
    color: rgb(241,196,15);
    margin-right: 0px;
    font-size: 18px;
    font-weight: bold;
}
#curri_info>p{
    font-size: 15px;
    font-weight: 600;
}
#curri_bar{
    height: 30px;
    width: 80%;
    background-color: gray;
}
#curri_status{
    float: left;
    height: 100%;
    width: 22.2%;
    background-color: white;
}
#curri_btn{
    width: 20%;
}
#curri_btn>button{
    width: 80%;
    height: 50px;
    background-color: white;
    border: none;
    color: rgb(46, 48, 146);
    font-size: 16px;
    font-weight: bold;
    margin-top: 200px;
    border-radius: 5px;
}
.black{
	color: black;
	margin-top: 15px;
	margin-bottom: 5px;
}
.white{
	color: white;	
	margin-top: 16px;
	margin-bottom: 16px;
}
</style>
</head>
<body>

<!-- header -->
<jsp:include page="../common/navBar.jsp" />

<!-- 커리큘럼 상태 바 -->
<jsp:include page="curriStatusBar.jsp" />

<!-- 본문 -->
<div class="main">

    <span class="button" onclick="moving('lessonInfo.cr');">
       	 클래스 소개
    </span>

    <span class="button" onclick="moving('detailFAQ.cr');">
        FAQ
    </span>

    <hr>

    <div id="main_qna_box">

        <h1>Q&A</h1>

        <div id="detail_qna_box">

            <div id="reply_box">

                <div class="user_img">
                    <img src="${ loginUser.memPic }" height="100%">
                </div>

                <div class="blank"></div>

                <div class="question_box">

                    <textarea id="question_area" cols="30" rows="10" placeholder="질문 내용을 입력해주세요."></textarea>

                    <button class="button" onclick="insertQ();">제출</button>

                </div>
                
            </div>
            
            <!-- 폼 -->
	        <form action="insertQuestion.cr" method="POST" id="qnaForm">
	        	<input type="hidden" name="lessonNo" value="${ lesson.lessonNo }">
	        	<input type="hidden" name="memNo" value="${ loginUser.memNo }">
	        	<input type="hidden" name="question" value="">
	        </form>
            

            <hr>

			<c:forEach var="qna" items="${ qnaList }" varStatus="status">
			
	            <!-- 이게 한 세트 -->
	            <div>
	            	
	            	<input type="hidden" value="${ qna.qnaNo }" id="qna${ status.count }">
	
	                <!-- 질문 박스 -->
	                <div class="margin_box">
	
	                    <!-- 질문 -->
	                    <div class="question">
	    
	                        <div class="user_img">
	                            <img src="${ qna.memPic }" height="100%">
	                        </div>
	                        
	                        <div class="blank"></div>
	    
	                        <div class="question_box">
	        
	                            <p class="black"></p>
	        
	                            <span>${ qna.memNick } ${ qna.qEnrollDate }</span>
	    
	                            <div class="enter">
	    							
	    							<c:if test="${ loginUser.memNo == qna.memNo }">
		                                <span class="button" onclick="modify(${ status.count }${ status.index });">수정</span>
		                                /
		                                <span class="button" onclick="deleteQuestion(${ status.count }${ status.index });">삭제</span>
	    	                        </c:if>
	                                <c:if test="${ loginUser.memNo == qna.tutorNo }">
	                                	<span class="button" onclick="reply(${ status.count }${ status.index });">답변</span>
	                                </c:if>
	                                
	                            </div>
	        
	                        </div>
	    
	                    </div>
	    
	                    <!-- 답변(hide) -->
	                    <div class="answer" id="answer${ status.count }${ status.index }">
	    
	                        <textarea class="answer_div" cols="20" rows="8" placeholder="답변 내용을 입력해주세요."></textarea>
	    
	                        <button onclick="send(${ status.count }${ status.index });" class="button send"></button>
	                        
	                        <button onclick="closeForm(${ status.count }${ status.index });" class="button div_close">닫기</button>
	    
	                    </div>
	                    
	                    <form action="" method="POST" id="actionQuestion${ status.count }${ status.index }">
	                    	<input type="hidden" value="${ qna.qnaNo }" name="qnaNo">
	                    	<input type="hidden" value="${ lesson.lessonNo }" name="lessonNo">
	                    	<input type="hidden" value="" name="">
	                    </form>
	
	                </div>
	
					<c:if test="${ qna.aStatus == 'Y' }">
					
		                <!-- 질문 박스 -->
		                <div class="margin_box">
		
		                    <!-- 질문 -->
		                    <div class="question tutor">
		    
		                        <div class="user_img">
		                            <img src="${ qna.tutorPic }" height="100%">
		                        </div>
		                        
		                        <div class="blank"></div>
		    
		                        <div class="question_box">
		        
		                            <p class="black">${ qna.answer }</p>
		        
		                            <span>${ qna.tutorNick } ${ qna.aEnrollDate }</span>
		    
		                            <div class="enter">
		    
		    							<c:if test="${ loginUser.memNo == qna.tutorNo }">
			                                <span class="button" onclick="modify(${ status.count }${ status.index +1 });">수정</span>
			                                /
			                                <span class="button" onclick="deleteAnswer(${ status.count }${ status.index +1 });">삭제</span>
		    							</c:if>
		    							
		                            </div>
		        
		                        </div>
		    
		                    </div>
		    
		                    <!-- 답변 창 -->
		                    <div class="answer" id="answer${ status.count }${ status.index +1 }">
		    
		                        <textarea class="answer_div" cols="20" rows="8" placeholder="답변 내용을 입력해주세요."></textarea>
		    
		                        <button onclick="updateAnswer(${ status.count }${ status.index +1 });" class="button send">수정</button>
		                        
		                        <button onclick="closeForm(${ status.count }${ status.index +1 });" class="button div_close">닫기</button>
		    
		                    </div>
		                    
		                    <form action="" method="POST" name="actionAnswer${ status.count }${ status.index +1 }">
		                    	<input type="hidden" name="qnaNo" value="${ qna.qnaNo }">
		                    	<input type="hidden" name="lessonNo" value="${ lesson.lessonNo }">
		                    	<input type="hidden" name="answer" value="">
		                    </form>
		
		                </div>
	                
	                </c:if>
	
	            </div>
	                
            </c:forEach>
            
        </div>
        

    </div>

</div>
<!-- 고치거나 추가하고 싶은 기능 -->
<!-- 닫기 버튼을 이용해 닫기보단 한 번 더 클릭 시 다시 창이 안보이게 하는 기능 -->


<script>

    function reply(i) {
        if($("#answer" + i).css("display") == "show") {
            $("#answer" + i).hide();
        }

        $("#answer" + i).show();
        $("#answer" + i).children().eq(0).attr("placeholder", "답변 내용을 입력해주세요.");
        $("#answer" + i).children().eq(1).text("답장");
    }

    function modify(i) {
        if($("#answer" + i).css("display") == "show") {
            $("#answer" + i).hide();
        }

        $("#answer" + i).show();
        $("#answer" + i).children().eq(0).attr("placeholder", "수정 내용을 입력해주세요.");
        $("#answer" + i).children().eq(1).text("수정");
    }

    function closeForm(i) {
        $("#answer" + i).hide();
    }
    
    function moving(e) {
		location.href = e + "?lessonNo=" + ${ lesson.lessonNo };
	}
    
    function send(i) {
   		var column = $("#answer" + i).children().eq(1).text();
		var text = $("#answer" + i).children().eq(0).text();
   		
   		if(column == "답장") {
   			$("#actionQuestion" + i).children().eq(2).attr("name", "answer").val(text);
   			$("#actionQuestion" + i).attr("action", "insertAnswer.cr").submit();
   		} else {
   			$("#actionQuestion" + i).children().eq(2).attr("name", "question").val(text);
   			$("#actionQuestion" + i).attr("action", "updateQuestion.cr").submit();
   		}
   	}
    
    function insertQ(){
    	var text = $("#question_area").text();
		
		$("#qnaForm").children().eq(2).val(text);
		
		$("#qnaForm").submit();
    }
    
    function deleteQuestion(i) {
    	var result = confirm("정말로 삭제하시겠습니까?");
    	 
		if(result) {
			$("#actionQuestion" + i).attr("action", "deleteQuestion.cr").submit();
		}
    }
    
    function updateAnswer(i) {
    	var text = $("#answer" + i).children().eq(2).text();
    	
    	$("#actionAnswer" + i).children().eq(2).val(text);
    	$("#actionAnswer" + i).attr("action", "updateAnswer.cr").submit();
    }
    
    function deleteAnswer(i) {
    	var result = confirm("정말로 삭제하시겠습니까?");
    	
    	if(result) {
    		$("#actionAnswer" + i).attr("action", "deleteAnswer.cr").submit();
    	}
    }
</script>

<!-- footer -->
<jsp:include page="../common/footer.jsp" />

</body>
</html>