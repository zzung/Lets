<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 결제 관리</title>
</head>
<body>
	<jsp:include page="adminNav.jsp" />
	<div id="main-wrapper">
		<div class="main-content">
			<section id="memberManagement">
				<div class="content-header">
					<h1>클래스 결제 관리</h1>
				</div>
				<div class="welcome" align="center">
					<div align="right" style="width: 1030px;">
						<form action="">
							<tr>
								<td><select name="condition" style="height: 30px;">
										<option value="writer">클래스 제목</option>
										<option value="title">회원ID</option>
										<option value="content">결제현황</option>
								</select></td>
								<td><input type="text" name="keyword"></td>
								<td><button type="submit" class="btn btn-default">검색</button></td>
							</tr>
						</form>
					</div>
					<br>
					<table class="list-area">
						<tr>
							<th width="50px;" height="40px;">번호</th>
							<th width="200px;">회원ID</th>
							<th width="350px;">결제된 클래스명</th>
							<th width="200px;">결제현황</th>
							<th width="100px;">결제 정보 조회</th>
							<th width="130px;">결제 취소</th>
						</tr>
						<tr>
							<td>3</td>
							<td>recipee@gmail.com</td>
							<td width="350px;">오늘은 내가 왕이다..어쩔래 길이가 얼마나 길지 모르니까 계속 적어 본다.</td>
							<td id="payCondition">결제완료</td>
							<td><button type="button" data-toggle="modal"
									data-target="#paymentInquiry" class="btn btn-default">조회</button></td>
							<td><button onclick="cancelPay();" class="btn btn-default">결제취소</button></td>
						</tr>
						<tr>
							<td>2</td>
							<td>recipee@gmail.com</td>
							<td width="350px;">오늘은 내가 왕이다..어쩔래 길이가 얼마나 길지 모르니까 계속 적어 본다.</td>
							<td id="payCondition">결제완료</td>
							<td><button type="button" data-toggle="modal"
									data-target="#paymentInquiry" class="btn btn-default">조회</button></td>
							<td><button onclick="cancelPay();" class="btn btn-default">결제취소</button></td>
						</tr>

						<tr>
							<td>1</td>
							<td>recipee@gmail.com</td>
							<td width="350px;">오늘은 내가 왕이다..어쩔래 길이가 얼마나 길지 모르니까 계속 적어 본다.</td>
							<td id="payCondition1">결제완료</td>
							<td><button type="button" data-toggle="modal"
									data-target="#paymentInquiry" class="btn btn-default">조회</button></td>
							<td><button onclick="cancelPay();" id="payCancelBtn"
									class="btn btn-default">결제취소</button></td>
						</tr>
					</table>
					<!--?Modal Start-->
					<div class="modal" id="paymentInquiry">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content" align="left" style="width: 300px;">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">결제 정보</h4>
								</div>
								<div class="modal-body">
									<p class="modalTitle">결제자 정보</p>
									<p>홍길동</p>
									<br>
									<p class="modalTitle">결제 방법</p>
									<p>계좌이체/신용카드</p>
									<br>
									<p class="modalTitle">계좌번호</p>
									<p>카카오 123-87321-098</p>
									<br>
									<p class="modalTitle">결제일</p>
									<p>2020-10-20</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>

						</div>
					</div>
					<!--Modal End-->

					<!--?결제취소 확인 alert ** 컬럼별로 번호 매겨서야 한다(payCondition 변경하기 위해).-->
					<script>
						function cancelPay() {
							var num = 1;
							var result = confirm("결제 취소하시겠습니까??");

							if (result) {
								var str = "취소 대기"
								document.getElementById("payCancelBtn").disabled = true;
							} else {
								return;
							}

							var payCondition = document
									.getElementById("payCondition" + num)
							payCondition.innerHTML = "<p>" + str + "</p>"
						}
					</script>
					<!--end of 결제취소-->

					<div class="container" align="center">
						<ul class="pagination">
							<li><a href="#">&lt;</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">&gt;</a></li>
						</ul>
					</div>
				</div>
			</section>
		</div>
	</div>
</body>


</html>