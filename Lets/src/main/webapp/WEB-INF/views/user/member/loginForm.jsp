<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lets</title>
<link rel="stylesheet" href="resources/user/assets/css/style.css">
<link rel="stylesheet" href="resources/user/assets/css/member.css">
</head>
<body>
    <jsp:include page="../common/navBar.jsp" />
    
    <!-- 로그인 페이지-->
    <main>
        <br><br>
        <div class="wrapper">
            <div class="login-content">
                <div class="login-content1">
	                <form id="loginForm" action="login.me" method="post">
	                    <div class="login-top">로그인</div>
	                    <br>
	                    <div>이메일</div>
	                    <div><input type="text" placeholder="이메일을 입력해주세요" id="memId" name="memId" class="form-control" required></div>
	                    <div><a href="findId.me">아이디를 잊으셨나요?</a></div>
	                    <br>
	                    <div>비밀번호</div>
	                    <div><input type="password" placeholder="비밀번호를 입력해주세요" id="memPwd" name="memPwd" class="form-control" required></div>
	                    <div><a href="findPwdForm.me">비밀번호를 잊으셨나요?</a></div>
	                    <div class="login-join"><a href="enrollForm.me">회원가입 하기</a></div>
	                    <br><br>
	                    <div class="login-bottom">
	                        <input type="submit" class="genric-btn primary radius" value="로그인 하기"><br>
	                        <input type="submit" class="genric-btn success radius" onclick="loginSubmit(2);" value="네이버로 시작하기"><br>
	                        <input type="submit" class="genric-btn warning radius" onclick="loginSubmit(3);" value="카카오로 시작하기" style="color: black;">
	                        <br>
	                        <div style="font-size: 12px; font-weight: normal; text-align: center; margin-top: 15px;">
	                              	최초 로그인 시 <br> 이용약관 개인정보수집 및 이용, 개인정보 제공에 <br>동의하는 것으로 간주합니다
	                        </div>
	                    </div>
					</form>
                    <br><br><br><br><br>
                </div>

				<script>
				/*
					function loginSubmit(num){
						if(num==1){
							$('#loginForm').attr("action", "login.me").submit();
						}else if(num==2){
							
						}else{
							
						}
					}
				*/
				</script>

                <div class="login-content2">
                    <img src="resources/user/assets/img/member/skateboard-1030929_1920.jpg" width="600px" height="650px">
                </div>
                <div style="clear:both"></div>

            </div>
        </div>

    </main>
	<!-- 로그인 페이지 끝-->
    
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>