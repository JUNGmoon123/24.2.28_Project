<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="GPS2CSV버전"></c:set>

<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html>
<meta charset="utf-8">
<title>지도</title>
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}
</style>

<body>
	<div class="map_wrap">
		<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;">
						키워드 :
						<input type="text" value="이태원 맛집" id="keyword" size="15">
						<button type="submit">검색하기</button>
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>
	<div class="map_API" id="map"></div>
	<!-- 지도 위에 표시될 마커 카테고리 -->
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

		<div id="placesList">
			<!-- DB테이블가져오기 -->
		</div>
		<!-- 	동적 페이징 -->
		<div class="pagination2 flex justify-center mt-3">
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
	<title>AJAX로 데이터 가져오기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>

    
    
    $(document).ready(function(){
        // 페이지 로드시 AJAX 요청을 보냅니다.
        $.ajax({
            url: '/usr/home/JsonAPIgps', // 데이터를 제공하는 서버의 엔드포인트 URL로 수정
            type: 'GET',
            dataType: 'json', // 받아올 데이터 타입을 JSON으로 지정
            success: function(data) {
                displayPlaces(data); // 성공적으로 데이터를 받았을 때 테이블을 생성하는 함수 호출
            },
            error: function(xhr, status, error) {
                console.error('AJAX 요청 실패:', status, error); // AJAX 요청 실패 시 에러 메시지 출력
            }
        });

        // 받은 데이터를 기반으로 테이블을 생성하는 함수
        function displayPlaces(data) {
            var placesList = $('#placesList');
            var table = $('<table border="1"></table>');

            // 테이블 헤더 추가
            var thead = $('<thead><tr><th>번호</th><th>이름</th><th>주소</th><th>번호</th><th>홈페이지</th><th>위도</th><th>경도</th></tr></thead>');
            table.append(thead);

            // 받은 데이터를 반복하여 테이블 행 추가
            var tbody = $('<tbody></tbody>');
            $.each(data, function(index, place) {
                var row = $('<tr></tr>');
                row.append($('<td>' + place.id + '</td>'));
                row.append($('<td>' + place.barName + '</td>'));
                row.append($('<td>' + place.barAddr + '</td>'));
                row.append($('<td>' + place.barNumber + '</td>'));
                row.append($('<td>' + place.barWeb + '</td>'));
                row.append($('<td>' + place.latitude + '</td>')); // 위도 열 추가
                row.append($('<td>' + place.longitude + '</td>')); // 경도 열 추가
                tbody.append(row);
            });
            table.append(tbody);

            placesList.append(table);
        }
    });
</script>
    
    
    
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
		var markers = [];
		// 		카카오지도
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.57319, 126.96658), // 지도의 중심좌표
			level : 3
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

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = document.getElementById('keyword').value;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document.getElementById('menu_wrap'), fragment = document.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title);
							});

					kakao.maps.event.addListener(marker, 'mouseout',
							function() {
								infowindow.close();
							});

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), 
			fragment = document.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title+ '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
	</script>
</body>
</html>

<%@ include file="../common/foot.jspf"%>