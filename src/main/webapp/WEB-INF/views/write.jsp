<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

h1 {
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
</head>
<body>
<div class="container">
        
        <jsp:include page="/WEB-INF/views/common/nav.jsp" />
        
        <h1>리뷰 남기기</h1>
        <hr width = "100%" color="gray">
        <br/>
        <form action="<%=request.getContextPath() %>/insert_ok.go" method="post">
            <div class="form-group">
                <label for="userid">방문장소</label><br>
                <input type="text"  name="rname">
                
            </div>
            
            <div class="form-group">
                <label for="userid">주차가능여부</label><br>
                <input type="text"  name="rparking">
                
            </div>
            
             <div class="form-group">
                <label for="userid">메뉴</label><br>
                <input type="text"  name="rmenu">
                
            </div>
            
             <div class="form-group">
                <label for="username">평점</label><br>
                <select name="rrating">
                	<option>::::: 별점을 선택해주세요 :::::</option>
                	<option>5</option>
                	<option>4</option>
                	<option>3</option>
                	<option>2</option>
                	<option>1</option>
                </select>
            </div>

            <div class="form-group">
                <label for="userid">내용</label><br>
                <textarea rows="25" cols="30" name="rreview" maxlength="100" 
                placeholder="여기에 내용을 입력하세요 (최대 100자)"></textarea>
                
            </div>

           <br><br>
                <input type="submit" value="write">
           
        </form>
    </div>

</body>
</html>