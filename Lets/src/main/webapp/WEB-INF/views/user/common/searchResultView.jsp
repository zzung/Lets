<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
								<h2>검색 결과</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--? 키즈 인기 코스  -->
		<div class="popular-course section-padding30">
			<div class="container">
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
								<img src="resources/user/assets/img/gallery/popular_sub2.png" alt="">
							</div>
							<div class="course-caption">
								<div class="course-cap-top">
									<h4>
										<a href="#">Web Development</a>
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
								<img src="resources/user/assets/img/gallery/popular_sub3.png" alt="">
							</div>
							<div class="course-caption">
								<div class="course-cap-top">
									<h4>
										<a href="#">Digital Marketing</a>
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
		<!-- new class End -->
	</main>
	<jsp:include page="footer.jsp" />
</body>
</html>