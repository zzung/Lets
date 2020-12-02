<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 결제 관리</title>
</head>
<body>
	<jsp:include page="adminNav.jsp" />
	<div id="main-wrapper">
		<div class="main-content">
			<section id="memberManagement">
				<div class="content-header">
					<h1>클래스 결제 관리</h1>
				</div>
				<div class="welcome" align="center">
					<div align="right" style="width: 1030px;">					
					<form action="searchPaymentMgmt.ad">
							<input type="hidden" name="currentPage" value="1"> 
							<select name="condition" style="height: 30px;">
								<option value="title">클래스 제목</option>
								<option value="writer">회원ID</option>
								<option value="payment">결제현황</option>
							</select>
	                       	<input type="text" name="keyword" value="${keyword}">
	                   		<button type="submit" class="btn btn-default">검색</button>
					</form> 
			        </div>
			        <script>
			        	$(".searchArea option[value=${condition}]").attr("selected",true); 
			        </script>
					<br>
					<table class="list-area">
						<tr>
							<th width="50px;" height="40px;">번호</th>
							<th width="200px;">회원ID</th>
							<th width="350px;">결제된 클래스명</th>
							<th width="200px;">결제현황</th>
							<th width="100px;">결제 정보 조회</th>
							<th width="130px;">결제 취소</th>
						</tr>
						<c:forEach var="mp" items="${mp }" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td>${mp.memId }</td>
							<td width="350px;">${mp.lessonTitle }</td>
							<td class="payCondition${mp.memPayNo }">${mp.status }</td>
							<td><button type="button" data-toggle="modal" data-target="#paymentInquiry" data-name="${mp.memName }" data-type="${mp.type }" 
							data-repayment="${mp.repayment}" data-date="${mp.paymentDate}"class="btn btn-default" onclick="paymentInquiry(this);">조회</button></td>
							<td><button onclick="cancelPay(this);" data-no="${mp.memPayNo }" class="btn btn-default">결제취소</button></td>
						</tr>
						</c:forEach>
					</table>
					<!--?Modal Start-->
					<div class="modal" id="paymentInquiry">
			            <div class="modal-dialog">
			              <!-- Modal content-->
			              <div class="modal-content" align="left" style="width:300px;">
			                <div class="modal-header">
			                  <button type="button" class="close" data-dismiss="modal">&times;</button>
			                  <h4 class="modal-title">결제 정보</h4>
			                </div>
			                <div class="modal-body">
			                  <p class="modalTitle">결제자 정보</p>
			                  <p id="modalName"></p>
			                  <br>
			                  <p class="modalTitle">결제 방법</p>
			                  <p id="modalType"></p>
			                  <br>
			                  <p class="modalTitle">계좌번호</p>
			                  <p id="modalRePayment"></p>
			                  <br>
			                  <p class="modalTitle">결제일</p>
			                  <p id="modalDate"></p>
			                </div>
			                <div class="modal-footer">
			                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			                </div>
			              </div>
			              
			            </div>
			          </div>
					<!--Modal End-->

					<script>
						$(function(){
							paymentInquiry(); 
						})
					
						function paymentInquiry(e){
							var name = $(e).data("name");
							var type = $(e).data("type");
							var rePayment = $(e).data("payment");
							var date = $(e).data("date");
							
							 $("#modalName").text(name);
							 $("#modalType").text(type);
							 $("#modalRePayment").text(rePayment);
							 $("#modalDate").text(date);
						}
						
						//?결제취소 확인 alert ** 컬럼별로 번호 매겨서야 한다(payCondition 변경하기 위해)
						function cancelPay(e) {
							var accept = confirm("결제 취소하시겠습니까??");
							var memPayNo = $(e).data("no");
							var str = "결제 취소";

							if (accept) {
								$.ajax({
									url:"cancelPay.ad",
									data:{
										memPayNo:memPayNo
									},
									success:function(result){
										if(result == "success"){
											alert("결제 취소 완료")
											$(".payCondition"+memPayNo).text(str);
											
										} else {
											alert("결제 취소 실패했습니다.")
										}
									},
									error:function(){
										console.log("cancel payment ajax fail")
									}
								})
							} else {
								
								return;
							}

						}
					</script>
					<!--end of 결제취소-->
					<div class="container" align="center">
						<ul class="pagination">
						<c:choose>
							<c:when test="${pi.currentPage eq 1 }">
								<li class="disabled"><a href="">&lt;</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="classPayment.ad?currentPage=${pi.currentPage -1 }">&lt;</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
							<c:choose>
								<c:when test="${pi.currentPage ne p }">
									<c:choose>
										<c:when test="${empty sc }">
											<li><a href="classPayment.ad?currentPage=${p}">${p}</a></li>
										</c:when>
										<c:otherwise>
											<c:url var="searchUrl" value="searchPaymentMgmt.ad">
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
								<li><a href="classPayment.ad?currentPage=${pi.currentPage +1 }">&gt;</a></li>
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