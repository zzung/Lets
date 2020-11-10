<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/user/assets/css/style.css">
<link rel="stylesheet" href="resources/user/assets/css/paymentDetailView.css">
</head>
<body>

	<jsp:include page="../common/navBar.jsp" />

	<main>
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
									<h4 style="color: #2d2d2d;">"단 한번의 선택이 미래를"</h4>
									<img src="resources/user/assets/img/post/post_1.png" alt="post">
								</div>
							</div>
							<form action="">
								<div class="payment-user-info">
									<div>
										<h3>연락처 정보</h3>
									</div>
									<br>
									<div id="reciver">
										<h4>
											<b>받으시는분</b>
										</h4>
										<div class="mt-10">
											<input type="text" name="userName" placeholder="사용자 성함"
												onfocus="this.placeholder = ''"
												onblur="this.placeholder = '사용자 성함'" required
												class="user-input-primary">
										</div>
									</div>
									<br>
									<div id="phone">
										<h4>
											<b>휴대폰 전화</b>
										</h4>
										<div class="mt-10">
											<input type="text" name="phone" placeholder="사용자 연락처"
												onfocus="this.placeholder = ''"
												onblur="this.placeholder = '사용자 연락처'" required
												class="user-input-primary">
										</div>
									</div>
									<br>
									<div id="address">
										<h4>
											<b>우편번호찾기 API 확인 후 수정</b>
										</h4>
										<div class="mt-10">
											<input type="text" name="phone" placeholder="주소"
												onfocus="this.placeholder = ''"
												onblur="this.placeholder = 'Primary color'" required
												class="user-input-primary">
										</div>
									</div>
								</div>

								<div class="payment-amount-area">
									<div id="amount-title">
										<h3>결제 금액</h3>
									</div>
									<br>
									<div>
										<table>
											<tr>
												<td class="sum-title">총 상품 금액</td>
												<td class="sum-amount">195,000원</td>
											</tr>
											<tr>
												<td class="sum-title">할인 금액</td>
												<td class="sum-amount">19,500원</td>
											</tr>
											<tr id="total-amount">
												<td>최종 가격</td>
												<td class="sum-amount">175,500원</td>
											</tr>
										</table>
									</div>
								</div>
								<div class="payment-method">
									<div id="method-title">
										<h3>결제수단</h3>
									</div>
									<input type="radio" name="payMethod" value="card" id="card"
										checked /> <label for="card" id="pay">신용카드</label> <br> <input
										type="radio" name="payMethod" value="tranfser" id="transfer" />
									<label for="transfer" id="pay">무통장입급</label>
								</div>
								<br>
								<br>
								<br>
								<div>
									<buttom type="submit" class="gen-btn primary-border custom">결제하기</buttom>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			</div>
		</section>
		<!--================ Blog Area end =================-->
	</main>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>