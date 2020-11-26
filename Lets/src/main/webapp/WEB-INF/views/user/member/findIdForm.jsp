<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                	회원 가입시 입력하신 이름과 생년월일로 일치하는 아이디를 찾습니다.
            </div>
           	<form action="findIdResult.me" method="post">
            	<div class="findId-content2">
	                <table>
	                    <tr>
	                        <th>이름</th>
	                        <td><input type="text" class="form-control" id="memName" name="memName" required></td>
	                    </tr>
	                    <tr>
	                        <th>생년월일</th>
	                        <td><input type="text" class="form-control" id="birthday" name="birthday" required></td>
	                    </tr>
	                </table>
            	</div>
            	<br>
            	<div class="findId-btn">
                	<input type="submit" class="genric-btn primary radius" value="아이디 찾기"><br>
            	</div>
            </form>
        </div>
    <br><br><br>
	<!-- 아이디 찾기 페이지 끝-->
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>