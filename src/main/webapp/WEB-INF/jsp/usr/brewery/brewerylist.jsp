<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="양조장찾기"></c:set>

<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html>
<meta charset="utf-8">
<style>

/* 하단 와이너리 리스트모음 */
/*PEN STYLES*/
/* 메인 브루어리 스타일 */
.main_brewery {
	box-sizing: border-box;
}

/* body 스타일 */
body2 {
	background: #f1f1f1;
	display: flex;
	flex-direction: column;
	font-size: 1rem;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

/* 변수 정의 */
:root {
	--color-white: #fff;
	--color-prime: #5ad67d;
	--color-grey: #e2e2e2;
	--color-grey-dark: #a2a2a2;
}

/* 블로그 카드 스타일 */
.blog-card {
	display: flex;
	flex-direction: column;
	margin: 1rem auto;
	margin-bottom: 1.6%;
	background: var(--color-white);
	line-height: 1.4;
	font-family: sans-serif;
	border-radius: 5px;
	overflow: hidden;
	z-index: 0;
	width: 100%;
	box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.4); /* 명암 추가 */
}

/* 블로그 카드 내 하이퍼링크 스타일 */
.blog-card a {
	color: inherit;
}

/* 블로그 카드 내 하이퍼링크 호버 효과 */
.blog-card a:hover {
	color: var(--color-prime);
}

/* 블로그 카드 내 사진 호버 효과 */
.blog-card:hover .photo {
	transform: scale(1.3) rotate(3deg);
}

/* 블로그 카드 메타 섹션 스타일 */
.blog-card .meta {
	position: relative;
	z-index: 0;
	height: 200px;
}

/* 블로그 카드 내 사진 스타일 */
.blog-card .photo {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background-size: cover;
	background-position: center;
	transition: transform .2s;
}

/* 블로그 카드 내 디테일 섹션 및 리스트 스타일 */
.blog-card .details, .blog-card .details ul {
	margin: auto;
	padding: 0;
	list-style: none;
}

/* 블로그 카드 내 디테일 섹션 스타일 */
.blog-card .details {
	position: absolute;
	top: 0;
	bottom: 0;
	left: -100%;
	margin: auto;
	transition: left .2s;
	background: rgba(0, 0, 0, .6);
	color: var(--color-white);
	padding: 10px;
	width: 100%;
	font-size: .9rem;
}

/* 블로그 카드 내 디테일 섹션 내 하이퍼링크 스타일 */
.blog-card .details a {
	text-decoration: dotted underline;
}

/* 블로그 카드 내 태그 스타일 */
.blog-card .details ul li {
	display: inline-block;
}

/* 블로그 카드 내 작성자 아이콘 스타일 */
.blog-card .details .author:before {
	font-family: FontAwesome;
	margin-right: 10px;
	content: "\f007";
}

/* 블로그 카드 내 날짜 아이콘 스타일 */
.blog-card .details .homepage:before {
	font-family: FontAwesome;
	margin-right: 10px;
	content: "\f133";
}

/* 블로그 카드 내 태그 아이콘 스타일 */
.blog-card .details .tags ul:before {
	font-family: FontAwesome;
	content: "\f02b";
	margin-right: 10px;
}

/* 블로그 카드 내 태그 아이템 스타일 */
.blog-card .details .tags li {
	margin-right: 2px;
}

/* 블로그 카드 내 첫 번째 태그 아이템 스타일 */
.blog-card .details .tags li:first-child {
	margin-left: -4px;
}

/* 블로그 카드 내 설명 스타일 */
.blog-card .description {
	padding: 1rem;
	background: var(--color-white);
	position: relative;
	z-index: 1;
}

/* 블로그 카드 내 제목 스타일 */
.blog-card .description h1, .blog-card .description h2 {
	font-family: Poppins, sans-serif;
}

.blog-card h1 {
	line-height: 1;
	margin: 0;
	font-size: 1.7rem;
}

.blog-card h2 {
	font-size: 1rem;
	font-weight: 300;
	text-transform: uppercase;
	color: var(--color-grey-dark);
	margin-top: 5px;
}

/* 블로그 카드 내 '더 읽기' 스타일 */
.blog-card .description .read-more {
	text-align: right;
}

/* 블로그 카드 내 '더 읽기' 하이퍼링크 스타일 */
.blog-card .description .read-more a {
	color: var(--color-prime);
	display: inline-block;
	position: relative;
}

