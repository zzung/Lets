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
			<section id="reportManagement">
				<div class="content-header">
					<h1>공지사항 관리</h1>
				</div>
				
				<div class="welcome" align="center" style="width:1030px;">
					<!-- 검색 div start -->
					<div>
						<div style="width:200px; float:left; text-align:left;">
							<button type="button" data-toggle="modal"
									data-target="#writeNotice" class="btn btn-default">공지 작성</button>
						</div>
						<div align="right">
							<form action="">
								<select name="condition" style="height: 30px;">
									<option value="title">제목</option>
									<option value="type">분류</option>
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
							<th width="90px">중요공지</th>
							<th width="90px">분류</th>
							<th width="500px">공지제목</th>
							<th width="120px">작성일</th>
							<th width="120px">삭제여부</th>
						</tr>
						<tr>
							<td height="40px">1</td>
							<td>Y</td>
							<td>회원</td>
							<td>
							
							[서비스 개편 사항] 메인페이지에서 새로 생긴 클래스를 확인할 수 있습니다.
							
							</td>
							<td>2020-10-30</td>
							<td>N</td>
						</tr>
					</table>
					
					<!-- Modal Start -->
					<div class="modal" id="writeNotice">
						<div class="modal-dialog">

							<!-- Modal content -->
							<div class="modal-content" align="center" style="width: 700px; ">
								<div class="modal-header" >
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h3 class="modal-title" style="text-align:center">공지사항 등록</h3>
								</div>
								
								<div class="modal-body" align="center" style="width:600px;">
									<!-- 공지 등록 form start -->
									<form action="">
										<table>
											<tr>
												<td>
													<select name="condition" style="width:100px; height: 30px; margin-right:10px;">
														<option>회원</option>
														<option>튜터</option>
													</select>
												</td>
												<td>
													<input type="text" style="width:400px;">
												</td>
											</tr>
											<tr>
												<td colspan="2" align="left">
													<input type="checkbox">중요 공지 등록
												</td>
												
											</tr>
											
											<tr>
												<td colspan="2" align="center">
													<textarea style="resize:none; width:510px; height:400px;"></textarea>
												</td>
											</tr>
											<tr>
												<td>
													<button onclick="prev();" id="blacklistApplyBtn"
													class="btn btn-default">이전</button>
												</td>
												<td>
													<button onclick="noticeEnroll();" id="deleteReplyBtn"
													class="btn btn-default">등록</button>
												</td>
											</tr>
										</table>
										
									</form>
									
									
									
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