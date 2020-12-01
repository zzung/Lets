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

        <span class="button" onclick="moving('lessonInfo.cr');">
           	 클래스 소개
        </span>

        <span class="button" onclick="moving('detailFAQ.cr');">
            FAQ
        </span>

        <hr>

        <div id="top_box">

            <!-- Q&A 창 -->
            <div id="qna_box">
                
                <span class="button" onclick="moving('detailQNA.cr');">Q&A</span>

                <div id="question">

                    <div class="img_box">
                        <img src="${ qna.memPic }" alt="user" height="100%">
                    </div>

                    <p class="black">
                        ${ qna.question }
                    </p>

                </div>

                <div id="answer">

                    <div class="img_box">
                        <img src="${ qna.tutorPic }" alt="tutor" height="100%">
                    </div>

                    <p class="black">
                        ${ qna.answer }
                    </p>

                </div>
    
            </div>
            
            <div style="width: 10%;"></div>

            <!-- 상태창 -->
            <!-- 오프라인 수업에는 어떤 정보를 표시..? -->
            <div id="info_box">
    
                <span>내 학습 사항</span>

                <h1>${ videoCount }/${ lesson.lessonContNo } 완료</h1>

            </div>

        </div>

        <!-- 커리큘럼 area -->
        <div id="curri">

            <span>커리큘럼</span>

            <br><br><br>
            
            <c:forEach var="curriculum" items="${ curriculumList }">
            	<c:choose>
            		<c:when test="${ curriculum.curLevel eq 1 }">
            			<p class="title">${ curriculum.curriculumCont }</p>			
            		</c:when>
            		<c:otherwise>
            			<p class="content">${ curriculum.curriculumCont }</p>		
            		</c:otherwise>
            	</c:choose>
            </c:forEach>
            

            

        </div>

    </div>
    
    <script>
    	function moving(e){
    		location.href = e + "?lessonNo=" + ${ lesson.lessonNo };
    	}
    </script>

<!-- footer -->
<jsp:include page="../common/footer.jsp" />

</body>
</html>