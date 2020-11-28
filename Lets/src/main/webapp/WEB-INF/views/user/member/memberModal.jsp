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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
        <!-- 정보 수정하기 클릭시 보여질 Modal-->
        <div class="modal" id="info-Update-Modal">
            <div class="modal-dialog">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                <div class="m-title" style="color:rgb(46, 48, 146);">회원 정보 수정 & 탈퇴</div>
                <button type="reset" class="close" data-dismiss="modal">×</button>
                </div>
                
                <!-- Modal body -->
                <form action="update.me" method="POST" enctype="multipart/form-data">
                    <div class="modal-body">
                        <div class="mbody-1">
                            <div class="mbody-1-img">
                            	<c:choose>
                            		<c:when test="${empty loginUser.memPic}">
                            			<c:if test="${loginUser.gender eq 'F'}">
		                                	<img id="target_img" src="resources/user/assets/img/member/woman.png">
                            			</c:if>
                            			<c:if test="${loginUser.gender eq 'M'}">
		                                	<img id="target_img" src="resources/user/assets/img/member/man.png">
                            			</c:if>
                            		</c:when>
                            		<c:otherwise>
	                                	<img id="target_img" src="${loginUser.memPic}">
                            		</c:otherwise>
                            	</c:choose>
                                <img id="setting_img-icon" src="resources/user/assets/img/member/settings.png">
                                <input type="file" id="changeMemPic" name="changeMemPic" style="display:none;">
                                <input type="hidden" id="memPic" name="memPic">
                            </div>
                        </div>

						<input type="hidden" id="memId" name="memId" value="${loginUser.memId}">

                        <div class="mbody-2">
                            <div class="update-list-title">이름</div>
                            <div class="update-name-block">
                                <input type="text" class="form-control" id="memName" name="memName" style="font-size: 13px;" value="${loginUser.memName}"  readonly><br>
                            </div>
	
                            <div class="update-list-title">새로운 비밀번호</div>
                            <div class="update-pwd-block">
                                <input type="password" class="form-control" id="memPwd" name="memPwd" style="font-size: 13px;" minlength="8" placeholder="영문,특수문자,숫자 포함 8자리 이상">
                            </div>
                            <div class="update-pwd-check"></div>
                            
                            <br>
                            <div class="update-list-title">새로운 비밀번호 확인</div>
                            <div class="update-pwdCheck-block">
                                <input type="password" class="form-control" id="memPwdCheck" name="memPwdCheck" minlength="8" style="font-size: 13px;" placeholder="비밀번호를 한번 더 입력해주세요">
                            </div>
                            <div class="update-pwdCheck-check"></div>
                            
                            <br>
                            <div class="update-list-title">닉네임</div>
                            <div class="update-nickName-block">
                                <input type="text" class="form-control" id="nickname" name="nickname" style="font-size: 13px;" value="${loginUser.nickname}">
                            </div>
                            <div class="update-nickName-check"></div>

                            <br>
                            <div class="update-list-title">생년월일</div>
                            <div class="update-birth-block">
                                <input type="text" class="form-control" id="birthday" name="birthday" style="font-size: 13px;" value="${loginUser.birthday}">
                            </div>
                            <div class="update-birth-check"></div>

                            <br>
                            <div class="update-list-title">주소</div>
                            <div class="update-address-block1">
                                <input type="text" class="form-control" id="postcode" name="postcode" value="${loginUser.postcode}" style="font-size: 13px;" readonly>
                                <div id="update-address-btn" class="genric-btn info radius" onclick="findPostcode();" style="width: 130px; font-size: 10px;">우편번호 찾기</div>
                            </div>
                            <div class="update-address-block2">
                                <input type="text" class="form-control" id="postAddress" name="postAddress" value="${loginUser.postAddress}" placeholder="도로명 주소" style="margin-top: 10px; font-size: 13px;" readonly>
                            </div>
                            <div class="update-address-block3">
                                <input type="text" class="form-control" id="detailAddress" name="detailAddress" value="${loginUser.detailAddress}" placeholder="상세 주소" style="margin-top: -10px; font-size: 13px;">
                            </div>
                            <div class="update-address-block4">
                                <input type="text" class="form-control" id="extraAddress" name="extraAddress" value="${loginUser.extraAddress}" placeholder="참고 항목" style="margin-top: -10px; font-size: 13px;">
                            </div>
                            <div class="update-address-check"></div>
                            
                            <br>
                            <div class="update-list-title">휴대번호</div>
                            <div class="update-phone-block">
                                <input type="text" class="form-control" id="phone" name="phone" value="${loginUser.phone}">
                            </div>
                            <div class="update-phone-check"></div>
                            <br>
                        </div>
                    </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <div class="mfoot">
                        <input type="submit" class="genric-btn primary radius" value="수정하기">
                        <input type="button" class="genric-btn danger radius" value="탈퇴하기" onclick="deleteMember1();" data-toggle="modal" data-target="#delete-member-Modal">
                    </div>
                </div>
                </form>
                
            </div>
            </div>
        </div>
        <script>
			var nicknameInput = $(".update-nickName-block input[name=nickname]");
	    	
	    	nicknameInput.keyup(function(){
	    		if(nicknameInput.val().length >= 3){
		    		
	    			$.ajax({
						url:"nicknameCheck.me",
						data:{nickname : nicknameInput.val()},
						success:function(result){
							if(result == 'success'){
								$(".update-nickName-check").text("사용가능한 닉네임입니다.");
							}else{
								$(".update-nickName-check").text("이미 사용중인 닉네임입니다.");
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
        
	        function deleteMember1(){
	            $('#info-Update-Modal').modal('hide');
	        }
        </script>
        
        <script>
        var checkPwd= RegExp('^[a-zA-Z0-9][a-zA-Z0-9!@#$%]{7,20}$');
        var checkBirth = RegExp('^[0-9]{2}(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$');
        var checkPhone = RegExp('^[0][1][0-9]\\d{3,4}\\d{4}$');
        var checkAddress3 = RegExp('^[가-힣a-zA-Z0-9][가-힣a-zA-Z0-9\s]');

            $('.update-pwd-block input').focusout(function(){
                if($('#memPwd').val()!==""){
                    if(!checkPwd.test($('#memPwd').val())){
                        $('.update-pwd-check').text("조건에 맞는 비밀번호를 입력해주세요.");
                    }else{
                        $('.update-pwd-check').text("");
                    }
                }
            });
            $('.update-pwdCheck-block input').focusout(function(){
                if($('#memPwdCheck').val()!=$('#memPwd').val()){
                    $('.update-pwdCheck-check').text("비밀번호가 일치하지 않습니다.");
                }else{
                    $('.update-pwdCheck-check').text("");
                }
            });
            $('.update-birth-block input').focusout(function(){
                if($('#birthday').val()!==""){
                    if(!checkBirth.test($('#birthday').val())){
                        $('.update-birth-check').text("'-'를 제외한 6자리 숫자로 입력해주세요.");
                    }else{
                        $('.update-birth-check').text("");
                    }
                }
            });
            $('.update-address-block3 input').focusout(function(){
                if($('#address3').val()!=""){
                    if(!checkAddress3.test($('#address3').val())){
                        $('.update-address-check').text("상세 주소를 정확히 입력해주세요.");
                    }else{
                        $('.update-address-check').text("");
                    }
                }
            });
            $('.update-phone-block input').focusout(function(){
                if($('#phone').val()!=""){
                    if(!checkPhone.test($('#phone').val())){
                        $('.update-phone-check').text("'-'를 제외한 숫자만 입력해주세요.")
                    }else{
                        $('.update-phone-check').text("")
                    }
                }
            });
        </script>
        
        <script>
            $('#setting_img-icon').hide();

            $('.mbody-1-img img').click(function (e) {
                $('#changeMemPic').click();
                $('#changeMemPic').change(function(){
                    setImageFromFile(this, '#target_img');
                    console.log($('#changeMemPic').val()); // 올릴 파일명 찍힘
                });
                $('#memPic').attr("src", $('#changeMemPic').val());
                // console.log("변경된 src :"+$('#target_img').attr("src"));   // 적용안됨
                e.preventDefault();
            });   

            function setImageFromFile(input, expression) {
                if (input.files && input.files[0]){
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $(expression).attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }

            $('.mbody-1-img img').mouseenter(function(){
                $('#target_img').hide();
                $('#setting_img-icon').show();
            });
            $('.mbody-1-img img').mouseleave(function(){
                $('#target_img').show();
                $('#setting_img-icon').hide();
            });

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
                        document.getElementById("detailAddress").focus();
                    }
                }).open();
            }
        </script>
		<!-- 회원 정보 수정 Modal 끝 -->

        <!-- 회원 탈퇴 클릭시 보여질 Modal -->
        <form action="delete.me" method="POST">
            <div class="modal" id="delete-member-Modal">
            <div class="modal-dialog">
                <div class="modal-content">
                
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <div class="m-title"></div>
	                    <button type="button" class="close" data-dismiss="modal">×</button>
	                </div>
	                
	                <!-- Modal body -->
	                <div class="modal-body">
	                    <div class="m-title" style="text-align: center; color:orangered;">정말로 탈퇴하시겠습니까?</div>
	                    <br>
	                    <div class="m-info" style="text-align: center; font-size: 13px; font-weight: bolder;">
				                        계정을 삭제하시면 기존의 수강권, 클래스 기록 등의 <br>
				                        모든 회원 정보가 삭제됩니다.
	                    </div>
	                    <br>
	                    <div>
	                        <input type="password" class="form-control" id="memPwdDelCheck" name="memPwdDelCheck" required placeholder="비밀번호를 입력해주세요" style="margin-left: 130px; width: 200px; height: 35px; font-size: 14px;">                        
	                    </div>
	                </div>
	                
	                <!-- Modal footer -->
	                <div class="modal-footer" style="margin-right: 100px;"> 
	                    <input type="reset" class="genric-btn primary radius" data-dismiss="modal" value="취소하기">
	                    <input type="submit" class="genric-btn danger radius" value="계정 삭제하기">
	                </div>
                
                </div>
            </div>
            </div>
        </form>

        <!-- 회원 탈퇴 Modal 끝-->
</body>
</html>