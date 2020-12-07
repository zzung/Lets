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
							
								<form action="insertInq.su" method="post" onsubmit="return confirm('공지를 등록 하시겠습니까?');">
									<div align="left">
										<div style="width:300px;">
											<label><input type="radio" name="typeStatus" checked>&nbsp;&nbsp;공개</label>
											<label><input type="radio" name="typeStatus">&nbsp;&nbsp;비공개</label>
										</div>
										<div style="height:60px;">
											
											<div><div>문의 유형</div>
												<select name="inqType">
													<option value="사용자">사용자</option>
													<option value="튜터">튜터</option>
													<option value="클래스">클래스</option>
													<option value="기타">기타</option>
												</select>
											</div>
										</div>
										<br>										
										<div>
											<div>문의 제목</div>
											<input type="text" style="width:700px;" name="inqTitle" placeholder="제목을 입력하세요.">
										</div>
										<br>
										<div>
											<div>문의 내용</div>
											<div>
												<textarea style="width:700px; height:200px; resize:none;" name="inqContent" placeholder="내용을 입력하세요."></textarea>
											</div>
											<div>
												<div><input type="file" id="upfile" class="form-control-file border" style="width:500px;" name="inqFile"></div>
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
				<c:forEach var="i" items="${list}" varStatus="status">
				<div id="boardList">
					<a href="supportInqDetail.su?inqNo=${i.inqNo }" >
						<div class="ino" style="border:solid 1px; padding:10px;">
							<input type="hidden" value="${i.inqNo }">
							<div>${i.typeStatus }</div>
							<div>${i.inqTitle }</div>
							<div><span style="margin-right:20px;">${i.enrollDate }</span><span>${i.nickname }</span></div>
						</div>
					</a>
					<br>
				</div>
				</c:forEach>
				
			</div>
			
			<div class="blog-pagination justify-content-center d-flex" align="center">
				<ul class="pagination">
				<c:choose>
					<c:when test="${pi.startPage eq 1 }">
					 <li class="page-item">
			            <a href="#" class="page-link" aria-label="Previous">
			                <i class="ti-angle-left"></i>
			            </a>
			        </li>
					</c:when>
					
					<c:otherwise>
						<li class="page-item">
				            <a href="supportInq.su?currentPage=${pi.currentPage -1 }" class="page-link" aria-label="Previous">
				                <i class="ti-angle-left"></i>
				            </a>
				        </li>
					</c:otherwise>
				</c:choose>
				
				
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
					<c:choose>
						<c:when test="${pi.currentPage ne p }">
							<c:choose>
								<c:when test="${empty sc }">
								<li class="page-item active">
						            <a href="supportInq.su?currentPage=${p}" class="page-link">${p}</a>
						        </li>
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
						 <li class="page-item">
				            <a href="#" class="page-link" aria-label="Next">
				                <i class="ti-angle-right"></i>
				            </a>
				        </li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a href="supportInq.su?currentPage=${pi.currentPage +1 }" class="page-link" aria-label="Next">
				                <i class="ti-angle-right"></i>
				            </a>
						</li>
					</c:otherwise>
				</c:choose>	
				</ul>
			</div>
			
		</div>
	</div>
		
	<jsp:include page="../common/footer.jsp" />

</body>
</html>