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
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
</head>
     <script>
         var chkIdx = 0;

         var curriculumKeyupFunction = function(){
           	 var curriculumIndex = $(".curriculumTextInput").index($(this))
           	 $(".curriculumText").eq(curriculumIndex).text($(this).val())
           	 $(".videoCurriculumText").eq(curriculumIndex).text($(this).val())
   	     }

 		 var titleKeyupFucntion = function(){
        	 var titleIndex = $(".titleInput").index($(this))
        	 $(".titleText").eq(titleIndex).text($(this).val())
        	 $(".videoTitleText").eq(titleIndex).text($(this).val())
   	     }
   	     
         var detailAddFunction = function(){
         	
         	var detailHtml = '';
         	detailHtml += '<tr><td><h6 class="category_2">2)</h6></td>';
         	detailHtml += '<td width=400px><input type="hidden" name="curriculumList[].curLevel" value="2"><input class="form-control curriculumTextInput totalInput" name="curriculumList[0].curriculumCont" type="text" placeholder="커리큘럼 세부 리스트를 입력해 주세요 "></td>';
         	detailHtml += '<td><button class="plus_btn detailadd" type="button">+</button><button class="plus_btn detailDel" type="button">-</button></td></tr>';

         	var curriculumIndex = $('.curriculumS').eq($('.detailadd').index($(this))).children().length+1;
         	
         	var curriculumhtml = '';
         	curriculumhtml += '<h5><span class="curriculumNum">'+curriculumIndex +') </span><span class="curriculumText"></span></h5>';
         	
         	var videoCurriculumHtml = '';
         	videoCurriculumHtml+= '<div class="curriculumVideo"><h6><span class="videoCurriculumNum">'+curriculumIndex+') </span> <span class="videoCurriculumText"></span></h6><div class="mt-10">';
         	videoCurriculumHtml+= '<textarea class="single-textarea" placeholder="교육 과정에 대한 간단한 소개를 입력해 주세요" required name="videoList['+$('.curriculumVideo').length+'].videoCont" onfocus="this.placeholder =\'\'" onblur="this.placeholder = \'교육 과정에 대한 간단한 소개를 입력해 주세요\'"></textarea> <br>';
         	videoCurriculumHtml+= '<input class="form-control" name="videoList['+$('.curriculumVideo').length+'].videoName" type="text" placeholder="영상 제목을 입력해 주세요" style="width: 800px;">';
         	videoCurriculumHtml+= '<input class="form-control" name="videoList['+$('.curriculumVideo').length+'].videoUrl" type="text" placeholder="교육 과정에 맞는 영상 url 입력해 주세요" style="width: 800px;"></div></div>';

         	$('.curriculumS').eq($('.detailadd').index($(this))).append(curriculumhtml);

         	$(this).parents().eq(2).append(detailHtml);
         	$('.curriculum_detail').eq($('.detailadd').index($(this))).append(videoCurriculumHtml);
         	
         	for(i=0; i<$('.curriculumVideo').length; i++){
         		$('.curriculumVideo').eq(i).find('.mt-10').find('.single-textarea').attr('name', 'videoList['+i+'].videoCont')
         		$('.curriculumVideo').eq(i).find('.mt-10').find('.form-control').eq(0).attr('name', 'videoList['+i+'].videoName')
         		$('.curriculumVideo').eq(i).find('.mt-10').find('.form-control').eq(1).attr('name', 'videoList['+i+'].videoUrl')
         	}
         	for(i=0; i<$('.totalInput').length; i++){
         		$('.totalInput').eq(i).prev().attr('name', 'curriculumList['+i+'].curLevel')
         		$('.totalInput').eq(i).attr('name', 'curriculumList['+i+'].curriculumCont')
         	}
         	
         	
         	$('.curriculumInput').eq($('.detailadd').index($(this))).find('.curriculumTextInput').last().keyup(curriculumKeyupFunction);
         	var length = $(this).parents().eq(2).children().length;
         	$(this).parents().eq(2).children().eq(length-1).children().eq(0).html('<h6 class="category_2">'+(length-1) + ")"+'</h6>');

         	$(this).parents().eq(1).next().find('.detailDel').click (function(){

            	var titleIndex = $('.curriculumInput').index($(this).parents().eq(4))
            	
            	var targetindex = $(this).parents().eq(2).children().index($(this).parents().eq(1))-1
            	$('.curriculumS').eq($('.curriculumInput').index($(this).parents().eq(4))).children().eq(targetindex).remove()
            	var tbody = $(this).parents().eq(2)
            	var length = tbody.children().length - 1
            	if ($(this).prev().length != 0) {
            		tbody.children().eq(length-1).children().eq(2).prepend('<button class="plus_btn detailadd" type="button">+</button>')
            		$(this).parents().eq(1).prev().find('.detailadd').click(detailAddFunction);
               	} 
            	$(this).parents().eq(1).remove()
            		$('.videoTop').eq(titleIndex).find('.curriculumVideo').eq(targetindex).remove();
            	
            	var curriculumLength = $('.curriculumD').eq(titleIndex).find('.curriculumNum').length
            	for(i=0; i<curriculumLength; i++){
            		$('.curriculumD').eq(titleIndex).find('.curriculumNum').eq(i).text((i+1)+") ")
          
            	}
            	for(i=0; i<length; i++){
            		tbody.find(".category_2").eq(i).text((i+1)+")")
            		$('.videoTop').eq(titleIndex).find('.curriculumVideo').eq(i).find('.videoCurriculumNum').text((i+1)+") ")
        	 	}
             	for(i=0; i<$('.curriculumVideo').length; i++){
             		$('.curriculumVideo').eq(i).find('.mt-10').find('.single-textarea').attr('name', 'videoList['+i+'].videoCont')
             		$('.curriculumVideo').eq(i).find('.mt-10').find('.form-control').eq(0).attr('name', 'videoList['+i+'].videoName')
             		$('.curriculumVideo').eq(i).find('.mt-10').find('.form-control').eq(1).attr('name', 'videoList['+i+'].videoUrl')
             	}
             	
             	for(i=0; i<$('.totalInput').length; i++){
             		$('.totalInput').eq(i).prev().attr('name', 'curriculumList['+i+'].curLevel')
             		$('.totalInput').eq(i).attr('name', 'curriculumList['+i+'].curriculumCont')
             	}
            })
            $(this).parents().eq(1).next().find('.detailadd').click(detailAddFunction);
         	$(this).remove();
         }

         
         $(document).ready (function () { 
        	 
        	 $('#groupClassNo').change(function(){
        		 $('#groupClass').val($('#groupClassNo').val())
        	 });
        	 
			$('#oneClass').click(function(){
				$('#groupClassNo').prop('readonly', true)
			});
			$('#groupClass').click(function(){
				$('#groupClassNo').removeAttr('readonly')
			});
	    	 
         	$('#timePrice').change(function(){
        		$('#timePriceResult').html($('#timePrice').val()); 
        	});
        	
	       	 $('#weekCount').change(function(){
	    		 if($('#weekCount').val() != "" && $('#totalPeriod').val() != ""){ 
	    			 
	    		 	$('#totalCount').val($('#weekCount').val()*$('#totalPeriod').val())
	    		 	$('#totalCountResult').html($('#totalCount').val()); 
	    		 }        		 
	    	 });
	    	 
	    	 $('#totalPeriod').change(function(){
	    		 if($('#weekCount').val() != "" && $('#totalPeriod').val() != ""){        			 
	    		 	$('#totalCount').val($('#weekCount').val()*$('#totalPeriod').val())
	    		 	$('#totalCountResult').html($('#totalCount').val()) ;
	    		 }        		 
	    	 });
	    	 
	    	 $('#lessonPricePayResult').click(function(){
	    		 $('#ontimeResult').html($("#oneLessonTime option:selected").val());
	    		 $('#originPrice').html(($('#weekCount').val()*$('#totalPeriod').val())*($("#oneLessonTime option:selected").val())*($('#timePrice').val()))
	    		 $('#payTotal').val(($('#weekCount').val()*$('#totalPeriod').val())*($("#oneLessonTime option:selected").val())*($('#timePrice').val()))
 	    		 $('#connectFees').html((($('#weekCount').val()*$('#totalPeriod').val())*($("#oneLessonTime option:selected").val())*($('#timePrice').val()))*0.2)
 	    		 $('#resultPay').html(($('#weekCount').val()*$('#totalPeriod').val())*($("#oneLessonTime option:selected").val())*($('#timePrice').val())-((($('#weekCount').val()*$('#totalPeriod').val())*($("#oneLessonTime option:selected").val())*($('#timePrice').val()))*0.2))
	    	 });
	    	 
        	 
        	 $('input[name=lessonType]').change(function(){
        		var type = $(this).val();
        		if(type=='오프라인'){
        			$('#enroll_cul').css('display', 'none')
        			$('.curriculumVideo .form-control').removeAttr('required')
        			$('.curriculumVideo .single-textarea').removeAttr('required')
        		}else{
        			$('#enroll_cul').css('display', 'block')
        			$('.curriculumVideo .form-control').prop('required', true)
        			$('.curriculumVideo .single-textarea').prop('required', true)
        		}
        	 });
        	             
        	 
            $('#curriculumBtn').click (function () {   

            	var curriculumIndex = $('.totalInput').length
	            chkIdx ++;
	            var html = '';
	            html += '<div class="curriculumInput">';
	            html += '<table style="width: 500px">';
	            html += '<tr><td width=40px><h5 class="category_1">' + ($(".category_1").length + 1) + '.</h5></td>';
	            html += '<td width=400px><input type="hidden" name="curriculumList['+curriculumIndex+'].curLevel" value="1"><input class="form-control titleInput totalInput" name="curriculumList['+curriculumIndex+'].curriculumCont" type="text" placeholder="커리큘럼 주제를 입력해주세요"></td>';
	            html += '<td><button class="plus_btn categorydelete" type="button" id="categorydelete" value="'+($(".category_1").length + 1)+'">-</button></td></tr>';
	            html += '<tr><td><h6 class="category_2">1)</h6></td>';
	            html += '<td><input type="hidden" name="curriculumList['+(curriculumIndex+1)+'].curLevel" value="2"><input class="form-control curriculumTextInput totalInput" name="curriculumList['+(curriculumIndex+1)+'].curriculumCont" type="text" placeholder="커리큘럼 세부 리스트를 입력해 주세요 "></td></tr>';
 	            html += '<tr><td><h6 class="category_2">2)</h6></td>';
	            html += '<td><input type="hidden" name="curriculumList['+(curriculumIndex+2)+'].curLevel" value="2"><input class="form-control curriculumTextInput totalInput" name="curriculumList['+(curriculumIndex+2)+'].curriculumCont" type="text" placeholder="커리큘럼 세부 리스트를 입력해 주세요 "></td>';
	            html += '<td><button class="plus_btn detailadd" type="button">+</button></td></tr></table><br></div>';
	             $('#parah').append (html); 
	             
	            var inputhtml = '';
	            inputhtml += '<div class="curriculumD"><h4 class="inputTitle"><span class="titleNum">'+($(".category_1").length)+'. </span><span class="titleText"></span></h4>';
	            inputhtml += '<div class="curriculumS"><h5><span class="curriculumNum">1) </span><span class="curriculumText"></span></h5><h5><span class="curriculumNum">2) </span><span class="curriculumText"></span></h5></div><hr></div>';
	            $('.curriculumP').append(inputhtml);
	            
	            var videoHtml = '';
	            videoHtml+= '<div class="videoTop"><h5><span class="videoTitleNum">' +($('.videoTitleNum').length+1)+'. </span> <span class="videoTitleText"></span></h5><div class="curriculum_detail">';
	            videoHtml+= '<div class="curriculumVideo"><h6><span class="videoCurriculumNum">1) </span> <span class="videoCurriculumText"></span></h6><div class="mt-10">';
	            videoHtml+= '<textarea class="single-textarea" placeholder="교육 과정에 대한 간단한 소개를 입력해 주세요" required name="videoList['+$('.curriculumVideo').length+'].videoCont" onfocus="this.placeholder =\'\'" onblur="this.placeholder = \'교육 과정에 대한 간단한 소개를 입력해 주세요\'"></textarea> <br>';
	            videoHtml+= '<input class="form-control" name="videoList['+$('.curriculumVideo').length+'].videoName" type="text" placeholder="영상 제목을 입력해 주세요" required style="width: 800px;">';
	            videoHtml+= '<input class="form-control" name="videoList['+$('.curriculumVideo').length+'].videoUrl" type="text" placeholder="교육 과정에 맞는 영상 url 입력해 주세요" required style="width: 800px;"></div></div>';
	            videoHtml+= '<div class="curriculumVideo"><h6><span class="videoCurriculumNum">2) </span> <span class="videoCurriculumText"></span></h6><div class="mt-10">';
	            videoHtml+= '<textarea class="single-textarea" placeholder="교육 과정에 대한 간단한 소개를 입력해 주세요" required name="videoList['+($('.curriculumVideo').length+1)+'].videoCont" onfocus="this.placeholder = \'\'" onblur="this.placeholder = \'교육 과정에 대한 간단한 소개를 입력해 주세요\'"></textarea> <br>';
	            videoHtml+= '<input class="form-control" name="videoList['+($('.curriculumVideo').length+1)+'].videoName" type="text" placeholder="영상 제목을 입력해 주세요" required style="width: 800px;">';
	            videoHtml+= '<input class="form-control" name="videoList['+($('.curriculumVideo').length+1)+'].videoUrl" type="text" placeholder="교육 과정에 맞는 영상 url 입력해 주세요" required style="width: 800px;"></div></div></div><hr></div>';    
			    $('.videoAll').append(videoHtml);
	            
	            $('.titleInput').last().keyup(titleKeyupFucntion);
	            
	            $('.curriculumInput').last().find('.curriculumTextInput').keyup(curriculumKeyupFunction);
	            
                
	             var categorydeleteindex=$('.categorydelete').length-1
	             $('.categorydelete').eq(categorydeleteindex).click (function (){
	            	 $('.curriculumD').eq($(this).attr('value')-1).remove()
	            	 $(this).parents().eq(4).remove()
	            	 	$('.videoTop').eq($(this).attr('value')-1).remove()
	            	 	var length = $(".category_1").length
	            	 	for(i=0; i<length; i++){
	            	 		$(".category_1").eq(i).text((i+1)+".")
	            	 		$(".categorydelete").eq(i).attr('value',(i+2))
	            	 		$(".inputTitle").eq(i).find('.titleNum').text((i+1)+". ")
	            	 		$(".videoTitleNum").eq(i).text((i+1)+".")
	            	 	}
	 	        });
	             var detailindex=$('.detailadd').length-1
	            $('.detailadd').eq(detailindex).click(detailAddFunction);
	            
            });
            $('.detailadd').click(detailAddFunction)
	        
      	});      	
      </script>
