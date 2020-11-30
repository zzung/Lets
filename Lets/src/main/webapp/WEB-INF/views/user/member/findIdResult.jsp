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
	
	<!-- 아이디찾기 페이지-->
	<main>
	    <br><br>
	    <div class="find-wrapper">
	        <div class="findId-title">아이디 찾기</div><br>
	        <div class="findId-content1">
	            	회원님의 정보와 일치하는 아이디 목록입니다.
	        </div>
	            	<c:choose>
	            		<c:when test="${!empty mem}">
					        <div class="findId-content4" style="text-align: center;">
					            <table>
					                <tr><th>${mem.memId}</th></tr>
					                <tr><td style="font-size:13px;">가입일 ( ${mem.enrollDate} )</td></tr>
					            </table>
					        </div>
	            		</c:when>
	            		<c:otherwise>
	            			<div class="findId-content4">
					            <table>
					                <tr>
					                    <th>${errorMsg}</th>
					                </tr>
					            </table>
					        </div>
	            		</c:otherwise>
	            	</c:choose>
	        <br>
	        <div class="findId-btn2">
	            <div class="genric-btn primary radius" onclick="location.href='loginForm.me';" style="float: left; margin-right: 30px;">로그인 하기</div>
	            <div class="genric-btn primary-border radius" onclick="location.href='findPwdForm.me';" style="float: left;">비밀번호 찾기</div>
	        </div>
        	<br><br>
        </div>
    </main>
	<br><br><br>
	<!-- 아이디 찾기 페이지 끝-->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>