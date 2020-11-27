<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="resources/user/assets/css/style.css">
<link rel="stylesheet" href="resources/user/assets/css/tutorNotice.css">
</head>
<body>

<!-- header -->
<jsp:include page="../common/navBar.jsp" />

<!-- 본문 -->
<div id="detail_box">

    <h1>튜터 공지사항</h1>

    <hr>

    <br><br><br><br><br>

    <table id="detail_table">

        <thead>

            <tr>
                <th>
                	<c:choose>
                		<c:when test="${ notice.noticeType == 'R' }">
                    		<span id="red">중요</span>
                    	</c:when>
                    	<c:otherwise>
                    		<span id="black">${ notice.noticeNo }</span>
                    	</c:otherwise>
					</c:choose>
                    ${ notice.noticeTitle }

                    <span id="notice_date">${ notice.enrollDate }</span>
                </th>
            </tr>

        </thead>

        <tbody>

            <tr>
                <td>
                    ${notice.noticeContent }
                </td>
            </tr>
            
        </tbody>

    </table>

    <br><br>

    <button id="list_btn" onclick="history.back();">목록으로</button>

</div>

<!-- footer -->
<jsp:include page="../common/footer.jsp" />

</body>
</html>