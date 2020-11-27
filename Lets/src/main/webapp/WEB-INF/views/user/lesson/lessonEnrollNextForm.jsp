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
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

</head>
<body>
    <jsp:include page="../common/navBar.jsp" />
    <!-- <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> -->
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
            <textarea id="summernote" name=""></textarea>
            <!-- <script>
                $(document).ready(function() {
                      $('#summernote').summernote({
                          width : 900,
                          height : 500,
                          focus : true
                      });
                    });
            </script> -->
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

                <table id="prepareTable">
                	<tbody>
	                    <tr>
	                        <td width=400px><input class="form-control" name="" id="" type="text" placeholder="준비물을 입력해 주세요"></td>
	                    </tr>
                    </tbody>
                </table>

                <br><button href="#" type="button" class="genric-btn primary-border radius" id="prepareBtn">준비물 추가</button>

                <script>  
                     $('#prepareBtn').click (function () {
                         var prepareHtml = '';
                         prepareHtml += '<tr><td><input class="form-control" name="" id="" type="text" placeholder="준비물을 입력해 주세요"></td>';
                         prepareHtml += '<td><button class="plus_btn prepareDel" type="button">-</button></td></tr>';
                         $('#prepareTable > tbody:last').append(prepareHtml);
                         
	                     $('.prepareDel').click (function(){
	                    	 $(this).parents().eq(1).remove()                   	 
	                     });
                     }); 
                </script>
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
               <div id="lessonFaq">
	               <table>
	                   <tr>
	                       <th>Q.</th>
	                       <td width=600px><input class="form-control" name="" id="" type="text" placeholder="자주하는 질문을 입력해주세요"></td>
	                       <td></td>
	                   </tr>
	                   <tr>
	                       <th>A.</th>
	                       <td><input class="form-control" name="" id="" type="text" placeholder="답변을 작성해주세요"></td>
	                   </tr>
	               </table>
               </div>
               <br><button href="#" type="button" class="genric-btn primary-border radius" id="faqBtn">질문 추가</button><br><br>
               
               <script>
               		$('#faqBtn').click (function () {
               			var faqHtml = '';
               			faqHtml += '<table><tr><th>Q.</th><td width=600px><input class="form-control" name="" id="" type="text" placeholder="자주하는 질문을 입력해주세요"></td>';
               			faqHtml += '<td><button class="plus_btn faqDel" type="button">-</button></td></tr>';
               			faqHtml += '<tr><th>A.</th><td><input class="form-control" name="" id="" type="text" placeholder="답변을 작성해주세요"></td></tr></table>';
               			$('#lessonFaq').append(faqHtml);
               			
               			$('.faqDel').click (function(){
               				$(this).parents().eq(3).remove();
               			});
               			
               		});
               </script>
               
          	</div>
          	<br><br>
            <div>
                <h5><b>가격 / 시간</b></h5><br>
                <table>
                    <tr>
                        <th colspan="2">시간당 가격</th>
                    </tr>
                    <tr>
                        <td width="240"><input class="form-control" name="" id="" type="number" placeholder="시간당 가격을 입력하세요"></td>
                        <th>원</th>
                    </tr>
                </table><br>
            </div>
            
            <div>
                <table>
                    <tr>
                        <th colspan="2">1회당 수업 시간</th>
                    </tr>
                    <tr>
                        <td>
                            <div class="default-select" id="default-select">
                                <select style="display: none;">
                                    <option value="1">1회당 수업시간을 선택하세요</option>
                                    <option value="1">1시간</option>
                                    <option value="1">2시간</option>
                                    <option value="1">3시간</option>
                                    <option value="1">4시간</option>
                                    <option value="1">5시간</option>
                                </select>
                                <div class="nice-select" tabindex="0">
                                    <span class="current">1회당 수업시간을 선택하세요</span>
                                    <ul class="list">
                                        <li data-value=" 1" class="option selected focus">1시간</li>
                                        <li data-value="1" class="option">2시간</li>
                                        <li data-value="1" class="option">3시간</li>
                                        <li data-value="1" class="option">4시간</li>
                                        <li data-value="1" class="option">5시간</li>
                                    </ul>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <br><br><br>
            <div>
                <h5><b>진행 기간 / 횟수</b></h5><br>
                <table>
                    <tr>
                        <th colspan="2">총 수업 횟수</th>
                    </tr>
                    <tr>
                        <td width="240"><input class="form-control" name="" id="" type="number" placeholder="한 주당 진행할 횟수 입력"></td>
                        <th>번</th>
                    </tr>
                </table><br>
                <table>
                    <tr>
                        <th colspan="2">총 진행 기간</th>
                    </tr>
                    <tr>
                        <td width="240"><input class="form-control" name="" id="" type="number" placeholder="총 진행 기간 주단위로 입력"></td>
                        <th>주</th>
                    </tr>
                </table>
            </div>
            <br><br><br>
            <div>
                <h5><b>총 수업 가격</b></h5><br>
                <div style="background-color: #f9f9ff; width: 600px; font-size: 20px; padding: 20px;">
                    12,000원 X 1시간 X 6번 <br>
                    <hr>
                    <table align="right" style="width: 200px;">
                        <tr>
                            <th>원수업료</th>
                            <th>72,000</th>
                            <th>원</th>
                        </tr>
                        <tr>
                            <th>연결 수수료</th>
                            <th>14,400</th>
                            <th>원</th>
                        </tr>
                    </table><br><br><br>

                    <table align="right" style="color: red; width: 200px;">
                        <tr>
                            <th>총 수업료</th>
                            <th>57,600</th>
                            <th>원</th>
                        </tr>
                    </table><br>
                </div>
            </div>
            
          	<div class="section-top-border"  align="center">
		        <h3 class="mb-30"><b>잠깐!</b></h3>
		        <blockquote class="generic-blockquote" align="left">
		            <b>레츠의 수수료 정책은 어떻게 되나요?</b> <br><br>
			            레츠 연결 수수료는 다회차 수업의 경우 첫 1시간 수업료, 원데이클래스의 경우 <u>전체 수업료의 20%</u> 입니다.<br>
			            이는 레츠 운영비와 수업홍보비로 활용합니다.<br><br>
			            첫 수업 후 수강생이 생각했던 수업과 맞지 않아 추후 수업 진행 취소하는 경우, 튜터님께 1시간 수업료를 환급해드립니다. <br>
		            (수업 신청 전, 수업이 어떤 방식으로 진행되는지 알 수 있도록 수업소개 페이지에 수업 전 반드시 알아야 할   내용을 충분히 설명해주세요.) <br>
		        </blockquote>
    		</div>
        </div>
        
     <div align="center"><button type="submit" class="genric-btn primary radius">최종 승인 요청하기</button></div><br><br>
    </form>
    
     
 <jsp:include page="../common/footer.jsp" />
</body>
</html>