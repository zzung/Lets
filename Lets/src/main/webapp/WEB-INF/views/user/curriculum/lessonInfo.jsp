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

    <span class="button clicked">
        클래스 소개
    </span>

    <span class="button">
        FAQ
    </span>

    <hr>

    <div id="lesson_box">

        <span id="lesson_title">클래스 소개</span>

        <br><br><br>

        <img src="resources/user/assets/img/curriculum/calendar.png" alt="calendar" height="40px" style="margin-left: 5%;">

        <span class="hold">25주 수강 가능</span>

        <img src="resources/user/assets/img/curriculum/media.png" alt="calendar" height="40px">

        <span class="hold">15개 컨텐츠</span>

        <br><br><br>

		<!-- 한 세트  -->
        <img class="imgPop" src="resources/user/assets/img/curriculum/empty.png" border="1px" width="90%" height="250px" style="margin-left: 5%;">

        <div class="textarea">
            	설레는 말이다 청춘! 너의 두손을 가슴에 대고 물방아 같은 심장의 고동을 들어 보라 청춘의 피는 끓는다 끓는 피에 뛰노는 심장은 거선의 기관과 같이 힘있다 이것이다 인류의 역사를 꾸며 내려온 동력은 바로 이것이다
        </div>

    </div>

</div>

<script>
    $(function() {

        $(".imgPop").click(function() {
            imgPop(this.src);
        });

    });

    function imgPop(url){
        var img=new Image();
        img.src=url;
        var img_width=img.width;
        var win_width=img.width;
        var img_height=img.height;
        var win=img.height;
        var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+img_height+', menubars=no, scrollbars=no');
        OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
    }

</script>

<!-- footer -->
<jsp:include page="../common/footer.jsp" />

</body>
</html>