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

            <tr>
                <td><span class="red">중요</span></td>
                <td id="title">튜터님들은 꼭 참고하세요!</td>
                <td>매니저</td>
                <td>2018.05.21</td>
                <td>148</td>
            </tr>
            <tr>
                <td><span class="red">중요</span></td>
                <td id="title">준비물에 대한 공지사항입니다.</td>
                <td>매니저</td>
                <td>2019.02.01</td>
                <td>209</td>
            </tr>
            <tr>
                <td><span class="red">중요</span></td>
                <td id="title">8월 공지사항입니다.</td>
                <td>매니저</td>
                <td>2020.07.30</td>
                <td>75</td>
            </tr>
            <tr>
                <td><span class="red">중요</span></td>
                <td id="title">9월 공지사항입니다.</td>
                <td>매니저</td>
                <td>2020.08.25</td>
                <td>66</td>
            </tr>
            <tr>
                <td>121</td>
                <td id="title">공지사항입니다.</td>
                <td>매니저</td>
                <td>2020.09.21</td>
                <td>45</td>
            </tr>
            <tr>
                <td>120</td>
                <td id="title">참고 공지사항입니다.</td>
                <td>매니저</td>
                <td>2020.09.29</td>
                <td>31</td>
            </tr>
            <tr>
                <td>119</td>
                <td id="title">튜터님들은 꼭 참고하세요</td>
                <td>매니저</td>
                <td>2018.05.21</td>
                <td>148</td>
            </tr>
            <tr>
                <td>118</td>
                <td id="title">튜터님들은 꼭 참고하세요</td>
                <td>매니저</td>
                <td>2018.05.21</td>
                <td>148</td>
            </tr>
        </tbody>

    </table>

    <br><br><br>

    <div align="center">
        <button class="paging_btn">&lt;</button>
        <button class="paging_btn">1</button>
        <button class="paging_btn">2</button>
        <button class="paging_btn">3</button>
        <button class="paging_btn">4</button>
        <button class="paging_btn">&gt;</button>
    </div>

</div>
<!-- footer -->
<jsp:include page="../common/footer.jsp" />

</body>
</html>