<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style> 
    .tutorFaq{font-size: 17px;margin-left: 5%;}
    #faqClick{height: 20px; height: 20px;margin-top: 5px;float: right;}
    #hrBorder{border-color: rgb(75, 73, 73); width: 750px;}
    .tutorFaqCon{margin-left: 5%;font-size:15px}
</style>
<link rel="stylesheet" href="resources/user/assets/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<!--메뉴바 넣을 자리-->
    <jsp:include page="../user/common/navBar.jsp" />
    
    <br><br>
    <div class="tutorMain" >
        <div class="tutorContent" style="text-align: center; ">
            <img src="resources/user/images/tutorMain.jpg" alt="" style="width: 900px; height: 550px;"> <br><br>
            <p style="font-size: 18px;font-weight: bold;">여러분이 경험한 모든 것들, <br> 함께 공유하면 <br> 더욱 큰 경험이 될 거에요.</p> <br>
            <p style="font-size: 23px;font-weight: bold;">레츠에서 당신의 재능을 보여주세요 !</p> <br>
            <p style="font-size: 18px;"><a href="#" class="genric-btn primary e-large" style="text-decoration:none";>튜터 도전하기</a></p>
            <br><br><br>
            <p style="font-size: 25px;font-weight: bold;">레츠 튜터, 어떻게 될 수 있나요 ?</p>
            <div class="stepImg" style="height: 250px;">
                <div id="step1" style="float: left; margin-left: 23%;">
                    <img src="resources/user/images/step1.jpg" alt=""><br><br>
                    <span style="color: gray; font-size: 15px;">step1</span><br>
                    <span style="font-size: 15px;">튜터 및 클래스 등록</span><br><br>
                    <span style="font-size: 13px;">어떤 클래스를 진행할 건지<br>수업 소개와 튜터 소개를<br>정성스럽게 작성해 주세요.</span>
                </div>
                <div style="float: left; width: 50px;">
                    <p style="font-size: 50px; margin-top: 100px;">&gt;</p>
                </div>
                <div id="step2" style="float: left;">
                    <img src="resources/user/images/step2.jpg" alt="" height="60px"><br><br>
                    <span style="color: gray; font-size: 15px;">step2</span><br>
                    <span style="font-size: 15px;">클래스 심사</span><br><br>
                    <span style="font-size: 13px;">등록하신 클래스 소개를<br>매니저가 확인 후<br>튜터 등록을 도와드립니다.</span>
                </div>
                <div style="float: left; width: 50px;">
                    <p style="font-size: 50px; margin-top: 100px;">&gt;</p>
                </div>
                <div id="step3" style="float: left;">
                    <img src="resources/user/images/step3.jpg" alt=""><br><br>
                    <span style="color: gray; font-size: 15px;">step3</span><br>
                    <span style="font-size: 15px;">클래스 오픈</span><br><br>
                    <span style="font-size: 13px;">클래스 오픈이 결정되면<br>맞춤 추천 알고리즘으로<br>많은 회원들에게 공유가 됩니다..</span>
                </div>
                <div style="float: left; width: 50px;">
                    <p style="font-size: 50px; margin-top: 100px;">&gt;</p>
                </div>
                <div id="step4" style="float: left;">
                    <img src="resources/user/images/step4.jpg" alt=""><br><br>
                    <span style="color: gray; font-size: 15px;">step4</span><br>
                    <span style="font-size: 15px;">클래스 런칭 및 정산</span><br><br>
                    <span style="font-size: 13px;">제작된 클래스가 런칭되면<br>회원들이 클래스를<br>수강할 수 있게 됩니다.<br>이후 클래스 판매 수익을<br>매달 정산 받을 수 있습니다.</span>
                </div>
            </div>
            <br><br><br><br>
            <p style="font-size: 25px;font-weight: bold;">레츠 튜터 FAQ</p><br><br>
            <div id="tutorFaqList" style="width: 700px;margin-left: 25%;height: 40px;text-align: left;height: auto;">
                <hr id="hrBorder">
                <div class="tutorFaq">튜터 등록은 무료인가요?&nbsp;&nbsp;<img src="resources/user/images/tutorFaq.jpg" id="faqClick" alt=""></div>
                <p class="tutorFaqCon" style="display: none;text-align: left;">
			         <br>          
			                    튜터 등록은 무료입니다. <br>
			                    수강생과 매칭이 되기 전까지는 수수료가 전혀 발생하지 않습니다!<br>  
			                    레츠 수수료는 다 회차일 경우 첫 1시간 수업료, 원데이일 경우 전체 수업료의 20% 입니다.
                </p>
                <hr id="hrBorder">
                <div class="tutorFaq">어떤 클래스를 등록할 수 있나요?&nbsp;&nbsp;<img src="resources/user/images/tutorFaq.jpg" id="faqClick" alt=""></div>
                <p class="tutorFaqCon" style="display: none;text-align: left;">
			         <br>          
			                    본인이 공유하고 싶은 클래스를 등록해 주시면 됩니다. <br>
			                    자신의 재능을 레츠에서 마음껏 펼쳐보세요!<br>
			                    관리자의 승인이 떨어진다면 클래스가 등록됩니다^^
			    </p>
                <hr id="hrBorder">
                <div class="tutorFaq">클래스 등록을 위해서는 어떤것이 필요한가요 ?&nbsp;&nbsp;<img src="resources/user/images/tutorFaq.jpg" id="faqClick" alt=""></div>
                <p class="tutorFaqCon" style="display: none;text-align: left;">
                <br>
			                    클래스 등록을 위해서 본인 소개와 클래스 주제, 클래스 세부주제가 필요합니다.<br>
			                    온라인 강의일 때는 동영상 주소를 같이 첨부해 주시기 바랍니다.
                </p>
                <hr id="hrBorder">
                <div class="tutorFaq">클래스 가격은 어떻게 정해야 하나요 ?&nbsp;&nbsp;<img src="resources/user/images/tutorFaq.jpg" id="faqClick" alt=""></div>
                <p class="tutorFaqCon" style="display: none;text-align: left;">
                <br>
				         관리자와 상의 한 후 결정하게 됩니다.<br>
				         수수료 20%를 포함한 가격으로 클래스 가격이 매겨집니다.
                </p>
                <hr id="hrBorder">
                <div class="tutorFaq" >준비물은 직접 보내는 방식인가요?&nbsp;&nbsp;<img src="resources/user/images/tutorFaq.jpg" id="faqClick" alt=""></div>
                <p class="tutorFaqCon" style="display: none;text-align: left;">
                <br>
			                    그렇습니다!<br>
			                    튜터님이 필요하다고 생각하는 준비물을 직접 선택하고 보내실 수 있습니다.<br>
			                    클래스가 시작되기 전에 미리 준비해 두세요!
                </p>
                <hr id="hrBorder">
            </div>
            <br><br><br><br><br>
        </div>
    </div>
    <script>
        $(function(){
            $(".tutorFaq").click(function(){
                var $con = $(this).next(); 
                if($con.css("display") == "none"){
                    $(this).siblings(".tutorFaqCon").slideUp();
                    $con.slideDown();
                }else{
                    $con.slideUp();
                }
            });
        });
    </script>

    <!-- 푸터바 넣을 자리-->
	<jsp:include page="../user/common/footer.jsp" />
</body>
</html>