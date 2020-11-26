<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/user/assets/css/style.css">
<link rel="stylesheet" href="resources/user/assets/css/tutorEnroll.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
    <jsp:include page="../common/navBar.jsp" />
        <form action="">
        <br><h3 class="mb-30">클래스 등록</h3>
        <hr class="top-hr">
        <div style="margin: 4%;">
            <br>
            <h5><b>클래스 설명</b></h5>
            <div style="background-color: #f9f9ff; width: 900px; font-size: 13px;">
                <ul class="unordered-list">
                    <font style="font-size:large;"><b>Tip</b></font>
                    <li>튜터님이 진행할 클래스에 대해 자유롭게 소개해 주세요. (사진 첨부도 가능합니다) </li>
                    <li>수업의 목표와 수업 진행방식에 대해 설명해 주세요.</li>
                    <li>수업을 진행하는 동안에 얻을 수 있는 결과물 혹은 기대할 수 있는 발전에 대해 얘기해 주세요.</li>
                    <li>다른 수업에서는 얻을 수 없는 튜터님 만의 장점에 대해 설명해 주세요. </li>
                </ul>
            </div>
            <script>
                $(document).ready(function() {
                      $('#summernote').summernote({
                          width : 900,
                          height : 500,
                          focus : true
                      });
                    });
            </script>
            <div id="summernote" name="" required style="width: 1000px;"></div>
            <br><br>

            <div>
                <h5><b>클래스 준비물</b></h5>
                <div style="background-color: #f9f9ff; width: 900px; font-size: 13px;">
                    <ul class="unordered-list">
                        <li>선택 사항 입니다.</li>
                        <li>클래스에서 필요한 준비물들을 적어주세요.</li>
                        <li>준비물들은 항상 넉넉히 준비하여 회원들에게 클래스 시작전에 배송해주셔야 합니다.</li>
                    </ul>
                </div>

                <table>
                    <tr>
                        <td width=400px><input class="form-control" name="" id="" type="text" placeholder="준비물을 입력해 주세요"></td>
                    </tr>
                    <tr>
                        <td width=400px><input class="form-control" name="" id="" type="text" placeholder="준비물을 입력해 주세요"></td>
                        <td><button class="plus_btn prepareAdd" type="button">-</button></td>
                    </tr>
                </table>

                <br><button href="#" type="button" class="genric-btn primary-border radius" id="prepareBtn">준비물 추가</button>

                <!-- <script>                
                        $('#prepareBtn').click (function () {

                            var prepareHtml = '';

                            prepareHtml += '<tr><td width=400px><input class="form-control" name="" id="" type="text" placeholder="준비물을 입력해 주세요"></td>';
                            prepareHtml += '<td><button class="plus_btn" type="button">-</button></td></tr>';


                        )}; 
                </script> -->
           </div>

           <br><br>
           <div>
               <h5><b>클래스 FAQ</b></h5>
               <div style="background-color: #f9f9ff; width: 900px; font-size: 13px;">
                   <ul class="unordered-list">
                       <li>선택 사항 입니다.</li>
                       <li>레츠 회원들이 자주 궁금해하시는 부분이나 참고하면 좋을만한 질문과 답변을 작성해주세요.</li>
                   </ul>
               </div>
               <table>
                   <tr>
                       <th>Q.</th>
                       <td width=600px><input class="form-control" name="" id="" type="text" placeholder="자주하는 질문을 입력해주세요"></td>
                       <td><button class="plus_btn" type="button">+</button></td>
                   </tr>
                   <tr>
                       <th>A.</th>
                       <td><input class="form-control" name="" id="" type="text" placeholder="답변을 작성해주세요"></td>
                   </tr>
               </table>
               <table>
                   <tr>
                       <th>Q.</th>
                       <td width=600px><input class="form-control" name="" id="" type="text" placeholder="자주하는 질문을 입력해주세요"></td>
                       <td><button class="plus_btn" type="button">-</button></td>
                   </tr>
                   <tr>
                       <th>A.</th>
                       <td><input class="form-control" name="" id="" type="text" placeholder="답변을 작성해주세요"></td>
                   </tr>
               </table>
           </div>
        </div>
    </form>
    
     <div align="center"><button type="submit" class="genric-btn primary radius">최종 승인 요청하기</button></div><br>
     
 <jsp:include page="../common/footer.jsp" />
</body>
</html>