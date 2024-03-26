<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="BeerDetail"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.img {
	max-width: 200px; /* 이미지의 최대 너비 설정 */
	max-height: 200px; /* 이미지의 최대 높이 설정 */
}

.table_main {
	width: 75%;
	height: 600px;
	/* 	border: 2px solid green; */
	display: flex;
	position: relative;
	justify-content: center; /* 수평 가운데 정렬 */
	align-items: center; /* 수직 가운데 정렬 */
	margin: 0 auto; /* 가운데 정렬을 위해 추가된 마진 */
	margin-left: 18%;
}

.left_half_main {
	width: 40%;
	height: 100%;
	border: 1px solid black;
}

.right_half_main {
	width: 60%;
	height: 100%;
}

.right-half {
	overflow: auto; /* 테이블이 너무 커서 스크롤이 필요한 경우를 위해 */
}

.table_box1 {
	width: 70%;
	height: 100px;
	margin-top: 20px;
	margin-left: 30px;
	/* 	border: 2px solid gold; */
}

.table_box1_text {
	width: 60%;
	height: 70px;
	padding-top: 15px;
	margin: auto;
	margin-top: 10px;
	text-align: center;
	font-size: 40px;
	font-family: 'Ownglyph_meetme-Rg';
	border-top: 1px solid black;
	/* 	border: 2px solid red; */
}

.beer_text_infobox {
	position: absolute;
	top: 650px;
	width: 80%; /* 이전에 설정된 너비보다 작게 조정 */
	
	margin-top : 5px;
	left: 0.5%;
	background-color: #f2f2f2; /* 배경색 */
	padding: 10px; /* 안쪽 여백 */
	border-radius: 5px; /* 테두리 모서리를 둥글게 */
	border: 1px solid #ccc; /* 테두리 스타일 */
	float: left; /* 왼쪽으로 이동 */
}

.text_info p {
	font-size: 16px; /* 글꼴 크기 */
	line-height: 1.5; /* 줄 간격 */
	color: #333; /* 글꼴 색상 */
}
</style>


<title>상품 detail</title>

<section class="mt-8 text-xl px-4 beer-details">
	<div class="table_main">
		<div class="left_half_main">
			<img src="${beer.src } " alt="" style="width: 100%; height: 100%; object-fit: cover;">
		</div>
		<div class="right_half_main">
			<div class="table">
				<!-- 이 곳에 테이블 내용 추가 -->
				<div>
					<div class="table_box1">
						<div class="table_box1_text">
							<h1>[${beer.model}]</h1>
						</div>
					</div>
					<div class="table_box1">
						<div class="table_box1_text">
							<div>${beer.byear }</div>
						</div>
					</div>
					<div class="table_box1">
						<div class="table_box1_text">
							<div>종류 : ${beer.color }</div>
						</div>
					</div>
					<div class="table_box1">
						<div class="table_box1_text">
							<div>${beer.price }원</div>
						</div>
					</div>
					<div class="table_box1">
						<div class="table_box1_text">
							<button>
								<a href="https://www.lotteon.com/search/render/render.ecn?render=nqapi&platform=m&collection_id=301&u9=navigate&u8=LM40004031&login=Y#">구매링크바로가기</a>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
			<div class="beer_text_infobox">
				<div class="text_info">
					<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis modi officia incidunt facere similique
						repellendus molestias suscipit reprehenderit esse! Consectetur deleniti perferendis dolor impedit nihil distinctio
						sapiente minima cumque numquam!</div>
				</div>
			</div>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>