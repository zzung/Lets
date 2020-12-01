<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할인 상품 관리</title>
</head>
<body>
	<jsp:include page="adminNav.jsp" />
	<div id="main-wrapper">
		<div class="main-content">
			<section id="classManagement">
				<div class="content-header">
					<h1>할인 상품 관리</h1>
				</div>
				<div class="welcome" align="center">
					<div align="right" style="width: 1030px;">
						<a class="btn btn-default" onclick="searchSubmit(1);">할인 미적용</a> <a
							class="btn btn-default" onclick="searchSubmit(2);">할인 적용</a>

						<form action="" method="post" id="searchSubmit">
							<input type="hidden" name="" value="">
						</form>

						<form action="">
							<select name="condition" style="height: 30px;">
								<option value="writer">클래스 제목</option>
								<option value="title">튜터ID</option>
								<option value="content">클래스 할인율</option>
							</select> <input type="text" name="keyword">
							<button class="btn btn-default" type="submit">검색</button>
						</form>
					</div>
					<script>
						function searchSubmit(num) {
							if (num == 1) {
								$("#searchSubmit").attr("action", "보낼페이지")
										.submit();
							} else {
								$("#searchSubmit").attr("action", "보낼페이지")
										.submit();
							}
						}
					</script>
					<br>
					<table class="list-area">
						<tr>
							<th width="50px;" height="40px;">번호</th>
							<th width="400px;">클래스 이름</th>
							<th width="300px;">튜터ID</th>
							<th width="150px;">클래스 할인율</th>
							<th width="130px;">할인 설정</th>
						</tr>
						<c:forEach var="m" items="${m }">
						<tr>
							<td>${m }</td>
							<td width="350px;">${m.lessonTitle }</td>
							<td>${m.memId }</td>
							<td>할인 미적용</td>
							<td><button class="btn btn-default">설정</button></td>
						</tr>
						</c:forEach>
					</table>
					<!--?Modal Start-->
					<div class="modal" id="settingSales">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content" align="center" style="width: 300px;">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">클래스 할인율</h4>
								</div>
								<div class="modal-body">
									<select name="discounts" id="discounts"
										style="width: 200px; height: 40px;">
										<option value="0.1">10%</option>
										<option value="0.2">20%</option>
										<option value="0.3">30%</option>
										<option value="0.5">50%</option>
									</select>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal" onclick="apply();">적용</button>
								</div>
							</div>
						</div>
					</div>
					<!--Modal End-->
					<!--?적용 alert-->
					<script>
						function apply() {
							var apply = confirm("적용하시겠습니까??");
							var str = document.getElementById("discounts").value;
							var num = 1;

							if (apply) {
								document.getElementById("appliedDiscount" + num).innerHTML = "<p>"+ str + "</p>"
							} else {
								return;
							}

						}
					</script>
					<!--end of 적용-->
					<div class="container" align="center">
						<ul class="pagination">
						<c:choose>
							<c:when test="${pi.currentPage eq 1 }">
								<li class="disabled"><a href="">&lt;</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="saleManagement.ad?currentPage=${pi.currentPage -1 }">&lt;</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
							<li><a href="saleManagement.ad?currentPage=${p}">{p}</a></li>
						</c:forEach>
						
						<c:choose>
							<c:when test="${pi.currentPage eq pi.maxPage }">
								<li class="disabled"><a href="#">&gt;</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="saleManagement.ad?currentPage=${pi.currentPage +1 }">&lt;</a></li>
							</c:otherwise>
						</c:choose>	
						</ul>
					</div>
				</div>
			</section>
		</div>
	</div>
</body>
</html>