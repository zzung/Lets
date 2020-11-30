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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
    .findPwd-info3{
        position: relative; 
        display: inline-block; 
        cursor: pointer;
    }
    .findPwd-info3 .tt-text{ 
        visibility: hidden; 
        width: 300px; 
        background-color:rgb(46, 48, 146);
        color: white; 
        text-align: center; 
        border-radius: 10px; 
        padding: 10px 5px; 
        position: absolute; 
        z-index: 1;
        top: 200%; 
        left: 50%; 
        margin-left:-150px;
    }
    .findPwd-info3 .tt-text::after { 
        content: ""; 
        position: absolute; 
        bottom: 100%; 
        left: 50%; 
        margin-left: -10px; 
        border-width: 10px; 
        border-style: solid; 
        border-color: transparent transparent rgb(46, 48, 146); transparent; 
    }
    .findPwd-info3:hover .tt-text{ 
        visibility: visible;
    }
</style>
</head>
<body>
	<jsp:include page="../common/navBar.jsp" />
	
	<!-- 비밀번호 찾기 페이지-->
	<main>
		    <br><br>
		    <div class="find-wrapper">
		    	<form id="findPwdSecond" action="" method="post">
		        <div class="findPwd-title">비밀번호 찾기 02</div><br>
		        <div class="findPwd-info2">회원 정보에 등록한 이메일로 인증</div>
		        <div class="findPwd-content1">
		           	회원 정보에 등록한 이메일 주소와 입력한 이메일 주소가 같아야 인증번호를 받을 수 있습니다.
		        </div>
		        <div class="findPwd-info">01 아이디 입력&nbsp;&nbsp;>&nbsp;&nbsp;02 본인 확인&nbsp;&nbsp;>&nbsp;&nbsp;03 비밀번호 재설정</div><br>
		        <div class="findPwd-content3">
		            
		            <table>
		                <tr>
		                    <th>이메일</th>
		                    <td><input type="text" class="form-control" id="memId" name="memId" required></td>
		                    <td>
		                        <div id="sendNumber" class="genric-btn primary radius" onclick="sendEmailCheckNumber();" style="margin-left: 30px;">인증번호 받기</div>
		                    </td>
		                </tr>
		                <tr>
		                    <th>인증번호</th>
		                    <td><input type="text" class="form-control" id="checkNumber" name="checkNumber" required></td>
		                </tr>
		            </table>
		        </div>
		        
               	<input type="hidden" id="firstStepId" name="firstStepId" value="${firstStepId}">
               	<input type="hidden" id="randNum" name="randNum">
               	
		        <div class="findPwd-info3">인증번호가 오지 않나요?
		            <span class="tt-text">스팸 메세지로 등록되어 있는 것은 아닌지 <br>확인해주세요. <br>스팸 메세지로 등록되어 있지 않다면,<br> 새로고침 후 다시 한 번 '인증번호 받기'를<br> 눌러주세요.</span>
		        </div>
		        <div class="findPwd-btn2">
		            <div class="genric-btn primary radius" onclick="compareCheckNumber();" style="float: left; margin-right: 30px;">인증하기</div>
		        </div>
		        <br><br><br><br>
				</form>
				
		       <script>
		       		// 이메일로 인증번호 전송
		            function sendEmailCheckNumber(){
		       			if(!$('#memId').val()){
		       				alert('이메일을 입력해주세요 !');
		       			}else{
		       				var randNum = Math.floor((Math.random()*900000)+100000);
		       				
		       				if($('#memId').val()!=$("#firstStepId").val()){
		       					alert('[비밀번호 찾기 01] 에서 입력했던 이메일을 입력해주세요 !');
		       				}else{
		       					$("#randNum").val(randNum);
			       				$.ajax({
									url:"sendEmailCheck.me",
									data:{randNum: randNum,
										  memId: $("#memId").val()	
									},
									success:function(result){
										if(result=='success'){
						       				alert('인증번호가 발송되었습니다.');
										}else{
											alert('인증번호 발송 Error ! 관리자에게 문의하세요.');
										}
									},
									error:function(){
										console.log('이메일 발송 ajax오류');
									}
								})
		       				}
		       			}
		            };
		
	                // 인증번호가 일치하는지 확인
		            function compareCheckNumber(){
	                	if((!$('#memId').val()) && (!$('#checkNumber').val())){
	                		alert('인증번호를 입력해주세요 !');
	                	}else{
	                		$.ajax({
								url:"compChecknum.me",
								data:{checkNumber: $('#checkNumber').val(),
									  randNum: $('#randNum').val()	
								},
								success:function(result){
									if(result=='success'){
										alert('성공적으로 인증되었습니다.');
										$("#findPwdSecond").attr("action", "findPwdThird.me").submit();
									}else{
										alert('인증번호가 일치하지 않습니다. 인증번호를 다시 한번 입력해주세요.');
									}
								},
								error:function(){
									console.log('비밀번호찾기 step2 ajax오류');
								}
							})
	                	}
		            }
	           </script> 
		
		    </div>
		<br><br><br>
	</main>
	<!-- 비밀번호 찾기 페이지 끝-->
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>