<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 이용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	#curri_status{
	    float: left;
	    height: 100%;
	    background-color: white;
	}
	#curri_info>h1:hover{cursor:pointer;}
</style>
</head>
<body>
    <div class="curriculumn">

        <div id="curri_img">
            <img src="${ lesson.lessonCoverImg }" id="curri_main_img" width="100%" height="100%" class="imgPop button">
        </div>

        <div id="curri_info">
            <h1 onclick="location.href='detailCurri.cr?lessonNo=${lesson.lessonNo}';">${ lesson.lessonTitle }</h1>

            <span id="info">클래스 평가 &nbsp;${ avgStar } </span>
			
			<c:forEach var="v" begin="1" end="5">
				<c:choose>
					<c:when test="${ v <= avgStar }">
						<span class="star">★</span>
					</c:when>
					<c:otherwise>
			        	<span class="star">☆</span>			
					</c:otherwise>
				</c:choose>
	        </c:forEach>			
	        
            <br><br>
			
			<c:if test="${ loginUser.memNo != 2 and loginUser.memNo != 3 and loginUser.memNo != 4 and loginUser.memNo != 5 }">
			
			<c:set var="videoStep" value="${ videoCount/lesson.lessonContNo }" />			
			
	            <p class="white">진도율 : ${ videoCount }강/${ lesson.lessonContNo }강 (<fmt:formatNumber value="${ videoStep }" type="percent" />)</p>
	
	            <div id="curri_bar">
	
	                <div id="curri_status" style="width: <fmt:formatNumber value="${ videoStep }" type="percent" />"></div>
	
	            </div>
            
            </c:if>

        </div>

		<c:if test="${ loginUser.memNo != 2 and loginUser.memNo != 3 and loginUser.memNo != 4 and loginUser.memNo != 5 }">
		
	        <div id="curri_btn">
	            
	            <button class="button" onclick="location.href='videoList.cr?lessonNo=${ lesson.lessonNo }';">학습하기</button>
	
	        </div>
        
        </c:if>

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
</body>
</html>