<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 이용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <div class="curriculumn">

        <div id="curri_img">
            <img src="resources/user/assets/img/curriculum/empty.png" id="curri_main_img" width="100%" height="100%" class="imgPop button">
        </div>

        <div id="curri_info">
            <h1>클래스 제목</h1>

            <span id="info">클래스 평가 4.5/5</span>

            <span class="star">★</span>
            <span class="star">★</span>
            <span class="star">★</span>
            <span class="star">★</span>
            <span class="star">☆</span>

            <br><br><br>

            <p class="white">진도율 : 2강/9강 (22.2%)</p>

            <div id="curri_bar">

                <div id="curri_status"></div>

            </div>

        </div>

        <div id="curri_btn">
            
            <button class="button">학습하기</button>

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
</body>
</html>