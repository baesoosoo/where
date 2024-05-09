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