<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할인 상품 관리</title>
</head>
<body>
	<jsp:include page="adminNav.jsp" />
	<div id="main-wrapper">
		<div class="main-content">
			<section id="classManagement">
				<div class="content-header">
					<h1>할인 상품 관리</h1>
				</div>
				<div class="welcome" align="center">
					<div align="right" style="width: 1030px;">
						<a class="btn btn-default" onclick="searchSubmit(1);">할인 미적용</a> 
						<a class="btn btn-default" onclick="searchSubmit(2);">할인 적용</a>

						<form action="" method="post" id="searchSubmit">
							<input type="hidden" name="currentPage" value="1">
						</form>
						
						<div id=searchArea>
							<form action="searchDiscount.ad">
								<input type="hidden" name="currentPage" value="1">
								<select name="condition" style="height: 30px;">
									<option value="content">클래스 제목</option>
									<option value="writer">튜터ID</option>
									<option value="percentage">클래스 할인율</option>
								</select> 
								<input type="text" name="keyword" value="${keyword}">
								<button class="btn btn-default" type="submit">검색</button>
							</form>
						</div>
					</div>
					<script>  
						function searchSubmit(num) {
							if (num == 1) {
								$("#searchSubmit").attr("action", "discountUnApplied.ad").submit();
							} else {
								$("#searchSubmit").attr("action", "discountApplied.ad").submit();
							}
						}
		
						
						$(function(){
							$("#searchArea option[value=${condition}]").attr("selected",true);
						})
						
					</script>
					<br>
					<table class="list-area">
						<tr>
							<th width="50px;" height="40px;">번호</th>
							<th width="400px;">클래스 이름</th>
							<th width="300px;">튜터ID</th>
							<th width="150px;">클래스 할인율</th>
							<th width="130px;">할인 설정</th>
						</tr>
						<c:forEach var="m" items="${m }" varStatus="status">
						<tr>
							<td>${status.count } </td>
							<td width="350px;">${m.lessonTitle }</td>
							<td>${m.memId }</td>
							<c:choose>
								<c:when test="${empty m.discount}">
									<td id="appliedDiscount${m.lessonNo }">할인 미적용</td>
								</c:when>
								<c:otherwise>
									<td id="appliedDiscount${m.lessonNo }">${m.discount }%</td>
								</c:otherwise>
							</c:choose>
							<td><button class="btn btn-default" onclick="discountSet(this)" data-no="${m.lessonNo }" data-toggle="modal" data-target="#settingSales">설정</button></td>
						</tr>
						</c:forEach>
					</table>
					<!--?Modal Start-->
					<div class="modal" id="settingSales">
						<div class="modal-dialog">
							<!-- Modal content-->			
							<div class="modal-content" align="center" style="width: 300px;">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">클래스 할인율</h4>
								</div>
								<input type="hidden" id="discountSet" name="lessonNo" value="">
								<div class="modal-body">
									<select name="discounts" id="discounts" style="width: 200px; height: 40px;">
										<option value="10">10%</option>
										<option value="20">20%</option>
										<option value="30">30%</option>
										<option value="50">50%</option>
									</select>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-default" data-dismiss="modal" onclick="apply();">적용</button>
								</div>
							</div>
						</div>
					</div>
					<!--Modal End-->
					<!--?적용 alert-->
					<script>
						function discountSet(e){
							$("#discountSet").val($(e).data("no"));
						}
						
						function apply() {
							var discount = $("#discounts").val();
							var lessonNo = $("#discountSet").val(); 
							var per = discount + "%";
							
							$.ajax({
								url:"discountSet.ad",
								data:{
									lessonNo:lessonNo,
									discount:discount
								},
								success:function(result){
									if(result == "success"){
										$("#appliedDiscount" + lessonNo).text(per);
										alert("할인 적용 완료");
									} else {
										alert("할인 적용 실패했습니다.")
									}
								},
								error:function(){
									console.log("discount ajax fail")
								}
							});
						}
						
					</script>
					<!--end of 적용-->
					<div class="container" align="center">
						<ul class="pagination">
						<c:choose>
							<c:when test="${pi.currentPage eq 1 }">
								<li class="disabled"><a href="">&lt;</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="saleManagement.ad?currentPage=${pi.currentPage -1 }">&lt;</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
							<c:choose>
								<c:when test="${pi.currentPage ne p }">
									<c:choose>
										<c:when test="${empty sc }">
											<li><a href="saleManagement.ad?currentPage=${p}">${p}</a></li>
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
								<li><a href="saleManagement.ad?currentPage=${pi.currentPage +1 }">&gt;</a></li>
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