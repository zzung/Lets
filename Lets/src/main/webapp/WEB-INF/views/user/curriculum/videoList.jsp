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

    <span class="button" onclick="moving('detailFAQ.cr');">
        FAQ
    </span>

    <hr>

    <div id="video_box">

        <span>교육과정</span>
        <br><br><br>

        <div id="btn_box">

            <span class="button" id="all_open">모두 펼치기</span>
        
            <span id="point" style="margin-left: 20px;">${ lesson.lessonContNo }강의</span>

        </div>

        <div id="blank"></div>
        
        <c:forEach var="video" items="${ videoList }" varStatus="status">

	        <div class="show button">
	
	            <img src="resources/user/assets/img/curriculum/plus.png" alt="show" height="100%">
	
	            <span>${ video.videoCont }</span>
	
	        </div>
	
	        <div class="video button" onclick="location.href='detailVideo.cr?videoNo=${ video.videoNo }&memNo=${ loginUser.memNo }&lessonNo=${ lesson.lessonNo }';">
	
				<c:choose>
					<c:when test="${ video.status == 'N' }">		
		            	<img src="resources/user/assets/img/curriculum/play.png" alt="play" height="100%">
		            </c:when>
		            <c:otherwise>
						<img src="resources/user/assets/img/curriculum/check.png" alt="done" height="100%">
					</c:otherwise>
	            
	            </c:choose>
	            
		            <span>${ video.videoName }</span>
	
	        </div>
	        
        </c:forEach>

    </div>

</div>


<script>
	function moving(e){
		location.href = e + "?lessonNo=" + ${ lesson.lessonNo };
	}
	
    $(function() {
        // 비디오 창 show/hide
        $(".show").click(function() {

            if($(".video").css("display") == "none") {
                $("#all_open").text("모두 펼치기");
            } else {
                $("#all_open").text("모두 접기");
            }


            var $video = $(this).next();

            if($video.css("display") == "none") {
                $video.show();
                $("#all_open").text("모두 접기");
            } else {
                $video.hide();
                $("#all_open").text("모두 펼치기")
            }
        });

        // 비디오 창 all open/all close
        $("#all_open").click(function() {

            if($(this).text() == "모두 접기") {
                $(".video").hide();
                $(this).text("모두 펼치기");
            } else {
                $(".video").show();
                $(this).text("모두 접기");
            }
        });

    })
</script>

<!-- footer -->
<jsp:include page="../common/footer.jsp" />

</body>
</html>