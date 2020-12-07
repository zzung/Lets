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

    <span class="button clicked" onclick="moving('lessonInfo.cr');">
       	 클래스 소개
    </span>

    <span class="button" onclick="moving('detailFAQ.cr');">
        FAQ
    </span>

    <hr>

    <div id="lesson_box">

        <span id="lesson_title">클래스 소개</span>

        <br><br><br>

        <img src="resources/user/assets/img/curriculum/calendar.png" alt="calendar" height="40px" style="margin-left: 5%;">

        <span class="hold">${ lesson.period } 주 수강 가능</span>

        <img src="resources/user/assets/img/curriculum/media.png" alt="calendar" height="40px">

        <span class="hold">${ lesson.totalCount }개 컨텐츠</span>

        <br><br><br>

		<!-- 한 세트  -->
        <img class="imgPop" src="${ lesson.lessonCoverImg }" border="1px" width="90%" height="250px" style="margin-left: 5%;">

        <div class="textarea">
            	${ lesson.lessonInstr }
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

    function moving(e){
		location.href = e + "?lessonNo=" + ${ lesson.lessonNo };
	}
    
</script>

<!-- footer -->
<jsp:include page="../common/footer.jsp" />

</body>
</html>