/* 블로그 카드 내 '더 읽기' 하이퍼링크 호버 효과 */
.blog-card .description .read-more a:after {
	content: "\f061";
	font-family: FontAwesome;
	margin-left: -10px;
	opacity: 0;
	vertical-align: middle;
	transition: margin .3s, opacity .3s;
}

/* 블로그 카드 내 '더 읽기' 하이퍼링크 호버 후 아이콘 스타일 */
.blog-card .description .read-more a:hover:after {
	margin-left: 5px;
	opacity: 1;
}

/* 블로그 카드 내 단락 스타일 */
.blog-card p {
	position: relative;
	margin: 1rem 0 0;
}

/* 블로그 카드 내 첫 번째 단락 스타일 */
.blog-card p:first-of-type {
	margin-top: 1.25rem;
}

/* 블로그 카드 내 첫 번째 단락 전 구분선 스타일 */
.blog-card p:first-of-type:before {
	content: "";
	position: absolute;
	height: 5px;
	background: var(--color-prime);
	width: 35px;
	top: -0.75rem;
	border-radius: 3px;
}

/* 블로그 카드 호버 시 디테일 섹션 스타일 */
.blog-card:hover .details {
	left: 0%;
}

.search-container {
    width: 30%; /* 검색창이 차지할 영역의 너비 조정 */
    float: left; /* 검색창을 왼쪽에 배치 */
}

.blog-container {
    width: 65%; /* 블로그 카드가 차지할 영역의 너비 조정 */
    position: absolute; /* 절대 위치 지정 */
    right: 6%; /* 오른쪽 여백 설정 */
    top: 20%; /* 상단 여백 설정 */
/*     border: 2px solid green; */
}

/* 미디어 쿼리 */
@media ( min-width : 640px) {
	.blog-card {
		flex-direction: row;
		max-width: 700px;
	}
	.blog-card .meta {
		flex-basis: 40%;
		height: auto;
	}
	.blog-card .description {
		flex-basis: 60%;
		position: relative;
	}
	.blog-card .description:before {
		transform: skewX(-3deg);
		content: "";
		background: #fff;
		width: 30px;
		position: absolute;
		left: -10px;
		top: 0;
		bottom: 0;
		z-index: -1;
	}
	.blog-card.alt {
		flex-direction: row-reverse;
	}
	.blog-card.alt .description:before {
		left: inherit;
		right: -10px;
		transform: skew(3deg);
	}
	.blog-card.alt .details {
		padding-left: 25px;
	}
}
/* 검색창 스타일옵션 */
.search_box {
/* 	border: 2px solid green; */
	width: 1000px; /* 너비 조정 (예시로 300px로 설정) */
	position: absolute; /* 절대 위치로 설정 */
	top: 15%; /* 원하는 위치로 조정 */
	right: 0; /* 오른쪽 정렬 */
	margin-top: 10px; /* 필요에 따라 여백 조정 */
	margin-right: 50px; /* 필요에 따라 오른쪽 여백 조정 */
}

.search_box_1 {
	margin-right: 0; /* 추가 스타일 조정 */
}

.search_option {
	max-width: 10rem;
}

/* 지도옵션 */
.map_wrap {
	display: flex; /* Flexbox를 사용하여 자식 요소를 수평으로 배치 */
	justify-content: space-between; /* 자식 요소들을 좌우에 공간을 두고 배치 */
	align-items: flex-start; /* 수직 방향으로 맞춤 */
	position: relative;
	left: 2%;
	width: 35%;
	height: 800px;
/* 	border: 2px solid red; */
	top: 80px;
	text-align: center;
}

#map {
	display: inline-block; /* 추가 지도를 가운데로 옮기기 위해서 text-align과 같이 씀 */
	overflow: hidden;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.8); /* 그림자 추가 */
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

/* 하단페이지옵션 */
/* 하단 바 */
.bottom-bar {
	position: fixed;
	bottom: 0;
	left: 0;
	width: 100%;
	background-color: #fff; /* 배경색을 설정하고 필요에 따라 다른 스타일을 적용할 수 있습니다. */
	padding: 10px; /* 필요에 따라 여백을 조정하세요. */
	box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1); /* 하단에 그림자를 추가합니다. */
	z-index: 9999; /* 다른 요소 위로 올라가도록 z-index 설정 */
}

