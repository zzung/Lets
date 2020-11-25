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

    <span class="button">
        클래스 소개
    </span>

    <span class="button clicked">
        FAQ
    </span>

    <hr>

    <div id="FAQ_box">
        
        <span id="title">FAQ</span> <br><br>

        <p class="head">Q. 요가는 처음인데 할 수 있을까요?</p>

        <p class="black">있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살 수 있는</p>

        <p class="head">Q. 요가는 처음인데 할 수 있을까요?</p>

        <p class="black">있으며 인생을 풍부하게 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살 수 있는</p>

    </div>

</div>

<!-- footer -->
<jsp:include page="../common/footer.jsp" />

</body>
</html>