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
			            <tr>
			                <td height="40px;">2</td>
			                <td width="350px;">오늘은 내가 왕이다..어쩔래 길이가 얼마나 길지 모르니까 계속 적어 본다.</td>
			                <td>머니</td>
			                <td>recipechoice@gmail.com</td>
			                <td>승인 검토중</td>
			                <td><button class="btn btn-default">승인</button>&nbsp;&nbsp;&nbsp;<button class="btn btn-default">거부</button></td>
			            </tr>
			            <tr>
			                <td height="40px;">2</td>
			                <td>오늘은 내가 여왕이다</td>
			                <td>머니</td>
			                <td>recipee@gmail.com</td>
			                <td>승인</td>
			                <td><button class="btn btn-default">승인</button>&nbsp;&nbsp;&nbsp;<button class="btn btn-default">거부</button></td>
			            </tr>
			            <tr>
			                <td height="40px;">2</td>
			                <td>오늘은 내가 조커다</td>
			                <td>머니</td>
			                <td>recipe@gmail.com</td>
			                <td id="approvalStatus1">거부</td>
			                <td><button onclick="approvalClass();" id="approval" class="btn btn-default">승인</button>&nbsp;&nbsp;
			                    <button data-toggle="modal" data-target="#settingSales" id="reject" class="btn btn-default">거부</button></td>
			            </tr>
			        </table>
		        <!--?승인여부 선택-->
		        <!-- ?승인 거부 클릭시 보여질 모달 -->
					<div class="modal" id="settingSales">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content" align="center" style="width: 450px;">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">거부 사유</h4>
								</div>
								<div class="modal-body">
									<textarea id="reportReasonArea" cols="45" rows="4"
										style="resize: none;"></textarea>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-default" data-dismiss="modal" onclick="sendRejectReason();">적용</button>
								</div>
							</div>
						</div>
					</div>
					<!--Modal End-->
					<script>
						function approvalClass() {
							var accept = confirm("클래스 생성을 승인 하시겠습니까?");
							var str = " ";
							var num = 1;

							if (accept) {
								str = "승인";
								document.getElementById("approval").disabled = true;
							} else {
								return;
							}

							document.getElementById("approvalStatus" + num).innerHTML = "<p>"
									+ str + "</p>";

						}

					</script>
		        <!--end of 승인여부-->
		        <br><br>
		        <div class="container" align="center">              
		            <ul class="pagination">
		              <li><a href="#">&lt;</a></li>
		              <li><a href="#">1</a></li>
		              <li><a href="#">2</a></li>
		              <li><a href="#">3</a></li>
		              <li><a href="#">4</a></li>
		              <li><a href="#">5</a></li>
		              <li><a href="#">&gt;</a></li>
		            </ul>
		          </div>
		    </div>
	    </section>
    </div>
    </div>
</body>
</html>