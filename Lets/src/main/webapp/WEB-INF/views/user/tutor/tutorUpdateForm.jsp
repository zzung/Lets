<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="../common/navBar.jsp" />
    
    <form>
        <br><h3 class="mb-30">튜터 수정</h3>
        <hr class="top-hr">
        <div class="tutorEnrollForm" style="margin: 5%">
            
            <h5><b>튜터 소개</b></h5><br>
            <div style="background-color: #f9f9ff; width: 900px; font-size: 13px;">
                <ul class="unordered-list">
                    <font style="font-size:large;"><b>Tip</b></font>
                    <li>튜터님의 재능에 관한 경력 및 이력을 작성해 주세요. </li>
                    <li>튜터님이 재능을 얻기 위해 겪었던 경험에 대해 작성해 주세요.</li>
                </ul>
            </div><br>

            <div class="tutorEnroll">
                <textarea class="tutor-textarea" placeholder="튜터소개를 입력해주세요. (공백포함 1000자 이내)" required="" name=""
                    onfocus="this.placeholder = ''" onblur="this.placeholder = '튜터소개를 입력해주세요. (공백포함 1000자 이내)'"></textarea>
            </div><br>

            <h5><b>프로필 이미지 첨부</b></h5><input type="file" id="upfile" class="form-control-file border" style="width:500px;" name=""><br><br><br>
            <div align="center">
                <button type="submit" class="genric-btn primary radius">등록하기</button><br><br><br>
           </div>
          </div>
      </form>
    
    <jsp:include page="../common/footer.jsp" />
</body>
</html>