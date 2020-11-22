<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 관리</title>
</head>
<body>
	<jsp:include page="adminNav.jsp" />
	<div id="main-wrapper">
		<div class="main-content">
			<section id="reportManagement">
				<div class="content-header">
					<h1>FAQ 관리</h1>
				</div>
				
				<div class="welcome" align="center" style="width:1030px;">
					<!-- 검색 div start -->
					<div>
						<div style="width:200px; float:left; text-align:left;">
							<button type="button" data-toggle="modal"
									data-target="#writeFaq" class="btn btn-default">FAQ 작성</button>
						</div>
						<div align="right">
							<form action="">
								<select name="condition" style="height: 30px;">
									<option value="title">제목</option>
									<option value="type">분류</option>
									<option value="type">유형</option>
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
							<th width="90px">분류</th>
							<th width="90px">유형</th>
							<th width="500px">제목</th>
							<th width="120px">작성일</th>
							<th width="120px">삭제여부</th>
						</tr>
						<tr>
							<td height="40px">1</td>
							<td>회원</td>
							<td>회원</td>
							<td>회원가입을 하면 할수 있는 것들은 무엇인가요?</td>
							<td>2020-10-30</td>
							<td>N</td>
						</tr>
						<tr>
							<td height="40px">2</td>
							<td>회원</td>
							<td>클래스</td>
							<td>회원은 클래스를 어떻게 신청하나요?</td>
							<td>2020-10-30</td>
							<td>N</td>
						</tr>
						<tr>
							<td height="40px">3</td>
							<td>회원</td>
							<td>결제</td>
							<td>클래스 결제 방법이 어떻게 되나요?</td>
							<td>2020-10-30</td>
							<td>N</td>
						</tr>
						<tr>
							<td height="40px">4</td>
							<td>회원</td>
							<td>시스템</td>
							<td>자기소개작성은 어떻게 하나요?</td>
							<td>2020-10-30</td>
							<td>N</td>
						</tr>
						<tr>
							<td height="40px">5</td>
							<td>회원</td>
							<td>기타</td>
							<td>배송확인은 어디서 하나요?</td>
							<td>2020-10-30</td>
							<td>N</td>
						</tr>
						<tr>
							<td height="40px">6</td>
							<td>튜터</td>
							<td>회원</td>
							<td>클래스를 수강중인 회원은 어디서 확인하나요?</td>
							<td>2020-10-30</td>
							<td>N</td>
						</tr>
						<tr>
							<td height="40px">7</td>
							<td>튜터</td>
							<td>클래스</td>
							<td>클래스 생성은 어떻게 하나요?</td>
							<td>2020-10-30</td>
							<td>N</td>
						</tr>
						<tr>
							<td height="40px">8</td>
							<td>튜터</td>
							<td>결제</td>
							<td>결제취소 회원은 어떻게 처리하나요?</td>
							<td>2020-10-30</td>
							<td>N</td>
						</tr>
						<tr>
							<td height="40px">9</td>
							<td>튜터</td>
							<td>시스템</td>
							<td>정산은 진행 하나요?</td>
							<td>2020-10-30</td>
							<td>N</td>
						</tr>
						<tr>
							<td height="40px">5</td>
							<td>튜터</td>
							<td>기타</td>
							<td>관리자님과 상담하려면 어떻게 하나요?</td>
							<td>2020-10-30</td>
							<td>N</td>
						</tr>
					</table>
					
					
<!------------------------------------------------------ 공지 작성 모달&스크립트 시작 ------------------------------------------------------>

					<!-- 공지 작성 Modal Start -->
					<div class="modal" id="writeFaq">
						<div class="modal-dialog">

							<!-- Modal content -->
							<div class="modal-content" align="center" style="width: 900px; ">
								<div class="modal-header" >
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h3 class="modal-title" style="text-align:center">FAQ 작성</h3>
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
											<span>유형 : </span>
											<label for="member"><input type="radio" name="faqCategory" id="member" value="">회원</label>&nbsp;&nbsp;&nbsp;
											<label for="tutor"><input type="radio" name="faqCategory" id="tutor" value="">튜터</label>&nbsp;&nbsp;&nbsp;
											<label for="lesson"><input type="radio" name="faqCategory" id="lesson" value="">클래스</label>&nbsp;&nbsp;&nbsp;
											<label for="pay"><input type="radio" name="faqCategory" id="pay" value="">결제</label>&nbsp;&nbsp;&nbsp;
											<label for="etc"><input type="radio" name="faqCategory" id="etc" value="">기타</label>
										</div>
										<div>
											<textarea style="resize:none; width:770px; height:500px;" placeholder="내용을 입력하세요."></textarea>
										</div>
										<br>
										<div>
											<span>
												<button onclick="noticeReset();" id="noticeResetBtn"
												class="btn btn-default">이전</button>
											</span>
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
					
					<!-- 공지사항 리셋 확인 alert ** 컬럼별로 번호 매겨서야 한다(Condition 변경하기 위해) -->
					<script>
						function noticeReset() {
							var num = 1;
							var result = confirm("공지사항을 리셋 하시겠습니까??");

							if (result) {
								var str = "리셋"
								document.getElementById("noticeResetBtn").disabled = true;
							} else {
								return;
							}

							var noticeCondition = document
									.getElementById("noticeCondition" + num)
							blacklistCondition.innerHTML = "<p>" + str + "</p>"
						}
					</script>
					<!-- 공지사항 리셋 확인 끝 -->
					
					
<!------------------------------------------------------ 공지 작성 모달&스크립트 끝 ------------------------------------------------------>
					
					
					
					
<!------------------------------------------------------ 공지 내용 모달&스크립트 시작 ------------------------------------------------------>
					<!-- 공지 내용 Modal Start -->
					<div class="modal" id="detailNotice">
						<div class="modal-dialog">

							<!-- Modal content -->
							<div class="modal-content" align="center" style="width: 900px; ">
								<div class="modal-header" >
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h3 class="modal-title" style="text-align:center">공지사항 내용</h3>
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
												<button onclick="noticeApply();" id="noticeApplyBtn"
												class="btn btn-default">이전</button>
											</span>
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
<!------------------------------------------------------ 공지 내용 모달&스크립트 종료 ------------------------------------------------------>
					
					
					
					
<!------------------------------------------------------ 공지 수정 모달&스크립트 시작 ------------------------------------------------------>					
					
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
<!------------------------------------------------------ 공지 내용 모달&스크립트 종료 ------------------------------------------------------>
					
					
					
					
					
					
					
					
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