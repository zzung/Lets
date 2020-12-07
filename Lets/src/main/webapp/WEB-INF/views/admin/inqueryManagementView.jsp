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
							<th width="150px">닉네임</th>
							<th width="70px">분류</th>
							<th width="220px">문의 제목</th>
							<th width="120px">문의일</th>
							<th width="120px">단변일</th>
							<th width="90px">답변여부</th>
							<th width="90px">공개여부</th>
							<th width="90px">삭제여부</th>
						</tr>
						<c:forEach var="l" items="${list }" varStatus="status">
						<tr>
							<td height="40px">1</td>
							<td>닉네임1</td>
							<td>사용자</td>
							<td>
								<a href="#" data-toggle="modal" data-target="#inqueryContent1">
								제목1
								</a>
							</td>
							<td>2020-11-19</td>
							<td></td>
							<td>접수</td>
							<td>비공개</td>
							<td>N</td>
						</tr>
						</c:forEach>
					</table>
					
					<!-- Modal Start -->
					<div class="modal" id="inqueryContent1">
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
											<td style="border-bottom:solid 1px;">[클래스]더욱 다양한 클래스가 있었으면 좋겠어요</td>
										</tr>
										<tr>
											<td style="border-bottom:solid 1px;"><span style="margin-right:20px;">닉네임1</span><span>2020-09-29</span></td>
										</tr>
										<tr>
											<td>
											다양한 카테고리에 다양한 클래스가 있었으면 좋겠어요~
											뜨개질 같은거나 만드는거 배워보고 싶어요
											
											다양한 카테고리에 다양한 클래스가 있었으면 좋겠어요~
											뜨개질 같은거나 만드는거 배워보고 싶어요 다양한
											
											다양한 카테고리에 다양한 클래스가 있었으면 좋겠어요~
											뜨개질 같은거나 만드는거 배워보고 싶어요
											
											다양한 카테고리에 다양한 클래스가 있었으면 좋겠어요~
											뜨개질 같은거나 만드는거 배워보고 싶어요
											</td>
										</tr>
										<tr>
											<td style="border-bottom:solid 1px;">
												<div>
													<br>
													첨부파일:
												</div>
											</td>
										</tr>
									</table>
									<br>
									
									<!-- 문의내용 끝 -->
									
									<!-- 답변입력 시작 -->
									<div align="center">
										<form action="" onsubmit="return confirm('답변을 발송하시겠습니까?')">
											<div style="text-align:left">답변 입력</div>
											<div>
												<textarea name="" id="" style="resize:none; width: 720px; height: 80px;"></textarea>
											</div>
											<br>
											<div class="">
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