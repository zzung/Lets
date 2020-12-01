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
<link rel="stylesheet" href="resources/user/assets/css/curriculum.css">
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

    <span class="button clicked" onclick="moving('detailFAQ.cr');">
        FAQ
    </span>

    <hr>

    <div id="FAQ_box">
        
        <span id="title">FAQ</span>
        
        <br><br>
		
		<c:forEach var="faq" items="${ faqList }">
		
	        <p class="head">${ faq.faqQuestion }</p>
	
	        <p class="black">${ faq.faqAnswer }</p>
	        
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