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

		<!--? 키즈 인기 코스  -->
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
				<!--?slider-->
				<div class="exampleRow">
					<div class="col-xs-12">
						<div id="exampleSlider-popular">
							<div class="MS-content">
								<div class="slider-course mb-40 item">
									<input type="hidden" name="lessonNo" value="1">
									<div class="course-img">
										<img src="resources/user/assets/img/gallery/popular_sub1.png" alt="">
									</div>
									<div class="course-caption">
										<div class="course-cap-top">
											<h4>
												<a href="#">Graphic Design</a>
											</h4>
										</div>
										<div class="course-cap-mid d-flex justify-content-between">
											<div class="course-ratting">
												<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i>
											</div>
											<ul>
												<li>52 Review</li>
											</ul>
										</div>
										<div class="course-cap-bottom d-flex justify-content-between">
											<ul>
												<li><i class="ti-user"></i> 562</li>
												<li><i class="ti-heart"></i> 562</li>
											</ul>
										</div>
									</div>
								</div>

								<div class="slider-course mb-40 item">
									<div class="course-img">
										<img src="resources/user/assets/img/gallery/team2.png" alt="">
									</div>
									<div class="course-caption">
										<div class="course-cap-top">
											<h4>
												<a href="#">Graphic Design</a>
											</h4>
										</div>
										<div class="course-cap-mid d-flex justify-content-between">
											<div class="course-ratting">
												<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i>
											</div>
											<ul>
												<li>52 Review</li>
											</ul>
										</div>
										<div class="course-cap-bottom d-flex justify-content-between">
											<ul>
												<li><i class="ti-user"></i> 562</li>
												<li><i class="ti-heart"></i> 562</li>
											</ul>
										</div>
									</div>
								</div>

								<div class="slider-course mb-40 item">
									<div class="course-img">
										<img src="resources/user/assets/img/gallery/team1.png" alt="">
									</div>
									<div class="course-caption">
										<div class="course-cap-top">
											<h4>
												<a href="#">Graphic Design</a>
											</h4>
										</div>
										<div class="course-cap-mid d-flex justify-content-between">
											<div class="course-ratting">
												<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i>
											</div>
											<ul>
												<li>52 Review</li>
											</ul>
										</div>
										<div class="course-cap-bottom d-flex justify-content-between">
											<ul>
												<li><i class="ti-user"></i> 562</li>
												<li><i class="ti-heart"></i> 562</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="slider-course mb-40 item">
									<div class="course-img">
										<img src="resources/user/assets/img/gallery/team1.png" alt="">
									</div>
									<div class="course-caption">
										<div class="course-cap-top">
											<h4>
												<a href="#">Graphic Design</a>
											</h4>
										</div>
										<div class="course-cap-mid d-flex justify-content-between">
											<div class="course-ratting">
												<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i>
											</div>
											<ul>
												<li>52 Review</li>
											</ul>
										</div>
										<div class="course-cap-bottom d-flex justify-content-between">
											<ul>
												<li><i class="ti-user"></i> 562</li>
												<li><i class="ti-heart"></i> 562</li>
											</ul>
										</div>
									</div>
								</div>
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
		<!-- money Popular Course slider End -->
		<script>
			$(function(){
				$(".slider-course").click(function(){
					location.href="courseDetailView.le?lessonNo="+$(this).children("input[name=lessonNo]").val(); 
				});
			});
		</script>
		<!--? 머니 인기 코스  -->
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
								<div class="slider-course mb-40 item">
									<div class="course-img">
										<img src="resources/user/assets/img/gallery/popular_sub1.png" alt="">
									</div>
									<div class="course-caption">
										<div class="course-cap-top">
											<h4>
												<a href="#">Graphic Design</a>
											</h4>
										</div>
										<div class="course-cap-mid d-flex justify-content-between">
											<div class="course-ratting">
												<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i>
											</div>
											<ul>
												<li>52 Review</li>
											</ul>
										</div>
										<div class="course-cap-bottom d-flex justify-content-between">
											<ul>
												<li><i class="ti-user"></i> 562</li>
												<li><i class="ti-heart"></i> 562</li>
											</ul>
										</div>
									</div>
								</div>

								<div class="slider-course mb-40 item">
									<div class="course-img">
										<img src="resources/user/assets/img/gallery/team2.png" alt="">
									</div>
									<div class="course-caption">
										<div class="course-cap-top">
											<h4>
												<a href="#">Graphic Design</a>
											</h4>
										</div>
										<div class="course-cap-mid d-flex justify-content-between">
											<div class="course-ratting">
												<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i>
											</div>
											<ul>
												<li>52 Review</li>
											</ul>
										</div>
										<div class="course-cap-bottom d-flex justify-content-between">
											<ul>
												<li><i class="ti-user"></i> 562</li>
												<li><i class="ti-heart"></i> 562</li>
											</ul>
										</div>
									</div>
								</div>

								<div class="slider-course mb-40 item">
									<div class="course-img">
										<img src="resources/user/assets/img/gallery/team1.png" alt="">
									</div>
									<div class="course-caption">
										<div class="course-cap-top">
											<h4>
												<a href="#">Graphic Design</a>
											</h4>
										</div>
										<div class="course-cap-mid d-flex justify-content-between">
											<div class="course-ratting">
												<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i>
											</div>
											<ul>
												<li>52 Review</li>
											</ul>
										</div>
										<div class="course-cap-bottom d-flex justify-content-between">
											<ul>
												<li><i class="ti-user"></i> 562</li>
												<li><i class="ti-heart"></i> 562</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="slider-course mb-40 item">
									<div class="course-img">
										<img src="resources/user/assets/img/gallery/team1.png" alt="">
									</div>
									<div class="course-caption">
										<div class="course-cap-top">
											<h4>
												<a href="#">Graphic Design</a>
											</h4>
										</div>
										<div class="course-cap-mid d-flex justify-content-between">
											<div class="course-ratting">
												<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i>
											</div>
											<ul>
												<li>52 Review</li>
											</ul>
										</div>
										<div class="course-cap-bottom d-flex justify-content-between">
											<ul>
												<li><i class="ti-user"></i> 562</li>
												<li><i class="ti-heart"></i> 562</li>
											</ul>
										</div>
									</div>
								</div>
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
								<div class="slider-course mb-40 item">
									<div class="course-img">
										<img src="resources/user/assets/img/gallery/popular_sub1.png" alt="">
									</div>
									<div class="course-caption">
										<div class="course-cap-top">
											<h4>
												<a href="#">Graphic Design</a>
											</h4>
										</div>
										<div class="course-cap-mid d-flex justify-content-between">
											<div class="course-ratting">
												<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i>
											</div>
											<ul>
												<li>52 Review</li>
											</ul>
										</div>
										<div class="course-cap-bottom d-flex justify-content-between">
											<ul>
												<li><i class="ti-user"></i> 562</li>
												<li><i class="ti-heart"></i> 562</li>
											</ul>
										</div>
									</div>
								</div>

								<div class="slider-course mb-40 item">
									<div class="course-img">
										<img src="resources/user/assets/img/gallery/team2.png" alt="">
									</div>
									<div class="course-caption">
										<div class="course-cap-top">
											<h4>
												<a href="#">Graphic Design</a>
											</h4>
										</div>
										<div class="course-cap-mid d-flex justify-content-between">
											<div class="course-ratting">
												<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i>
											</div>
											<ul>
												<li>52 Review</li>
											</ul>
										</div>
										<div class="course-cap-bottom d-flex justify-content-between">
											<ul>
												<li><i class="ti-user"></i> 562</li>
												<li><i class="ti-heart"></i> 562</li>
											</ul>
										</div>
									</div>
								</div>

								<div class="slider-course mb-40 item">
									<div class="course-img">
										<img src="resources/user/assets/img/gallery/team1.png" alt="">
									</div>
									<div class="course-caption">
										<div class="course-cap-top">
											<h4>
												<a href="#">Graphic Design</a>
											</h4>
										</div>
										<div class="course-cap-mid d-flex justify-content-between">
											<div class="course-ratting">
												<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i>
											</div>
											<ul>
												<li>52 Review</li>
											</ul>
										</div>
										<div class="course-cap-bottom d-flex justify-content-between">
											<ul>
												<li><i class="ti-user"></i> 562</li>
												<li><i class="ti-heart"></i> 562</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="slider-course mb-40 item">
									<div class="course-img">
										<img src="resources/user/assets/img/gallery/team1.png" alt="">
									</div>
									<div class="course-caption">
										<div class="course-cap-top">
											<h4>
												<a href="#">Graphic Design</a>
											</h4>
										</div>
										<div class="course-cap-mid d-flex justify-content-between">
											<div class="course-ratting">
												<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i> <i class="fas fa-star"></i> <i
													class="fas fa-star"></i>
											</div>
											<ul>
												<li>52 Review</li>
											</ul>
										</div>
										<div class="course-cap-bottom d-flex justify-content-between">
											<ul>
												<li><i class="ti-user"></i> 562</li>
												<li><i class="ti-heart"></i> 562</li>
											</ul>
										</div>
									</div>
								</div>
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
		<!-- Career Popular Course End -->



		<!--? 머니 전테 클래스   -->
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
					<div class="col-xl-4 col-lg-4 col-md-6">
						<!-- Single course -->
						<div class="single-course mb-40">
							<div class="course-img">
								<img src="resources/user/assets/img/gallery/popular_sub1.png" alt="">
							</div>
							<div class="course-caption">
								<div class="course-cap-top">
									<h4>
										<a href="#">Graphic Design</a>
									</h4>
								</div>
								<div class="course-cap-mid d-flex justify-content-between">
									<div class="course-ratting">
										<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="fas fa-star"></i>
									</div>
									<ul>
										<li>52 Review</li>
									</ul>
								</div>
								<div class="course-cap-bottom d-flex justify-content-between">
									<ul>
										<li><i class="ti-user"></i> 562</li>
										<li><i class="ti-heart"></i> 562</li>
									</ul>
									<span>Free</span>
								</div>
							</div>
						</div>
					</div>
					<!--한개컬럼 end-->
					<div class="col-xl-4 col-lg-4 col-md-6">
						<!-- Single course -->
						<div class="single-course mb-40">
							<div class="course-img">
								<img src="resources/user/assets/img/gallery/popular_sub1.png" alt="">
							</div>
							<div class="course-caption">
								<div class="course-cap-top">
									<h4>
										<a href="#">Graphic Design</a>
									</h4>
								</div>
								<div class="course-cap-mid d-flex justify-content-between">
									<div class="course-ratting">
										<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="fas fa-star"></i>
									</div>
									<ul>
										<li>52 Review</li>
									</ul>
								</div>
								<div class="course-cap-bottom d-flex justify-content-between">
									<ul>
										<li><i class="ti-user"></i> 562</li>
										<li><i class="ti-heart"></i> 562</li>
									</ul>
									<span>Free</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-4 col-lg-4 col-md-6">
						<!-- Single course -->
						<div class="single-course mb-40">
							<div class="course-img">
								<img src="resources/user/assets/img/gallery/popular_sub1.png" alt="">
							</div>
							<div class="course-caption">
								<div class="course-cap-top">
									<h4>
										<a href="#">Graphic Design</a>
									</h4>
								</div>
								<div class="course-cap-mid d-flex justify-content-between">
									<div class="course-ratting">
										<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="fas fa-star"></i> <i class="fas fa-star"></i> <i
											class="fas fa-star"></i>
									</div>
									<ul>
										<li>52 Review</li>
									</ul>
								</div>
								<div class="course-cap-bottom d-flex justify-content-between">
									<ul>
										<li><i class="ti-user"></i> 562</li>
										<li><i class="ti-heart"></i> 562</li>
									</ul>
									<span>Free</span>
								</div>
							</div>
						</div>
					</div>
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