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
			<section id="memberManagement">
				<div class="content-header">
					<h1>회원 관리</h1>
				</div>
				
				<div class="welcome" align="center" style="width:800px;">
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
					<br>
					<table class="list-area">
						<tr>
							<th width="50px" height="40px">번호</th>
							<th width="80px">회원 분류</th>
							<th width="80px">이름</th>
							<th width="150px">닉네임</th>
							<th width="220px">이메일</th>
							<th width="80px">탈퇴여부</th>
							<th width="110px">회원 상세조회</th>
						</tr>
						<tr>
							<td height="40px">1</td>
							<td>회원</th>
							<td>고길동이</td>
							<td>닉네임1</td>
							<td>user01@naver.com</td>
							<td>N</td>
							<td><button type="button" data-toggle="modal"
									data-target="#memberInfo1" class="btn btn-default">상세 조회</button>
							</td>
						</tr>
						<tr>
							<td height="40px">2</td>
							<td>튜터</th>
							<td>김튜터</td>
							<td>닉네임2</td>
							<td>tutor02@naver.com</td>
							<td>N</td>
							<td><button type="button" data-toggle="modal"
									data-target="#memberInfo2" class="btn btn-default">상세 조회</button>
							</td>
						</tr>
					</table>
					
					<!--?Modal Start-->
					<div class="modal" id="memberInfo1">
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
											<td>회원</td>
											<td>고길동이</td>
											<td>닉네임1</td>
											<td>user01@naver.com</td>
											<td>010-1234-5678</td>
											<td>1989-10-10</td>
											<td>남</td>
										</tr>
									</table>
									<br>
									<table class="list-area">
										<tr>
											<th width=120>가입일</th>
											<th width=120>탈퇴일</th>
											<th width=80>탈퇴여부</th>
											<th width=80>블랙여부</th>
										</tr>
										<tr>
											<td>2020-11-19</td>
											<td>2020-11-19</td>
											<td>N</td>
											<td>N</td>
										</tr>
									</table>
									<hr>
									
									<span><h4>수강 클래스 내역</h4></span>
									<table class="list-area">
										<tr>
											<th width=400>클래스 제목</th>
											<th width=140>클레스 카테고리</th>
											<th width=200>수강기간</th>
										</tr>
										<tr>
											<td>1억모으기</td>
											<td>머니</td>
											<td>2020-01-20 ~ 2020-05-10</td>
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
					
					<!--?Modal Start-->
					<div class="modal" id="memberInfo2">
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
											<td>튜터</td>
											<td>김튜터</td>
											<td>닉네임2</td>
											<td>tutor01@naver.com</td>
											<td>010-4321-8765</td>
											<td>1989-01-10</td>
											<td>여</td>
										</tr>
									</table>
									<br>
									<table class="list-area">
										<tr>
											<th width=120>가입일</th>
											<th width=120>탈퇴일</th>
											<th width=80>탈퇴여부</th>
											<th width=80>블랙여부</th>
										</tr>
										<tr>
											<td>2020-11-19</td>
											<td>2020-11-19</td>
											<td>N</td>
											<td>N</td>
										</tr>
									</table>
									<hr>
									
									<span><h4>수강 클래스 내역</h4></span>
									<table class="list-area">
										<tr>
											<th width=400>클래스 제목</th>
											<th width=140>클레스 카테고리</th>
											<th width=200>수강기간</th>
										</tr>
										<tr>
											<td>프리미어프로 쉽게 배우기</td>
											<td>커리어</td>
											<td>2020-01-20 ~ 2020-05-10</td>
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
											<td>1억모으기</td>
											<td>머니</td>
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