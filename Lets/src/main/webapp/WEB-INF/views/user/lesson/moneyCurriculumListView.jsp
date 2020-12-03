<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

	<main>
		<!--? 컬리큘럼 상세 이미지 -->
		<div class="curriculum-area ">
			<div class="curriculum-header d-flex align-items-center"
				data-background="resources/user/assets/img/gallery/money.png"></div>
		</div>
		<!--? end 컬리큘럽 상세 이미지 -->

		<!--? 머니 인기 코스  -->
		<div class="popular-course section-padding-slider">
			<div class="container">
				<div class="row justify-content-sm-center">
					<div class="cl-xl-7 col-lg-8 col-md-10">
						<!-- Section Tittle -->
						<div class="section-tittle text-center mb-70">
							<h2>Money Popular Course</h2>
						</div>
					</div>
				</div>
				<!--?인기-->
				<div class="exampleRow">
					<div class="col-xs-12">
						<div id="exampleSlider-popular">
							<div class="MS-content">
							<c:forEach var="pop" items="${pop }">
								<div class="slider-course mb-40 item">
									<div class="course-img">
										<img src="${pop.lessonCoverImg }" alt="">
									</div>
									<div class="course-caption">
										<div class="course-cap-top">
											<h5>
												<a href="courseDetailView.le?lessonNo=${pop.lessonNo }">${pop.lessonTitle }</a>
											</h5>
										</div>
										<div class="course-cap-mid d-flex justify-content-between">
											<div class="course-ratting">
												<c:forEach var="s" begin="1" end="${pop.star }">
													<i class="fas fa-star"></i> 
												</c:forEach>
												<c:forEach var="ss" begin="${pop.star }" end="4">
													<i class='fas fa-star' style='color:#e6e6e6'></i>
												</c:forEach>
											</div>
										</div>
										<div class="course-cap-bottom d-flex justify-content-between">
											<ul>
												<li><i class="ti-heart"></i> ${pop.likeCount }</li>
											</ul>
											<span>${pop.price }원</span>
										</div>
									</div>
								</div>	
							</c:forEach>		
							</div>
							<div class="MS-controls">
								<button class="MS-left">&lt;</button>
								<button class="MS-right">&gt;</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--  Popular Course slider End -->
		<!--? 키즈 인기 코스  -->
		<div class="popular-course section-padding-slider">
			<div class="container">
				<div class="row justify-content-sm-center">
					<div class="cl-xl-7 col-lg-8 col-md-10">
						<!-- Section Tittle -->
						<div class="section-tittle text-center mb-70">
							<h2>Money New Course</h2>
						</div>
					</div>
				</div>
				<!--?slider-->
				<div class="exampleRow">
					<div class="col-xs-12">
						<div id="exampleSlider-new">
							<div class="MS-content">
							<c:forEach var="n" items="${nl }">
								<div class="slider-course mb-40 item">
									<div class="course-img">
										<img src="${n.lessonCoverImg }" alt="">
									</div>
									<div class="course-caption">
										<div class="course-cap-top">
											<h5>
												<a href="courseDetailView.le?lessonNo=${n.lessonNo }">${n.lessonTitle }</a>
											</h5>
										</div>
										<div class="course-cap-mid d-flex justify-content-between">
											<div class="course-ratting">
												<c:forEach var="s" begin="1" end="${n.star }">
													<i class="fas fa-star"></i> 
												</c:forEach>
												<c:forEach var="ss" begin="${n.star }" end="4">
													<i class='fas fa-star' style='color:#e6e6e6'></i>
												</c:forEach>
											</div>
										</div>
										<div class="course-cap-bottom d-flex justify-content-between">
											<ul>
												<li><i class="ti-heart"></i> ${n.likeCount }</li>
											</ul>
											<span>${n.price }원</span>
										</div>
									</div>
								</div>	
							</c:forEach>
							</div>
							<div class="MS-controls">
								<button class="MS-left">&lt;</button>
								<button class="MS-right">&gt;</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Money Popular Course End -->
		<!--? 머니 할인 클래스 -->
		<div class="popular-course section-padding-slider">
			<div class="container">
				<div class="row justify-content-sm-center">
					<div class="cl-xl-7 col-lg-8 col-md-10">
						<!-- Section Tittle -->
						<div class="section-tittle text-center mb-70">
							<h2>Money Discount Course</h2>
						</div>
					</div>
				</div>
				<!--?slider-->
				<div class="exampleRow">
					<div class="col-xs-12">
						<div id="exampleSlider-discount">
							<div class="MS-content">
							<c:forEach var="d" items="${disc }">
								<div class="slider-course mb-40 item">
									<div class="course-img">
										<img src="${d.lessonCoverImg }" alt="">
									</div>
									<div class="course-caption">
										<div class="course-cap-top">
											<h5>
												<a href="courseDetailView.le?lessonNo=${d.lessonNo }">${d.lessonTitle }</a>
											</h5>
										</div>
										<div class="course-cap-mid d-flex justify-content-between">
											<div class="course-ratting">
												<c:forEach var="s" begin="1" end="${d.star }">
													<i class="fas fa-star"></i> 
												</c:forEach>
												<c:forEach var="ss" begin="${d.star }" end="4">
													<i class='fas fa-star' style='color:#e6e6e6'></i>
												</c:forEach>
											</div>
										</div>
										<div class="course-cap-bottom d-flex justify-content-between">
											<ul>
												<li><i class="ti-heart"></i> ${d.likeCount }</li>
											</ul>
											<c:set var="disc" value="${d.discount }" />
											<c:set var="divide" value="100"/>
											<c:set var="price" value="${d.price }" />
											<c:set var="preTotal" value="${price * (disc / divide) }"/>
											<c:set var="total" value="${price - preTotal }" />
											<span>${d.discount }%&nbsp;&nbsp;&nbsp;<c:out value="${total }" />원</span>
										</div>
									</div>
								</div>	
							</c:forEach>
							</div>
							<div class="MS-controls">
								<button class="MS-left">&lt;</button>
								<button class="MS-right">&gt;</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Money Popular Course End -->



		<!--? 키즈 전테 클래스   -->
		<div class="popular-course section-padding40">
			<div class="container">
				<div class="row justify-content-sm-center">
					<div class="cl-xl-7 col-lg-8 col-md-10">
						<!-- Section Tittle -->
						<div class="section-tittle text-center mb-70">
							<h2>Money Course</h2>
						</div>
					</div>
				</div>
				<div class="row">
				<c:forEach var="a" items="${all }">
					 <div class="col-xl-4 col-lg-4 col-md-6">
					<div class="slider-course mb-40 item">
						<div class="course-img">
							<img src="${a.lessonCoverImg }" alt="">
						</div>
						<div class="course-caption">
							<div class="course-cap-top">
								<h5>
									<a href="courseDetailView.le?lessonNo=${a.lessonNo }">${a.lessonTitle }</a>
								</h5>
							</div>
							<div class="course-cap-mid d-flex justify-content-between">
								<div class="course-ratting">
									<c:forEach var="s" begin="1" end="${a.star }">
										<i class="fas fa-star"></i> 
									</c:forEach>
									<c:forEach var="ss" begin="${a.star }" end="4">
										<i class='fas fa-star' style='color:#e6e6e6'></i>
									</c:forEach>
								</div>
							</div>
							<div class="course-cap-bottom d-flex justify-content-between">
								<ul>
									<li><i class="ti-heart"></i> ${a.likeCount }</li>
								</ul>
								<span>${a.price }원</span>
							</div>
						</div>
					</div>	
				</div>
				</c:forEach>
				</div>
			</div>
		</div>
		<!-- hobby Popular Course End -->
		<!--slider 동적 문-->
		<script>
			$('#exampleSlider-popular').multislider({
				interval : 3000
			});

			$('#exampleSlider-new').multislider({
				interval : 3000
			});

			$('#exampleSlider-discount').multislider({
				interval : 3000
			});
		</script>
	</main>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>