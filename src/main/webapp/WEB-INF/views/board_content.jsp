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

span{
	
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

input[type="button"] {
	width: 30%;
	padding: 10px;
	border-radius: 20px;
	border: none;
	background-color: rgb(240, 240, 18);
	color: #fff;
	cursor: pointer;

}

input[type="button"]:hover {
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
  <c:set var="dto" value="${content }"/>
        
        <h1>리뷰 남기기</h1>
        <hr width = "100%" color="gray">
        <br/>
        <form action="<%=request.getContextPath() %>/insert_ok.go" method="post">
            <div class="form-group">
                <label for="userid">방문장소</label><br><br>
               <span> ${dto.rname }</span>
               
                
            </div>
            
            <div class="form-group">
                <label for="userid">주차가능여부</label><br><br>
                <span> ${dto.rparking }</span>
                
            </div>
            
             <div class="form-group">
                <label for="userid">메뉴</label><br><br>
                <span> ${dto.rmenu }</span>
                
            </div>
            
             <div class="form-group">
                <label for="username">평점</label><br><br>
                <span> ${dto.rrating } 점</span>
            </div>

            <div class="form-group">
                <label for="userid">내용</label><br>
                <textarea rows="25" cols="35">${dto.rreview } </textarea>
                
            </div>

           <br><br>
      <div align="center">     
     <input type="button" value="글 수정하기" onclick="location.href='modify.go?num=${dto.rno}'">&nbsp;&nbsp;
	<input type="button" value="글 삭제하기" onclick="if(confirm('정말로 삭제하겠습니까?')){location.href='delete.go?num=${dto.rno }'
		}else{return;}">
           
 		</div>
       </form>
     </div>
</body>
</html>