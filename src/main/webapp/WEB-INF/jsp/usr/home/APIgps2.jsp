<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="GPS2CSV버전"></c:set>

<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>지도 이동시키기</title>

</head>
<title>닫기가 가능한 커스텀 오버레이</title>
<style>
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}
</style>
<body>

	<div class="map_API" id="map"></div>
	<!-- 지도 위에 표시될 마커 카테고리 -->
	<div class="map_btn">

		<button class="btn2 btn-outline" type="button" onclick="setCenter()">지도 중심좌표 이동시키기</button>
		<button class="btn2 btn-outline" type="button" onclick="panTo()">지도 중심좌표 대전으로 이동시키기</button>
		<button class="btn2 btn-outline" type="button" onclick="hideMarkers()">마커 감추기</button>
		<button class="btn2 btn-outline" type="button" onclick="showMarkers()">마커 보이기</button>
	</div>
	<div class="map_btn2">
		<input type="checkbox" id="chkUseDistrict" onclick="setOverlayMapTypeId()" />
		지적편집도 정보 보기
		<input type="checkbox" id="chkTerrain" onclick="setOverlayMapTypeId()" />
		지형정보 보기
		<input type="checkbox" id="chkTraffic" onclick="setOverlayMapTypeId()" />
		교통정보 보기
		<input type="checkbox" id="chkBicycle" onclick="setOverlayMapTypeId()" />
		자전거도로 정보 보기
	</div>

	<section class="gps_list">
		<div>영역설정</div>
		<div class="badge badge-outline">${articlesCount }개</div>
		<div class="flex-grow"></div>
		<form action="">
			<input type="hidden" name="boardId" value="${param.boardId }" />
			<select data-value="${param.searchKeywordTypeCode }" class="select select-bordered select-sm w-full max-w-xs"
				name="searchKeywordTypeCode">
				<option value=barName>barName</option>
				<option value="barAddr">barAddr</option>
				<option value="barName,barAddr">barName+barAddr</option>
			</select>
			<input value="${param.searchKeyword }" name="searchKeyword" type="text" placeholder="searchKeyword?"
				class="input-sm input input-bordered w-48 max-w-xs" />
			<button class="btn btn-ghost btn-sm" type="submit">검색</button>
		</form>
		<table class="table-box-1 table" border="1">
			<colgroup>
				<col style="width: 10%" />
				<col style="width: 20%" />
				<col style="width: 40%" />
				<col style="width: 10%" />
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
					<th>번호</th>
					<th>홈페이지</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="brewery2" items="${brewerys2 }">
					<tr class="hover">

						<td>${brewery2.id }</td>
						<td>${brewery2.barName }</td>
						<td>${brewery2.barAddr }</td>
						<td>${brewery2.barNumber }</td>
						<td>${brewery2.barWeb }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 	동적 페이징 -->
		<div class="pagination flex justify-center mt-3">
			<c:set var="paginationLen" value="3" />
			<c:set var="startPage" value="${page -  paginationLen  >= 1 ? page - paginationLen : 1}" />
			<c:set var="endPage" value="${page +  paginationLen  <= pagesCount ? page + paginationLen : pagesCount}" />

			<c:set var="baseUri" value="?boardId=${boardId }" />
			<c:set var="baseUri" value="${baseUri }&searchKeywordTypeCode=${searchKeywordTypeCode}" />
			<c:set var="baseUri" value="${baseUri }&searchKeyword=${searchKeyword}" />

			<c:if test="${startPage > 1 }">
				<a class="btn btn-sm" href="${baseUri }&page=1">1</a>
				<button class="btn btn-sm btn-disabled">...</button>
			</c:if>

			<c:forEach begin="${startPage }" end="${endPage }" var="i">
				<a class="btn btn-sm ${param.page == i ? 'btn-active' : '' }" href="${baseUri }&page=${i }">${i }</a>
			</c:forEach>

			<c:if test="${endPage < pagesCount }">
				<button class="btn btn-sm btn-disabled">...</button>
				<a class="btn btn-sm" href="${baseUri }&page=${pagesCount }">${pagesCount }</a>
			</c:if>

		</div>
	</section>
	<!-- 			<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQf6Btyz574Zht4rEUPxMNB0zg9x8r4mJ21dg&usqp=CAU" alt="" /> -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef50bc8210ed6065bd9b724884224a1c"></script>

	<script>
		var lat;
		var lon;
		// 		주차장
		async function getData2() {
			const API_KEY = 'ef50bc8210ed6065bd9b724884224a1c';
			const url = 'https://www.yuseong.go.kr/ys_parking/ysparkingList/ORP/getJSONData.do?_wadl&type=json';
			const response = await fetch(url);
			const data = await response.json();

			console.log("data", data);
			console.log(data.response);
			console.log(data.response.body);
			console.log(data.response.header);
			console.log(data.response.body.items);
			console.log(data.response.body.items[0]);
			console.log(data.response.body.items[0].item.addr);
			console.log(data.response.body.items[0].item.latitude);
			console.log(data.response.body.items[0].item.longitude);

			lat = data.response.body.items[0].item.latitude;
			lon = data.response.body.items[0].item.longitude;
		}
		getData2();

		// 		카카오지도
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.57319, 126.96658), // 지도의 중심좌표
			level : 7
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 지도 타입 정보를 가지고 있을 객체입니다
		// map.addOverlayMapTypeId 함수로 추가된 지도 타입은
		// 가장 나중에 추가된 지도 타입이 가장 앞에 표시됩니다
		// 이 예제에서는 지도 타입을 추가할 때 지적편집도, 지형정보, 교통정보, 자전거도로 정보 순으로 추가하므로
		// 자전거 도로 정보가 가장 앞에 표시됩니다
		var mapTypes = {
			terrain : kakao.maps.MapTypeId.TERRAIN,
			traffic : kakao.maps.MapTypeId.TRAFFIC,
			bicycle : kakao.maps.MapTypeId.BICYCLE,
			useDistrict : kakao.maps.MapTypeId.USE_DISTRICT
		};

		// 체크 박스를 선택하면 호출되는 함수입니다
		function setOverlayMapTypeId() {
			var chkTerrain = document.getElementById('chkTerrain'), chkTraffic = document
					.getElementById('chkTraffic'), chkBicycle = document
					.getElementById('chkBicycle'), chkUseDistrict = document
					.getElementById('chkUseDistrict');

			// 지도 타입을 제거합니다
			for ( var type in mapTypes) {
				map.removeOverlayMapTypeId(mapTypes[type]);
			}

			// 지적편집도정보 체크박스가 체크되어있으면 지도에 지적편집도정보 지도타입을 추가합니다
			if (chkUseDistrict.checked) {
				map.addOverlayMapTypeId(mapTypes.useDistrict);
			}

			// 지형정보 체크박스가 체크되어있으면 지도에 지형정보 지도타입을 추가합니다
			if (chkTerrain.checked) {
				map.addOverlayMapTypeId(mapTypes.terrain);
			}

			// 교통정보 체크박스가 체크되어있으면 지도에 교통정보 지도타입을 추가합니다
			if (chkTraffic.checked) {
				map.addOverlayMapTypeId(mapTypes.traffic);
			}

			// 자전거도로정보 체크박스가 체크되어있으면 지도에 자전거도로정보 지도타입을 추가합니다
			if (chkBicycle.checked) {
				map.addOverlayMapTypeId(mapTypes.bicycle);
			}

		}
		
		// 지도에 마커를 표시합니다 
		var marker = new kakao.maps.Marker({
		    map: map, 
		    position: new kakao.maps.LatLng(33.450701, 126.570667)
		});
		

		// 커스텀 오버레이에 표시할 컨텐츠 입니다
		// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
		// 별도의 이벤트 메소드를 제공하지 않습니다 
		var content = '<div class="wrap">'
				+ '    <div class="info">'
				+ '        <div class="title">'
				+ '            카카오 스페이스닷원'
				+ '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
				+ '        </div>'
				+ '        <div class="body">'
				+ '            <div class="img">' 
				+ '                <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">'
				+ '           </div>'
				+ '            <div class="desc">'
				+ '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>'
				+ '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>'
				+ '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>'
				+ '            </div>' + '        </div>' + '    </div>'
				+ '</div>';

		// 마커 위에 커스텀오버레이를 표시합니다
		// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		var overlay = new kakao.maps.CustomOverlay({
			content : content,
			map : map,
			position : marker.getPosition()
		});

		// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		kakao.maps.event.addListener(marker, 'click', function() {
			overlay.setMap(map);
		});

		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		function closeOverlay() {
			overlay.setMap(null);
		}
	</script>
</body>
</html>

<%@ include file="../common/foot.jspf"%>