<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 관리</title>
</head>
<body>
	<jsp:include page="adminNav.jsp" />
	<div id="main-wrapper">
		<div class="main-content">
		<section id="classManagement">
			<div class="content-header">
				<h1>클래스 관리</h1>
			</div>
				<div class="welcome" align="center">
			        <div align="right" style="width:1030px;">
			            <form action="">
			                <tr>
			                    <td>
			                        <select name="condition" style="height:28px;">
			                            <option value="writer">클래스 제목</option>
			                            <option value="title">튜터ID</option>
			                            <option value="content">승인상태</option>
			                          </select>
			                    </td>
			                    <td>
			                        <input type="text" name="keyword">
			                    </td>
			                    <td><button type="submit" class="btn btn-default">검색</button></td>
			                </tr>
			            </form>
			        </div >
			        <br>
			        <table class="list-area">
			            <tr>
			                <th width="50px;" height="40px;">번호</th>
			                <th width="350px;">클래스제목</th>
			                <th width="150px;">클래스 카데고리</th>
			                <th width="200px;">튜터ID</th>
			                <th width="100px;">승인상태</th>
			                <th width="180px;">승인여부</th>
			            </tr>
			            <c:forEach var="l" items="${list }" varStatus="status">
			            <tr>
			                <td height="40px;">${status.count }</td>
			                <td width="350px;">${l.lessonTitle }</td>
			                <td>${l.lessonCategory }</td>
			                <td>${l.memId }</td>
			                <td id="approvalArea${l.lessonNo }">${l.lessonStatus }</td>
			                <td><button class="btn btn-default" id="approval" data-no="${l.lessonNo}" onclick="approvalClass(this);">승인</button>&nbsp;&nbsp;&nbsp;
			                <button class="btn btn-default" id="reject" data-toggle="modal" data-target="#rejectApproval" data-no="${l.lessonNo}" onclick="rejectApprovalSet(this)">거부</button></td>
			            </tr>
			            </c:forEach>
			        </table>
		        <!--?승인여부 선택-->
		        <!-- ?승인 거부 클릭시 보여질 모달 -->
					<div class="modal" id="rejectApproval">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content" align="center" style="width: 450px;">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">거부 사유</h4>
								</div>
								<div class="modal-body">
									<textarea id="reportReasonArea" cols="45" rows="4" style="resize: none;"></textarea>
								</div>
								<div class="modal-footer">
									<input type="hidden" id="rejectNo" value="">
									<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-default" data-dismiss="modal" onclick="sendRejectReason();">적용</button>
								</div>
							</div>
						</div>
					</div>
					<!--Modal End-->
					<script>
						function approvalClass(e) {
							var accept = confirm("클래스 생성을 승인 하시겠습니까?");
							var lessonNo = $(e).data("no");
							var str = "승인";
							
							console.log(lessonNo); 
							
							if (accept) {
								$.ajax({
									url:"lessonApproval.ad",
									data:{
										lessonNo:lessonNo
									},
									success:function(result){
										if(result == "success" ){
											alert("승인 완료되었습니다.")
											$("#approvalArea"+lessonNo).text(str);
											document.getElementById("approval").disabled = true;
										} else {
											aler("승인 실패했습니다.")
										}
									},
									error:function(){
										console.log("approval class ajax fail");
									}
								});

							} else {
								
								return;
							}

						}
						
						function rejectApprovalSet(e){
							 $("#rejectNo").val($(e).data("no"));
						}
						
						function sendRejectReason(){
							var accept = confirm("거절 사유 작성 완료 하시겠습니까?")
							var lessonNo = $("#rejectNo").val();
							var rReason = $("#reportReasonArea").text();
							var str = '거절'; 
							
							
							if(accept){
								$.ajax({
									url:"rejectApproval.ad",
									data:{
										lessonNo:lessonNo,
										rReason: rReason
									},
									success:function(result){
										if(result == "success"){
											alert("거절 완료되었습니다.");
											$("#approvalArea"+lessonNo).text(str);
											$("#reject").attr("disabled",true);
											$("#approval").attr("disabled",false); 
										}
									},
									error:function(){
										console.log("reject approval ajax fail");
									}
								});
								
							}else{
								return;
							}
						}
					</script>
		        <!--end of 승인여부-->
		        <br><br>
		        <div class="container" align="center">
						<ul class="pagination">
						<c:choose>
							<c:when test="${pi.currentPage eq 1 }">
								<li class="disabled"><a href="">&lt;</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="classManagement.ad?currentPage=${pi.currentPage -1 }">&lt;</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
							<c:choose>
								<c:when test="${pi.currentPage ne p }">
									<c:choose>
										<c:when test="${empty sc }">
											<li><a href="classManagement.ad?currentPage=${p}">${p}</a></li>
										</c:when>
										<c:otherwise>
											<c:url var="searchUrl" value="searchDiscount.ad">
												<c:param name="currentPage" value="${p }"/>
												<c:param name="condition" value="${condition }" />
												<c:param name="keyword" value="${keyword }" />
											</c:url>
											
											<li><a href="${searchUrl }">${p }</a></li>
										</c:otherwise>
									</c:choose>	
								</c:when>
							</c:choose>
						</c:forEach>
						
						<c:choose>
							<c:when test="${pi.currentPage eq pi.maxPage }">
								<li class="disabled"><a href="#">&gt;</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="classManagement.ad?currentPage=${pi.currentPage +1 }">&gt;</a></li>
							</c:otherwise>
						</c:choose>	
						</ul>
					</div>
		    </div>
	    </section>
    </div>
    </div>
</body>
</html>