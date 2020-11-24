<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/user/assets/css/style.css">
<link rel="stylesheet" href="resources/user/assets/css/member.css">
</head>
<body>
	<jsp:include page="../common/navBar.jsp" />
	
	<!-- 비밀번호 찾기 페이지-->
	<main>
	    <br><br>
	    <div class="find-wrapper">
	        <div class="findPwd-title">비밀번호 찾기 01</div><br>
	        <div class="findPwd-info">01 아이디 입력&nbsp;&nbsp;>&nbsp;&nbsp;02 본인 확인&nbsp;&nbsp;>&nbsp;&nbsp;03 비밀번호 재설정</div>        <div class="findPwd-content1">
	            	비밀번호를 찾고자 하는 아이디를 입력해주세요.
	        </div>
	        <div class="findPwd-content2">
	            <table>
	                <tr>
	                    <th>아이디 </th>
	                    <td><input type="text" class="form-control" id="memId" name="memId" required></td>
	                </tr>
	            </table>
	        </div>
	        <br>
	        <div class="findPwd-btn1">
	            <div class="genric-btn primary radius" onclick="findPwd();" style="float: left; margin-right: 30px;">다음</div>
	        </div>
	        <br><br>
	
	        <script>
	            function findPwd(){
	            	$.ajax({
						url:"findPwdFirst.me",
						data:{memId : $("#memId").val()},
						success:function(result){
							if(result == 'success'){
								location.href="findPwdSecond.me";
							}else{
			            		alert("해당 아이디가 존재하지 않습니다.");
								location.href="redirect:/"
							}
						},
						error:function(){
							console.log("아이디 중복체크용 ajax 통신 실패");
						}
					})
	            }
	        </script>
	
	    </div>
	<br><br><br>
	</main>
	<!-- 비밀번호 찾기 페이지 끝-->

	<jsp:include page="../common/footer.jsp" />
</body>
</html>