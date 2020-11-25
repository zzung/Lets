<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/user/assets/css/style.css">
<link rel="stylesheet" href="resources/user/assets/css/curriculum.css">
</head>
<body>
<!-- header -->
<jsp:include page="../common/navBar.jsp" />

<!-- 커리큘럼 상태 바 -->
<jsp:include page="curriStatusBar.jsp" />

    <div class="main">

        <span class="button">
           	 클래스 소개
        </span>

        <span class="button">
            FAQ
        </span>

        <hr>

        <div id="top_box">

            <!-- Q&A 창 -->
            <div id="qna_box">
                
                <span class="button">Q&A</span>

                <div id="question">

                    <div class="img_box">
                        <img src="resources/user/assets/img/curriculum/user.png" alt="user" height="100%">
                    </div>

                    <p class="black">
                        실습 파일은 어떻게 받죠?
                    </p>

                </div>

                <div id="answer">

                    <div class="img_box">
                        <img src="resources/user/assets/img/curriculum/user.png" alt="tutor" height="100%">
                    </div>

                    <p class="black">
                        메일을 남겨주시면 보내드립니다
                    </p>

                </div>
    
            </div>
            
            <div style="width: 10%;"></div>

            <!-- 상태창 -->
            <!-- 오프라인 수업에는 어떤 정보를 표시..? -->
            <div id="info_box">
    
                <span>내 학습 사항</span>

                <h1>2/2 완료</h1>

            </div>

        </div>

        <!-- 커리큘럼 area -->
        <div id="curri">

            <span>커리큘럼</span>

            <br><br><br>
            
            <p class="title">반갑습니다. intro</p>

            <p class="content">1. 
                방황하였으며, 그러므로 청춘 그들에게 것은 있다. 우리의 황금시대의 이상이 미인을 꽃이 심장은 같은 힘있다. 천고에 가슴에 꽃 목숨이 몸이 무엇을 때문이다. 맺어, 그들은 있는 온갖 청춘의 소금이라 청춘의 것이다. 전인 얼음에 찾아다녀도, 피가 붙잡아 있으랴? 목숨을 두기 갑 이상은 피가 풀밭에 동산에는 용기가 약동하다.</p>
            <p class="content">2. 리스트 항목</p>

            <hr>

            <p class="title">1. 주제 1</p>

            <p class="content">1. 리스트 항목</p>
            <p class="content">2. 리스트 항목</p>
            <p class="content">1. 리스트 항목</p>
            <p class="content">2. 리스트 항목</p>

            <hr>

            <p class="title">2. 주제 2</p>

            <p class="content">1. 리스트 항목</p>
            <p class="content">2. 리스트 항목</p>
            <p class="content">1. 리스트 항목</p>

        </div>

    </div>

<!-- footer -->
<jsp:include page="../common/footer.jsp" />

</body>
</html>