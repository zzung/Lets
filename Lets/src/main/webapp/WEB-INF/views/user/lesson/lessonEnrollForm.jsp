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
</head>
     <script>
         var chkIdx = 0;
         $(document).ready (function () {                
            $('#curriculumBtn').click (function () {   
	           	console.log( $(".category_1").length)
	            chkIdx ++;
	            var html = '';
	            html += '<div class="curriculumInput">';
	            html += '<table style="width: 500px">';
	            html += '<tr><td width=40px><h5 class="category_1">' + ($(".category_1").length + 1) + '.</h5></td>';
	            html += '<td><input class="form-control" name="" type="text" placeholder="커리큘럼 주제를 입력해주세요"></td>';
	            html += '<td><button class="plus_btn categorydelete" type="button" id="categorydelete">-</button></td></tr>';
	            html += '<tr><td><h6 class="category_2">1)</h6></td>';
	            html += '<td><input class="form-control" name="" type="text" placeholder="커리큘럼 세부 리스트를 입력해 주세요 "></td></tr>';
 	            html += '<tr><td><h6 class="category_2">2)</h6></td>';
	            html += '<td><input class="form-control" name="" type="text" placeholder="커리큘럼 세부 리스트를 입력해 주세요 "></td>';
	            html += '<td><button class="plus_btn deailadd" type="button">+</button></td></tr></table><br></div>';
	             $('#parah').append (html); 
	             
	             $('.categorydelete').click (function (){
	            	 $(this).parents().eq(4).remove()
	            	 	var length = $(".category_1").length
	            	 	for(i=0; i<length; i++){
	            	 		$(".category_1").eq(i).text((i+1)+".")
	            	 	}
	 	        });
	             
	            $('.deailadd').click (function(){
	            	
	            	var detailHtml = '';
	            	detailHtml += '<tr><td><h6 class="category_2">2)</h6></td>';
	            	detailHtml += '<td><input class="form-control" name="" id="" type="text" placeholder="커리큘럼 세부 리스트를 입력해 주세요 "></td>';
	            	detailHtml += '<td><button class="plus_btn deailadd" type="button">+</button><button class="plus_btn deailDel" type="button">-</button></td></tr>';
	            	
	            	$(this).parents().eq(2).append(detailHtml);
	            	
	            	var length = $(this).parents().eq(2).children().length;
	            	$(this).parents().eq(2).children().eq(length-1).children().eq(0).html('<h6 class="category_2">'+(length-1) + ")"+'</h6>');
	            	$(this).remove();
	            	
		            $('.deailDel').click (function(){
		            	debugger
		            	$(this).parents().eq(1).remove()
		            })	
	            });
	            
            });
            $('.deailadd').click (function(){
            	debugger
            });
	        
	        
      	});      	
      </script>
