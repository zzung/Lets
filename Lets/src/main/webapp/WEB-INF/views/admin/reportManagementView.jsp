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
							<form action="searchReportMgmt.ad">
								<input type="hidden" name="currentPage" value="1"> 
								<select name="condition" style="height: 30px;">
									<option value="nickname">신고자</option>
									<option value="reportType">신고사유</option>
									<option value="status">처리상태</option>
								</select>
		                       	<input type="text" name="keyword" value="${keyword}">
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
							<th width="200px">신고사유</th>
							<th width="220px">댓글 내용(상세조회) </th>
							<th width="120px">신고일</th>
							<th width="90px">처리상태</th>
						</tr>
						<c:forEach var="l" items="${list }" varStatus="status">
						<input type="hidden" name="replyNo" value="">
						<tr>
							<td height="40px">${status.count }</td>
							<td>${l.nickname}</td>
							<td>${l.reportType }</td>
							<td>
								<span onclick="reArr(this);" data-toggle="modal" 
								data-memno="${l.memNo}" data-nickname="${l.nickname }" data-reportcount="${l.reportCount }"
								data-replyno="${l.replyNo}" data-enrolldate="${l.enrollDate}" data-replycontent="${l.replyContent}" 
								data-reportno="${l.reportNo}" data-reportdate="${l.reportDate}" data-reporttype="${l.reportType}"
								data-target="#reportContent">${l.replyContent }test</span>
								
							</td>
							<td>${l.reportDate }</td>
							<td>${l.status }</td>
						</tr>
						</c:forEach>
					</table>
					
					<!-- Modal Start -->
					<div class="modal" id="reportContent">
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
											<th>누적신고횟수</th>
										</tr>
										<tr>
										
											<td><p id="신고된 댓글 작성자 닉네임">winter</p></td>
											<td><p id="신고된 댓글 작성자의 누적 신고 카운트">1</p></td>
										</tr>
									</table>
									<br>
									
									<div align="center" style="width:500px">
										<div style="text-align:left">작성일:<p id="modalEnrollDate"></p></div>
										<div style="width:500px; height: 80px; border:solid 1px; text-align:left;">
										<p id="modalReplyContent"></p>
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
											<td></td>
											<td><p id="modalReportDate"></p></td>
											<td><p id="modalReportType"></p></td>
										</tr>
									</table>
									<br>
									<button class="btn btn-default" id="approval${l.reportNo }" 
									data-no="${l.lessonNo}" onclick="approvalClass(this);">블랙등록</button>
									
									<button class="btn btn-default" id="reject${l.reportNo }" data-toggle="modal" data-target="#rejectApproval" 
									data-no="${l.lessonNo}" onclick="rejectApprovalSet(this)">댓글삭제</button>
									
							
								</div>	
							</div>
						</div>
					</div>
					<!--Modal End-->
					
					<script>
						$(function(){
							reArr(); 
						})
						
						function reArr(e){
							var memNo = $(e).data("memno");
							var nickname = $(e).data("nickname"); 
							var reportCount = $(e).data("reportcount");
							var replyNo = $(e).data("replyno");
							var enrollDate = $(e).data("enrolldate");
							var replyContent = $(e).data("replycontent");
							var reportNo = $(e).data("reportno");
							var reportDate = $(e).data("reportdate");
							var reportType = $(e).data("reporttype");
							
							$("#modalMemNo").text(memNo);
							$("#modalNickname").text(nickname);
							$("#modalReportCount").text(reportCount);
							$("#modalReplyNo").text(replyNo);
							$("#modalEnrollDate").text(enrollDate);
							$("#modalReplyContent").text(replyContent);
							$("#modalReportNo").text(reportNo);
							$("#modalReportDate").text(reportDate);
							$("#modalReportType").text(reportType);
					</script>
					<!-- 블랙등록 확인 alert ** 컬럼별로 번호 매겨서야 한다(Condition 변경하기 위해) -->
					<script>
						function approvalClass(e) {
							var accept = confirm("블랙리스트로 변경하시겠습니까?");
							var lessonNo = $(e).data("memno");
							var str = "승인";
							
							console.log(lessonNo); 
							
							if (accept) {
								$.ajax({
									url:"lessonApproval.ad",
									data:{
										lessonNo:lessonNo
									},
									success:function(result){
										if(result == "success" ){
											alert("승인 완료되었습니다.")
											$("#approvalArea"+lessonNo).text(str);
											$("#approval"+lessonNo).attr("disabled",true); 
											$("#reject"+lessonNo).attr("disabled",false);
											
										} else {
											alert("승인 실패했습니다.")
										}
									},
									error:function(){
										console.log("approval class ajax fail");
									}
								});

							} else {
								
								return;
							}

						}
						
						function rejectApprovalSet(e){
							 $("#rejectNo").val($(e).data("no"));
						}
						
						function sendRejectReason(){
							var accept = confirm("거절 사유 작성 완료 하시겠습니까?")
							var lessonNo = $("#rejectNo").val();
							var rReason = $("#reportReasonArea").val();
							var str = '거절'; 
							
							console.log(rReason); 
							if(accept){
								$.ajax({
									url:"rejectApproval.ad",
									data:{
										lessonNo:lessonNo,
										refuseReason: rReason
									},
									success:function(result){
										if(result == "success"){
											alert("거절 완료되었습니다.");
											$("#reportReasonArea").val("");
											$("#approvalArea"+lessonNo).text(str);
											$("#reject"+lessonNo).attr("disabled",true);
											$("#approval"+lessonNo).attr("disabled",false); 
										}
									},
									error:function(){
										console.log("reject approval ajax fail");
									}
								});
								
							}else{
								return;
							}
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
								<li><a href="reportManagement.ad?currentPage=${pi.currentPage -1 }">&lt;</a></li>
							</c:otherwise>
						</c:choose>
						
						
						<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
							<c:choose>
								<c:when test="${pi.currentPage ne p }">
									<c:choose>
										<c:when test="${empty sc }">
											<li><a href="reportManagement.ad?currentPage=${p}">${p}</a></li>
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
								<li><a href="reportManagement.ad?currentPage=${pi.currentPage +1 }">&gt;</a></li>
							</c:otherwise>
						</c:choose>	
						</ul>
					</div>
			</section>
		</div>
	</div>
</body>


</html>