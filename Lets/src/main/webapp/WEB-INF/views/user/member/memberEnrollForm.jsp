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
	
	<!-- 회원가입 페이지-->
    <main>
        <br><br>
        <div class="register-wrapper">
            <div class="register-title">회원가입</div><br>
            
            <form action="insert.me" method="post" onsubmit="addressValue();">
	            <div class="register-email">
	                <div class="register-list">아이디</div>
	                <input type="hidden" id="memId" name="memId">
	                <div class="email-block1">
	                    <input type="text" class="form-control" id="userEmail1" name="userEmail1" placeholder="이메일을 입력해주세요" required>
	                    &nbsp;@&nbsp;
	                </div>
	                <div class="email-block2">
	                    <input type="text" class="form-control" id="userEmail2" name="userEmail2" style="width: 130px;" placeholder="직접 입력">
	
	                    <select id="emailSelect" class="emailSelect">
	                        <option value="">선택 하기</option>
	                        <option value="naver.com">naver.com</option>
	                        <option value="google.com">google.com</option>
	                        <option value="daum.net">daum.net</option>
	                        <option value="hanmail.net">hanmail.net</option>
	                        <option value="nate.com">nate.com</option>
	                        <option value="emailWrite">직접 입력</option>
	                    </select>
	                </div>
	                <div id="email-block3" class="genric-btn primary radius" onclick="checkId();">인증하기</div>
	                <!-- ajax 적용할것 : 아이디 중복체크 알림 -->
	                <div class="email-check"></div>
	            </div>
	
	            <br>
	            <div class="register-pwd">
	                <div class="register-list">비밀번호</div>
	                <div class="pwd-block1">
	                    <input type="password" class="form-control" id="memPwd" name="memPwd" minlength="8" placeholder="비밀번호를 입력해주세요" required >
	                </div>
	                <div class="pwd-check1"></div>
	                <br>
	                <div class="register-list">비밀번호 확인</div>
	                <div class="pwd-block2">
	                    <input type="password" class="form-control" id="memPwdCheck" name="memPwdCheck" placeholder="비밀번호를 입력해주세요" required > 
	                </div>
	                <div class="pwd-check2"></div>
	            </div>
	            
	            <br>
	            <div class="register-list">이름</div>
	            <div class="name-block">
	                <input type="text" class="form-control" id="memName" name="memName" maxlength="8" placeholder="이름을 입력해주세요" required>
	            </div>
	
	            <br>
	            <div class="register-list">닉네임</div>
	            <div class="nickname-block">
	                <input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임을 입력해주세요" required>
	            </div>
	            <!-- ajax 적용할것 : 닉네임 중복체크 -->
	            <div class="nickname-check"></div>
	
	            <br>
	            <div class="register-list">생년월일</div>
	            <div class="birth-block">
	                <input type="number" class="form-control" id="birthday" name="birthday" maxlength="6" placeholder="ex) 990101" required>
	            </div>
	            <div class="birth-check"></div>
	
	            <br>
	            <div class="register-list">성별</div>
	            <div class="gender-block">
	                <input type="radio" id="gender" name="gender" value="F" style="width: 20px; height: 20px;">&nbsp;&nbsp;여자
	                &nbsp;&nbsp;&nbsp;&nbsp;
	                <input type="radio" id="gender" name="gender" value="M" style="width: 20px; height: 20px;">&nbsp;&nbsp;남자
	            </div>
	
	            <br>
	            <div class="register-list">주소</div>
	            <input type="hidden" id="address" name="address">
	            <div class="address-block1">
	                <input type="text" class="form-control" id="postcode" name="postcode" placeholder="우편번호" readonly>
	            </div>
	            <div id="address-btn" class="genric-btn primary radius" onclick="findPostcode();">우편번호 찾기</div>
	            <div class="address-block2">
	                <input type="text" class="form-control" id="postAddress" name="postAddress" placeholder="도로명 주소" readonly>
	            </div>
	            <div class="address-block3">
	                <input type="text" class="form-control" id="detailAddress" name="detailAddress" placeholder="상세 주소 입력">
	            </div>
	            <div class="address-block4">
	                <input type="text" class="form-control" id="extraAddress" name="extraAddress" placeholder="참고 항목">
	            </div>
	            <div class="address-check"></div>
	
	            <br>
	            <div class="register-list">휴대전화</div>
	            <div class="phone-block">
	                <input type="number" class="form-control" id="phone" name="phone" maxlength="11" placeholder="'-'빼고 입력해주세요" required>
	            </div>
	            <div class="phone-check"></div>
	
	            <br>
	            <div class="register-info">
	                	회원 가입시 이용약관 개인정보수집 및 이용, <br> 개인정보 제공에 동의하는 것으로 간주합니다.<br><br>
	            </div>
	
	            <div class="register-btn">
	                <input type="submit"  class="genric-btn primary radius" value="회원가입 하기" >
	            </div>
	            <br>
            </form>
        </div>

    </main>
    <br><br><br>
