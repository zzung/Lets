<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet'>
	<!-- Syntax Highlighter -->
	<link rel="stylesheet" type="text/css" href="resources/admin/syntax-highlighter/styles/shCore.css" media="all">
	<link rel="stylesheet" type="text/css" href="resources/admin/syntax-highlighter/styles/shThemeDefault.css" media="all">
	<!-- Font Awesome CSS-->
	<link rel="stylesheet" href="resources/admin/css/font-awesome.min.css">
	<!-- Normalize/Reset CSS-->
	<link rel="stylesheet" href="resources/admin/css/normalize.min.css">
	<link rel="stylesheet" href="resources/admin/css/main.css">
	<link rel="stylesheet" href="resources/admin/css/editcss.css">
	<!--paging-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<body id="welcome">
<aside class="left-sidebar">
<div class="logo">
	<a href="#welcome">
		<h1>관리자</h1>
	</a>
</div>
<nav class="left-nav">
	<ul id="nav">
		<li class="current"><a href="#memberManagement">회원관리</a></li>
		<li><a href="#tutorManagement">튜터관리</a></li>
		<li><a href="#classManagement">클래스관리</a></li>
		<li><a href="#classPayment">클래스 결제관리</a></li>
		<li><a href="#saleManagement">할인 상품 관리</a></li>
		<li><a href="#blackListManagement">블랙리스트관리</a></li>
		<li><a href="#reply">1:1 문의</a></li>
		<li><a href="#reportManagement">신고관리</a></li>
		<li><a href="#announcement">공지사항</a></li>
		<li><a href="#faqManagement">FAQ</a></li>
	</ul>
</nav>
</aside>
<!--?memberManagement -->
<div id="main-wrapper">
<div class="main-content">
	<section id="memberManagement">
		<div class="content-header">
			<h1>관리자 페이지</h1>
		</div>
		
		<!-- 관리자 페이지 포함하기  -->
		<div class="welcome" align="center">
			<div align="right" style="width:995px;">
				
			</div>
		</div>
	
	</section>
	<br><br><br>
	<section id="tutorManagement">
		<div class="content-header">
			<h1>튜터관리</h1>
		</div>
		
		<!-- 튜터관리 포함하기  -->
		
	</section>
	<br><br><br>
	<!-------------------------------------클래스 관리------------------------------------->
	<section id="classManagement">
		<div class="content-header">
			<h1>클래스 관리</h1>
		</div>
		
		<jsp:include page="classManagementView.jsp"/>
	
	</section>
	<br><br><br>
	<!----------------------------------------------------------------------->
	<section id="classPayment">
		<div class="content-header">
			<h1>클래스 결제관리</h1>
		</div> 
		
		<jsp:include page="classPaymentView.jsp" />
		
	</section>
	<br><br><br>

	<section id="saleManagement">
		<div class="content-header">
			<h1>할인 상품 관리</h1>
		</div>
    
    	<jsp:include page="discountManagementView.jsp" />
    
	</section>
	<br><br><br>
	<section id="blackListManagement">
			<h2 class="title"> 블랙리스트 관리 </h2>
			
			<!-- 블랙리스트 페이지 포함하기 -->   
	</section>
	<br><br><br>
	<section id="reply">
		<div class="content-header">
			<h1>1:1문의</h1>
		</div>
	
		<!--  1:1 문의 페이지 포함하기 -->
		            
	</section>
	<br><br><br>
	<section id="reportManagement">
		<div class="content-header">
			<h1>신고관리</h1>
		</div>
		<!-- 신고관리 페이지 포함하기  -->
		           
	</section>
	<br><br><br>
	<section id="announcement">
		<h2 class="title">공지사항</h2>		            
		
		<!-- 공지사항 페이지 포함 시키기 -->
		
		
	</section>
	<br><br><br>
	<section id="faqManagement">
		<div class="content-header">
			<h1>FAQ</h1>
		</div>	            
		
		<!-- FAQ 페이지 포함시키기  -->
		
		
	</section>
</div>
</div>

<!-- Essential JavaScript Libraries
	==============================================-->
	<script type="text/javascript" src="resources/admin/js/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="resources/admin/js/jquery.nav.js"></script>
	<script type="text/javascript" src="resources/admin/syntax-highlighter/scripts/shBrushXml.js"></script> 
	<script type="text/javascript" src="resources/admin/syntax-highlighter/scripts/shBrushCss.js"></script> 
	<script type="text/javascript" src="resources/admin/syntax-highlighter/scripts/shBrushJScript.js"></script> 
	<script type="text/javascript" src="resources/admin/syntax-highlighter/scripts/shBrushPhp.js"></script> 
	<script type="text/javascript" src="resources/admin/js/custom.js"></script>
</body>
</html>