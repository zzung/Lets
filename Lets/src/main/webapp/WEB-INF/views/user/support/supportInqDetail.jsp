<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세 페이지</title>
    <link rel="stylesheet" href="resources/user/assets/css/style.css">
    <link rel="stylesheet" href="resources/user/assets/css/curriculumPage.css">
    <link rel="stylesheet" href="resources/user/assets/css/multiSlider.css">
  
    <script type="text/javascript" async src="https://www.google-analytics.com/analytics.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="resources/user/assets/js/jquery-2.2.4.min.js"></script>
    <script src="resources/user/assets/js/multislider.min.js"></script>
    <script src="resources/user/assets/js/multislider.js"></script>
   
</head>
<body>
	<jsp:include page="../common/navBar.jsp" />

	<div style="padding:30px 100px;">
		<!-- 고객센터 상단 탭 -->
		<div align="left">
			<a href="supportNotice.su">
				<span style="margin:20px;">공지사항</span></a>
			<a href="supportFaq.su">
			<span style="margin:20px;">FAQ</span></a>
			<a href="supportInq.su">
			<span style="margin:20px;">문의사항</span></a>
			<hr>
		</div>
		
		<!-- 고객센터 내용 div -->
		<div style="width:1000px;">
			<div> 
				<div style="margin-bottom:10px;">
					<button type="button" data-toggle="modal" data-target="#updateInq"
					class="genric-btn primary-border radius">수정</button>
						
						<!-- 공지 작성 Modal Start -->
					<div class="modal" id="updateInq">
						<div class="modal-dialog">

							<!-- Modal content -->
							<div class="modal-content" align="center" style="width: 800px; ">
								<div>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<br>
									<h3 class="" style="text-align:center">문의내용 수정</h3>
								</div>
								<hr>
								<div class="modal-body" style="padding:0px 50px;">
								
								
									
									<form action="">
										<div align="left">
											<div>
												<label><input type="radio" name="typeStatus" checked>&nbsp;&nbsp;공개</label>
												<label><input type="radio" name="typeStatus">&nbsp;&nbsp;비공개</label>
											</div>
											<div style="height:60px;">
												<div>문의 유형</div>
												<div>
													<select>
														<option>사용자</option>
														<option>튜터</option>
														<option>클래스</option>
														<option>기타</option>
													</select>
												</div>
											</div>
											<br>										
											<div>
												<div>문의 제목</div>
												<input type="text" style="width:700px;" value="더욱 다양한 클래스가 있었으면 좋겠어요.">
											</div>
											<br>
											<div>
												<div>문의 내용</div>
												<div>
													<textarea style="width:700px; height:200px; resize:none;">다양한 카테고리에 다양한 클래스가 있었으면 좋겠어요~
뜨개질 같은거나 만드는거 배워보고 싶어요~
													</textarea>
												</div>
												<div>
													<div><input type="file"></div>
												</div>
											</div>
											<br>
											<div align="center">
												<button type="button" class="genric-btn primary-border radius" data-dismiss="modal">닫기</button>
												&nbsp;&nbsp;&nbsp;
												<button class="genric-btn primary-border radius" type="submit">수정하기</button>
											</div>
											<br>
										</div>
									</form>
									
								</div>	
							</div>
						</div>
					</div>
					<!-- 공지 작성 Modal End -->
						
					
					<button onclick="inqDelete();" id="inqDeleteBtn" 
					class="genric-btn primary-border radius">삭제</button>
									
					<!-- 문의 삭제 확인 alert ** 컬럼별로 번호 매겨서야 한다(Condition 변경하기 위해) -->
					<script>
						function inqDelete() {
							var num = 1;
							var result = confirm("문의를 삭제 하시겠습니까??");

							if (result) {
								var str = "삭제"
								document.getElementById("inqDeleteBtn").disabled = true;
							} else {
								return;
							}

							var inqCondition = document
									.getElementById("inqCondition" + num)
							inqCondition.innerHTML = "<p>" + str + "</p>"
						}
					</script>
					<!-- 문의 삭제 확인 끝 -->
					
					
				</div>
				
				<div style="padding:10px; border:solid 1px;">
					<!-- 공지 대상 -->
					<div>공개</div>
					<div>[클래스] 더욱 다양한 클래스가 있었으면 좋겠어요.</div>
					<div>
						<span style="width:100px; float:left;">2020-11-22</span>
						<span style="width:150px;">튜터01</span>
					</div>
					<hr>
					<div style="margin:-10px 0px;"><span>첨부파일 : </span></div>
					<hr>
					<div>
						<div>
							다양한 카테고리에 다양한 클래스가 있었으면 좋겠어요~
							<br>
							뜨개질 같은거나 만드는거 배워보고 싶어요~
							<br><br>
						</div>
					</div>
				</div>
				<br>
				<table>
					<tr>
						<td align="center" style="width:100px; height:100px;">
							<span><img src="" style="width:80px; height:80px;"></span>
							<span>관리자</span>
						</td>
						<td style="border:solid 1px; width:900px; padding:10px;">
							불편을 드려서 죄송합니다.
							<br>
							빠른 시일 내로 카테고리 추가에 대한 회의를 진행 후 다양한 클래스로 찾아뵙겠습니다. 감사합니다.
						</td>
					</tr>
				</table>
			</div>
			<hr>
			<button type="button" class="genric-btn primary-border" style="margin-top:10px;"
			onclick=";location.href='supportInq.su'">목록으로</button>
		</div>
	</div>
		
	<jsp:include page="../common/footer.jsp" />

</body>
</html>