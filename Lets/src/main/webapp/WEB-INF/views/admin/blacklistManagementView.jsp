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
	<!-- 사이드메뉴바 -->
	<jsp:include page="adminNav.jsp" />
	
	<!-- 메인 컨텐츠 -->
	<div id="main-wrapper">
		<div class="main-content">
			<section id="blacklistManagement">
				
				<!-- 상단( 페이지 제목 ) -->
				<div class="content-header">
					<h1>블랙리스트 관리</h1>
				</div>
				
				<!-- 중단 ( 컨텐츠 ) -->
				<div class="welcome" align="center" style="width:800px;">
					<div align="right">
						<form action="">
							<select name="condition" style="height: 30px;">
								<option value="title">닉네임</option>
								<option value="content">이메일</option>
							</select>
							<input type="text" name="keyword">
							<button type="submit" class="btn btn-default">검색</button>
						</form>
					</div>
					<br>
					<table class="list-area">
						<tr>
							<th width="50px" height="40px">번호</th>
							<th width="150px">닉네임</th>
							<th width="220px">이메일</th>
							<th width="150px">누적신고횟수</th>
							<th width="110px">블랙해제</th>
						</tr>
						<tr>
							<td height="40px">1</td>
							<td>닉네임1</td>
							<td>user01@naver.com</td>
							<td>12</td>
							<td><button onclick="cancelBlacklist();" id="blacklistCancelBtn"
									class="btn btn-default">해제</button></td>
						</tr>
						<tr>
							<td height="40px">2</td>
							<td>닉네임2</td>
							<td>tutor02@naver.com</td>
							<td>5</td>
							<td><button onclick="cancelBlacklist();" id="blacklistCancelBtn"
									class="btn btn-default">해제</button></td>
						</tr>
					</table>

					<!-- 확인 alert ** 컬럼별로 번호 매겨서야 한다(Condition 변경하기 위해) -->
					<script>
						function cancelBlacklist() {
							var num = 1;
							var result = confirm("블랙상태를 해제 하시겠습니까??");

							if (result) {
								var str = "해제"
								document.getElementById("blacklistCancelBtn").disabled = true;
							} else {
								return;
							}

							var blacklistCondition = document
									.getElementById("blacklistCondition" + num)
							blacklistCondition.innerHTML = "<p>" + str + "</p>"
						}
					</script>
					<!-- 확인 끝 -->




					
					<div class="" align="center">
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