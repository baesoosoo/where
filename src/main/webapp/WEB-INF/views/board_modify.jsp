<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
@charset "UTF-8";

body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background:rgb(237,102,87);
}

.container {
	width: 500px;
	height: 50%;
	margin: 50px auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
}

.form-group {
	margin-bottom: 20px;
}

	width: 80px;
}

.form-group button {
	position: right;
	width: 90px;
	height: 40px;
	top: 0;
	bottom: 0;
	right: 5px;
	margin: auto;
	border-radius: 3px;
}

label {
	font-weight: bold;
}

input[type="text"]{
	
	width: 80%;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
}

textarea {
    width: 80%;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

input[type="submit"] {
	width: 100%;
	padding: 10px;
	border-radius: 20px;
	border: none;
	background-color: rgb(240, 240, 18);
	color: #fff;
	cursor: pointer;
}

input[type="submit"]:hover {
	background: rgb(253, 253, 5);
	transition: 0.5s;
}

 select {
     height: 50px; 
     width: 250px;
        }

</style>
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