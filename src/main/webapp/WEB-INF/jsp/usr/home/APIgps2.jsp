<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="양조장찾기"></c:set>

<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html>
<meta charset="utf-8">
<title>지도</title>
<style>

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
/* 	border: 2px solid green; */
}

/* 양조장리스트설정 */
.gps_list {
	position: relative; /* 원래의 위치 방식으로 변경 */
	width: 100%;
	height: 600px; /* 높이를 자동으로 조정 */
	margin-top: 100px;
	border: 1px solid green;
	overflow: auto; /* 내용이 넘칠 경우 스크롤 표시 */
}

.table-box-1 tbody tr {
	display: table-row; /* 테이블 행으로 표시 */
	margin-bottom: 10px;
}

.table-box-1 tbody td {
	display: table-cell; /* 테이블 셀로 표시 */
}

.overlay_info {
	border-radius: 6px;
	margin-bottom: 12px;
	float: left;
	position: relative;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	background-color: #fff;
}

.overlay_info:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.overlay_info a {
	display: block;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
	text-decoration: none;
	color: #fff;
	padding: 12px 36px 12px 14px;
	font-size: 14px;
	border-radius: 6px 6px 0 0
}

.overlay_info a strong {
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_icon.png)
		no-repeat;
	padding-left: 27px;
}

.overlay_info .desc {
	padding: 14px;
	position: relative;
	min-width: 250px;
	height: 100px
}

.overlay_info img {
	vertical-align: top;
}

.overlay_info .address {
	font-size: 12px;
	color: #333;
	position: absolute;
	left: 80px;
	right: 14px;
	top: 24px;
	white-space: normal
}

.overlay_info:after {
	content: '';
	position: absolute;
	margin-left: -11px;
	left: 50%;
	bottom: -12px;
	width: 22px;
	height: 12px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png)
		no-repeat 0 bottom;
}

/*  지도오버레이 */
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 202px;
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

/* 클릭한 위치 위도경도로 알아내기css */
.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

</style>

<body>
	<div class="map_wrap">
		<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;">
		
		</div>
		
	</div>
	<!-- 	<div class="map_API" id="map"></div> -->
	<!-- 지도 위에 표시될 마커 카테고리 -->
	<!-- 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef50bc8210ed6065bd9b724884224a1c"></script> -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef50bc8210ed6065bd9b724884224a1c&libraries=services"></script>
	<script>
	  var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
	    var mapCenter = new kakao.maps.LatLng(37.566535, 126.9779692); // 지도의 중심좌표
	    var mapOption = {
	        center: mapCenter, // 지도의 중심좌표
	        level: 7 // 지도의 확대 레벨
	    };

	    var map = new kakao.maps.Map(mapContainer, mapOption);

	    // 주소를 좌표로 변환하는 geocoder 객체 생성
	    var geocoder = new kakao.maps.services.Geocoder();

	    // JavaScript 배열을 생성하여 데이터 저장
	    var breweryData = [];

	    <c:forEach var="brewery2" items="${brewerys2}">
	        var brewery = {
	            id: '${brewery2.id}',
	            barlatitude: '${brewery2.barlatitude}',
	            barlongitude: '${brewery2.barlongitude}',
	            barName: '${brewery2.barName}',
	            barAddr: '${brewery2.barAddr}',
	            barNumber: '${brewery2.barNumber}',
	            barWeb: '${brewery2.barWeb}'
	        };

	        // 배열에 객체 추가
	        breweryData.push(brewery);

	        // 주소로 좌표를 검색하여 마커와 인포윈도우를 표시합니다
	        searchAddress(brewery.barAddr, brewery);
	    </c:forEach>

	    // 주소로 좌표를 검색하는 함수 정의
	    function searchAddress(address, brewery) {
	        // 주소로 좌표를 검색합니다
	        geocoder.addressSearch(address, function(result, status) {
	            // 정상적으로 검색이 완료됐으면 
	            if (status === kakao.maps.services.Status.OK) {
	                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	                // 결과값으로 받은 위치를 마커로 표시합니다
	                var marker = new kakao.maps.Marker({
	                    map: map,
	                    position: coords
	                });

	                // 인포윈도우로 장소에 대한 설명을 표시합니다
	                var infowindow = new kakao.maps.InfoWindow({
	                    content: '<div style="width: 140px; padding: 6px 0; text-align: center; background: rgba(220, 220, 220, 0.2);">' +
	                        '<div>' + brewery.barName + '</div>' +
	                        '<a href="https://map.kakao.com/link/map/' + brewery.barName + ',' + brewery.barlatitude + ',' + brewery.barlongitude + '" target="_blank">지도 보기</a><br>' +
	                        '<a href="' + brewery.barWeb + '" target="_blank">홈페이지 </a>' +
	                        '</div>'
	                });
	                infowindow.open(map, marker);
	                
	                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	                map.setCenter(coords);
	            } else {
	                alert('주소 검색 실패했습니다.');
	            }
	        });
	    }
	</script>

	<section class="gps_list">
		<div>영역설정</div>
		<div class="badge badge-outline">${articlesCount }개</div>
		<div class="flex-grow"></div>
		<form action="">
			<input type="hidden" name="boardId" value="${param.boardId }" />
			<select data-value="${param.searchKeywordTypeCode }" class="select select-bordered select-sm w-full max-w-xs"
				name="searchKeywordTypeCode">
				<option value="barName,barAddr">전체</option>
				<option value=barName>양조장이름</option>
				<option value="barAddr">주소</option>
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
						<td class="barlatitude" style="display: none;">${brewery2.barlatitude}</td>
						<td class="barlongitude" style="display: none;">${brewery2.barlongitude}</td>
						<td>
							<a href="#">${brewery2.barName }</a>
						</td>
						<td>${brewery2.barAddr }</td>
						<td>${brewery2.barNumber }</td>
						<td>
							<a href="${brewery2.barWeb}">홈페이지 바로가기</a>
						</td>
					</tr>

				</c:forEach>

			</tbody>
		</table>
		<!-- 동적 페이징  -->
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


</body>
</html>

<%@ include file="../common/foot.jspf"%>