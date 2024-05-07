<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	
<link rel="stylesheet" type="text/css" href="./resources/css/main.css">

</head>
<body>


	<div id="login">
		<a href="<%=request.getContextPath()%>/">home</a> <a
			href="<%=request.getContextPath()%>/login.go" target="_blank">login</a>
		<a href="<%=request.getContextPath()%>/join.go" target="_blank">join</a>
	</div>
	<jsp:include page="/WEB-INF/views/common/nav.jsp" />
	
	<ul class="nav nav-pills nav-fill">
		<li class="nav-item"><a class="nav-link" href="#">카테고리로 모아보기</a></li>
		<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/board_list.go">방문 평점</a></li>
</ul>

	<hr>
	<span>&nbsp;&nbsp;&nbsp;음식점&nbsp;&nbsp;<img src="./resources/img/분홍.png" width="20px" height="20px"></span>
	<span>&nbsp;&nbsp;&nbsp;카페&nbsp;&nbsp;<img src="./resources/img/파랑.png" width="20px" height="20px"></span>

	<br>
	<br>
	
	<div id="map" style="width:100%; height: 600px;" align="center"></div>

	<!-- 키 발급 -->
	<script
		src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=49072393f4640596f3db81e26e421fb8"></script>

	<script>
		var mapContainer = document.getElementById('map');// 지도를 표시할 div
		var mapOption = {
			center : new kakao.maps.LatLng(37.54083, 127.0806),// 지도의 중심좌표
			level : 5 // 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);// 지도를 생성합니다

		//음식점 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [ {
			title : '선명희피자',
			latlng : new kakao.maps.LatLng(37.53874, 127.0858)
		 
		}, {
			title : '신설설농탕',
			latlng : new kakao.maps.LatLng(37.54031, 127.0830)
		
		}, {
			title : '대한해물 구의역점',
			latlng : new kakao.maps.LatLng(37.53826, 127.0852)
		
		}, {
			title : '고공',
			latlng : new kakao.maps.LatLng(37.53795, 127.0856)
		
		}, {
			title : '백돈',
			latlng : new kakao.maps.LatLng(37.53852, 127.0787)
		
		}, {
			title : '난바다스시',
			latlng : new kakao.maps.LatLng(37.53738, 127.0832)
		
		}, {
			title : '건대우동집 구의점',
			latlng : new kakao.maps.LatLng(37.53796, 127.0836)
		
		},{
			title : '송림식당',
			latlng : new kakao.maps.LatLng(37.53683, 127.0766)
		
		},{
			title : '불난닭발',
			latlng : new kakao.maps.LatLng(37.53722, 127.0840)
		
		},{
			title : '로니로티',
			latlng : new kakao.maps.LatLng(37.54089, 127.0685)
		
		},{
			title : '용용선생 건대점',
			latlng : new kakao.maps.LatLng(37.54142, 127.0703)
		
		},{
			title : '모두랑 분식',
			latlng : new kakao.maps.LatLng(37.54208, 127.0855)
		
		},{
			title : '횃불',
			latlng : new kakao.maps.LatLng(37.53819, 127.0866)
		
		},{
			title : '한우짝갈비살',
			latlng : new kakao.maps.LatLng(37.53848, 127.0875)
		
		},{
			title : '매복식당',
			latlng : new kakao.maps.LatLng(37.53898, 127.0884)
		
		},{
			title : '서북면옥',
			latlng : new kakao.maps.LatLng(37.54536, 127.0853)
		
		} ];

		//음식점 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://cdn-icons-png.flaticon.com/128/10740/10740584.png";

		for (var i = 0; i < positions.length; i++) {
			
			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new kakao.maps.Size(30, 35);
			
			// 마커 이미지를 생성합니다    
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map,// 마커를 표시할 지도
				position : positions[i].latlng,// 마커를 표시할 위치 (latlng는 위도)
				title : positions[i].title,// 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage
			// 마커 이미지 
			});

			// 마커에 mouseover 이벤트 추가
			kakao.maps.event.addListener(marker, 'mouseover', function() {
				var title = this.getTitle();
				var overlayContent = '<div class="customoverlay">'
					+ '  <a href="#">' + '    <span class="title">' + title
					+ '</span>' + '  </a>' + '</div>';
			var overlayPosition = this.getPosition();

				var customOverlay = new kakao.maps.CustomOverlay({
					map : map,
					position : overlayPosition,
					content : overlayContent,
					yAnchor : 1 //오버레이의 아래쪽 기준 위치
				});
			});

			// 마커에 mouseout 이벤트 추가
			kakao.maps.event.addListener(marker, 'mouseout', function() {
				// 커스텀 오버레이 숨기기
				if (customOverlay) {
					customOverlay.getContentElement().style.display = 'none';
				}
			});

		}
		// 카페 마커를 표시할 위치와 title 객체 배열입니다 
		var cafePositions = [ {
			title : '투썸',
			latlng : new kakao.maps.LatLng(37.53804, 127.0838)
		
		}, {
			title : '비인나227 건대스타시티직영점',
			latlng : new kakao.maps.LatLng(37.53912, 127.0717)
		
		}, {
			title : '띵동와플',
			latlng : new kakao.maps.LatLng(37.54257, 127.0714)
		
		}, {
			title : '애드앤드',
			latlng : new kakao.maps.LatLng(37.54525, 127.0774)
		
		},{
			title : '오버더레인보우',
			latlng : new kakao.maps.LatLng(37.53924, 127.0831)
		
		},{
			title : '건대커피 랩',
			latlng : new kakao.maps.LatLng(37.54081, 127.0697)
		
		},{
			title : '카페러슬',
			latlng : new kakao.maps.LatLng(37.54861, 127.0855)
		
		} ];

		var cafeImageSrc = "https://cdn-icons-png.flaticon.com/128/10740/10740580.png";

		for (var i = 0; i < cafePositions.length; i++) {
			var cafeImageSize = new kakao.maps.Size(30, 35);
			var cafeMarkerImage = new kakao.maps.MarkerImage(cafeImageSrc,
					cafeImageSize);
			var cafeMarker = new kakao.maps.Marker({
				map : map,
				position : cafePositions[i].latlng,
				title : cafePositions[i].title,
				image : cafeMarkerImage
			});

			// 카페 마커에 mouseover 이벤트 추가
			kakao.maps.event.addListener(cafeMarker, 'mouseover', function() {
				var title = this.getTitle();
				var overlayContent = '<div class="customoverlay">'
					+ '  <a href="#">' + '    <span class="title">' + title
					+ '</span>' + '  </a>' + '</div>';
			var overlayPosition = this.getPosition();

				var customOverlay = new kakao.maps.CustomOverlay({
					map : map,
					position : overlayPosition,
					content : overlayContent,
					yAnchor : 1
				});
			});

			// 카페 마커에 mouseout 이벤트 추가
			kakao.maps.event.addListener(cafeMarker, 'mouseout', function() {
				// 커스텀 오버레이 숨기기
				if (customOverlay) {
					customOverlay.getContentElement().style.display = 'none';
				}
			});

		}
	</script>

	<br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>

