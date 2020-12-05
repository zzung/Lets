<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
				
				<a href="supportNoticeDetail.su">
					<div style="padding:10px; border:solid 1px;">
						<!-- 공지 대상 -->
						<div><h5>* 튜터</h5></div>
						<div>[서비스 개편 사항] 메인페이지에서 새로 생긴 클래스를 확인할 수 있습니다!</div>
						<div>2020-11-22</div>
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