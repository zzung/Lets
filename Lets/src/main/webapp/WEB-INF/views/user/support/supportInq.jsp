<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>
    <link rel="stylesheet" href="resources/user/assets/css/style.css">
    <link rel="stylesheet" href="resources/user/assets/css/curriculumPage.css">
    <link rel="stylesheet" href="resources/user/assets/css/multiSlider.css">
  
    <script type="text/javascript" async src="https://www.google-analytics.com/analytics.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="resources/user/assets/js/jquery-2.2.4.min.js"></script>
    <script src="resources/user/assets/js/multislider.min.js"></script>
    <script src="resources/user/assets/js/multislider.js"></script>
    <style>
    -webkit-tap-highlight-color: transparent;
--blue: #007bff;
--indigo: #6610f2;
--purple: #6f42c1;
--pink: #e83e8c;
--red: #dc3545;
--orange: #fd7e14;
--yellow: #ffc107;
--green: #28a745;
--teal: #20c997;
--cyan: #17a2b8;
--white: #fff;
--gray: #6c757d;
--gray-dark: #343a40;
--primary: #007bff;
--secondary: #6c757d;
--success: #28a745;
--info: #17a2b8;
--warning: #ffc107;
--danger: #dc3545;
--light: #f8f9fa;
--dark: #343a40;
--breakpoint-xs: 0;
--breakpoint-sm: 576px;
--breakpoint-md: 768px;
--breakpoint-lg: 992px;
--breakpoint-xl: 1200px;
--font-family-sans-serif: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
--font-family-monospace: SFMono-Regular,Menlo,Monaco,Consolas,"Liberation Mono","Courier New",monospace;
font-size: 1rem;
line-height: 1.5;
color: #212529;
text-align: left;
font-family: "Roboto",sans-serif;
font-weight: normal;
font-style: normal;
box-sizing: border-box;
display: flex!important;
justify-content: center!important;
margin-top: 80px;
    
    
    </style>
    
    
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
				<div><button type="button" data-toggle="modal" data-target="#writeInq" 
				class="genric-btn primary-border radius" style="width:1000px">- 1:1 문의 작성 하기 - </button></div>
					
				<!-- 문의 작성 Modal Start -->
				<div class="modal" id="writeInq">
					<div class="modal-dialog">
						<!-- Modal content -->
						<div class="modal-content" align="center" style="width: 800px; ">
							<div>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<br>
								<h3 class="" style="text-align:center">1:1 문의 작성하기</h3>
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
											<input type="text" style="width:700px;" value="" placeholder="제목을 입력하세요.">
										</div>
										<br>
										<div>
											<div>문의 내용</div>
											<div>
												<textarea style="width:700px; height:200px; resize:none;" placeholder="내용을 입력하세요."></textarea>
											</div>
											<div>
												<div><input type="file"></div>
											</div>
										</div>
										<br>
										<div align="center">
											<button type="reset" class="genric-btn primary-border radius">초기화</button>
											&nbsp;&nbsp;&nbsp;
											<button type="submit" class="genric-btn primary-border radius">문의하기</button>
										</div>
										<br>
									</div>
								</form>
							</div>	
						</div>
					</div>
				</div>
				<!-- 문의 작성 Modal End -->
				
				<br>
				<a href="supportInqDetail.su">
					<div style="border:solid 1px; padding:10px;">
						<div>공개</div>
						<div>[클래스] 더욱 다양한 클래스가 있었으면 좋겠어요.</div>
						<div><span style="margin-right:20px;">2020-11-22</span><span>튜터01</span></div>
					</div>
				</a>
				<br>
				<a href="supportInqDetail.su">
					<div style="border:solid 1px; padding:10px;">
						<div>공개</div>
						<div>[사용자] 결제 한 클래스를 환불을 받고 싶어요.</div>
						<div><span style="margin-right:20px;">2020-11-22</span><span>유저01</span></div>
					</div>
				</a>
				<br>
				<a href="supportInqDetail.su">
					<div style="border:solid 1px; padding:10px;">
						<div>비공개</div>
						<div>[기타] 기타를 잘치고 싶어요.</div>
						<div><span style="margin-right:20px;">2020-11-22</span><span>유저07</span></div>
					</div>
				</a>
				<br>
				<a href="supportInqDetail.su">
					<div style="border:solid 1px; padding:10px;">
						<div>비공개</div>
						<div>[튜터]환불은 어떻게 진행하나요?</div>
						<div><span style="margin-right:20px;">2020-11-22</span><span>튜터01</span></div>
					</div>
				</a>
				<br>
			</div>
			
			<div class="blog-pagination justify-content-center d-flex">
			    <ul class="pagination">
			        <li class="page-item">
			            <a href="#" class="page-link" aria-label="Previous">
			                <i class="ti-angle-left"></i>
			            </a>
			        </li>
			        <li class="page-item">
			            <a href="#" class="page-link">1</a>
			        </li>
			        <li class="page-item active">
			            <a href="#" class="page-link">2</a>
			        </li>
			        <li class="page-item active">
			            <a href="#" class="page-link">3</a>
			        </li>
			        <li class="page-item active">
			            <a href="#" class="page-link">4</a>
			        </li>
			        <li class="page-item active">
			            <a href="#" class="page-link">5</a>
			        </li>
			        <li class="page-item">
			            <a href="#" class="page-link" aria-label="Next">
			                <i class="ti-angle-right"></i>
			            </a>
			        </li>
			    </ul>
			</div>
			
		</div>
	</div>
		
	<jsp:include page="../common/footer.jsp" />

</body>
</html>