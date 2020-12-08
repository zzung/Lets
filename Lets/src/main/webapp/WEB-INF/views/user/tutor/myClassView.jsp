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
    #salaryTable th {text-align: right;}
    .outCome{
    	background-color: lightgray; 
    	height: 200px; 
    	width: 580px; 
    	text-align: center;
    	margin-bottom:10px;
    	border-radius:5px}
    .totalSalary{
    	background-color: rgb(45, 48, 186); 
    	margin-left:15px ; 
    	color: white;
    	height: 200px;
    	width: 580px;
    	box-sizing: border-box;
    	margin-bottom:10px;
    	border-radius:5px}  
    .classSalary div {float: left; text-align:center}
    .btn-group-sm >.btn, .btn-sm {
    padding: .25rem .5rem;
    line-height: 1.5;
    border-radius: .2rem;
    }
    #deliveryF li{
        height: 35px;
        list-style-type:circle;
        margin-left: 10px;
    }
    #deliveryRe tr{
        height: 35px;
    }
    .titleName th{font-size:18px}
    .titleName tr{background:lightgray}
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
            
            <thead>
	            <tr class="titleName" style="background-color:rgb(243, 243, 243)">
	            	<th>수업제목</th>
	            	<th>QNA게시판</th>
	            	<th>승인날짜</th>
	            	<th>수업유형</th>
	            	<th>수업종료신청</th>
	            </tr>
	        </thead>
	        <tbody>
            <c:choose>
            	<c:when test="${empty aLlist }">
            		<tr>
                		<td colspan="4" align="center">승인된 수업이 없습니다.</td>
                	</tr>
            	</c:when>
            	<c:otherwise>
		            	<c:forEach var="al" items="${aLlist}" varStatus="del">
							<!-- 삭제에 필요(인덱스) -->  
							<form action="" method="post" id="delLesson${del.index }">
			       				<input type="hidden" id="deleteLes${del.index }" value="${al.lessonNo}" name="lno">
				            </form>
				            <tr>
				                <td style="width: 550px;"><a href="courseDetailView.le?lessonNo=${al.lessonNo }" style="color:black">${al.lessonTitle }</a></td>
				                <td style="width: 150px;"><a href="detailQNA.cr?lessonNo=${al.lessonNo }" style="color:black">답변달기</a></td>
				                <td style="width: 150px;">${al.approveDate }</td>
				                <td style="width: 150px;">${al.lessonType }</td>
				                <td id="lessonTp${del.index }" style="width: 150px;">
				                <c:choose>
				                	<c:when test="${al.lessonType eq '온라인' }">
				                		<c:choose>
				                		<c:when test="${al.status eq 'Y' }">
				                    		<button class="genric-btn primary-border btn-sm" 
				                    		id="deleteBtn${del.index }" style="font-size: 13px;" onclick="deleteBtn${del.index }();">클래스 종료 신청</button>
				                		</c:when>
				                		<c:otherwise>
				                			<span style="font-size:12px">종료신청 완료</span>	                		
				                		</c:otherwise>
				                		</c:choose>
				                	</c:when>
				                	<c:when test="${al.lessonType eq '오프라인' }">
				                		<span style="font-size:12px">종료신청 불가</span>
				                	</c:when>
				                </c:choose>
				                </td>
				            </tr>
			       	<script>
			       		function deleteBtn${del.index }(){
			       			$("#delLesson${del.index }").attr("action","deleteLesson.tl").submit();
			       		}
			       	</script>
		     		<!-- 
				        <script>
				        	$(function(){
				        		$("#deleteBtn${del.index }").click(function(){
				        			
				        			$.ajax({
				        					url:"deleteLesson.tl",
				        					data:{
				        						lno:$("#deleteLes${del.index }").val()
				        					},
				        					success:function(result){
				        						
				        						if(result == "success"){
				        							var result = "";
				        							
				        							result += '<span style="font-size:12px" id="finish">'+'종료신청 완료'+'</span>'
					        						//console.log("ajax통신성공");
					        						alert("삭제요청되었습니다");
					        						$("#deleteBtn${del.index }").hide();
					        						$("#lessonTp${del.index }").html(result); 
				        							
				        						} else {
				        							alert("삭제 실패")
				        						}
				        					},error:function(){
				        						alert("삭제요청실패");
				        						//console.log("ajax통신실패")
				        					}
				        			})
				        		})
				        	})
				        </script>
				        -->
		            </c:forEach>
	           </c:otherwise>
     		</c:choose>
     		</tbody>
        </table>
        <!------------------------ 클래스 승인 상태 --------------------------------->
        <br><br>
        <p id="smTitle" style="color: gray;">클래스 승인 상태<span style="font-size: 12px;color: rgb(45, 48, 186);float: right;">**승인보류, 거부는 삭제 후 다시 신청해주세요.</span></p>
        <table style="text-align: center;" class="table table-bordered table-sm">
	        <thead>
	       		<tr class="titleName" style="background-color:rgb(243, 243, 243)">
	            	<th style="width: 550px;">수업제목</th>
	            	<th style="width: 150px;">승인유형</th>
	            	<th style="width: 100px;">삭제</th>
	            </tr>
		    </thead>
		    <tbody>
		    <c:choose>
            	<c:when test="${empty sLlist }">
            		<tr>
                		<td colspan="4" align="center">등록된 수업이 없습니다.</td>
                	</tr>
            	</c:when>
            	<c:otherwise>
		            <c:forEach var="sl" items="${sLlist }" varStatus="slModal">
		            <form action="" method="post" id="del${slModal.index }">
		            	<input type="hidden" id="lno${slModal.index }" name="lno" value="${sl.lessonNo }">
			        </form> 
			            <tr>
			                <td><a href="courseDetailView.le?lessonNo=${sl.lessonNo }" style="color:black">${sl.lessonTitle}</a></td>
			                <td>
			                    <c:choose>
			                    	<c:when test="${sl.lessonStatus eq '거절'}">
			                    		<a type="button" class="genric-btn danger-border btn-sm" data-toggle="modal" 
		                    			data-target="#R_reason" id="r_reason${slModal.index}">승인거부</a>
			                    	</c:when>
			                    	<c:when test="${sl.lessonStatus eq '보류'}">
			                    		<c:choose>
				                    		<c:when test="${empty sl.holdReason}">
					                    		<div>검토중</div>
					                    	</c:when>
					                    	<c:otherwise>
					                    		<a type="button" class="genric-btn primary-border btn-sm" data-toggle="modal" 
			                    				data-target="#H_reason" id="h_reason${slModal.index}">승인보류</a>
					                    	</c:otherwise>
				                    	</c:choose>
				                    </c:when>
			                    </c:choose>
			                </td>
			                <td>
			                    <c:choose>
			                    	<c:when test="${sl.lessonStatus eq '보류' }">
				                    	<c:if test="${!empty sl.holdReason}">
			                    			<button class="genric-btn primary-border btn-sm" style="font-size: 13px;" id="lessonDelBtn${slModal.index }" >삭제</button>
				                    	</c:if>
			                    	</c:when>
			                    	<c:when test="${sl.lessonStatus eq '거절'}">
			                    		<button class="genric-btn primary-border btn-sm" style="font-size: 13px;" id="lessonDelBtn${slModal.index }" onclick="delBtn${slModal.index}();">삭제</button>
			                    	</c:when>
			                    	<c:otherwise>
			                    	
			                    	</c:otherwise>
			                    </c:choose>
			                </td> 
			            </tr>
			            
			            <!-- 승인보류시 떠야할 모달 -->
					    <div class="modal fade" id="H_reason${slModal.index }">
					        <div class="modal-dialog ">
					            <div class="modal-content">
					                <div class="modal-outer" style="background-color:rgba(212, 209, 209, 0.411); padding: 20px;">
					                    <!-- Modal Body -->
					                    <div class="modal-body" style=" background-color: white;  height: 300px;" >
					                        <button type="button" class="close" data-dismiss="modal" >&times;</button> 
					                        <h4 style="text-align: center;">클래스 보류 사유</h4>
					                        <br><br>
					                        <p>${sl.holdReason}</p>
					                    </div>
					                </div>
					            </div>
					        </div>
					    </div>
					
					    <!-- 승인거부 시 뜨는 모달 -->
					    <div class="modal fade" id="R_reason${slModal.index }">
					        <div class="modal-dialog ">
					            <div class="modal-content">
					                <div class="modal-outer" style="background-color: rgba(212, 209, 209, 0.411); padding: 20px;">
					                    <!-- Modal Body -->
					                    <div class="modal-body" style=" background-color: white;  height: 300px;" >
					                        
					                        <button type="button" class="close" data-dismiss="modal">&times;</button> 
					                        <h4 style="text-align: center;">클래스 거부 사유</h4>
					                        <br><br>
					                        <p>${sl.refuseReason }</p>
					                    </div>
					                </div>
					            </div>
					        </div>
					    </div>
		            
			            <!-- 보류, 거절 hover 시 뜰 모달  -->
				        <script>
				            $("#r_reason${slModal.index }").mouseover(function(){
				            	
				                $("#R_reason${slModal.index }").modal({
				                    show:true
				                })
				            })
				
				            $("#h_reason${slModal.index }").mouseover(function(){
				                $("#H_reason${slModal.index }").modal({
				                    show:true
				                })
				            })
						
				        </script>
				        <!-- 
				       <script>
			       		function delBtn${slModal.index }(){
			       			$("#del${slModal.index  }").attr("action","deleteLesson.tl").submit();
			       		}
			       		</script>
			       		 -->
				        <script>
				        	$(function(){
				        		$("#lessonDelBtn${slModal.index }").click(function(){
				        			
				        			$.ajax({
				        					url:"deleteLes.tl",
				        					data:{
				        						lno:$("#lno${slModal.index }").val()
				        					},
				        					success:function(result){
				        						
				        						if(result == "success"){
				        							console.log("성공");
				        							$("#lessonDelBtn${slModal.index }").parents("tr").remove();
				        							$("#R_reason${slModal.index }").remove();
				        							$("#H_reason${slModal.index }").remove();
				        						} else {
				        							alert("삭제 실패")
				        						}
				        					},error:function(){
				        						alert("삭제요청실패");
				        						//console.log("ajax통신실패")
				        					}
				        			})
				        		})
				        	})
				        </script>
				       
		        	</c:forEach>
	        	</c:otherwise>
	        	</c:choose>
	        </tbody>
        </table>
	            

        <!----------------------------------------- 클래스 준비물 관리 ----------------------------------------->
        
        <br><br>
        <p id="smTitle" style="color: gray;">클래스 준비물 관리</p>
        
        <div class="prepareTable">
        <table style="text-align: center;" id="lessonPreTable" class="table table-bordered table-sm"></table>
	    </div>
	    <script>
	    	function deliveryReady(e){
	    		var content = $(e).data("list");
	    		var memName = $(e).data("memname");
	    		var lno = $(e).data("lno");
	    		var mno = $(e).data("mno");

	    		console.log($(e).data("mno"));
	    		console.log(mno);
	    		/*
	    		console.log(memName); 
	    		console.log($(e).data("memName"));
	    		*/
	    		$(".listContent").text(content); 
	    		$(".memName").text(memName);
	    		$("#lno").val(lno);
	    		$("#mno").val(mno);
	    		
	    	}
	    	
	    	function deliveryGo(e){
	    		var delNo = $(e).data("delno");
	    		var delName = $(e).data("delname");
	    		var name = $(e).data("name");
	    		var content = $(e).data("prelist");
	    		
	    		$(".prelist").text(content); 
	    		$(".name").text(name);
	    		$(".delname").text(delName);
	    		$(".delnum").text(delNo);
	    	}
	    	
	    	
	    </script>
	    
        <!-- 준비물 보내기 클릭 시 뜨는 모달 -->
	    <div class="modal fade" id="deliveryR">
	        <div class="modal-dialog">
	            <div class="modal-content">
	            <!-- Modal Header -->
	            <div class="modal-header">
	                <h4 class="modal-title">준비물 보내기</h4>
	                <button type="button" class="close" data-dismiss="modal">&times;</button> 
	            </div>
	            <form action="delivery.tm" method="post">
	            <input type="hidden" name="memNo" id="mno"value="">
	            <input type="hidden" name="lessonNo" id="lno" value="">    
				   
				   <!-- Modal Body -->
	                <div class="modal-body">
	                	<span class="memName"></span>
	                    <label for="userId" class="mr-sm-2">회원님께 보내실 클래스의 준비물 입니다.</label><br>
	                    
	                    <div class="delivery_go" >
	                    <dl>
	                    	<dd>
	                            <li class="listContent" style="list-style-type:square"></li>
	                            <c:forEach var="l" items=".listContent">
	                            	
	                            </c:forEach>
	                    	</dd>
	                    </dl>
	                    </div>
	                    <hr>
	                     <dl>
	                    	<dd>택배사</dd>
	                    	<dd><input type="text" id="delName"  name="delName" value=""></dd>
	                    	<dd>운송장번호</dd>
	                    	<dd><input type="text" id="delNo" name="delNo" value=""></dd>
	                    </dl>
	                </div>
	                
	                <!-- Modal footer -->
	                <div class="modal-footer">
	                    <button type="submit" class="genric-btn primary-border btn-sm" >입력</button>
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
		           	<form action="" method="post">
		                <!-- Modal Body -->
		                <div class="modal-body">
		                	<span class="name"></span>
		                    <label for="userId" class="mr-sm-2">회원님께 보낸 클래스의 준비물</label><br>
		                    
		                    <div class="delivery_ing">
		                      <dl>
		                    	<dd>
		                            <li class="prelist" style="list-style-type:square"></li>
		                    	</dd>
		                      </dl>
		                    </div>
		                    <hr>
		                     <dl>
		                    	<dd style="width:300px; height: 30px;" >택배사 : <span class="delname"></span></dd>
		                    	<dd style="width:300px; height: 30px;" >운송장번호 : <span class="delnum"></span></dd>
		                    </dl>
		                </div>
		            </form>
	            </div>
	        </div>
	    </div>
	        
	        <!--페이징-->
            <div id="pagingArea" style="margin-left: 35%;"></div>

	       <script>
	       	$(function(){
	       		prepareList();
	       		
	    	})
	       	//내클래스 -> 준비물보내기 ajax
	       	function prepareList(currentP){
	       		$.ajax({
	       			url:"prepareList.tm",
	       			data:{
	       				memNo: ${loginUser.memNo},
	       				currentPage:currentP
	       			},
	       			success:function(hmap){
	       				
	       				var value = "";
	       				var result ="";
	       				
		       				value +='<thead>'
		       				value +='<tr class="titleName" style="background-color:rgb(243, 243, 243)">'
							value +='<th style="width: 100px;">'+'회원이름'+'</th>'
							value +='<th style="width: 550px;">'+'수업제목'+'</th>'
							value +='<th style="width: 200px;">'+'결제날짜'+'</th>'
							value +='<th style="width: 150px;">'+'배송유형'+'</th>'
							value +='</tr>' 
							value += '</thead>'
	       				$.each(hmap.list, function(i,memPay){
							value += '<tbody><tr>' 
					        value += '<td>' + memPay.memName + '</td>'
					        value += '<td><a href="courseDetailView.le?lessonNo='+memPay.lessonNo+'" style="color:black">' + memPay.lessonTitle + '</a></td>'
					        value += '<td>신청일 ' + memPay.paymentDay + '</td>' 
					        value += '<td>'
			                  		if(memPay.delStatus == "배송전"){
			               	value += '<button data-toggle="modal" data-target="#deliveryR" class="genric-btn primary btn-sm" style="font-size: 13px;" data-list='+memPay.lessonPrepare+' data-memname='+memPay.memName+' data-mno=' +memPay.memNo+' data-lno='+memPay.lessonNo+ ' onclick="deliveryReady(this);">준비물 보내기</button>'
			                 		 }else if(memPay.delStatus == "배송중"){
			               	value += '<button data-toggle="modal" class="genric-btn primary-border btn-sm" data-target="#deliveryF" style="font-size: 13px;" data-prelist='+memPay.lessonPrepare+' data-name='+memPay.memName+' data-delno='+memPay.delNo+' data-delname='+memPay.delName+' onclick="deliveryGo(this);">배송중</button>'
			                  		}else{
			               	value += '<button data-toggle="modal" class="genric-btn primary-border btn-sm" data-target="#deliveryF" style="font-size: 13px;" data-prelist='+memPay.lessonPrepare+' data-name='+memPay.memName+' data-delno='+memPay.delNo+' data-delname='+memPay.delName+' onclick="deliveryGo(this);">배송완료</button>' 
			                 		 }
							value += '</td></tr>'
		       				value += '</tbody>';
	       				
	       				})
						$(".prepareTable > #lessonPreTable").html(value);
						
						var listCount = hmap.pi.listCount;
					    var currentPage = hmap.pi.currentPage;
					    var startPage = hmap.pi.startPage;
					    var endPage = hmap.pi.endPage;
					    var maxPage = hmap.pi.maxPage;
					    var Previous = hmap.pi.currentPage-1;
			
						 	  result += '<ul class="pagination">'
					  	   if(currentP != 1) {
                              result += '<li class="page-item"><a class="page-link" onclick="prepareList( '+ (currentPage-1) +')">Previous</a></li>'
                           }else{
                              result += '<li class="page-item disabled"><a class="page-link" onclick="prepareList( '+ (currentPage-1) +')">Previous</a></li>'
                           }
						for(var p=startPage; p<=endPage; p++){
                              if(currentP != p){
                                 result += '<li class="page-item"><a class="page-link" onclick="prepareList( '+ p +')">'+ p+ '</a></li>'
                              }else{
                                 result += '<li class="page-item disabled"><a class="page-link" onclick="prepareList( '+ p +')">'+p+'</a></li>'
                              }
						}
                            if(currentP == maxPage){
                               result += '<li class="page-item disabled"><a class="page-link" onclick="prepareList( '+ (currentPage+1) +')">Next</a></li>'
                            }else{
                               result += '<li class="page-item"><a class="page-link" onclick="prepareList( '+ (currentPage+1) +')">Next</a></li>'
                               
                            }
				
                            $("#pagingArea").html(result);
						
	       			},
	       			error:function(err){
	       				console.log(err);
	       				console.log("preparelist ajax fail")
	       			}
	       			
	       		})
	       	}
	       </script>
        
        <script>
        	$(".page-link").on("click",function(){
        		var page = $(".page-link");
        		page.css("hover:")
        	})
        </script>
        <!-- 수업성과 & 정산서 -->
        <br><hr>
        <div style="color: gray; font-size: 20px; font-weight: bold; ">수업성과 & 정산서
	        <br>
	       <!-- 
	        <div class="single-element-widget mt-30" >
	            <div class="default-select" id="salary" style="float:left">
	                <select name="salary">
	                <option value="total_pay">전체수익</option>
	                <option value="month_pay">월별로보기</option>
	                </select>
	            </div>
	            <div class="default-select" id="year"style="display: none;float:left">
	                <select name="year" >
	                    <option value="2018">2018</option>
	                    <option value="2019">2019</option>
	                    <option value="2020">2020</option>
	                </select>
	            </div>
	            <div class="default-select" id="month" style="display: none;float:left">
	                <select name="month">
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
	        </div>
	         -->
	        <!-- 정산받는 버튼 -->
	        <span style="float: right; margin-right:80px;"><button data-toggle="modal" data-target="#account" class="genric-btn primary-border btn-sm" onclick="salarySave();">정산받기</button></span>
        </div>
        <br><br>
        	<div class="classSalary" >
        <c:forEach var="ms" items="${ msList}" varStatus="chk">
	            <div class="outCome">
	            	<c:choose>
		            	<c:when test="${empty ms.account }">
		                    <div class="confirm-checkbox" style="margin-left:20px;margin-top:20px">
			                	<input type="checkbox" id="confirm-checkbox${chk.index }" name="lno" value="${ms.lessonNo }">
			                	<label for="confirm-checkbox${chk.index }"></label>
			                </div>
		                </c:when>
	                </c:choose>
                    <br>
                    <p id="classTitle" name="classTitle" style="font-size:20px;">${ms.lessonTitle }</p>
                    <br>
                    <table id="outComeTable" align="center">
                    	<tr>
                    		<th>추천수 : </th>
                    		<td>${ms.likeCount } 명</td>
                    	</tr>
                    	<tr>
                    		<th>신청수 : </th>
                    		<td>${ms.studentCount } 명</td>
                    	</tr>
                    </table>
	            </div>
                <div class="totalSalary" >
                    <br><br>
                    <table id="salaryTable" align="center">
                    	
                        <tr>
                            <td>&nbsp;</td>
                            <td style="width: 200px; height: 25px;">총 클래스 금액</td>
                            <th>${ms.payTotal }</th>
                        </tr>
                        <tr>
                            <td>X&nbsp;</td>
                            <td>수강인원</td>
                            <th>${ms.studentCount }</th>
                        </tr>
                        <tr>
                            <th colspan="3">-------------------------------------------------</th>
                        </tr>
                        <tr>
                            <th></th>
                            <td>튜터님의 수익<span style="font-size:12px">(수수료 포함X)</span></td>
                            <th>${ms.salaryTotal }</th>
                        </tr>
                        
                    </table>
                    <br><br>
                </div>
        </c:forEach>
            </div>
        <br clear="both">
        <!-- 반복문 끝 -->

    <!-- 정산 시 받을 계좌입력 모달 -->
    <div class="modal fade" id="account">
        <div class="modal-dialog ">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title" style="margin-left: 150px;">정산 시 받을 계좌</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button> 
            </div>

            <form action="insertSalary.ts" method="post">
                <!-- Modal Body -->
                <div class="modal-body">
                    <table align="center" class="modalTable">
                    <input type="hidden" name="lsno" id="lsno" value="">
                        <tr>
                            <td style="width: 120x;">은행이름&nbsp;&nbsp;</td>
                            <td><input type="text" id="bankName" name="salaryList[0].bankName"></td>
                        </tr>
                        <tr>
                            <td>계좌번호&nbsp;&nbsp;</td>
                            <td><input type="text" id="accountNo" name="salaryList[0].accountNo" placeholder="(-) 포함 해서 적어주세요"></td>
                        </tr>
                        <tr>
                            <td id="memo"style="font-size:12px;" colspan="2"></td>
                        </tr>
                    </table> 
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="genric-btn primary-border btn-sm"  >저장</button>
                    <button type="button" class="genric-btn danger-border btn-sm" data-dismiss="modal">취소</button>
                </div>
            </form>
            </div>
        </div>
    </div>
    <br><br>
     <script>
        	function salarySave() {
        		var selected = new Array();
        		$("input[name=lno]:checked").each(function(){
        			selected.push(this.value);
        		});
        		
        		$("#lsno").val(selected);
        		console.log(selected);
        	}
        </script>
    
    <!-- 정산 쪽 셀렉박스
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
        -->
        <jsp:include page="../common/footer.jsp"/>
</body>
</html>