<body>

    <jsp:include page="../common/navBar.jsp" />
 <form action="insert.le" method="post" enctype="multipart/form-data">  
    <br><h3 class="mb-30">클래스 등록</h3>
    <hr class="top-hr">
    <div class="class1-form">
     
        <h5><b>클래스 제목</b></h5>
        <input type="text" name="lessonTitle" placeholder="클래스 제목을 입력해주세요 (공백 포함 50자 이내)" onfocus="this.placeholder = ''" onblur="this.placeholder = '클래스 제목을 입력해주세요 (공백 포함 50자 이내)'" class="classTitle" required>
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
        <input type="file" id="upfile" class="form-control-file border" style="width:400px;" name="lessonUpFile"  required><br><br><br>
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
                <textarea class="single-textarea" placeholder="튜터님의 수업을 수강하기에 적합한 수업 대상에 대해 적어주세요." required name="lessonTarget"
                     onfocus="this.placeholder = ''" onblur="this.placeholder = '튜터님의 수업을 수강하기에 적합한 수업 대상에 대해 적어주세요.'"></textarea>
            </div><br>
        </div><br><br>
        <table>
            <tr>
                <th width=210>수업형태</th>
                <td><input type="radio" name="lessonForm" id="multiTime" value="다회차"> <label for="multiTime"> 다회차 수업</label></td>
                <td><input type="radio" name="lessonForm" id="oneTime" value="원데이"> <label for="oneTime"> 원데이 클래스</label></td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2" class="classCon">
                    * 다회차 수업일 경우 되도록 한달 내에 끝낼 수 있도록 커리큘럼을 계획해 주세요.<br><br><br><br><br>
                </td>
            </tr>

            <tr>
                 <th>수업유형</th>
                 <td><input type="radio" name="lessonType" id="online" value="온라인"> <label for="online"> 온라인 수업</label></td>
                 <td><input type="radio" name="lessonType" id="offline" value="오프라인"> <label for="offline"> 오프라인 수업</label></td>
             </tr>
             <tr>
                 <td></td>
                 <td colspan="2" class="classCon">
                     * 온라인 수업일 경우 다음 단계에서 영상과 설명을 올려주셔야 합니다.<br><br><br><br><br>
                 </td>
             </tr>

             <tr>
                 <th>수업 참여 희망 인원</th>
                 <td><input type="radio" name="lessonGroup" id="oneClass" value="1"> <label for="oneClass"> 1:1 수업</label></td>
                 <td><input type="radio" id="groupClass" name="lessonGroup"> <label for="groupClass"> 그룹 수업</label> 
                     <input type="number" min="2" id="groupClassNo" readonly placeholder="숫자만 입력" onfocus="this.placeholder = ''" onblur="this.placeholder = '숫자만 입력'" class="classNum"></td>
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
                         <select name="lessonCategory" style="display: none;">
                             <option value="" selected disabled>수업 카테고리를 선택해주세요.</option>
                             <option value="키즈">키즈</option>
                             <option value="머니">머니</option>
                             <option value="커리어">커리어</option>
                             <option value="취미생활">취미생활</option>
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
                                    <td width=40px><input type="hidden" name="CurriculumListNo"><h5 class="category_1">1.</h5></td>
                                    <td width=400px><input type="hidden" name="curriculumList[0].curLevel" value="1"><input class="form-control titleInput totalInput" name="curriculumList[0].curriculumCont" type="text" placeholder="커리큘럼 주제를 입력해주세요"></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><h6 class="category_2">1)</h6></td>
                                    <td><input type="hidden" name="curriculumList[1].curLevel" value="2"><input class="form-control curriculumTextInput totalInput" name="curriculumList[1].curriculumCont" type="text" placeholder="커리큘럼 세부 리스트를 입력해 주세요 "></td>
                                </tr>
                                <tr>
                                    <td><h6 class="category_2">2)</h6></td>
                                    <td><input type="hidden" name="curriculumList[2].curLevel"  value="2"><input class="form-control curriculumTextInput totalInput" name="curriculumList[2].curriculumCont" type="text" placeholder="커리큘럼 세부 리스트를 입력해 주세요 "></td>
                                    <td><button class="plus_btn detailadd" type="button">+</button></td>
                                </tr>
                        </table><br>
                        </div>
                    </div>
                </div>

                <br><button type="button" class="genric-btn primary-border radius" id="curriculumBtn">주제 추가</button><br><br><br><br>


            </div>
            
         </div>
         <br><br>
         <div class="lesson-row">
             <div class="typography curriculumP">
             	<div class="curriculumD">
	                 <h4 class="inputTitle"><span class="titleNum">1. </span><span class="titleText"></span></h4>
	                 <div class="curriculumS">
	                 	<h5><span class="curriculumNum">1) </span><span class="curriculumText"></span></h5>
	                 	<h5><span class="curriculumNum">2) </span><span class="curriculumText"></span></h5>
	                 </div>
	                 <hr>
                 </div>
             </div>
         </div>
         
         <script>
         $(".titleInput").keyup(titleKeyupFucntion);
         
         $(".curriculumTextInput").keyup(curriculumKeyupFunction);
         
         </script>

         <div id="enroll_cul">
            <h5><b>클래스 영상 등록</b></h5>
                <div style="background-color: #f9f9ff; width: 900px; font-size: 13px;">
                    <ul class="unordered-list">
                        <li>교육 과정의 주제에 맞는 영상 url을 입력해 주세요.</li>
                        <li>레츠 회원들이 참고하기 쉽게 영상에 대한 간단한 소개를 해주세요.</li>
                    </ul>
                </div>

                <br><br>
               <div class="videoAll">
               	<div class="videoTop">
                   <h5><span class="videoTitleNum">1. </span> <span class="videoTitleText"></span></h5>
                   <div class="curriculum_detail">
                   	<div class="curriculumVideo">
                       <h6><span class="videoCurriculumNum">1) </span> <span class="videoCurriculumText"></span></h6>
                       <div class="mt-10">
                           <textarea class="single-textarea" placeholder="교육 과정에 대한 간단한 소개를 입력해 주세요" required name="videoList[0].videoCont"
                           		onfocus="this.placeholder = ''" onblur="this.placeholder = '교육 과정에 대한 간단한 소개를 입력해 주세요'"></textarea> <br>
                           <input class="form-control" name="videoList[0].videoName" type="text" required placeholder="영상 제목을 입력해 주세요" style="width: 800px;">
                           <input class="form-control" name="videoList[0].videoUrl" type="text" required placeholder="교육 과정에 맞는 영상 url 입력해 주세요" style="width: 800px;">
                       </div>
                     </div>
                     <div class="curriculumVideo">
                       <h6><span class="videoCurriculumNum">2) </span> <span class="videoCurriculumText"></span></h6>
                       <div class="mt-10">
                           <textarea class="single-textarea" placeholder="교육 과정에 대한 간단한 소개를 입력해 주세요" required name="videoList[1].videoCont"
                           onfocus="this.placeholder = ''" onblur="this.placeholder = '교육 과정에 대한 간단한 소개를 입력해 주세요'"></textarea> <br>
                           <input class="form-control" name="videoList[1].videoName" type="text" required placeholder="영상 제목을 입력해 주세요" style="width: 800px;">
                           <input class="form-control" name="videoList[1].videoUrl" type="text" required placeholder="교육 과정에 맞는 영상 url 입력해 주세요" style="width: 800px;">
                       </div>
                     </div>
                   </div>
                   <hr>
                 </div>
               </div>
           </div>
           <br><br>
     </div>


