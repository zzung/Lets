<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>
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
							<form action="searchNoticeMgmt.ad">
								<input type="hidden" name="currentPage" value="1"> 
								<select name="condition" style="height: 30px;">
									<option value="noticeType">분류</option>
									<option value="noticeTitle">공지제목</option>
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
							<th width="90px">중요공지</th>
							<th width="90px">분류</th>
							<th width="500px">공지제목</th>
							<th width="120px">작성일</th>
							<th width="120px">삭제여부</th>
						</tr>
						<c:forEach var="n" items="${list }" varStatus="status">
						<tr>
							<td height="40px">${status.count }</td>
							<td>
							<c:choose>
			                	<c:when test="${n.status eq 'R' }">
			                		* 중요공지
			                	</c:when>
			                	<c:otherwise>
			                		일반공지
					            </c:otherwise>
			                </c:choose>
							</td>
							<td>
							<c:choose>
			                	<c:when test="${n.noticeType eq 'TUTOR' }">
			                		튜터
			                	</c:when>
			                	<c:otherwise>
			                		회원
					            </c:otherwise>
			                </c:choose>
							</td>
							<td><!-- 작성된 공지 페이지로 이동 / 공지내용에서 관리자 일시 수정 버튼 클릭 생성 후 수정 가능 -->
								<a href="supportNoticeDetail.su?noticeNo=${n.noticeNo }" target="_blank">
								${n.noticeTitle }
								</a>
							</td>
							<td>${n.enrollDate }</td>
							
							<td>
							<c:choose>
			                	<c:when test="${n.status eq 'N' }">
			                		삭제
			                	</c:when>
			                	<c:otherwise>
			                		-
					            </c:otherwise>
			                </c:choose>
							</td>
						</tr>
						</c:forEach>
					</table>
					
					
<!------------------------------------------------------ 공지 작성 모달&스크립트 시작 ------------------------------------------------------>

					<!-- 공지 작성 Modal Start -->
					<div class="modal" id="writeNotice">
						<div class="modal-dialog">

							<!-- Modal content -->
							<div class="modal-content" align="center" style="width: 900px; ">
								<div class="modal-header" >
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h3 class="modal-title" style="text-align:center">공지사항 등록</h3>
								</div>
								
								<div class="modal-body" align="center" style="width:800px;">
									<!-- 공지 등록 form start -->
									<form action="insertNotice.ad" method="post" onsubmit="return confirm('공지를 등록 하시겠습니까?');">
										<div style="height:36px;">
											<select name="noticeType" style="width:100px; height:30px;">
												<option value="MEMBER">회원</option>
												<option value="TUTOR">튜터</option>
											</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="text" style="width:640px;" name="noticeTitle" placeholder="제목을 입력하세요.">
										</div>
										<div align="left" style="width:800px; height:30px;">
											<input type="checkbox" name="status" id="importantNotice" value="R">
											<label for="importantNotice">중요 공지 등록</label>
										</div>
										<div>
											<textarea style="resize:none; width:770px; height:500px;" name="noticeContent" placeholder="내용을 입력하세요."></textarea>
										</div>
										<br>
										<div>
											<span>
												<button type="reset" class="btn btn-default">초기화</button>
											</span>
											&nbsp;&nbsp;&nbsp;
											<span>
												<button type="submit" class="btn btn-default">공지등록</button>
											</span>
										</div>
									</form>
								</div>	
							</div>
						</div>
					</div>
					<!-- 공지 작성 Modal End -->
					
<!------------------------------------------------------ 공지 작성 모달&스크립트 끝 ------------------------------------------------------>
					
					</div>
					<div class="container" align="center">
						<ul class="pagination">
						<c:choose>
							<c:when test="${pi.startPage eq 1 }">
								<li class="disabled"><a href="">&lt;</a></li>
							</c:when>
							
							<c:otherwise>
								<li><a href="noticeManagement.ad?currentPage=${pi.currentPage -1 }">&lt;</a></li>
							</c:otherwise>
						</c:choose>
						
						
						<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
							<c:choose>
								<c:when test="${pi.currentPage ne p }">
									<c:choose>
										<c:when test="${empty sc }">
											<li><a href="noticeManagement.ad?currentPage=${p}">${p}</a></li>
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
								<li><a href="noticeManagement.ad?currentPage=${pi.currentPage +1 }">&gt;</a></li>
							</c:otherwise>
						</c:choose>	
						</ul>
					</div>
			</section>
		</div>
	</div>
</body>


</html>