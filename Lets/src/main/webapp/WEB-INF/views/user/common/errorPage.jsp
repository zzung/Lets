<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/user/assets/css/style.css">
<link rel="stylesheet" href="resources/user/assets/css/member.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<jsp:include page="../common/navBar.jsp" />
	
	<main>
        <br><br>
        <div class="errorImg" align="center">
            <div style="font-size: 17px; font-weight: bold; margin-bottom: 30px; color: gray;">오류가 발생했습니다</div>
            <img src="resources/user/assets/img/member/iconmonstr-error-4-240.png" width="200" height="200">
            <div style="font-weight:bold; font-size: 17px; margin-top: 30px; color: rgb(46, 48, 146);">${errorMsg}</div>
        </div>
	    <br><br><br>
    </main>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>