<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 이용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" href="resources/user/assets/css/style.css">
<link rel="stylesheet" href="resources/user/assets/css/tutorNotice.css">
</head>
<body>

<!-- header -->
<jsp:include page="../common/navBar.jsp" />

<!-- 본문 -->

<div id="list_box">

    <h1>튜터 공지사항</h1>

    <hr>

    <br><br><br><br><br>

    <table id="notice_table">

        <thead>

            <tr>
                <th></th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>

        </thead>
        <tbody>
        	<c:forEach var="n" items="${ noticeList }" varStatus="status">
        		<c:choose>
        			<c:when test="${ noticeType='R' }">
			            <tr>
			                <td><span class="red">중요</span></td>
			                <td id="title">${ n.noticeTitle }</td>
			                <td>관리자</td>
			                <td>${ n.enrollDate }</td>
			                <td>${ n.count }</td>
			                <td><input type="hidden" value="${n.noticeNo }"></td>
			            </tr>
		            </c:when>
		           	<c:otherwise>
			            <tr>
			                <td>${n.noticeNo }</td>
			                <td id="title">${ n.noticeTitle }</td>
			                <td>관리자</td>
			                <td>${ n.enrollDate }</td>
			                <td>${ n.count }</td>
			                <td><input type="hidden" value="${n.noticeNo }"></td>
			            </tr>
			       	</c:otherwise>
	            </c:choose>
            </c:forEach>
        </tbody>

    </table>
    
    <br><br><br>

    <div align="center">
    
    	<c:choose>
    	
	    	<c:when test="${ pi.currentPage ne 1 }">
	        	<button class="paging_btn" onclick="pageButton(${ pi.currentPage -1 });">&lt;</button>
	        </c:when>
	        <c:otherwise>
	        	<button class="paging_btn" disabled>&lt;</button>
	        </c:otherwise>
	        
        </c:choose>
        
        <c:forEach var="i" begin="${ pi.startPage }" end="${ pi.endPage }">
        	<button class="paging_btn" onclick="pageButton(${ i });">${ i }</button>
        </c:forEach>
        
        <c:choose>
        
        	<c:when test="${ pi.currentPage != pi.maxPage }">
        		<button class="paging_btn" onclick="pageButton(${ pi.currentPage +1 });">&gt;</button>
        	</c:when>
        	<c:otherwise>
        		<button class="paging_btn" disabled>&gt;</button>
        	</c:otherwise>
        </c:choose>
        
    </div>
    
    <script>
		$(function() {
			
			$("#notice_table tbody tr").click(function() {
				location.href="tutorDetailNotice.no?noticeNo=" + $(this).children().eq(5).text();
			});
			
		})
		
		function pageButton(i){
			var currentPage = i;
			
			location.href="tutorNotice.no?currentPage=" + currentPage;
		}
	</script>

</div>
<!-- footer -->
<jsp:include page="../common/footer.jsp" />

</body>
</html>