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
<div id="detail_video_box">

    <h1>영상 제목</h1>

    <div class="iframe_box">
        <iframe src="https://www.youtube.com/embed/Nl199fznWzM" frameborder="0" allowfullscreen></iframe>
    </div>

    <h3>영상 소개</h3>

    <div id="video_button_box" align="center">
        <button class="video_button" onclick="">이전 강의</button>
        <button class="video_button" onclick="history.back();">목록으로</button>
        <button class="video_button" onclick="">다음 강의</button>
    </div>

</div>

<!-- footer -->
<jsp:include page="../common/footer.jsp" />

</body>
</html>