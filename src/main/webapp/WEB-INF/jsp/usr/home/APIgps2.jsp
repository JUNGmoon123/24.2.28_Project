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
	border: 2px solid green;
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
    .overlay_info {border-radius: 6px; margin-bottom: 12px; float:left;position: relative; border: 1px solid #ccc; border-bottom: 2px solid #ddd;background-color:#fff;}
    .overlay_info:nth-of-type(n) {border:0; box-shadow: 0px 1px 2px #888;}
    .overlay_info a {display: block; background: #d95050; background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center; text-decoration: none; color: #fff; padding:12px 36px 12px 14px; font-size: 14px; border-radius: 6px 6px 0 0}
    .overlay_info a strong {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_icon.png) no-repeat; padding-left: 27px;}
    .overlay_info .desc {padding:14px;position: relative; min-width: 190px; height: 56px}
    .overlay_info img {
    	vertical-align: top;
    }
    .overlay_info .address {font-size: 12px; color: #333; position: absolute; left: 80px; right: 14px; top: 24px; white-space: normal}
    .overlay_info:after {content:'';position: absolute; margin-left: -11px; left: 50%; bottom: -12px; width: 22px; height: 12px; background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png) no-repeat 0 bottom;}
</style>

<body>
	<div class="map_wrap">
		<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

	</div>
	<!-- 	<div class="map_API" id="map"></div> -->
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
	<!-- 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef50bc8210ed6065bd9b724884224a1c"></script> -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef50bc8210ed6065bd9b724884224a1c&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapCenter = new kakao.maps.LatLng(33.5563, 126.7958), // 지도의 중심좌표
	    mapOption = {
	        center: mapCenter, // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };

	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 커스텀 오버레이에 표시할 내용입니다
	// HTML 문자열 또는 Dom Element 입니다
	var content = '<div class="overlay_info">';
	content += '    <a href="https://place.map.kakao.com/17600274" target="_blank"><strong>월정리 해수욕장</strong></a>';
	content += '    <div class="desc">';
	content += '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">';
	content += '        <span class="address">제주특별자치도 제주시 구좌읍 월정리 33-3</span>';
	content += '    </div>';
	content += '</div>';

	// 커스텀 오버레이가 표시될 위치입니다 
	var position = new kakao.maps.LatLng(33.55635, 126.795841);

	// 커스텀 오버레이를 생성합니다
	var mapCustomOverlay = new kakao.maps.CustomOverlay({
	    position: position,
	    content: content,
	    xAnchor: 0.5, // 커스텀 오버레이의 x축 위치입니다. 1에 가까울수록 왼쪽에 위치합니다. 기본값은 0.5 입니다
	    yAnchor: 1.1 // 커스텀 오버레이의 y축 위치입니다. 1에 가까울수록 위쪽에 위치합니다. 기본값은 0.5 입니다
	});

	// 커스텀 오버레이를 지도에 표시합니다
	mapCustomOverlay.setMap(map);

	var rvContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
	var rv = new kakao.maps.Roadview(rvContainer); //로드뷰 객체
	var rvClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

	//지도의 중심좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
	rvClient.getNearestPanoId(mapCenter, 50, function(panoId) {
	    rv.setPanoId(panoId, mapCenter); //panoId와 중심좌표를 통해 로드뷰 실행
	});

	kakao.maps.event.addListener(rv, 'init', function() {

	    // 커스텀 오버레이를 생성합니다
	    var rvCustomOverlay = new kakao.maps.CustomOverlay({
	        position: position,
	        content: content,
	        xAnchor: 0.5, // 커스텀 오버레이의 x축 위치입니다. 1에 가까울수록 왼쪽에 위치합니다. 기본값은 0.5 입니다
	        yAnchor: 0.5 // 커스텀 오버레이의 y축 위치입니다. 1에 가까울수록 위쪽에 위치합니다. 기본값은 0.5 입니다
	    });

	    //rvCustomOverlay.setAltitude(2); //커스텀 오버레이의 고도값을 설정합니다.(로드뷰 화면 중앙이 0입니다)
	    rvCustomOverlay.setMap(rv);

	    var projection = rv.getProjection(); // viewpoint(화면좌표)값을 추출할 수 있는 projection 객체를 가져옵니다.
	    
	    // 커스텀오버레이의 position과 altitude값을 통해 viewpoint값(화면좌표)를 추출합니다.
	    var viewpoint = projection.viewpointFromCoords(rvCustomOverlay.getPosition(), rvCustomOverlay.getAltitude());

	    rv.setViewpoint(viewpoint); //커스텀 오버레이를 로드뷰의 가운데에 오도록 로드뷰의 시점을 변화 시킵니다.
	});
	</script>

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
					<tr class="hover" onclick="setKeywordFromRecordName('${brewery2.barName}'); searchPlaces(); displayInfowindow(marker, '${brewery2.barName}', '${brewery2.barWeb}')">
                <td>${brewery2.id }</td>
                <td><a href="#">${brewery2.barName }</a></td>
                <td>${brewery2.barAddr }</td>
                <td>${brewery2.barNumber }</td>
                <td> <a href="${brewery2.barWeb }">홈페이지 바로가기</a></td>
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