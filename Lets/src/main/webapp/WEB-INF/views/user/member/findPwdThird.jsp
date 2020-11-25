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

	<!-- 비밀번호 찾기 페이지-->
	<main>
	    <br><br>
	    <div class="find-wrapper">
	        <div class="findPwd-title">비밀번호 찾기 03</div><br><br>
	        <div class="findPwd-info">01 아이디 입력&nbsp;&nbsp;>&nbsp;&nbsp;02 본인 확인&nbsp;&nbsp;>&nbsp;&nbsp;03 비밀번호 재설정</div>
	        <div class="findPwd-content1">
	           	새로운 비밀번호를 입력해주세요
	        </div>
	        <form action="updatePwd.me" method="post">
		        <div class="findPwd-content4">
		        	<input type="hidden" id="memId" name="memId" value="${m.memId}">
		            <table class="inputNewPwd">
		                <tr>
		                    <th>새로운 비밀번호</th>
		                    <td><input type="password" class="form-control" id="memPwd" name="memPwd" minlength="8" required></td>
		                </tr>
		                <tr>
		                	<td></td>
		                    <td id="checkPwdMessage"></td>
		                </tr>
		            </table>
		        </div>
		        <br>
		        <div class="findPwd-btn2">
		            <input type="submit" class="genric-btn primary radius" style="float: left; margin-right: 30px;" value="변경하기">
		        </div>
		        <br><br>
			</form>
			
	    </div>
		<br><br><br>
		
		<script>
			var checkPwd= RegExp('^[a-zA-Z0-9][a-zA-Z0-9!@#$%]{7,20}$');
			
			$('.inputNewPwd input').focusout(function(){
	            if($('#memPwd').val() != ""){
	                if(!checkPwd.test($('#memPwd').val())){
	                	$('#checkPwdMessage').text("특수문자 포함 최소 8자리 이상으로 입력해주세요.");
	                }else{
	                	$('#checkPwdMessage').text("");
	                }	
	            }
	        });
		</script>
		
	</main>
	<!-- 비밀번호 찾기 페이지 끝-->

	<jsp:include page="../common/footer.jsp" />
</body>
</html>