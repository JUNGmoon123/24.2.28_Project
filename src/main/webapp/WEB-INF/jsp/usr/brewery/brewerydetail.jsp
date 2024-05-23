<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value=""></c:set>
<%@ include file="../common/head.jspf"%>

<title>와이너리detail</title>

<style>
.map_wrap {
	display: flex; /* Flexbox를 사용하여 자식 요소를 수평으로 배치 */
	align-items: flex-start; /* 수직 방향으로 맞춤 */
	position: relative;
	left: 30%;
	width: 50%;
	height: 400px;
/* 	border: 2px solid red; */
	top: 20px;
	text-align: center;
	margin-bottom: 80px; /* 하단에 여백 추가 */

}

#map {
	display: inline-block; /* 추가 지도를 가운데로 옮기기 위해서 text-align과 같이 씀 */
	overflow: hidden;
}

.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
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
	height: auto;
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

/* 와이너리 detail정보제공 css */
.table_main {
	width: 85%;
	height: 550px;
	margin-left: 10%; 
	overflow: hidden; /* 자식 요소의 범위를 벗어나지 못하도록 설정 */

}

.bre_img_box {
    width: 35%; /* 왼쪽 이미지 상자의 너비를 조정합니다 */
    float: left; /* 왼쪽으로 플로팅합니다 */
    margin-right: 20px; /* 오른쪽 여백을 설정합니다 */
    border: 2px solid green; /* 테두리를 설정합니다 */
    height: 500px; /* 높이를 설정합니다 */
    box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5); /* 그림자 효과를 추가합니다 */
}
.bre_img_box>img{
	width: auto;
	height: 100%;
}

.bre_text_box{

	width: 60%; /* 오른쪽 텍스트 영역의 너비를 조정합니다 */
    float: right; /* 오른쪽으로 플로팅합니다 */
    margin-top: 50px;
    margin-right: 20px; /* 오른쪽 여백을 설정합니다 */

    font-family: FontAwesome;
}

.bre_text_infobox {
    width: 60%; /* 오른쪽 텍스트 영역의 너비를 조정합니다 */
    float: right; /* 오른쪽으로 플로팅합니다 */
     margin-top: 50px;
    margin-right: 20px; /* 오른쪽 여백을 설정합니다 */

}

.bre_smallimg_box {
 margin-top: 40px;
    width: 60%; /* 오른쪽 텍스트 영역과 같은 너비를 가집니다 */
    float: right; /* 오른쪽으로 플로팅합니다 */
    clear: right; /* 오른쪽 여백을 설정합니다 */
}

.bre_smallimg_box .small_image_group {
    display: flex; /* 이미지들을 가로로 나란히 정렬하기 위해 플렉스 박스로 설정합니다 */
}

.bre_smallimg_box .small_image_group img {
    width: 160px; /* 이미지의 너비를 조정합니다 */
    height: 140px; /* 이미지의 높이를 자동으로 조정합니다 */
    margin-right: 10px; /* 이미지 사이의 간격을 설정합니다 */
     box-shadow: 5px 5px 7px rgba(0, 0, 0, 0.5); /* 그림자 효과를 추가합니다 */
}

</style>

<section class="mt-8 text-xl px-4">
	<div class="table_main">
		<div class="left_half_main"></div>
		<div>
			<div class="bre_img_box">
				<img src="${brewery2.barimage}" alt="" />
			</div>
			<div class="bre_text_box hover">
				<div class="barlatitude" style="display: none;">${brewery2.barlatitude}</div>

				<div class="barlongitude" style="display: none;">${brewery2.barlongitude}</div>
				<div>
					<a href="#">${brewery2.barName }</a>
				</div>
				<div>${brewery2.barAddr }</div>
				<div>${brewery2.barNumber }</div>
				<div>
					<a href="${brewery2.barWeb}">홈페이지 바로가기</a>
				</div>
			</div>
			<div class="bre_text_infobox">
				<div class="text_info">
					<p>배상면주가는 우리 술이 속해있는 아시아권에서 '술'과 '술 문화'를 아우르는 최고의 기업이 되고자 합니다. </p>
				</div>
			</div>
			<div class="bre_smallimg_box">
				<div class="small_image_group">
					<img src="https://tong.visitkorea.or.kr/cms/resource/89/2005989_image2_1.jpg" alt="" />
					<img src="https://soollove.com/web/product/big/202312/35d00b4d8bfc7d1d0297c8dfba8f9e1b.jpg" alt="" />
					<img src="https://img.29cm.co.kr/next-product/2022/08/18/0b73d5490bdd4778b8b20289d445d958_20220818170613.jpg?width=700" alt="" />
					<img src="https://tong.visitkorea.or.kr/cms/resource/01/1983101_image2_1.jpg" alt="" />
				</div>
			</div>
		</div>
	</div>
</section>


<div class="map_wrap">
	<div id="map" style="width: 80%; height: 100%; position: relative; overflow: hidden;"></div>
</div>
<!-- 	<div class="map_API" id="map"></div> -->
<!-- 지도 위에 표시될 마커 카테고리 -->
<!-- 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef50bc8210ed6065bd9b724884224a1c"></script> -->
<script type="text/javascript"src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef50bc8210ed6065bd9b724884224a1c&libraries=services"></script>
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
		map : map,
		position : new kakao.maps.LatLng(barlatitude, barlongitude)
	// 위도와 경도를 사용하여 마커의 위치 설정
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
			+ '                <img src="https://img6.yna.co.kr/etc/inner/KR/2020/12/04/AKR20201204086200805_13_i_P4.jpg" width="73" height="70">'
			+ '           </div>'
			+ '            <div class="desc">'
			+ '                <div class="ellipsis">'
			+ barAddr
			+ '</div>'
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





<%@ include file="../common/foot.jspf"%>