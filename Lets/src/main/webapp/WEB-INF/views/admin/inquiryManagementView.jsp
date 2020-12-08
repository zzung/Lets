<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 관리</title>
</head>
<body>
	<jsp:include page="adminNav.jsp" />
	<div id="main-wrapper">
		<div class="main-content">
			<section id="memberManagement">
				<div class="content-header">
					<h1>1:1 문의</h1>
				</div>
				
				<div class="welcome" align="center" style="width:1030px;">
					<!-- 검색 div start -->
					<div>
						<div style="width:200px; float:left;">
							<!-- 분류 버튼 추가 자리 -->
						</div>
						<div align="right">
							<form action="searchInquiryMgmt.ad">
								<input type="hidden" name="currentPage" value="1"> 
								<select name="condition" style="height: 30px;">
									<option value="nickname">닉네임</option>
									<option value="inqType">분류</option>
									<option value="inqTitle">문의 제목</option>
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
							<th width="150px">닉네임</th>
							<th width="70px">분류</th>
							<th width="320px">문의 제목</th>
							<th width="100px">문의일</th>
							<th width="100px">답변일</th>
							<th width="70px">답변여부</th>
							<th width="70px">공개여부</th>
						</tr>
						<c:forEach var="l" items="${list }" varStatus="status">
						<tr>
							<td height="40px">${status.count }</td>
							<td>${l.nickname }</td>
							<td>${l.inqType }</td>
							<td>
								<span onclick="inqArrayList(this);" data-toggle="modal" 
								data-inqno="${l.inqNo}" data-inqtype="${l.inqType}" data-inqtitle="${l.inqTitle}"
								data-inqcontent="${l.inqContent}" data-enrolldate="${l.enrollDate}" data-answerdate="${l.answerDate}"
								data-answercontent="${l.answerContent}" data-inqfile="${l.inqFile}" data-originfile="${l.originFile}"
								data-typestatus="${l.typeStatus}" data-status="${l.status}" data-restatus="${l.reStatus}"
								data-nickname="${l.nickname}" data-memno="${l.memNo}" data-memid="${l.memId}"
								data-target="#inquiryContent">${l.inqTitle }</span>
							</td>
							<td>${l.enrollDate }</td>
							<td>${l.answerDate }</td>
							<td>${l.reStatus }</td>
							<td>${l.typeStatus }</td>
						</tr>
						
						
						
						
						</c:forEach>
					</table>
					
					<!-- Modal Start -->
					<div class="modal" id="inquiryContent">
						<div class="modal-dialog">

							<!-- Modal content -->
							<div class="modal-content" align="left" style="width: 800px; padding:20px;">
								<div class="modal-header" >
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h3 class="modal-title" style="text-align:center">1:1문의 내용</h3>
								</div>
								<div class="modal-body" align=left>
									
									<!-- 문의 내용 시작 -->
									<table>
										<tr>
											<td style="border-bottom:solid 1px;"><p id="modalTitle"></p></td>
										</tr>
										<tr>
											<td style="border-bottom:solid 1px;"><span style="margin-right:20px;" id="modalNickname"></span><span id="modalEnrollDate"></span></td>
										</tr>
										<tr>
											<td style="width:780px;">
											<div id="modalInqContent">
											</div>
											</td>
										</tr>
										<tr>
											<td style="border-bottom:solid 1px;">
												<br>
												<!-- <div>
													첨부파일:
												</div> -->
											</td>
										</tr>
									</table>
									<br>
									
									<!-- 문의내용 끝 -->
									
									<!-- 답변입력 시작 -->
									<div align="center">
										<form action="inqAnswer.ad" method="post" onsubmit="return confirm('답변을 발송하시겠습니까?')">
											<div style="text-align:left">답변 입력</div>
											<div>
												<textarea name="answerContent" style="resize:none; width: 720px; height: 80px;"></textarea>
											</div>
											<br>
											<div>
												<button type="submit">답변발송</button>
											</div>
										</form>
									</div>
									<!-- 답변입력 끝 -->
									
								</div>	
							</div>
						</div>
					</div>
					<!--Modal End-->
					
					<script>
						$(function(){
							inqArrayList(); 
						})
					
						function inqArrayList(e){
				
							var inqNo = $(e).data("inqno");
							var inqType = $(e).data("inqtype");
							var inqTitle = $(e).data("inqtitle");
							var inqContent = $(e).data("inqcontent");
							var enrollDate = $(e).data("enrolldate");
							var answerDate = $(e).data("answerdate");
							var answerContent = $(e).data("answercontent");
							var inqFile = $(e).data("inqfile");
							var originFile = $(e).data("originfile");
							var typeStatus = $(e).data("typestatus");
							var status = $(e).data("status");
							var reStatus = $(e).data("restatus");
							var nickname = $(e).data("nickname");
							var memNo = $(e).data("memno");
							var memid = $(e).data("memid");
							
							
							
							$("#modalInqNo").text(inqNo);
							$("#modalType").text(inqType);
							$("#modalTitle").text(inqTitle);
							$("#modalInqContent").text(inqContent);
							$("#modalEnrollDate").text(enrollDate);
							$("#modalAnswerDate").text(answerDate);
							$("#modalAnswerContent").text(answerContent);
							$("#modalInqFile").text(inqFile);
							$("#modaloriginFile").text(originFile);
							$("#modaltypeStatus").text(typeStatus);
							$("#modalStatus").text(status);
							$("#modalReStatus").text(reStatus);
							$("#modalNickname").text(nickname);
							$("#modalMemNo").text(memNo);
							$("#modalMemId").text(memId);
						}
					</script>
					
					
					
				</div>
				<div class="container" align="center">
					<ul class="pagination">
					<c:choose>
						<c:when test="${pi.startPage eq 1 }">
							<li class="disabled"><a href="">&lt;</a></li>
						</c:when>
						
						<c:otherwise>
							<li><a href="inquiryManagement.ad?currentPage=${pi.currentPage -1 }">&lt;</a></li>
						</c:otherwise>
					</c:choose>
					
					
					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<c:choose>
							<c:when test="${pi.currentPage ne p }">
								<c:choose>
									<c:when test="${empty sc }">
										<li><a href="inquiryManagement.ad?currentPage=${p}">${p}</a></li>
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
							<li><a href="inquiryManagement.ad?currentPage=${pi.currentPage +1 }">&gt;</a></li>
						</c:otherwise>
					</c:choose>	
					</ul>
				</div>
			</section>
		</div>
	</div>
</body>


</html>