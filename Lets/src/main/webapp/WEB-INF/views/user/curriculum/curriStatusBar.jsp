<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div{
    box-sizing: border-box;
}
.curriculumn{
    padding-left: 10%;
    padding-right: 10%;
    height: 300px;
    background-color: rgb(46, 48, 146);
}
.curriculumn>div{
    float: left;
    height: 100%;
}

#curri_img{
    width: 30%;
}
#curri_img>img{
    padding: 10%;
    box-sizing: border-box;
}
#curri_info{
    width: 50%;
    color: white;
}
#curri_info>h1{
    margin-top: 40px; 
    margin-bottom: 40px;
}
#info{
    margin-right: 10px;
    font-size: 20px;
    font-weight: 700;
}
.star{
    color: rgb(241,196,15);
    margin-right: 0px;
    font-size: 18px;
    font-weight: bold;
}
#curri_info>p{
    font-size: 15px;
    font-weight: 600;
}
#curri_bar{
    height: 30px;
    width: 80%;
    background-color: gray;
}
#curri_status{
    float: left;
    height: 100%;
    width: 22.2%;
    background-color: white;
}

#curri_btn{
    width: 20%;
}
#curri_btn>button{
    width: 80%;
    height: 50px;
    background-color: white;
    border: none;
    color: rgb(46, 48, 146);
    font-size: 16px;
    font-weight: bold;
    margin-top: 200px;
}

.btn:hover{cursor: pointer;}
</style>
</head>
<body>
    <div class="curriculumn">

        <div id="curri_img">
            <img src="resources/user/assets/img/curriculum/empty.png" id="curri_main_img" width="100%" height="100%" class="imgPop btn">
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

            <p>진도율 : 2강/9강 (22.2%)</p>

            <div id="curri_bar">

                <div id="curri_status"></div>

            </div>

        </div>

        <div id="curri_btn">
            
            <button class="btn">학습하기</button>

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