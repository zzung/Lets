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
            
            <div class="register-email">
                <div class="register-list">아이디</div>
                <div class="email-block1">
                    <input type="text" class="form-control" id="userEmail1" name="userEmail1" placeholder="이메일을 입력해주세요" required>
                    &nbsp;@&nbsp;
                </div>
                <div class="email-block2">
                    <input type="text" class="form-control" id="userEmail2" name="userEmail2" style="width: 130px;">

                    <select id="" class="email-select" name="">
                        <option value="">선택 하기</option>
                        <option value="naver.com">naver.com</option>
                        <option value="google.com">google.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="nate.com">nate.com</option>
                        <option value="emailSelect">직접 입력</option>
                    </select>
                </div>
                <div id="email-block3" class="genric-btn primary radius">인증받기</div>
                <!-- ajax 적용할것 : 아이디 중복체크 알림 -->
                <div class="email-check">이미 존재하는 이메일 입니다.</div>
                <div class="email-checkNum">
                    <input type="number" class="form-control" id="" name="" placeholder="인증번호를 입력해주세요" required >
                </div>
                <div class="email-number-check">인증번호가 일치하지 않습니다.</div>
            </div>

            <br>
            <div class="register-pwd">
                <div class="register-list">비밀번호</div>
                <div class="pwd-block1">
                    <input type="password" class="form-control" id="userPwd" name="userPwd" minlength="10" placeholder="비밀번호를 입력해주세요" required >
                </div>
                <div class="pwd-check1"></div>
                <br>
                <div class="register-list">비밀번호 확인</div>
                <div class="pwd-block2">
                    <input type="password" class="form-control" id="userPwdCheck" name="userPwdCheck" placeholder="비밀번호를 입력해주세요" required > 
                </div>
                <div class="pwd-check2"></div>
            </div>
            
            <br>
            <div class="register-list">이름</div>
            <div class="name-block">
                <input type="text" class="form-control" id="" name="" maxlength="8" placeholder="이름을 입력해주세요" required>
            </div>

            <br>
            <div class="register-list">닉네임</div>
            <div class="nickname-block">
                <input type="text" class="form-control" id="" name="" placeholder="닉네임을 입력해주세요" required>
            </div>
            <!-- ajax 적용할것 : 닉네임 중복체크 -->
            <div class="nickname-check">이미 사용중인 닉네임입니다. </div>

            <br>
            <div class="register-list">생년월일</div>
            <div class="birth-block">
                <input type="number" class="form-control" id="userBirth" name="userBirth" maxlength="6" placeholder="ex) 990101" required>
            </div>
            <div class="birth-check"></div>

            <br>
            <div class="register-list">성별</div>
            <div class="gender-block">
                <input type="radio" id="" name="gender" value="F" style="width: 20px; height: 20px;">&nbsp;&nbsp;여자
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" id="" name="gender" value="M" style="width: 20px; height: 20px;">&nbsp;&nbsp;남자
            </div>

            <br>
            <div class="register-list">주소</div>
            <div class="address-block1">
                <input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호" readonly>
            </div>
            <div id="address-btn" class="genric-btn primary radius" onclick="findPostcode();">우편번호 찾기</div>
            <div class="address-block2">
                <input type="text" class="form-control" id="sample6_address" placeholder="도로명 주소" readonly>
            </div>
            <div class="address-block3">
                <input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세 주소 입력">
            </div>
            <div class="address-block4">
                <input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고 항목">
            </div>
            <div class="address-check"></div>

            <br>
            <div class="register-list">휴대전화</div>
            <div class="phone-block">
                <input type="number" class="form-control" id="userPhone" name="userPhone" maxlength="11" placeholder="'-'빼고 입력해주세요" required>
            </div>
            <div class="phone-check"></div>

            <br>
            <div class="register-info">
                	회원 가입시 이용약관 개인정보수집 및 이용, <br> 개인정보 제공에 동의하는 것으로 간주합니다.<br><br>
            </div>

            <div class="register-btn">
                <div class="genric-btn primary radius" onclick="location.href='';">회원가입 하기</div><br>
            </div>
        </div>

    </main>
    <br><br><br>
<!-- 회원가입 페이지 끝-->

    <script>
        var checkPwd= RegExp('/^[a-zA-Z0-9][a-zA-Z0-9!@#$%]{7,20}$/');
        var checkBirth = RegExp('/^[0-9]{2}(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/');
        var checkPhone = RegExp('/^(01[016789])(\d{4}|\d{3})\d{4}$/');
        var checkAddress3 = RegExp('/^[가-힣a-zA-Z0-9][가-힣a-zA-Z0-9\s]/');
        var checkEmail = RegExp('/^[a-zA-Z0-9]$/');

        $('.pwd-block1 input').focusout(function(){
            if($('#userPwd').val() != ""){
                if(!checkPwd.test($('#userPwd').val())){
                    $('.pwd-check1').text("특수문자 포함 최소 8자리 이상입력해주세요.");
                }else{
                    $('.pwd-check1').text("");
                }
            }
        });
        $('.pwd-block2 input').focusout(function(){
            if($('#userPwdCheck').val() != ""){
                if($('#userPwd').val() != $('#userPwdCheck').val()){
                    $('.pwd-check2').text("비밀번호가 일치하지 않습니다.");
                }else{
                    $('.pwd-check2').text("");
                }
            }
        });
           $('.birth-block input').focusout(function(){
            if($('#userBirth').val()!=""){
                if(!checkBirth.test($('#userBirth').val())){
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
        $('.phone-block input').focusout(function(){
            if($('#userPhone').val()!=""){
                if(!checkPhone.test($('#userPhone').val())){
                    $('.phone-check').text("'-'를 제외한 휴대번호 11자리를 정확히 입력해주세요.");
                }else{
                    $('.phone-check').text("");
                }
            }
        });
        $(function(){
            $('.email-block2 input').hide();
            $('.email-select').change(function(){
                if($(".email-select").val()=='emailSelect'){
                    $(".email-block2 input").show();
                    $(".email-select").hide();
                }else{
                    $('.email-block2 input').hide();
                }  
            });
        });
    </script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
    <script>
        function findPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                    console.log(data);
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수
    
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
    
                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }
    
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
    </script>
	
	
	
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>