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
	border: 2px solid green;
	display: flex;
	justify-content: center; /* 수평 가운데 정렬 */
	align-items: center; /* 수직 가운데 정렬 */
	margin: 0 auto; /* 가운데 정렬을 위해 추가된 마진 */
}

.left_half_main {
	width: 40%;
	height: 100%;
	border: 2px solid green;
}

.right_half_main {
	width: 60%;
	height: 100%;
}

.right-half {
	overflow: auto; /* 테이블이 너무 커서 스크롤이 필요한 경우를 위해 */
}

.table_box1 {
	width: 100%;
	height: 100px;
	border: 2px solid gold;
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
	border: 2px solid red;
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
							<h1>[${beer.model }]</h1>
						</div>
					</div>
					<div>
						<div>${beer.byear }</div>
					</div>
					<div>
						<div>${beer.color }</div>
					</div>
					<div>
						<div>${beer.price }</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>