.page-bar {
	text-align: center; /* 페이지네이션 버튼을 중앙 정렬합니다. */
}

.page-bar a {
	text-decoration: none;
	margin: 0 5px; /* 페이지 버튼 사이의 간격을 설정합니다. */
}

.page-bar button {
	background-color: #f9f9f9;
	border: 1px solid #ccc;
	color: #333;
	padding: 8px 16px;
	margin: 4px;
	border-radius: 4px;
}

.page-bar button:hover {
	background-color: #e9e9e9;
}

.page-bar button.active {
	background-color: #007bff;
	color: #fff;
}
</style>

<div class="map_wrap">
	<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
</div>

<div class="container">
	<div class="search-container">
		<form class="search_box" action="">
			<div class="search_box_1">
				<input type="hidden" name="boardId" value="${param.boardId }" />

				<select data-value="${param.searchKeywordTypeCode }" class=" search_option select select-bordered select-sm w-full"
					name="searchKeywordTypeCode">
					<option value="barName,barAddr">전체</option>
					<option value=barName>양조장이름</option>
					<option value="barAddr">주소</option>
				</select>
				<input value="${param.searchKeyword }" name="searchKeyword" type="text" placeholder="searchKeyword?"
					class="input-sm input input-bordered w-48 max-w-xs" />
				<button class="btn btn-ghost btn-sm btn-outline" type="submit">검색</button>

			</div>
		</form>
	</div>
	<div class="blog-container">
		<div class="body3">
			<div class="main_brewery">
				<div class="body2">
					<c:forEach var="brewery2" items="${brewerys2 }" varStatus="loop">
						<c:if test="${loop.index % 2 == 0}">
							<div class="blog-card alt">
								<div class="meta">
									<div class="photo" style="background-image: url(${brewery2.barimage})"></div>
									<ul class="details">
										<li class="author">
											<a href="${brewery2.barWeb}">홈페이지 바로가기</a>
										</li>
										<li class="homepage">
											<a href="${brewery2.barWeb}"></a>
											July. 15, 2015
										</li>
										<li class="tags">
											<ul>
												<li>
													<a href="#">Learn</a>
												</li>
												<li>
													<a href="#">Code</a>
												</li>
												<li>
													<a href="#">JavaScript</a>
												</li>
											</ul>
										</li>
									</ul>
								</div>
								<div class="description">
									<td style="display: none;">${brewery2.id }</td>
									<h1>${brewery2.barName }</h1>
									<h2>연락처 ${brewery2.barNumber }</h2>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad eum dolorum architecto obcaecati enim dicta
										praesentium, quam nobis! Neque ad aliquam facilis numquam. Veritatis, sit.</p>
									<p class="read-more">
										<a href="../brewery/brewerydetail?id=${brewery2.id}">더 알아보기</a>
									</p>
								</div>
							</div>
						</c:if>
						<c:if test="${loop.index % 2 != 0}">
							<div class="blog-card">
								<div class="meta">
									<div class="photo" style="background-image: url(${brewery2.barimage})"></div>
									<ul class="details">
										<li class="author">
											<a href="${brewery2.barWeb}">홈페이지 바로가기</a>
										</li>
										<li class="homepage">
											<a href="${brewery2.barWeb}"></a>
											July. 15, 2015
										</li>
										<li class="tags">
											<ul>
												<li>
													<a href="#">Learn</a>
												</li>
												<li>
													<a href="#">Code</a>
												</li>
												<li>
													<a href="#">HTML</a>
												</li>
												<li>
													<a href="#">CSS</a>
												</li>
											</ul>
										</li>
									</ul>
								</div>
								<div class="description">
									<td style="display: none;">${brewery2.id }</td>
									<h1>${brewery2.barName }</h1>
									<h2>연락처 ${brewery2.barNumber }</h2>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad eum dolorum architecto obcaecati enim dicta
										praesentium, quam nobis! Neque ad aliquam facilis numquam. Veritatis, sit.</p>
									<p class="read-more">
										<a href="../brewery/brewerydetail?id=${brewery2.id}">더 알아보기</a>
									</p>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<!-- 동적 페이징  -->
			<div class="bottom-bar flex justify-center mt-3">
				<c:set var="paginationLen" value="3" />
				<c:set var="startPage" value="${page - paginationLen >= 1 ? page - paginationLen : 1}" />
				<c:set var="endPage" value="${page + paginationLen <= pagesCount ? page + paginationLen : pagesCount}" />

				<c:set var="baseUri" value="?boardId=${boardId}" />
				<c:set var="baseUri" value="${baseUri}&searchKeywordTypeCode=${searchKeywordTypeCode}" />
				<c:set var="baseUri" value="${baseUri}&searchKeyword=${searchKeyword}" />

				<c:if test="${startPage > 1}">
					<a class="page-btn btn btn-sm" href="${baseUri}&page=1">1</a>
					<button class="btn btn-sm btn-disabled">...</button>
				</c:if>
				<c:forEach begin="${startPage}" end="${endPage}" var="i">
					<a class="page-btn btn btn-sm ${param.page == i ? 'btn-active' : ''}" href="${baseUri}&page=${i}">${i}</a>
				</c:forEach>

				<c:if test="${endPage < pagesCount}">
					<button class="btn btn-sm btn-disabled">...</button>
					<a class="page-btn btn btn-sm" href="${baseUri}&page=${pagesCount}">${pagesCount}</a>
				</c:if>
			</div>
		</div>
	</div>
