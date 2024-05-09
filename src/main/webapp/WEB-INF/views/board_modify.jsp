<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./resources/css/board.css">
</head>
<body>

	<div class="container">
        
        <jsp:include page="/WEB-INF/views/common/nav.jsp" />
        <c:set var="dto" value="${modify }"/>
        <h2>리뷰 수정하기</h2>
        <hr width = "100%" color="gray">
        <br/>
        <form action="<%=request.getContextPath() %>/modify_ok.go" method="post">
        <input type="hidden" value="${dto.rno }" name="rno">
            <div class="form-group">
                <label for="userid">방문장소</label><br>
                <input type="text"  name="rname" value="${dto.rname }">
                
            </div>
            
            <div class="form-group">
                <label for="userid">주차가능여부</label><br>
                <input type="text"  name="rparking" value="${dto.rparking }">
                
            </div>
            
             <div class="form-group">
                <label for="userid">메뉴</label><br>
                <input type="text"  name="rmenu" value="${dto.rmenu }">
                
            </div>
            
            <div class="form-group">
                <label for="userid">별점</label><br>
                <input type="text"  name="rrating" value="${dto.rrating }">
                
            </div>
            

            <div class="form-group">
                <label for="userid">내용</label><br>
                <textarea rows="25" cols="30" name="rreview" maxlength="100" 
                placeholder="${dto.rreview }" ></textarea>
                
            </div>

           <br>
                <input type="submit" value="글 수정하기">
           
        </form>
    </div>

</body>
</html>