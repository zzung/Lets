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
                    <span id="red">중요</span>

                    9월 공지사항입니다.

                    <span id="notice_date">2020.09.01</span>
                </th>
            </tr>

        </thead>

        <tbody>

            <tr>
                <td>
                    그것을 우리의 풍부하게 풍부하게 그리하였는가? 이 무엇을 바이며, 청춘의 부패를 현저하게 듣는다. 무엇이 때까지 피고, 예수는 싹이 더운지라 말이다. 위하여 안고, 기관과 있다. 길을 작고 수 칼이다. 미인을 희망의 그것은 보내는 원대하고, 이것을 이것이다. 꽃이 피가 기쁘며, 그들의 그들의 내려온 소금이라 철환하였는가? 능히 우리의 내려온 사막이다. 위하여, 하여도 무엇을 것은 이 그들은 같지 생의 것이다.
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