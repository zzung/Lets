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
								<a href="#" data-toggle="modal" data-target="#detailNotice">
								[서비스 개편 사항] 메인페이지에서 새로 생긴 클래스를 확인할 수 있습니다.
								</a>
							</td>
							<td>2020-10-30</td>
							<td>N</td>
						</tr>
					</table>
					
					
<!------------------------------------------------------ 공지 작성 모달&스크립트 ------------------------------------------------------>

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
									<form action="">
										<div style="height:36px;">
											<select name="condition" style="width:100px; height:30px;">
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
											<button onclick="noticeApply();" id=""
													class="btn btn-default">파일찾기</button>
										</div>
										<br>
										<div>
											<span>
												<button onclick="noticeApply();" id="noticeApplyBtn"
												class="btn btn-default">등록</button>
											</span>
										</div>
									</form>
								</div>	
							</div>
						</div>
					</div>
					<!-- 공지 작성 Modal End -->
					
					<!-- 공지사항 등록 확인 alert ** 컬럼별로 번호 매겨서야 한다(Condition 변경하기 위해) -->
					<script>
						function noticeApply() {
							var num = 1;
							var result = confirm("공지사항을 등록 하시겠습니까??");

							if (result) {
								var str = "등록"
								document.getElementById("noticeApplyBtn").disabled = true;
							} else {
								return;
							}

							var noticeCondition = document
									.getElementById("noticeCondition" + num)
							blacklistCondition.innerHTML = "<p>" + str + "</p>"
						}
					</script>
					<!-- 공지사항 등록 확인 끝 -->
					
					
<!------------------------------------------------------ 공지 등록 ------------------------------------------------------>
					
					
					
					<!-- 공지 내용 Modal Start -->
					<div class="modal" id="detailNotice">
						<div class="modal-dialog">

							<!-- Modal content -->
							<div class="modal-content" align="center" style="width: 900px; ">
								<div class="modal-header" >
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h3 class="modal-title" style="text-align:center">공지사항 수정</h3>
								</div>
								
								<div class="modal-body" align="center" style="width:800px;">
									<!--  form start -->
									<form action="">
										<div style="height:36px;">
											<select name="condition" style="width:100px; height:30px;">
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
											<button onclick="noticeApply();" id=""
													class="btn btn-default">파일찾기</button>
										</div>
										<br>
										<div>
											<span>
												<button onclick="noticeModify();" id="noticeModifyBtn"
												class="btn btn-default">수정</button>
											</span>
										</div>
									</form>
									
								</div>	
							</div>
						</div>
					</div>
					<!-- 공지 내용 Modal End -->
					
					
					<!-- 공지 수정 Modal Start -->
					<div class="modal" id="ModifyNotice">
						<div class="modal-dialog">

							<!-- Modal content -->
							<div class="modal-content" align="center" style="width: 900px; ">
								<div class="modal-header" >
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h3 class="modal-title" style="text-align:center">공지사항 수정</h3>
								</div>
								<div class="modal-body" align="center" style="width:800px;">
									<form action="">
										<div style="height:36px;">
											<select name="condition" style="width:100px; height:30px;">
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
											<button onclick="noticeApply();" id=""
													class="btn btn-default">파일찾기</button>
										</div>
										<br>
										<div>
											<span>
												<button onclick="noticeModify();" id="noticeModifyBtn"
												class="btn btn-default">수정</button>
											</span>
										</div>
									</form>
								</div>	
							</div>
						</div>
					</div>
					<!-- 공지 수정 Modal End -->
					
					
					
					
					
					
					
					
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