<body>
    <jsp:include page="../common/navBar.jsp" />
    
    <br><h3 class="mb-30">클래스 등록</h3>
    <hr class="top-hr">
    <div class="class1-form">
     
        <h5><b>클래스 제목</b></h5>
        <input type="text" name="" placeholder="클래스 제목을 입력해주세요 (공백 포함 50자 이내)" onfocus="this.placeholder = ''" onblur="this.placeholder = '클래스 제목을 입력해주세요 (공백 포함 50자 이내)'" class="classTitle" required>
        <br><br><br><br>

        <h5><b>클래스 커버 이미지</b></h5>
        <div style="background-color: #f9f9ff; width: 900px; font-size: 13px;">
            <ul class="unordered-list">
                <li>권장 사이즈 및 크기는 10MB 이하의 jpg, jpeg, png 파일 입니다.</li>
                <li>다음과 같은 사진은 자제해 주세요 !
                    <ul>
                        <li>프로필 사진과 동일한 커버사진</li>
                        <li>인위적인 홍보문구가 포함된 사진</li>
                        <li>저작권에 위배되는 사진</li>
                    </ul>
                </li>
            </ul>
        </div>
        <input type="file" id="upfile" class="form-control-file border" style="width:400px;" name=""  required><br><br><br>
        <div>
            <h5><b>수업 대상</b></h5>
            <div style="background-color: #f9f9ff; width: 900px; font-size: 13px;">
                <ul class="unordered-list">
                    <font style="font-size:large;"><b>Tip</b></font>
                    <li>수업을 추천하는 대상은 누구일까요? ('관심있는 누구나'와 같은 추상적이거나 포괄적인 답변은  피해주세요.)</li>
                    <li>예시 ) 인턴/입사를 앞두고 엑셀이 걱정되는 분, 스트레칭을 하고싶지만 막상 어떻게 해야할지 모르겠는 분</li>
                </ul>
            </div>
            <div class="mt-10">
                <textarea class="single-textarea" placeholder="튜터님의 수업을 수강하기에 적합한 수업 대상에 대해 적어주세요." required="" name=""
                     onfocus="this.placeholder = ''" onblur="this.placeholder = '튜터님의 수업을 수강하기에 적합한 수업 대상에 대해 적어주세요.'"></textarea>
            </div><br>
        </div><br><br>
        <table>
            <tr>
                <th width=210>수업형태</th>
                <td><input type="radio" name="classForm" id="multiTime" value="multiTime"> <label for="multiTime"> 다회차 수업</label></td>
                <td><input type="radio" name="classForm" id="oneTime" value="oneTime"> <label for="oneTime"> 원데이 클래스</label></td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2" class="classCon">
                    * 다회차 수업일 경우 되도록 한달 내에 끝낼 수 있도록 커리큘럼을 계획해 주세요.<br><br><br><br><br>
                </td>
            </tr>

            <tr>
                 <th>수업유형</th>
                 <td><input type="radio" name="classType" id="online" value="online"> <label for="online"> 온라인 수업</label></td>
                 <td><input type="radio" name="classType" id="offline" value="offline"> <label for="offline"> 대면 수업</label></td>
             </tr>
             <tr>
                 <td></td>
                 <td colspan="2" class="classCon">
                     * 온라인 수업일 경우 다음 단계에서 영상과 설명을 올려주셔야 합니다.<br><br><br><br><br>
                 </td>
             </tr>

             <tr>
                 <th>수업 참여 희망 인원</th>
                 <td><input type="radio" name="classGroup" id="oneClass" value="oneClass"> <label for="oneClass"> 1:1 수업</label></td>
                 <td><input type="radio" name="classGroup" id="groupClass" value="groupClass"> <label for="groupClass"> 그룹 수업</label> 
                     <input type="number" name="" placeholder="숫자만 입력" onfocus="this.placeholder = ''" onblur="this.placeholder = '숫자만 입력'" required="" class="classNum"></td>
                 </tr>
             <tr>
                 <td></td>
                 <td colspan="2" class="classCon">
                     * 레츠 회원님들이 선호하는 그룹 수업 인원은 2~6인 내외 입니다.<br><br><br><br><br>
                 </td>
             </tr>

             <tr>
                 <th>수업 카테고리</th>
                 <td colspan="2">
                     <div class="lesson-select" id="lesson-select">
                         <select style="display: none;">
                             <option value=" 1">수업 카테고리를 선택해주세요.</option>
                             <option value="1">키즈</option>
                             <option value="1">머니</option>
                             <option value="1">커리어</option>
                             <option value="1">취미</option>
                         </select>
                     </div>
                 </td>
             </tr>
        </table>

        <br><br>
        <h5><b>커리큘럼 등록</b></h5>
        <div class="curriculum_ex">
            <ul class="unordered-list">
                    <li>커리큘럼과 세부 리스트들은 최대한 이해하기 쉽고 상세하게 작성해 주세요. </li>
                    <li>레츠 회원들에게 오른쪽과 같이 보여지게 됩니다.</li>
                    <li>커리큘럼 세부 리스트는 적어도 2개 이상 적어주세요. (2개 필수)</li>
                    <li>리스트 추가 버튼을 누르면 하단에 추가로 입력 가능합니다. </li>
            </ul>
        </div>

        <div class="lesson-row">
            <div class="col-sm-6">
               <div class="form-group">
                   <!-- 첫 화면일 때 -->
                    <div id="parah">
                        <div class="curriculumInput">
                            <table style="width: 500px;">
                                <tr>
                                    <td width=40px><h5 class="category_1">1.</h5></td>
                                    <td><input class="form-control" name="" id="" type="text" placeholder="커리큘럼 주제를 입력해주세요"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><h6 class="category_2">1)</h6></td>
                                    <td><input class="form-control" name="" id="" type="text" placeholder="커리큘럼 세부 리스트를 입력해 주세요 "></td>
                                </tr>
                                <tr>
                                    <td><h6 class="category_2">2)</h6></td>
                                    <td><input class="form-control" name="" id="" type="text" placeholder="커리큘럼 세부 리스트를 입력해 주세요 "></td>
                                    <td><button class="plus_btn deailadd" type="button">+</button></td>
                                </tr>
                        </table><br>
                        </div>
                    </div>
                </div>

                <br><button href="#" type="button" class="genric-btn primary-border radius" id="curriculumBtn">리스트 추가</button><br><br><br><br>


            </div>
            
         </div>
         <br><br>
         <div class="lesson-row">
             <div class="typography">
                 <h4>1. 커리큘럼 주제 1</h4>
                 <h5>1) 커리큘럼 세부 리스트 1</h5>
                 <h5>2) 커리큘럼 세부 리스트 2</h5>
                 <hr>
                 <h4>2. 커리큘럼 주제 2</h4>
                 <h5>1) 커리큘럼 세부 리스트 1</h5>
                 <h5>2) 커리큘럼 세부 리스트 2</h5>
                 <hr>
                 <h4>3. 커리큘럼 주제 3</h4>
                 <h5>1) 커리큘럼 세부 리스트 1</h5>
                 <h5>2) 커리큘럼 세부 리스트 2</h5>
             </div>
         </div>

         <div id="enroll_cul">
            <h5><b>클래스 영상 등록</b></h5>
                <div style="background-color: #f9f9ff; width: 900px; font-size: 13px;">
                    <ul class="unordered-list">
                        <li>교육 과정의 주제에 맞는 영상 url을 입력해 주세요.</li>
                        <li>레츠 회원들이 참고하기 쉽게 영상에 대한 간단한 소개를 해주세요.</li>
                    </ul>
                </div>

                <br><br>
               <div>
                   <h5>1. 커리큘럼 주제 1</h5>
                   <div class="curriculum_detail">
                       <h6>1) 커리큘럼 세부 리스트 1</h6>
                       <div class="mt-10">
                           <textarea class="single-textarea" placeholder="교육 과정에 대한 간단한 소개를 입력해 주세요" required="" name=""
                           onfocus="this.placeholder = ''" onblur="this.placeholder = '교육 과정에 대한 간단한 소개를 입력해 주세요'"></textarea> <br>
                           <input class="form-control" name="" id="" type="text" placeholder="교육 과정에 맞는 영상 url 입력해 주세요" style="width: 800px;">
                       </div>
                       <h6>2) 커리큘럼 세부 리스트 2</h6>
                       <div class="mt-10">
                           <textarea class="single-textarea" placeholder="교육 과정에 대한 간단한 소개를 입력해 주세요" required="" name=""
                           onfocus="this.placeholder = ''" onblur="this.placeholder = '교육 과정에 대한 간단한 소개를 입력해 주세요'"></textarea> <br>
                           <input class="form-control" name="" id="" type="text" placeholder="교육 과정에 맞는 영상 url 입력해 주세요" style="width: 800px;">
                       </div>
                   </div>
                   <hr>

                   <h5>2. 커리큘럼 주제 2</h5>
                   <div class="curriculum_detail">
                       <h6>1) 커리큘럼 세부 리스트 1</h6>
                       <div class="mt-10">
                           <textarea class="single-textarea" placeholder="교육 과정에 대한 간단한 소개를 입력해 주세요" required="" name=""
                           onfocus="this.placeholder = ''" onblur="this.placeholder = '교육 과정에 대한 간단한 소개를 입력해 주세요'"></textarea> <br>
                           <input class="form-control" name="" id="" type="text" placeholder="교육 과정에 맞는 영상 url 입력해 주세요" style="width: 800px;">
                       </div>
                       <h6>2) 커리큘럼 세부 리스트 2</h6>
                       <div class="mt-10">
                           <textarea class="single-textarea" placeholder="교육 과정에 대한 간단한 소개를 입력해 주세요" required="" name=""
                           onfocus="this.placeholder = ''" onblur="this.placeholder = '교육 과정에 대한 간단한 소개를 입력해 주세요'"></textarea> <br>
                           <input class="form-control" name="" id="" type="text" placeholder="교육 과정에 맞는 영상 url 입력해 주세요" style="width: 800px;">
                       </div>
                   </div>
                   <hr>
                   <h5>3. 커리큘럼 주제 3</h5>
                   <div class="curriculum_detail">
                       <h6>1) 커리큘럼 세부 리스트 1</h6>
                       <div class="mt-10">
                           <textarea class="single-textarea" placeholder="교육 과정에 대한 간단한 소개를 입력해 주세요" required="" name=""
                           onfocus="this.placeholder = ''" onblur="this.placeholder = '교육 과정에 대한 간단한 소개를 입력해 주세요'"></textarea> <br>
                           <input class="form-control" name="" id="" type="text" placeholder="교육 과정에 맞는 영상 url 입력해 주세요" style="width: 800px;">
                       </div>
                       <h6>2) 커리큘럼 세부 리스트 2</h6>
                       <div class="mt-10">
                           <textarea class="single-textarea" placeholder="교육 과정에 대한 간단한 소개를 입력해 주세요" required="" name=""
                           onfocus="this.placeholder = ''" onblur="this.placeholder = '교육 과정에 대한 간단한 소개를 입력해 주세요'"></textarea> <br>
                           <input class="form-control" name="" id="" type="text" placeholder="교육 과정에 맞는 영상 url 입력해 주세요" style="width: 800px;">
                       </div>
                   </div>
               </div>
           </div>
           <br><br>
     </div>
     <div align="center"><button type="submit" class="genric-btn primary radius">저장 후 다음단계(1/2)</button></div><br>
   </form>
   
  <jsp:include page="../common/footer.jsp" />
    
</body>
</html>