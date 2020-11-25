<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="resources/user/assets/css/curriculum.css">
<link rel="stylesheet" href="resources/user/assets/css/style.css">
</head>
<body>

<!-- header -->
<jsp:include page="../common/navBar.jsp" />

<!-- 커리큘럼 상태 바 -->
<jsp:include page="curriStatusBar.jsp" />

<!-- 본문 -->
<div class="main">

    <span class="button">
        	클래스 소개
    </span>
    
    <span class="button">
      		FAQ
    </span>

    <hr>

    <div id="main_qna_box">

        <h1>Q&A</h1>

        <div id="detail_qna_box">

            <div id="reply_box">

                <div class="user_img">
                    <img src="resources/user/assets/img/curriculum/user.png" height="100%">
                </div>

                <div class="blank"></div>

                <div class="question_box">

                    <textarea id="question_area" cols="30" rows="10" placeholder="질문 내용을 입력해주세요."></textarea>

                    <button class="button" onclick="send(1);" id="question_send">제출</button>

                </div>
            </div>

            <hr>

            <!-- 이게 한 세트 -->
            <div>

                <!-- 질문 박스 -->
                <div class="margin_box">

                    <!-- 질문 -->
                    <div class="question">
    
                        <div class="user_img">
                            <img src="resources/user/assets/img/curriculum/user.png" height="100%">
                        </div>
                        
                        <div class="blank"></div>
    
                        <div class="question_box">
        
                            <p class="">실습 파일 어디 있나요?</p>
        
                            <span>user 2020/11/12 17:57</span>
    
                            <div class="enter">
    
                                <span class="button" onclick="modify(1);">수정</span>
                                /
                                <span class="button" onclick="reply(1);">답변</span>
                                /
                                <span class="button" onclick="deleteReply(1);">삭제</span>
    
                            </div>
        
                        </div>
    
                    </div>
    
                    <!-- 답변(hide) -->
                    <div class="answer" id="answer1">
    
                        <textarea class="answer_div" cols="20" rows="8" placeholder="답변 내용을 입력해주세요."></textarea>
    
                        <button onclick="send(1);" class="button send">답변</button>
                        
                        <button onclick="closeForm(1);" class="button close">닫기</button>
    
                    </div>

                </div>

                <!-- 질문 박스 -->
                <div class="margin_box">

                    <!-- 질문 -->
                    <div class="question tutor">
    
                        <div class="user_img">
                            <img src="resources/user/assets/img/curriculum/user.png" height="100%">
                        </div>
                        
                        <div class="blank"></div>
    
                        <div class="question_box">
        
                            <p class="black">메일 남겨주시면 보내드립니다.</p>
        
                            <span>tutor 2020/11/12 17:57</span>
    
                            <div class="enter">
    
                                <span class="button" onclick="modify(2);">수정</span>
                                /
                                <span class="button" onclick="reply(2);">답변</span>
                                /
                                <span class="button" onclick="deleteReply(2);">삭제</span>
    
                            </div>
        
                        </div>
    
                    </div>
    
                    <!-- 답변 창 -->
                    <div class="answer" id="answer2">
    
                        <textarea class="answer_div" cols="20" rows="8" placeholder="답변 내용을 입력해주세요."></textarea>
    
                        <button onclick="send(2);" class="button send">답변</button>
                        
                        <button onclick="closeForm(2);" class="button close">닫기</button>
    
                    </div>

                </div>

            </div>

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
</script>

<!-- footer -->
<jsp:include page="../common/footer.jsp" />

</body>
</html>