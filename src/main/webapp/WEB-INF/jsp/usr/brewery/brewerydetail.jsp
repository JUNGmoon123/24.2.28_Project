<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="와이너리 DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>

<title>와이너리detail</title>

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
	/*  지도오버레이 */
}

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
	background: #fff;
	border-top: 1px solid #ddd;
	border-left: 1px solid #ddd;
	border-right: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	font-size: 13px;
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
}
</style>

<div class="map_wrap">
	<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

</div>
<!-- 	<div class="map_API" id="map"></div> -->
<!-- 지도 위에 표시될 마커 카테고리 -->
<!-- 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef50bc8210ed6065bd9b724884224a1c"></script> -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef50bc8210ed6065bd9b724884224a1c&libraries=services"></script>
<script>
var barName = "${brewery2.barName}";
var barAddr = "${brewery2.barAddr}";
var barWeb = "${brewery2.barWeb}";
// var barsrc //이미지는 아직 미정
var barlatitude = parseFloat("${brewery2.barlatitude}");
var barlongitude = parseFloat("${brewery2.barlongitude}");
	// mapOption의 center를 숨겨진 요소에서 가져온 위도와 경도로 설정합니다.
	var mapOption = {
		center : new kakao.maps.LatLng(barlatitude, barlongitude), // 위도와 경도를 사용하여 지도의 중심좌표 설정
		level : 3
	};

	// 지도를 표시할 요소를 가져옵니다.
	var mapContainer = document.getElementById('map');
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 지도에 마커를 표시합니다 
	// 마커의 position을 숨겨진 요소에서 가져온 위도와 경도로 설정합니다.
	var marker = new kakao.maps.Marker({
   		map: map,
   	 	position: new kakao.maps.LatLng(barlatitude, barlongitude) // 위도와 경도를 사용하여 마커의 위치 설정
	});

	// 커스텀 오버레이에 표시할 컨텐츠 입니다
	var content = '<div class="wrap">'
			+ '    <div class="info">'
			+ '        <div class="title">'
			+ barName
			+ '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
			+ '        </div>'
			+ '        <div class="body">'
			+ '            <div class="img">'
			+ '                <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">'
			+ '           </div>'
			+ '            <div class="desc">'
			+ '                <div class="ellipsis">'+barAddr+'</div>'
			+ '                <div class="jibun ellipsis">추가할 내용이 있음?</div>'
			+ '                <div><a href="' + barWeb + '" target="_blank" class="link">홈페이지</a></div>'
			+ '            </div>' + '        </div>' + '    </div>' + '</div>';

	// 마커 위에 커스텀오버레이를 표시합니다
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



<section class="mt-8 text-xl px-4 beer-details">
	<div class="table_main">
		<div class="left_half_main"></div>
		<table class="table-box-1 table" border="1">
			<colgroup>
				<col style="width: 10%" />
				<col style="width: 20%" />
				<col style="width: 40%" />
				<col style="width: 10%" />
			</colgroup>
			<thead>
				<tr>
					<th>이름</th>
					<th>주소</th>
					<th>번호</th>
					<th>홈페이지</th>
				</tr>
			</thead>
			<tbody>
				<tr class="hover">
					<td class="barlatitude" style="display: none;">${brewery2.barlatitude}</td>
					
					<td class="barlongitude" style="display: none;">${brewery2.barlongitude}</td>
					<td>
						<a href="#">${brewery2.barName }</a>
					</td>
					<td >${brewery2.barAddr }</td>
					<td>${brewery2.barNumber }</td>
					<td>
						<a href="${brewery2.barWeb}">홈페이지 바로가기</a>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="beer_text_infobox">
			<div class="text_info">
				<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis modi officia incidunt facere
					similique repellendus molestias suscipit reprehenderit esse! Consectetur deleniti perferendis dolor impedit nihil
					distinctio sapiente minima cumque numquam!</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>