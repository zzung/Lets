<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 관리</title>
</head>
<body>
	<jsp:include page="adminNav.jsp" />
	<div id="main-wrapper">
		<div class="main-content">
			<section id="reportManagement">
				<div class="content-header">
					<h1>신고 관리</h1>
				</div>
				
				<div class="welcome" align="center" style="width:1030px;">
					<!-- 검색 div start -->
					<div>
						<div style="width:200px; float:left;">
							<!-- 분류 버튼 추가 자리 -->
						</div>
						<div align="right">
							<form action="">
								<select name="condition" style="height: 30px;">
									<option value="writer">이름</option>
									<option value="title">닉네임</option>
									<option value="content">이메일</option>
								</select>
								<input type="text" name="keyword">
								<button type="submit" class="btn btn-default">검색</button>
							</form>
						</div>
					</div>
					<!-- 검색 div end -->
					<br>
					<table class="list-area" style="width:1030px;">
						<tr>
							<th width="50px" height="40px">번호</th>
							<th width="140px">신고자</th>
							<th width="90px">신고사유</th>
							<th width="220px">댓글 내용(상세조회) </th>
							<th width="120px">신고일</th>
							<th width="90px">처리상태</th>
						</tr>
						<c:forEach var="l" items="${list }" varStatus="status">
						<input type="hidden" value="${replyNo eq 1 }">
						<tr>
							<td height="40px">${status.count }</td>
							<td>${l.nickname}</td>
							<td>${l.reportType }</td>
							<td>
								<a href="#" data-toggle="modal" data-target="#reportContent1">
								${l.replyContent }test
								</a>
							</td>
							<td>${l.reportDate }</td>
							<td>${l.status }</td>
						</tr>
						</c:forEach>
					</table>
					
					<!-- Modal Start -->
					<div class="modal" id="reportContent1">
						<div class="modal-dialog">

							<!-- Modal content -->
							<div class="modal-content" align="left" style="width: 600px; ">
								<div class="modal-header" >
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h3 class="modal-title" style="text-align:center">신고내역 상세조회</h3>
								</div>
								<div class="modal-body" align="center">
									
									<table class="list-area" width=500px;>
										<tr>
											<th>작성자</th>
											<th>신고횟수</th>
										</tr>
										<tr>
											<td>닉네임1</td>
											<td>5</td>
										</tr>
									</table>
									<br>
									
									<div align="center" style="width:500px">
										<div style="text-align:left">작성일:2020-09-30</div>
										<div style="width:500px; height: 80px; border:solid 1px; text-align:left;">
										이 아기 멍멍아
										</div>
									</div>
									<hr>
									
									<table class="list-area" width=500px;>
										<tr>
											<th>신고자</th>
											<th>신고일</th>
											<th>신고사유</th>
											
										</tr>
										<tr>
											<td>닉네임07</td>
											<td>2020-10-02</td>
											<td>욕설</td>
										</tr>
									</table>
									<br>
									
									<button onclick="applyBlacklist();" id="blacklistApplyBtn"
									class="btn btn-default">블랙등록</button>
									<button onclick="deleteReply();" id="deleteReplyBtn"
									class="btn btn-default">댓글 삭제</button>
									
								</div>	
							</div>
						</div>
					</div>
					<!--Modal End-->
					
					<!-- 블랙등록 확인 alert ** 컬럼별로 번호 매겨서야 한다(Condition 변경하기 위해) -->
					<script>
						function applyBlacklist() {
							var num = 1;
							var result = confirm("블랙상태로 등록 하시겠습니까??");

							if (result) {
								var str = "등록"
								document.getElementById("blacklistApplyBtn").disabled = true;
							} else {
								return;
							}

							var blacklistCondition = document
									.getElementById("blacklistCondition" + num)
							blacklistCondition.innerHTML = "<p>" + str + "</p>"
						}
					</script>
					<!-- 블랙등록 확인 끝 -->
					
					<!--  확인 alert ** 컬럼별로 번호 매겨서야 한다(Condition 변경하기 위해) -->
					<script>
						function deleteReply() {
							var num = 1;
							var result = confirm("신고 댓글을 삭제하시겠습니까??");

							if (result) {
								var str = "삭제"
								document.getElementById("deleteReply").disabled = true;
							} else {
								return;
							}

							var replyCondition = document
									.getElementById("replyCondition" + num)
							replyCondition.innerHTML = "<p>" + str + "</p>"
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