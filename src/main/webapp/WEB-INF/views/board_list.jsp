<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style type="text/css">
  p{
        color: gray;
    }

    #button2{
        float: right;
        width: 150px;
        height: 40px;
        font-size: 15px;
        font-weight: bold;
        border: 0;
        outline: 1.5px rgb(5, 5, 5) solid;
        border-radius: 5px;
        padding-left: 10px;
        background-color: rgb(237,102,87);
        color: #fff;
        
    }
    #login{
	
	float:right;
	margin:20px;
	word-spacing: 20px; 
	margin-right: 96px;

}

    #login a{
	
	text-decoration: none;
	color:  #333;
	
	
}

header h1{
	text-align: center;
	text-shadow: 2px 2px 2px gray;
	margin-left: 350px;
	
}

header h6{
	text-align:center;
	margin: 0 auto;
	text-shadow: 2px 2px 2px yellow;
	
}
p{
    text-align:center;
}
#foot{
	padding: 5px 0;
	background-color: #8bdc01;
	color: #fff;
	text-align: center;
	height: 140px;

}

#foot p{
	display: inline-block;
	font-size: 12px;
	font-family: monospace;
}
#container{
	background-color: rgb(240, 248, 223);
}

  th {
        font-size: 20px; 
        
    }


</style>
</head>
<body>
      
       <jsp:include page="/WEB-INF/views/common/nav.jsp" />
      
    <br><br><br>
    <p>방문 하시고 난 맛집의 후기를 남겨 주세요 ^^</p>
    <p>광진구의 맛있는 곳 추천도 좋아요. 많은 후기 부탁드립니다 ♥</p>
    
    <hr>

    <br><br>
    <div align="center" style="width:1500px; margin: auto;">
    <h1><b>review</b></h1>
    <input type="button" id="button2" onclick="location.href='write.go'" value="후기작성">
        <br><br><br>
        <table class="table table-hover">
    	<c:set var="list" value="${RList }"/>
    	<c:set var="paging" value="${Pageing }"/>
    	<tr>
    		<td colspan="5" align="right">
    		 전체 게시물 수 : ${paging.totalRecord }개
    		</td>
    	</tr>
           <tr>
               <th>No.</th>
               <th>방문 장소</th>
               <th>주차가능여부</th>
               <th>리 뷰</th>
               <th>조회수</th>    
               <th>별 점</th>    
        </tr>
        
    	
		<c:if test="${!empty list }">
			<c:forEach items="${list }" var="dto"> 
			<tr>
				<td>${dto.rno }</td>
				<td>${dto.rname }</td>
				<td>${dto.rparking }</td>
				<td>
				<a href="<%=request.getContextPath()%>/content.go?num=${dto.rno}">
				${dto.rreview }</a></td>
				<td>${dto.view_count }</td>
				<td>${dto.rrating }</td>
			</tr>
			</c:forEach>
		</c:if>
		
		<c:if test="${empty list }">
		<tr>
			<td colspan="5">
			<h2>작성된 리뷰가 없습니다....</h2>
			
			</td>
		</tr>
		
		</c:if>
        
    </table>
    	<c:if test="${paging.page > paging.block }">
			<a href="<%=request.getContextPath() %>/board_list.go?page=1">[처음으로]</a>
			<a href="<%=request.getContextPath() %>/board_list.go?page=${paging.startBlock-1}">◀</a>
		
		</c:if>
		
		<c:forEach begin="${paging.startBlock }" end="${paging.endBlock }" var="i">
			
			<c:if test="${i == paging.page }">
				<b>	<a href="<%=request.getContextPath() %>/board_list.go?page=${i}">${i }</a></b>
			</c:if>
			
			<c:if test="${i != paging.page }">
				<a href="<%=request.getContextPath() %>/board_list.go?page=${i}">${i }</a>
			</c:if>
		</c:forEach>
			
			<c:if test="${paging.endBlock < paging.allPage }">
			<a href="<%=request.getContextPath() %>/board_list.go?page=${paging.endBlock +1}">▶</a>
			<a href="<%=request.getContextPath() %>/board_list.go?page=${paging.allPage}">[마지막]</a>
		</c:if>
    <br><br>
    <form method="post" action="<%=request.getContextPath() %>/board_search.go">
			<select name="field">
				<option value="place">&nbsp;방문장소</option>
				<option value="parking">&nbsp;주차가능</option>
				<option value="rating">&nbsp;별점</option>
			</select>	
			
			<input name="keyword">&nbsp;&nbsp;&nbsp;
			<input type="submit" value="검색">

		</form>
    
    
    
    </div><br><br>
  
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>