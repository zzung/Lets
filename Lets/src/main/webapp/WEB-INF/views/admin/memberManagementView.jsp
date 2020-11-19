<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="adminNav.jsp" />
	<div id="main-wrapper">
		<div class="main-content">
			<section id="memberManagement">
				<div class="content-header">
					<h1>회원 관리</h1>
				</div>
				
				<div class="welcome" align="center">
					<div align="right" style="width: 1030px;">
						<form action="">
							<div>
								<select name="condition" style="height: 30px;">
									<option value="writer">이름</option>
									<option value="title">닉네임</option>
									<option value="content">이메일</option>
								</select>
								<input type="text" name="keyword">
								<button type="submit" class="btn btn-default">검색</button>
							</div>
						</form>
					</div>
					<br>
					<table class="list-area">
						<tr>
							<th width="50px;" height="40px;">번호</th>
							<th width="70px;">이름</th>
							<th width="150px;">닉네임</th>
							<th width="220px;">이메일</th>
							<th width="80px;">탈퇴여부</th>
							<th width="110px;">회원 상세조회</th>
						</tr>
						<tr>
							<td>3</td>
							<td>고길동</td>
							<td>닉네임1</td>
							<td>user01@naver.com</td>
							<td>N</td>
							<td><button type="button" data-toggle="modal"
									data-target="#paymentInquiry" class="btn btn-default">상세 조회</button>
							</td>
									
							
						</tr>
						
					</table>
					<!--?Modal Start-->
					<div class="modal" id="paymentInquiry">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content" align="left" style="width: 960px;">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title" style="text-align:center">회원 상세조회</h4>
								</div>
								<div class="modal-body" align=center>
									<span>회원정보</span>
									<table class="list-area">
										<tr>
											<th width=80>이름</th>
											<th width=140>닉네임</th>
											<th width=220>이메일</th>
											<th width=140>연락처</th>
											<th width=120>생년월일</th>
											<th width=50>성별</th>
											<th width=120>가입일</th>
											<th width=120>탈퇴일</th>
											<th width=65>탈퇴<br>여부</th>
											<th width=65>블랙<br>여부</th>
										</tr>
										<tr>
											<td>고길동이</td>
											<td>닉네임1</td>
											<td>user01@naver.com</td>
											<td>010-1234-5678</td>
											<td>1989-10-10</td>
											<td>남</td>
											<td>2020-11-19</td>
											<td>2020-11-19</td>
											<td>N</td>
											<td>N</td>
										</tr>
									</table>
									<br>
									<span>클래스 수강 내역</span>
									<table class="list-area">
										<tr>
											<th width=400>클래스 제목</th>
											<th width=140>클레스 카테고리</th>
											<th width=300>수강기간</th>
										</tr>
										<tr>
											<td>1억모으기</td>
											<td>머니</td>
											<td>2020-01-20 ~ 2020-05-10</td>
										</tr>
									</table>
									
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