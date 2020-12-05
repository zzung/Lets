<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
</head>
<body>
	<jsp:include page="adminNav.jsp" />
	<div id="main-wrapper">
		<div class="main-content">
			<section id="memberManagement">
				<div class="content-header">
					<h1>회원 관리</h1>
				</div>
				
				<div class="welcome" align="center" style="width:1030px;">
					<div align="right">
						<form action="searchMemberMgmt.ad">
							<select name="condition" style="height: 30px;">
								<option value="memName">이름</option>
								<option value="nickname">닉네임</option>
								<option value="email">아이디(이메일)</option>
							</select>
							<input type="text" name="keyword">
							<button type="submit" class="btn btn-default">검색</button>
						</form>
					</div>
					<br>
					<table class="list-area" style="width:1030px;">
						<tr>
							<th width="50px" height="40px">번호</th>
							<th width="80px">회원 분류</th>
							<th width="80px">이름</th>
							<th width="150px">닉네임</th>
							<th width="220px">이메일</th>
							<th width="110px">회원 상세조회</th>
						</tr>
						<c:forEach var="m" items="${list}" varStatus="status">
						<tr>
							<td height="40px">${status.count }</td>
							<td>
								<c:choose>
									<c:when test="${m.auth eq '1' }">
						               	<span>회원</span>
					                </c:when>
					                <c:when test="${m.auth eq '2' }">
						            	<span>튜터</span>
					                </c:when>
					                <c:when test="${m.auth eq '3' }">
						            	<span style="color: blue">* 관리자 *</span>
					                </c:when>
					                <c:when test="${m.status eq 'B' }">
						               	<span style="color: red;">* 블랙 *</span>
					                </c:when>
						        </c:choose>
							</td>
							<td>${m.memName }</td>
							<td>${m.nickname }</td>
							<td>${m.memId }</td>
							<td>
							<button type="button" data-no="${m.memNo }" data-toggle="modal"
									data-target="#memberInfo" class="btn btn-default">상세 조회</button>
							</td>
						</tr>
						</c:forEach>
					</table>
					
					<!-- Modal Start -->
					<div class="modal" id="memberInfo">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content" align="left" style="width: 800px;">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h3 class="modal-title" style="text-align:center">회원 상세조회</h3>
								</div>
								<div class="modal-body" align=center>
									<span><h4>회원정보</h4></span>
									<table class="list-area">
										<tr>
											<th width="80px">회원 분류</th>
											<th width=80>이름</th>
											<th width=140>닉네임</th>
											<th width=220>이메일</th>
											<th width=140>연락처</th>
											<th width=120>생년월일</th>
											<th width=50>성별</th>											
										</tr>
										<tr>
											<c:choose>
								               	<c:when test="${m.auth eq 1 }">
									                <td>회원</td>
								                </c:when>
									            <c:when test="${m.auth eq 2 }">
											        <td>튜터</td>
									            </c:when>
									            <c:when test="${m.auth eq 3 }">
											        <td>관리자</td>
									            </c:when>
							                </c:choose>
											<td>${m.memName }</td>
											<td>${m.nickname }</td>
											<td>${m.memId }</td>
											<td>${m.phone }</td>
											<td>${m.birthday }</td>
											<td>
												<c:choose>
									               	<c:when test="${m.gender eq 'M' }">
										                	남
									                </c:when>
										            <c:when test="${m.gender eq 'F' }">
										               	 여
									                </c:when>
								                </c:choose>
							                </td>
										</tr>
									</table>
									<br>
									<table class="list-area">
										<tr>
											<th width=120>가입일</th>
											<th width=120>탈퇴일</th>
											<th width=80>회원상태</th>
										</tr>
										<tr>
										<td>${m.enrollDate }</td>
										<td>${m.outDate }</td>
										<td>
											<c:choose>
												<c:when test="${m.status eq 'Y' }">
									               	정상
								                </c:when>
								                <c:when test="${m.status eq 'B' }">
									               	블랙
								                </c:when>
									             <c:when test="${m.status eq 'N' }">
									               	탈퇴
								                </c:when>
									        </c:choose>
								        </td>
										</tr>
									</table>
									<hr>
									
									<span><h4>수강 클래스 내역</h4></span>
									<table class="list-area">
										<tr>
											<th width=400>클래스 제목</th>
											<th width=140>클래스 카테고리</th>
										</tr>
										<tr>
											<td>${l.lessonTitle}</td>
											<td>${l.lessonCategory}</td>
										</tr>
									</table>
									<br>
									
									<span><h4>강의 클래스 내역</h4></span>
									<table class="list-area">
										<tr>
											<th width=400>클래스 제목</th>
											<th width=140>클레스 카테고리</th>
										</tr>
										<tr>
											<td>-</td>
											<td>-</td>
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