</div>
</div>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef50bc8210ed6065bd9b724884224a1c&libraries=services"></script>
<script>
	// Array to hold brewery data
	var breweries = [];
	<c:forEach var="brewery2" items="${brewerys2}">
	breweries.push({
		name : "${brewery2.barName}",
		addr : "${brewery2.barAddr}",
		web : "${brewery2.barWeb}",
		image : "${brewery2.barimage}",
		latitude : parseFloat("${brewery2.barlatitude}"),
		longitude : parseFloat("${brewery2.barlongitude}")
	});
	</c:forEach>

	// Initialize the map
	var mapContainer = document.getElementById('map');
	var mapOption = {
		center : new kakao.maps.LatLng(breweries[0].latitude,
				breweries[0].longitude),
		level : 5
	// 지도의 초기 확대 수준을 5로 설정하여 더 넓은 범위를 보여줍니다.
	};
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// Variable to keep track of the currently open overlay and its content
	var currentOverlay = null;

	// Function to create markers and overlays
	function createMarker(brewery) {
		var marker = new kakao.maps.Marker({
			map : map,
			position : new kakao.maps.LatLng(brewery.latitude,
					brewery.longitude)
		});

		var content = '<div class="wrap">'
				+ '    <div class="info">'
				+ '        <div class="title">'
				+ brewery.name
				+ '</div>'
				+ '        <div class="body">'
				+ '            <div class="img">'
				+ '                <img src="' + brewery.image + '" width="50" height="60">'
				+ '            </div>'
				+ '            <div class="desc">'
				+ '                <div class="ellipsis">'
				+ brewery.addr
				+ '</div>'
				+ '                <div class="jibun ellipsis">추가할 내용이 있음?</div>'
				+ '                <div><a href="' + brewery.web + '" target="_blank" class="link">홈페이지</a></div>'
				+ '            </div>' + '        </div>' + '    </div>'
				+ '</div>';

		var overlay = new kakao.maps.CustomOverlay({
			content : content,
			position : marker.getPosition(),
			map : map
		// Initially, display the overlay
		});

		// 현재 마커에 대한 오버레이를 추적하는 변수
		var currentOverlay = null;

		// 마커 클릭 이벤트 추가
		kakao.maps.event.addListener(marker, 'click', function() {
			// 현재 오버레이가 열려있으면 닫음
			if (currentOverlay) {
				currentOverlay.setMap(null);
				// 열려있는 오버레이와 클릭한 마커가 같으면 종료
				if (currentOverlay.getContent() == content) {
					currentOverlay = null;
					return;
				}
			}
			// 클릭된 마커의 오버레이를 엽니다.
			overlay.setMap(map);
			currentOverlay = overlay;
		});

		return {
			marker : marker,
			overlay : overlay
		};
	}

	// 모든 브루어리에 대해 마커와 오버레이를 생성합니다.
	var markersAndOverlays = [];
	for (var i = 0; i < breweries.length; i++) {
		markersAndOverlays.push(createMarker(breweries[i]));
	}
</script>

</body>
</html>

<%@ include file="../common/foot.jspf"%>