<!-- 회원가입 페이지 끝-->

    <script>
	    $(function(){
	        $('.email-block2 input').hide();
	        $('.emailSelect').change(function(){
	            if($(".emailSelect").val()=='emailWrite'){
	                $(".email-block2 input").show();
	                $(".emailSelect").hide();
	            }else{
	                $('.email-block2 input').hide();
	            }  
	        });
	    });
	    
    	function checkId(){
    		var inputId = $(".email-block1 input[name=userEmail1]").val();
    		var inputDomain = $(".email-block2 input[name=userEmail2]").val();
    		var selectDomain = $("#emailSelect option:selected").val();
    		var checkEmail = RegExp('^[a-zA-Z0-9]$');
    		
   			var memId = inputId + '@';
   			if(selectDomain=="emailWrite"){ // 직접입력 선택한 경우
    			memId = memId + inputDomain;
       		}else{ // selectbox 값 선택한 경우
       			memId = memId + selectDomain;
       		}
       		$("#memId").val(memId);
       		
       		console.log('조합된 아이디 : '+$("#memId").val());
    		console.log('inputDomain 값: '+inputDomain);
       		
       		if((inputId!=="" && inputDomain!=="")||(inputId!=="" && selectDomain!=="")){
	       		$.ajax({
					url:"idCheck.me",
					data:{memId : $("#memId").val()},
					success:function(result){
						if(result == 'success'){
							$(".email-check").text("사용가능한 이메일입니다.");
						}else{
							$(".email-check").text("이미 존재하는 이메일 입니다.");
						}
					},
					error:function(){
						console.log("아이디 중복체크용 ajax 통신 실패");
					}
				})
       		}else if(!checkEmail.test(inputId)){
				$(".email-check").text("제대로된 이메일 형식으로 입력해주세요.");
       		}else if(inputDomain===""){
       			$(".email-check").text("이메일을 입력해주세요.");
       		}else{
				$(".email-check").text("유효한 이메일을 입력해주세요.");
       		}
    		
    	};
    	
    	var nicknameInput = $(".nickname-block input[name=nickname]");
    	
    	nicknameInput.keyup(function(){
    		if(nicknameInput.val().length >= 3){
	    		
    			$.ajax({
					url:"nicknameCheck.me",
					data:{nickname : nicknameInput.val()},
					success:function(result){
						if(result == 'success'){
							$(".nickname-check").text("사용가능한 닉네임입니다.");
						}else{
							$(".nickname-check").text("이미 사용중인 닉네임입니다.");
						}
					},
					error:function(){
						console.log("닉네임 중복체크용 ajax 통신 실패");
					}
				})
    		}else{
    			$(".nickname-check").text("");
    		}
    	});
    	
        var checkPwd= RegExp('^[a-zA-Z0-9][a-zA-Z0-9!@#$%]{7,20}$');
        var checkBirth = RegExp('^[0-9]{2}(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$');
        var checkPhone = RegExp('^[0][1][0-9]\\d{3,4}\\d{4}$');
        var checkAddress3 = RegExp('^[가-힣a-zA-Z0-9][가-힣a-zA-Z0-9\s]');

        $('.pwd-block1 input').focusout(function(){
            if($('#memPwd').val() != ""){
                if(!checkPwd.test($('#memPwd').val())){
                    $('.pwd-check1').text("특수문자 포함 최소 8자리 이상입력해주세요.");
                }else{
                    $('.pwd-check1').text("");
                }
            }
        });
        $('.pwd-block2 input').focusout(function(){
            if($('#memPwdCheck').val() != ""){
                if($('#memPwd').val() != $('#memPwdCheck').val()){
                    $('.pwd-check2').text("비밀번호가 일치하지 않습니다.");
                }else{
                    $('.pwd-check2').text("");
                }
            }
        });
           $('.birth-block input').focusout(function(){
            if($('#birthday').val()!=""){
                if(!checkBirth.test($('#birthday').val())){
                    $('.birth-check').text("'-'를 제외한 6자리 숫자로 입력해주세요.");
                }else{
                    $('.birth-check').text("");
                }
            }
        });
        $('.address-block3 input').focusout(function(){
            if($('#userAddress3').val()!=""){
                if(!checkAddress3.test($('#userAddress3').val())){
                    $('.address-check').text("상세 주소를 정확히 입력해주세요.");
                }else{
                    $('.address-check').text("");
                }
            }
            
        });
        /*
        $('.phone-block input').focusout(function(){
            if($('#phone').val()!=""){
                if(!checkPhone.test($('#phone').val())){
                    $('.phone-check').text("'-'를 제외한 휴대번호 11자리를 정확히 입력해주세요.");
                }else{
                    $('.phone-check').text("");
                }
            }
        });
        */
        
    </script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
    <script>
        function findPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
    
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수
    
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
    
                    if(data.userSelectedType === 'R'){
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        document.getElementById("extraAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("extraAddress").value = '';
                    }
    
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("postAddress").value = addr;
                    // 커서를 상세주소 필드로 이동
                    document.getElementById("detailAddress").focus();
                }
            }).open();
        }
         
       function addressValue(){
			var postcode = $(".address-block1 input[name=postcode]").val();
			var postAddress = $(".address-block2 input[name=postAddress]").val();
			var detailAddress = $(".address-block3 input[name=detailAddress]").val();
			var address = postcode+postAddress+detailAddress;
			$("#address").val(address);
			console.log(address);
       }
    </script>
	
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>