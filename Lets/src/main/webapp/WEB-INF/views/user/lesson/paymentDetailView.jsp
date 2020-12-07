<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/user/assets/css/style.css">
<link rel="stylesheet" href="resources/user/assets/css/paymentDetailView.css">
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
</head>
<body>

	<jsp:include page="../common/navBar.jsp" />

	<main>
		<script
			src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<!--================Blog Area =================-->
		<section class="blog_area single-post-area section-padding">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 posts-list">

						<div id="payment-title">결제하기</div>
						<div class="payment-area">
							<h3>주문정보</h3>
							<br>
							<div class="media align-items-center">
								<div class="media-body">
									<h4 style="color: #2d2d2d;">"${l.lessonTitle }"</h4>
									<img src="${l.lessonCoverImg }" alt="post">
								</div>
							</div>
							
							<form action="paymentProcess.le">
								<div class="payment-user-info">
								<input type="hidden" name="lessonNo" value="${l.lessonNo }">
								<input type="hidden" name="memNo" value="${loginUser.memNo }">
									<div>
										<h3>연락처 정보</h3>
									</div>
									<br>
									<div id="reciver">
										<h4>
											<b>받으시는분</b>
										</h4>
									<div class="mt-10">
		                                 <table>
		                                    <tr style="font-size:16px;">
		                                       <td>${loginUser.memName }</td>
		                                    </tr>
		                                 </table>
		                              </div>
									</div>
									<br>
									<div id="phone">
										<h4>
											<b>휴대폰 전화</b>
										</h4>
										 <table>
		                                    <tr style="font-size:16px;">
		                                       <td>${loginUser.phone }</td>
		                                    </tr>
		                                 </table>

									</div>
									<br>
									<div id="ad">
										<h4>
											<b>주소</b>
										</h4>
										<div class="mt-10">
											<input type="text" id="postcode" name="delPostcode" placeholder="우편번호" class="user-input" required> 
											<button class="genric-btn primary" onclick="findPostCode()">우편번호찾기</button>

											<input type="text" id="address" name="delPostAdr" placeholder="주소" class="user-input-primary" required> 
											
											<input type="text" id="detailAddress" name="delDetailAdr" placeholder="상세주소" class="user-input" required> 
											<input type="text" id="extraAddress" name="delExtraAdr" placeholder="참고항목" class="user-input" required>					
										</div>
									</div>
								</div>
								<div class="payment-amount-area">
									<div id="amount-title">
										<h3>결제 금액</h3>
									</div>
									<br>
									<div>
									<c:set var="disc" value="${l.discount }"/>
			                        <c:set var="divide" value="100"/>
			                        <c:set var="total" value="${l.payTotal }" />
			                        <c:set var="discountAmount" value="${total*disc/100}" />
			                        <c:set var="totalAmount" value="${total-(total*disc/100) }" />
										<table>
											<tr>
												<td class="sum-title">총 상품 금액</td>
												<td class="sum-amount">
													<fmt:formatNumber type="currency" value="${total }"/>
												</td>
											</tr>
											<tr>
												<td class="sum-title">할인 금액</td>
												<td class="sum-amount">
													<fmt:formatNumber type="currency" value="${discountAmount }"/>
												</td>
											</tr>
											<tr id="total-amount">
												<td>최종 가격</td>
												<td class="sum-amount">
													<fmt:formatNumber type="currency" value="${totalAmount }"/>
												</td>
											</tr>
										</table>
									</div>
								</div>
								<div class="payment-method">
									<div id="method-title">
										<h3>결제수단</h3>
									</div>
									<input type="radio" name="type" value="card" id="card" checked /> 
									<label for="card" id="pay">신용카드</label> <br>
									<input type="radio" name="type" value="trans" id="trans" /> 
									<label for="trans" id="pay">무통장입급</label>
								</div>
								<br> <br> <br>
								<div>
									<button type="button" class="gen-btn primary-border custom" data-total="${l.payTotal }" data-phone="${loginUser.phone }"
									data-title="${l.lessonTitle }" data-name="${loginUser.memName}" onclick="payProcess(this);">결제하기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>

		<div id="layer" style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
			<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer"
				style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1" 
				onclick="closeDaumPostcode()" alt="닫기 버튼">
		</div>

		<script>
			// 우편번호 찾기 화면을 넣을 element
			var element_layer = document.getElementById('layer');

			function closeDaumPostcode() {
				// iframe을 넣은 element를 안보이게 한다.
				element_layer.style.display = 'none';
			}

			function findPostCode() {
				new daum.Postcode(
						{
							oncomplete : function(data) {

								var addr = ''; // 주소 변수
								var extraAddr = ''; // 참고항목 변수

								//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
								if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
									addr = data.roadAddress;
								} else { // 사용자가 지번 주소를 선택했을 경우(J)
									addr = data.jibunAddress;
								}

								// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
								if (data.userSelectedType === 'R') {
									// 법정동명이 있을 경우 추가한다. (법정리는 제외)
									// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
									if (data.bname !== ''
											&& /[동|로|가]$/g.test(data.bname)) {
										extraAddr += data.bname;
									}
									// 건물명이 있고, 공동주택일 경우 추가한다.
									if (data.buildingName !== ''
											&& data.apartment === 'Y') {
										extraAddr += (extraAddr !== '' ? ', '
												+ data.buildingName
												: data.buildingName);
									}
									// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
									if (extraAddr !== '') {
										extraAddr = ' (' + extraAddr + ')';
									}
									// 조합된 참고항목을 해당 필드에 넣는다.
									document.getElementById("extraAddress").value = extraAddr;

								} else {
									document.getElementById("extraAddress").value = '';
								}

								// 우편번호와 주소 정보를 해당 필드에 넣는다.
								document.getElementById('postcode').value = data.zonecode;
								document.getElementById("address").value = addr;
								// 커서를 상세주소 필드로 이동한다.
								document.getElementById("detailAddress")
										.focus();

								// iframe을 넣은 element를 안보이게 한다.
								// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
								element_layer.style.display = 'none';
							},
							width : '100%',
							height : '100%',
							maxSuggestItems : 5
						}).embed(element_layer);

				// iframe을 넣은 element를 보이게 한다.
				element_layer.style.display = 'block';

				// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
				initLayerPosition();
			}

			// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
			// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
			// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
			function initLayerPosition() {
				var width = 400; //우편번호서비스가 들어갈 element의 width
				var height = 500; //우편번호서비스가 들어갈 element의 height
				var borderWidth = 1; //샘플에서 사용하는 border의 두께

				// 위에서 선언한 값들을 실제 element에 넣는다.
				element_layer.style.width = width + 'px';
				element_layer.style.height = height + 'px';
				element_layer.style.border = borderWidth + 'px solid';
				// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
				element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
						+ 'px';
				element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
						+ 'px';
			}
			
			function payProcess(e){
				var name = $(e).data("name");
				var phone = $(e).data("phone");
				var payMethod = $("input:radio[name=type]:checked").val();
				var total = $(e).data("total");
				var title = $(e).data("title");

				IMP.init('imp28668444'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
				IMP.request_pay({
				    pg : 'html5_inicis',
				    pay_method : payMethod,
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : title,
				    amount : 10,
				    buyer_email : 'lets@iei.do',
				    buyer_name : name,
				    buyer_tel : phone,
				    m_redirect_url : 'https://localhost:8888/ee'
				}, function(rsp) {
				    if ( rsp.success ) {
				        var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				        
				        $("form").submit();
				        
				        
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				    }
	
				    alert(msg);
				});
			}
		</script>
		<!--================ Blog Area end =================-->
	</main>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>