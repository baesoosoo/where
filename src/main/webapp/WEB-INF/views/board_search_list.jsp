<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./resources/css/list.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/nav.jsp" />
	<br>
	<br>
	<br>
	<p>방문 하시고 난 맛집의 후기를 남겨 주세요 ^^</p>
	<p>광진구의 맛있는 곳 추천도 좋아요. 많은 후기 부탁드립니다 ♥</p>

	<hr>
	<br>
	<Br>
	<div align="center" style="width =: 1500px" margin:auto;>
		<h1>
			<b>review</b>
		</h1>
		<input type="button" id="button2" onclick="location.href='write.go'"
			value="후기작성"> <br>
		<br>
		<br>
		<table class="table table-hover">
			<c:set var="list" value="${searchPageList }" />
			<c:set var="paging" value="${Paging }" />
			<tr>
				<td colspan="5" align="right">전체 검색 게시물 수 :
					${paging.totalRecord }개</td>
			</tr>
			<tr>
				<th>No.</th>
				<th>방문 장소</th>
				<th>주차가능여부</th>
				<th>리 뷰</th>
				<th>별 점</th>
			</tr>

			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.rno }</td>
						<td>${dto.rname }</td>
						<td>${dto.rparking }</td>
						<td>${dto.rreview }</td>
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
		<br><br>
		<input type="button" id="button1" value="처음으로" onclick="location.href='board_list.go'">
	</div>


</body>
</html>