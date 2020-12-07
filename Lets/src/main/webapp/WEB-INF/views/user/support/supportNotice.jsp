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
			<c:forEach var="n" items="${list}" varStatus="status">
			<div>
				<a href="supportNoticeDetail.su?noticeNo=${n.noticeNo }">
					<div style="padding:10px; border:solid 1px;">
						<!-- 공지 대상 -->
						<div><h5>${n.noticeType }</h5></div>
						<div>${n.noticeTitle }</div>
						<div>${n.enrollDate }</div>
					</div>
				</a>
				<br>
			</div>
			</c:forEach>
			
			
			
			
			 <div class="container" align="center">
					<ul class="pagination">
					<c:choose>
						<c:when test="${pi.currentPage eq 1 }">
							<li class="disabled"><a href="">&lt;</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="classManagement.ad?currentPage=${pi.currentPage -1 }">&lt;</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<c:choose>
							<c:when test="${pi.currentPage ne p }">
								<c:choose>
									<c:when test="${empty sc }">
										<li><a href="classManagement.ad?currentPage=${p}">${p}</a></li>
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
							<li><a href="classManagement.ad?currentPage=${pi.currentPage +1 }">&gt;</a></li>
						</c:otherwise>
					</c:choose>	
					</ul>
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