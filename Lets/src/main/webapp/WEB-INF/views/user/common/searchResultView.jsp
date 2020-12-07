<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/user/assets/css/style.css">
</head>
<body>
	<jsp:include page="navBar.jsp" />

	<main>
		<!--? Hero Start -->
		<div class="slider-area ">
			<div class="slider-height2 d-flex align-items-center">
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="hero-cap hero-cap2 text-center">
								<h2>${ text }</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="popular-course section-padding30">
		
			<div class="container">
			
				<div class="row">
				
					<!-- 레슨 -->
					<c:forEach var="lesson" items="${ lessonList }">
					
						<!-- 한 개 박스 -->
						<div class="col-xl-4 col-lg-4 col-md-6">
						
							<!-- Single course -->
							<div class="single-course mb-40">
							
								<div class="course-img">
									<img src="${ lesson.lessonCoverImg }">
								</div>
								
								<div class="course-caption">
								
									<div class="course-cap-top">
										<h4><a href="courseDetailView.le?lessonNo=${ lesson.lessonNo }">${ lesson.lessonTitle }</a></h4>
									</div>
									
									<div class="course-cap-mid d-flex justify-content-between">
									
										<!-- 평균 별점 계산 -->
										<div class="course-ratting">
										
											<c:forEach var="s" begin="1" end="${ lesson.star }">
												<i class="fas fa-star"></i> 
											</c:forEach>
											<c:forEach var="ss" begin="${ lesson.star }" end="4">
												<i class='fas fa-star' style='color:#e6e6e6'></i>
											</c:forEach>
					
										</div>
										
									</div>
									
									<div class="course-cap-bottom d-flex justify-content-between">
									
										<!-- 좋아요 수 -->
										<ul>
											<li><i class="ti-heart"></i> ${ lesson.likeCount }</li>
										</ul>
										
										<!-- 가격 -->
										<c:set var="disc" value="${ lesson.discount }"/>
				                        <c:set var="total" value="${ lesson.payTotal }" />
				                        <c:set var="totalAmount" value="${ total-(total*disc/100) }" />
										<c:choose>
			                           		<c:when test="${!empty lesson.discount }">
			                           			<span style="color:#b2b2b2">
			                           				${ lesson.discount }%&nbsp;&nbsp;&nbsp;
			                              			<fmt:formatNumber type="currency" value="${ totalAmount }"/>
			                              		</span>
			                           		</c:when>
			                           		<c:otherwise>
			                              		<span><fmt:formatNumber type="currency" value="${ lesson.payTotal }"/></span>
			                           		</c:otherwise>
			                           </c:choose>
										
									</div>
									
								</div>
								
							</div>
						</div>
						
					</c:forEach>
					
					
					<!-- 튜터 -->
					<c:forEach var="tutor" items="${ tutorList }">
					
						<!-- 한 개 박스 -->
						<div class="col-xl-4 col-lg-4 col-md-6">
						
							<!-- Single course -->
							<div class="single-course mb-40">
							
								<div class="course-img">
									<img src="${ tutor.lessonCoverImg }">
								</div>
								
								<div class="course-caption">
								
									<div class="course-cap-top">
										<h4><a href="courseDetailView.le?lessonNo=${ tutor.lessonNo }">${ tutor.lessonTitle }</a></h4>
									</div>
									
									<div class="course-cap-mid d-flex justify-content-between">
									
										<!-- 평균 별점 계산 -->
										<div class="course-ratting">
										
											<c:forEach var="s" begin="1" end="${ tutor.star }">
												<i class="fas fa-star"></i> 
											</c:forEach>
											<c:forEach var="ss" begin="${ tutor.star }" end="4">
												<i class='fas fa-star' style='color:#e6e6e6'></i>
											</c:forEach>
					
										</div>
										
									</div>
									
									<div class="course-cap-bottom d-flex justify-content-between">
									
										<!-- 좋아요 수 -->
										<ul>
											<li><i class="ti-heart"></i> ${ tutor.likeCount }</li>
										</ul>
										
										<!-- 가격 -->
										<c:set var="disc" value="${ tutor.discount }"/>
				                        <c:set var="total" value="${ tutor.payTotal }" />
				                        <c:set var="totalAmount" value="${ total-(total*disc/100) }" />
										<c:choose>
			                           		<c:when test="${!empty tutor.discount }">
			                           			<span style="color:#b2b2b2">
			                           				${ tutor.discount }%&nbsp;&nbsp;&nbsp;
			                              			<fmt:formatNumber type="currency" value="${ totalAmount }"/>
			                              		</span>
			                           		</c:when>
			                           		<c:otherwise>
			                              		<span><fmt:formatNumber type="currency" value="${ tutor.payTotal }"/></span>
			                           		</c:otherwise>
			                           </c:choose>
										
									</div>
									
								</div>
								
							</div>
						</div>
						
					</c:forEach>
	
				</div>
			</div>
		</div>
		<!-- new class End -->
	</main>
	<jsp:include page="footer.jsp" />
</body>
</html>