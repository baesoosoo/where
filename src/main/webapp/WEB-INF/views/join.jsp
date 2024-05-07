<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

.form-control {
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

input[type="text"], input[type="password"]{
	
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

</style>
</head>
<body>
<div class="container">
        
        <jsp:include page="/WEB-INF/views/common/nav.jsp" />
        <h1>Join</h1>
        <hr width = "100%" color="gray">
        <br/>
        <form action="#" method="post">
            <div class="form-group">
                <label for="userid">아이디</label><br>
                <input type="text" id="userid" name="userid">
                
            </div>

            <div class="form-group">
                <label for="password">비밀번호</label><br>
                <input type="password" id="password" name="password" placeholder="(6~12 이내의 영문/숫자 사용가능)">
            </div>

            <div class="form-group">
                <label for="confirmpwd">비밀번호 확인</label><br>
                <input type="password" placeholder="비밀번호 확인" id="confirmpwd" name="confirmpwd">
            </div>

            <div class="form-group">
                <label for="username">닉네임</label><br>
                <input type="text" id="username">
            </div>

            <div class="form-group">
                <label for="userphone">어떤 카테고리에 더 관심이 있나요?</label>
                <select>
                    <option>선택</option>
                    <option>카페</option>
                    <option>맛집</option>
                    <option>둘다</option>
                </select>
            </div>

            <div class="form-group">
                <input type="submit" value="Join">
            </div>
        </form>
    </div>

</body>
</html>