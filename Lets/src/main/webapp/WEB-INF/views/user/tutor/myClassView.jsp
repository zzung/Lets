<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- 버튼 부트스트랩 (삭제하지 말 것)-->
<link rel="stylesheet" href="resources/user/assets/css/style.css">
<!-- 테이블 부트스트랩 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 없으면 모달 안뜸-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


<style>
    .myClass{width: 1250px;margin-left: 5%;}
    #smTitle{font-size: 20px;font-weight: bold;}
    .btn-group-sm>.btn, .btn-sm {
    padding: .25rem .5rem;
    line-height: 1.5;
    border-radius: .2rem;
    }
    .outCome{background-color: lightgray; height: 220px; width: 600px; text-align: center;}
    .totalSalary{background-color: rgb(45, 48, 186); margin-left:15px ; color: white;height: 220px; width: 600px;box-sizing: border-box;}
  
    #salaryTable th {text-align: right;}
    .classSalary div {float: left; text-align:center}
   
    #deliveryF li{
        height: 35px;
        list-style-type:circle;
        margin-left: 10px;
    }
    #deliveryRe tr{
        height: 35px;
    }
</style>
</head>
<body>
	
	<jsp:include page="../common/navBar.jsp" />
    <!-- 메뉴바 넣을 공간-->
    
  <div class="myClass">

        <p style="font-size: 25px; font-weight: bold;color: rgb(45, 48, 186);">내 수업
            
        <hr style="border-color: rgb(73, 73, 73);">
        <br><br>
        <!-- 승인 완료된 클래스 -->
        <p id="smTitle" style="color: gray;">승인 완료된 클래스 <span style="font-size: 12px;color: rgb(45, 48, 186);float: right;">**온라인 클래스인 경우에만 클래스 종료 신청이 가능합니다.</span></p>
        <table style="text-align: center;" id="classTable" class="table table-bordered table-sm">
            <!-- for문 -->
            <c:forEach var="al" items="${ aLlist}">
	            <tr>
	                <td style="width: 550px;">${al.lessonTitle }</td>
	                <td style="width: 250px;">${al.lessonType }</td> 
	                <td style="width: 200px;">
	                	<c:if test="${lessonType eq '온라인' }">
	                    	<a class="genric-btn primary-border btn-sm" href="deleteLesson.tc" style="font-size: 13px;">클래스 종료 신청</button>
	                	</c:if>
	                </td>
	            </tr>
            </c:forEach>
     
        </table>
        <!-- 클래스 승인 상태 -->
        <br><br>
        <p id="smTitle" style="color: gray;">클래스 승인 상태<span style="font-size: 12px;color: rgb(45, 48, 186);float: right;">**승인 보류인 경우, 수정 후 다시 클래스 신청이 가능합니다.</span></p>
        <table style="text-align: center;" class="table table-bordered table-sm">
            <tr>
                <td style="width: 550px;">제목넣을 칸</td>
                <td style="width: 150px;">2020.05.06</td>
                <td style="width: 150px;">
                    <!-- for문 돌릴 때 이것도 되는지 보기...ㅎ-->
                    <div >검토중</div>
                </td>
                <td style="width: 150px;">
                    
                </td>
            </tr>
            <!-- for 문 끝 아래는 임시--> 
            <tr>
                <td>제목넣을 칸</td>
                <td>2020.02.23</td>
                <td>
                    <a type="button" class="genric-btn primary-border btn-sm" data-toggle="modal" 
                    data-target="#H_reason" id="h_reason">승인보류</a>
                </td>
                <td>
                    <button class="genric-btn primary btn-sm" style="font-size: 13px;" onclick="">수정</button>
                    <button class="genric-btn primary-border btn-sm" style="font-size: 13px;" onclick="">삭제</button>
                </td>
            </tr>
            <tr>
                <td>제목넣을 칸</td>
                <td>2020.01.03</td>
                <td><a type="button" class="genric-btn primary-border btn-sm" data-toggle="modal" 
                    data-target="#R_reason" id="r_reason">승인거부</a></td>
                <td>
                    <button class="genric-btn primary btn-sm" style="font-size: 13px;">수정</button>
                    <button class="genric-btn primary-border btn-sm" style="font-size: 13px;">삭제</button>
                </td>
            </tr>
        </table>

        <!-- 클래스 준비물 관리 -->
        
        
        <br><br>
        <p id="smTitle" style="color: gray;">클래스 준비물 관리</p>
        
        <div id="prepareTable">
	        <table style="text-align: center;" id="classTable" class="table table-bordered table-sm">
	            <!-- for 문 -->
	            <tr>
	                <td style="width: 100px;">user02</td>
	                <td style="width: 550px;">제목넣을 칸</td>
	                <td style="width: 200px;">신청일 2020.05.06</td>
	                <!-- 조건문 가능! -->
	                <td style="width: 150px;">
	                    <a data-toggle="modal" class="genric-btn primary-border btn-sm" 
	                    data-target="#deliveryF" style="font-size: 13px;" id="delStatus">배송중</a>
	                </td>
	            </tr>
	            <!-- for문 끝 아래는 임시 -->
	            <tr>
	                <td>user01</td>
	                <td>제목넣을 칸</td>
	                <td>신청일 2020.02.23</td>
	                <td>
	                    <a data-toggle="modal" data-target="#deliveryR" class="genric-btn primary-border btn-sm" 
	                    style="font-size: 13px;" id="deliveryReady">준비물 보내기</a>
	                </td>
	            </tr>
	            <tr>
	                <td>user02</td>
	                <td>제목넣을 칸</td>
	                <td>신청일 2020.01.03</td>
	                <td>
	                    <a data-toggle="modal" class="genric-btn primary-border btn-sm" 
	                    data-target="#deliveryF" style="font-size: 13px;" id="deliveryOk">배송완료</a>
	                </td>
	            </tr>
	        </table>
        </div>
        
        
        
        
        
        <!-- 수업성과 & 정산서 -->
        <br><hr>
        <div style="color: gray; font-size: 20px; font-weight: bold; ">수업성과 & 정산서
	        <br>
	       
	        <!-- 튜터 등록 날짜로 ? 조건처리 할 수 있나 -->
	        
	        <div class="single-element-widget mt-30" >
	            <div class="default-select" id="salary" style="float:left">
	                <select>
	                <option value="total_pay">전체수익</option>
	                <option value="month_pay">월별로보기</option>
	                </select>
	            </div>
	            <div class="default-select" id="year" style="display: none;float:left">
	                <select>
	                    <option value="2018">2018</option>
	                    <option value="2019">2019</option>
	                    <option value="2020">2020</option>
	                </select>
	            </div>
	            <div class="default-select" id="month" style="display: none;float:left">
	                <select>
	                    <option value="1">1월</option>
	                    <option value="2">2월</option>
	                    <option value="3">3월</option>
	                    <option value="4">4월</option>
	                    <option value="5">5월</option>
	                    <option value="6">6월</option>
	                    <option value="7">7월</option>
	                    <option value="8">8월</option>
	                    <option value="9">9월</option>
	                    <option value="10">10월</option>
	                    <option value="11">11월</option>
	                    <option value="12">12월</option>
	                </select>
	            </div>
	       
	        <!-- 정산받는 버튼 -->
	        <span style="float: right;"><a data-toggle="modal" data-target="#account" class="genric-btn primary-border btn-sm" >정산받기</a></span>
	        </div>
	        
	        
        </div>
        <br><br><br>

        <!-- 정산받을 클래스들 반복문 돌릴 차례 -->
        <!-- 년도, 월 검색 후 그에 맞춰 나와야 됨....ㅎ-->
      
            <div class="classSalary" >
                <div class="outCome" style="text">
                    <br>
                    <p id="classTitle" name="classTitle" style="font-size:20px;">토익 회화! 비즈니스반입니다 오호오호 오호아하 고고갑시다</p>
                    <br>
                    <table id="outComeTable" align="center">
                    	<tr>
                    		<th style="width:80px; height:25px">조회수 : </th>
                    		<td style="width:50px; height:25px">53 회</td>
                    	</tr>
                    	<tr>
                    		<th>신청수 : </th>
                    		<td>22 명</td>
                    	</tr>
                    	<tr>
                    		<th>평점평균 : </th>
                    		<td>3.4</td>
                    	</tr>
                    </table>
                </div>
                <div class="totalSalary" >
                    <br><br>
                    <table id="salaryTable" align="center">
                        <tr>
                            <td>&nbsp;</td>
                            <td style="width: 200px; height: 25px;">총 클래스 금액</td>
                            <th>72000</th>
                        </tr>
                        <tr>
                            <td>-&nbsp;</td>
                            <td>레츠 수수료(20%)</td>
                            <th>14,400</th>
                        </tr>
                        <tr>
                            <td>X&nbsp;</td>
                            <td>수강인원</td>
                            <th>22</th>
                        </tr>
                        <tr>
                            <th colspan="3">-------------------------------------------------</th>
                        </tr>
                        <tr>
                            <th></th>
                            <td>튜터님의 총 수익</td>
                            <th>1,267,200</th>
                        </tr>
                    </table>
                    <br><br>
                    <input type="hidden" value="">
                </div>
            </div>
     <br><br><br><br><br><br><br><br><br><br><br><br>
        <!-- 반복문 끝 -->
    </div>

    <!-- 준비물 보내기 클릭 시 뜨는 모달 -->
    <div class="modal fade" id="deliveryR">
        <div class="modal-dialog">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">준비물 보내기</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button> 
            </div>
            <form action="/delivery.tm" method="post">
                <!-- Modal Body -->
                <div class="modal-body">
                    <label for="userId" class="mr-sm-2">user01 회원님께 보내실 클래스의 준비물을 선택해주세요</label><br>
                    
                    <div class="delivery_go" >
                        <table id="deliveryRe">
                            <!-- for문 -->
                            <tr>
                                <td style="width: 25px;">&nbsp;<input type="checkbox" id="material1" name="material1"></td>
                                <td>취미생활즐기기위하아나아ㅏ라아ㅏ나</td>
                            </tr>
                            <tr>
                                <td>&nbsp;<input type="checkbox" id="material2" name="material2"></td>
                                <td>5색 털실 양말만들기 준비물!</td>
                            </tr>
                        </table>
                    </div>
                    <br><hr>
                    <table>
                        <tr>
                            <th style="width:100px;">택배사</th>
                            <td><input type="text" id="delName" name="delName"></td>
                        </tr>
                        <tr>
                            <th>운송장번호</th>
                            <td><input type="text" id="delNo" name="delNo"></td>
                        </tr>
                    </table>
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="genric-btn primary-border btn-sm" id="deliveryGo">배송완료</button>
                    <button type="button" class="genric-btn danger-border btn-sm" data-dismiss="modal">취소</button>
                </div>
            </form>
            </div>
        </div>
    </div>
   
    <!-- 배송중, 배송완료 하면 보이는 모달 -->
    <div class="modal fade" id="deliveryF">
        <div class="modal-dialog ">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">배송</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button> 
            </div>
           
                <!-- Modal Body -->
                <div class="modal-body">
                    <label for="userId" class="mr-sm-2">user01 회원님께 보낸 클래스의 준비물</label><br>
                   
                    <div class="delivery_ing">
                        <ul style=" margin: 10px;" >
                            <li><p>오색털실 따뜻한 양말 만들기! (빨,주,노,초,파)</p></li>
                            <li><p>파피용</p></li>
                            <li><p>오색털실 따뜻한 양말 만들기! (빨,주,노,초,파)</p></li>
                        </ul>
                    </div>
                    <br><hr>
                    <table>
                        <tr>
                            <th style="width:100px; height: 50px;">택배사</th>
                            <td><span>택배사 이름 들어갈 공간</span></td>
                        </tr>
                        <tr>
                            <th>운송장번호</th>
                            <td>운송장 번호 들어갈 공간</td>
                        </tr>
                    </table>
                    <br>
                </div>
            
            </div>
        </div>
    </div>

    <!-- 승인보류시 떠야할 모달 -->
    <div class="modal fade" id="H_reason">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-outer" style="background-color:rgba(212, 209, 209, 0.411); padding: 20px;">
                    <!-- Modal Body -->
                    <div class="modal-body" style=" background-color: white;  height: 300px;" >
                        
                        <button type="button" class="close" data-dismiss="modal" >&times;</button> 
                        <h4 style="text-align: center;">클래스 보류 사유</h4>
                        <br><br>
                        <p>여기는 보류 사유 쓸 공간ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</p>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 승인거부 시 뜨는 모달 -->
    <div class="modal fade" id="R_reason">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-outer" style="background-color: rgba(212, 209, 209, 0.411); padding: 20px;">
                    <!-- Modal Body -->
                    <div class="modal-body" style=" background-color: white;  height: 300px;" >
                        
                        <button type="button" class="close" data-dismiss="modal">&times;</button> 
                        <h4 style="text-align: center;">클래스 거부 사유</h4>
                        <br><br>
                        <p>여기는 거부 사유 쓸 공간ㅇㅇㅇㅇㅇㅇㅇ</p>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 정산 시 받을 계좌입력 모달 -->
    <div class="modal fade" id="account">
        <div class="modal-dialog ">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title" style="margin-left: 150px;">정산 시 받을 계좌</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button> 
            </div>

            <form action="/accountSave.tc" method="post">
                <!-- Modal Body -->
                <div class="modal-body">
                    <table align="center">
                        <tr>
                            <td style="width: 80px;">은행이름</td>
                            <td><input type="text" id="bankName" name="bankName"></td>
                        </tr>
                        <tr>
                            <td>계좌번호</td>
                            <td><input type="text" id="accountNo" name="accountNo" placeholder="(-) 포함 해서 적어주세요"></td>
                        </tr>
                    </table> 
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="genric-btn primary-border btn-sm" id="accountSa">저장</button>
                    <button type="button" class="genric-btn danger-border btn-sm" data-dismiss="modal">취소</button>
                </div>
            </form>
            </div>
        </div>
    </div>
    
    <!-- 정산 쪽 셀렉박스 -->
        <script>
            $(function(){
                $("#salary").change(function(){
                    var selectMon = $("#salary option:selected").val();
                    if(selectMon == "month_pay") {
                        $("#year").show();
                        $("#month").show();
                    }else{
                        $("#year").hide();
                        $("#month").hide();
                    }   
                });
            });
            
        </script>
        <!-- 보류, 거절 hover 시 뜰 모달-->
        <script>
            $(function(){
               $("#r_reason").on({"mouseover":function(){
                   $("#R_reason").show();
               }, "mouseout":function(){
                   $("#R_reason").modal({
                       hide:true
                   })
               }}) 
               
            })

            $("#h_reason").mouseover(function(){
                $("#H_reason").modal({
                    show:true
                })
            })

        </script>
        
        
        <jsp:include page="../common/footer.jsp"/>
</body>
</html>