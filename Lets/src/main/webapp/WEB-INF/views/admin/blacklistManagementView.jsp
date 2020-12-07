<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랙리스트 관리</title>
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
				<div class="welcome" align="center" style="width:1030px;">
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
					<table class="list-area" style="width:1030px;">
						<tr>
							<th width="50px" height="40px">번호</th>
							<th width="150px">닉네임</th>
							<th width="220px">이메일</th>
							<th width="150px">누적신고횟수</th>
							<th width="110px">블랙해제</th>
						</tr>
						<c:forEach var="m" items="${list }" varStatus="status">
						<tr>
							<td height="40px">${status.count }</td>
							<td>${m.nickname }</td>
							<td>${m.memId }</td>
							<td>${m.reportCount }</td>
							<td><button onclick="cancelBlacklist();" id="blacklistCancelBtn"
									class="btn btn-default">해제</button></td>
						</tr>
						</c:forEach>
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

				
				</div>
				<div class="container" align="center">
					<ul class="pagination">
					<c:choose>
						<c:when test="${pi.startPage eq 1 }">
							<li class="disabled"><a href="">&lt;</a></li>
						</c:when>
						
						<c:otherwise>
							<li><a href="blacklistManagement.ad?currentPage=${pi.currentPage -1 }">&lt;</a></li>
						</c:otherwise>
					</c:choose>
					
					
					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<c:choose>
							<c:when test="${pi.currentPage ne p }">
								<c:choose>
									<c:when test="${empty sc }">
										<li><a href="blacklistManagement.ad?currentPage=${p}">${p}</a></li>
									</c:when>
									<c:otherwise>
										<c:url var="searchUrl" value="searchClassMgmt.ad">
											<c:param name="currentPage" value="${p }"/>
											<c:param name="condition" value="${condition }" />
											<c:param name="keyword" value="${keyword }" />
										</c:url>
										
										<li><a href="${searchUrl }">${p }</a></li>
									</c:otherwise>
								</c:choose>	
							</c:when>
						</c:choose>
					</c:forEach>
					
					<c:choose>
						<c:when test="${pi.currentPage eq pi.maxPage }">
							<li class="disabled"><a href="#">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="blacklistManagement.ad?currentPage=${pi.currentPage +1 }">&gt;</a></li>
						</c:otherwise>
					</c:choose>	
					</ul>
				</div>
			</section>
		</div>
	</div>
</body>


</html>