<div class="lessonEnrollNextForm">
        <div style="margin: 4%;">
            <br>
            <div style="clear: both;">
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
            </div>
            <textarea id="summernote" name="lessonInstr"></textarea>
            <script>
                $(document).ready(function() {
                      $('#summernote').summernote({
                          width : 900,
                          height : 500,
                          focus : false
                      });
                    });
            </script>
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
	                        <td width=400px><input class="form-control lessonPrepareInput" name="lessonPrepareList[0]" type="text" placeholder="준비물을 입력해 주세요"></td>
	                    </tr>
                    </tbody>
                </table>

                <br><button href="#" type="button" class="genric-btn primary-border radius" id="prepareBtn">준비물 추가</button>

                <script>  
                     $('#prepareBtn').click (function () {
                         var prepareHtml = '';
                         prepareHtml += '<tr><td><input class="form-control lessonPrepareInput" name="lessonPrepareList['+$('.lessonPrepareInput').length+']" type="text" placeholder="준비물을 입력해 주세요"></td>';
                         prepareHtml += '<td><button class="plus_btn prepareDel" type="button">-</button></td></tr>';
                         $('#prepareTable > tbody:last').append(prepareHtml);
                         
	                     $('.prepareDel').click (function(){
	                    	 $(this).parents().eq(1).remove()  
	                    	 for(i=0; i<$('.lessonPrepareInput').length; i++){
	                    		 $('#prepareTable').find('tr').eq(i).find('.lessonPrepareInput').attr('name','lessonPrepareList['+i+']')
	                    	 }
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
	               <table class="lessonFaqTable">
	                   <tr>
	                       <th>Q.</th>
	                       <td width=600px><input class="form-control faqQuestion" name="lessonFaqList[0].faqQuestion" type="text" placeholder="자주하는 질문을 입력해주세요"></td>
	                       <td></td>
	                   </tr>
	                   <tr>
	                       <th>A.</th>
	                       <td><input class="form-control faqAnswer" name="lessonFaqList[0].faqAnswer" type="text" placeholder="답변을 작성해주세요"></td>
	                   </tr>
	               </table>
               </div>
               <br><button href="#" type="button" class="genric-btn primary-border radius" id="faqBtn">질문 추가</button><br><br>
               
               <script>
               		$('#faqBtn').click (function () {
               			var faqHtml = '';
               			faqHtml += '<table class="lessonFaqTable"><tr><th>Q.</th><td width=600px>';
               			faqHtml += '<input class="form-control faqQuestion" name="lessonFaqList['+($('.lessonFaqTable').length)+'].faqQuestion" type="text" placeholder="자주하는 질문을 입력해주세요"></td>';
               			faqHtml += '<td><button class="plus_btn faqDel" type="button">-</button></td></tr>';
               			faqHtml += '<tr><th>A.</th><td><input class="form-control faqAnswer" name="lessonFaqList['+($('.lessonFaqTable').length)+'].faqAnswer" id="" type="text" placeholder="답변을 작성해주세요"></td></tr></table>';
               			$('#lessonFaq').append(faqHtml);
               				$('.lessonFaqTable').length
               				
               			
               			$('.faqDel').click (function(){
               				$(this).parents().eq(3).remove();
               				$('.lessonFaqTable').length
               				
               				for(i=0; i<$('.lessonFaqTable').length; i++){
               					$('.lessonFaqTable').eq(i).find('.faqQuestion').attr('name','lessonFaqList['+i+'].faqQuestion')
               					$('.lessonFaqTable').eq(i).find('.faqAnswer').attr('name','lessonFaqList['+i+'].faqAnswer')
               				}
               				
               				
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
                        <td width="240"><input class="form-control" id="timePrice" name="price" type="number" placeholder="시간당 가격을 입력하세요"></td>
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
                            <div class="default-select">
                                <select name="time" id="oneLessonTime" style="display: none;">
                                    <option value="" selected disabled>1회당 수업시간을 선택하세요</option>
                                    <option value="1">1시간</option>
                                    <option value="2">2시간</option>
                                    <option value="3">3시간</option>
                                    <option value="4">4시간</option>
                                    <option value="5">5시간</option>
                                </select>
 
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
                        <th colspan="2">주당 수업 횟수</th>
                    </tr>
                    <tr>
                        <td width="240"><input type="hidden" name="totalCount" id="totalCount"><input class="form-control" type="number" id="weekCount" placeholder="한 주당 진행할 횟수 입력"></td>
                        <th>번</th>
                    </tr>
                </table><br>
                <table>
                    <tr>
                        <th colspan="2">총 진행 기간</th>
                    </tr>
                    <tr>
                        <td width="240"><input class="form-control" name="period" id="totalPeriod" type="number" placeholder="총 진행 기간 주단위로 입력"></td>
                        <th>주</th>
                    </tr>
                </table>
            </div>
			<br><button type="button" class="genric-btn primary radius" id="lessonPricePayResult">총 수업 가격 확인하기</button><br><br>
            <div>
                <h5><b>총 수업 가격</b></h5><br>
                <div style="background-color: #f9f9ff; width: 600px; font-size: 20px; padding: 20px;">
                    <span id="timePriceResult">0</span>원 X <span id="ontimeResult">0</span>시간 X <span id="totalCountResult">0</span>번<br>
                    <hr>
                    <table align="right" style="width: 200px;">
                        <tr>
                            <th>원수업료</th>
                            <th><input type="hidden" id="payTotal" name="payTotal"><span id="originPrice">0</span></th>
                            <th>원</th>
                        </tr>
                        <tr>
                            <th>연결 수수료</th>
                            <th><span id="connectFees">0</span></th>
                            <th>원</th>
                        </tr>
                    </table><br><br><br>

                    <table align="right" style="color: red; width: 200px;">
                        <tr>
                            <th>총 수업료</th>
                            <th><span id="resultPay">0</span></th>
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
        
     <div align="center">
	     <button type="submit" class="genric-btn primary radius">최종 승인 요청하기</button>
     </div><br><br><br>
    </form>
 </div>
    
	<jsp:include page="../common/footer.jsp" />
   <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> 
   	
</body>
</html>