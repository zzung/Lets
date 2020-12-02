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
							<td><!-- 작성된 공지 페이지로 이동 / 공지내용에서 관리자 일시 수정 버튼 클릭 생성 후 수정 가능 -->
								<a href="작성된 공지 페이지로 이동">
								[서비스 개편 사항] 메인페이지에서 새로 생긴 클래스를 확인할 수 있습니다.
								</a>
							</td>
							<td>2020-10-30</td>
							<td>N</td>
						</tr>
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
									<form action="" method="post" onsubmit="return confirm('공지를 등록 하시겠습니까?');">
										<div style="height:36px;">
											<select name="noticeType" style="width:100px; height:30px;">
												<option>회원</option>
												<option>튜터</option>
											</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="text" style="width:640px;" placeholder="제목을 입력하세요.">
										</div>
										<div align="left" style="width:800px; height:30px;">
											<input type="checkbox" name="status" id="importantNotice" value="R">
											<label for="importantNotice">중요 공지 등록</label>
										</div>
										<div>
											<textarea style="resize:none; width:770px; height:500px;" placeholder="내용을 입력하세요."></textarea>
										</div>
										<br>
										<div align="left" style="width:800px; height:40px;">
											<span>첨부파일 :</span>
											<span><input type="text"></span>
											<button onclick="findFile();" id=""
													class="btn btn-default">파일찾기</button>
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