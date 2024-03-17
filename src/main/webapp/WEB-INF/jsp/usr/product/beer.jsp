<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="술상품"></c:set>
<%@ include file="../common/head.jspf"%>


<!DOCTYPE html>
<html>
<section class="content mt-8 text-xl px-4">
	<div>흑맥주</div>
	<div class="container-fluid">
		<div class="row">
			<div class="container_side_bar col-md-4">
				<div class="filter-column side_bar">
					<h3 class="title">와인 선택</h3>
					<p class="subtitle">
						By type: <select id="myType" onchange="product_init()">
							<option value="All">All</option>
							<option value="red">Red</option>
							<option value="white">White</option>
							<option value="craft">Craft</option>
							<option value="dark">Dark</option>
							<option value="makgeolli">막걸리</option>
							<option value="cheongju">청주</option>
							<option value="soju">소주</option>
						</select>
					</p>
					<p class="subtitle">
						By Price: <span class="bold-text" id="currentPrice"></span>
					</p>
					<input id="myRange" type="range" min="3000" max="70000" value="10000" onchange="product_init()">
					<p class="subtitle">Select</p>
					<div class="checkboxes clearfix">
						<div>
							<label for="white-color"> <input type="checkbox" id="white-color" name="white" checked
								onchange="product_init()"> 화이트와인
							</label>
						</div>
						<div>
							<label for="craft-color"> <input type="checkbox" id="craft-color" name="craft" checked
								onchange="product_init()"> Craft
							</label>
						</div>
						<div>
							<label for="dark-color"> <input type="checkbox" id="dark-color" name="dark" checked
								onchange="product_init()"> 흑맥주
							</label>
						</div>
						<div>
							<label for="red-color"> <input type="checkbox" id="red-color" name="red" checked
								onchange="product_init()"> 레드와인
							</label>
						</div>
						<div>
							<label for="makgeolli-color"> <input type="checkbox" id="makgeolli-color" name="makgeolli" checked
								onchange="product_init()"> 막걸리
							</label>
						</div>
						<div>
							<label for="cheongju-color"> <input type="checkbox" id="cheongju-color" name="cheongju" checked
								onchange="product_init()"> 청주
							</label>
						</div>
						<div>
							<label for="soju-color"> <input type="checkbox" id="soju-color" name="soju" checked
								onchange="product_init()"> 소주
							</label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<body>
	<div id="product" class="product_list">
		<!-- 맥주 데이터를 동적으로 추가할 곳입니다. -->
	</div>
	<!-- 	<!-- 동적 페이징 -->
	-->
	<div class="pagination flex justify-center mt-3">
		<c:set var="paginationLen" value="3" />
		<c:set var="startPage" value="${page - paginationLen >= 1 ? page - paginationLen : 1}" />
		<c:set var="endPage" value="${page + paginationLen <= pagesCount ? page + paginationLen : pagesCount}" />

		<c:set var="baseUri" value="?boardId=${boardId}" />
		<c:set var="baseUri" value="${baseUri}&searchKeywordTypeCode=${searchKeywordTypeCode}" />
		<c:set var="baseUri" value="${baseUri}&searchKeyword=${searchKeyword}" />

		<c:if test="${startPage > 1}">
			<a class="btn btn-sm" href="${baseUri}&page=1">1</a>
			<button class="btn btn-sm btn-disabled">...</button>
		</c:if>

		<c:forEach begin="${startPage}" end="${endPage}" var="i">
			<a class="btn btn-sm ${param.page == i ? 'btn-active' : '' }" href="${baseUri}&page=${i}">${i}</a>
		</c:forEach>

		<c:if test="${endPage < pagesCount}">
			<button class="btn btn-sm btn-disabled">...</button>
			<a class="btn btn-sm" href="${baseUri}&page=${pagesCount}">${pagesCount}</a>
		</c:if>
	</div>
</body>
</html>


<script>
	// 맥주 데이터 배열
	var beers = [
	    // Java에서 가져온 데이터를 JavaScript 배열로 변환
	    <c:forEach var="beer" items="${beerList}" varStatus="loop">
	        { 
	            "type": "${beer.btype}", 
	            "model": "${beer.model}", 
	            "year": "${beer.byear}", 
	            "color": "${beer.color}", 
	            "price": "${beer.price}", 
	            "src": "${beer.src}" 
	        }<c:if test="${!loop.last}">,</c:if>
	    </c:forEach>
	];

// 	console.log(beers); // 맥주 배열 출력
	
	// 색상 설정 객체
	var settings = {
	    white: true,
	    craft: true,
	    dark: true,
	    red: true,
	    makgeolli: true,
	    cheongju: true,
	    soju: true
	};
	// 페이지 로드 시 초기화 함수 호출
	window.onload = function() {
	    product_init();
	};

	// 초기화 함수
	function product_init() {
	    checkColors(); // 색상 설정 확인
	    var priceInput = document.getElementById("myRange");
	    var price = priceInput.value; // 가격 설정
	    var type = document.getElementById("myType").value; // 타입 설정
	    document.getElementById("currentPrice").innerHTML = price; // 현재 가격 표시
	    document.getElementById("product").innerHTML = draw_products(price, type); // 제품 표시
	}

	// 이벤트 핸들러 등록을 통해 초기값 설정
	document.addEventListener("DOMContentLoaded", function() {
	    var priceInput = document.getElementById("myRange");
	    var price = priceInput.value; // 가격 설정
	    var type = document.getElementById("myType").value; // 타입 설정
	    document.getElementById("currentPrice").innerHTML = price; // 현재 가격 표시
	    document.getElementById("product").innerHTML = draw_products(price, type); // 제품 표시
	});

	// 가격과 타입에 따라 제품을 HTML로 표시하는 함수
	function draw_products(price, type) {
	    var content = "";
	    for (var i = 0; i < beers.length; i++) {
	        var beer = beers[i];
	        // 가격 비교 부분 수정
	        if ((parseInt(beer.price) <= parseInt(price) && beer.type == type || parseInt(beer.price) <= parseInt(price) && type == "All") && checkColor(beer.color)) {
	            content += draw_card(beer); // 해당하는 제품 카드를 생성하여 content에 추가
	        }
	    }
	    return content; // content 반환
	}

	// 제품 카드 생성 함수
	function draw_card(product) {
	    return '<div class="product-card"><h3 class="model">' + product.model + '</h3><img class="image" src="' + product.src + '" alt ="' + product.model + '"><p class="year">Year: <span class="bold-text">' + product.year + '</span></p><p class="color">Color: <span class="bold-text">' + product.color + '</span></p><p class="price">Price: <span class="bold-text">' + product.price + '</span></p></div>'; // 제품 카드 HTML 반환
	}

	// 색상 설정 확인 및 업데이트 함수
	function checkColors() {
	    // 각 색상 설정을 가져와서 settings 객체에 업데이트
	    settings.white = document.getElementById("white-color").checked;
	    settings.red = document.getElementById("red-color").checked;
	    settings.craft = document.getElementById("craft-color").checked;
	    settings.dark = document.getElementById("dark-color").checked;
	    settings.makgeolli = document.getElementById("makgeolli-color").checked;
	    settings.cheongju = document.getElementById("cheongju-color").checked;
	    settings.soju = document.getElementById("soju-color").checked;
	}

	// 제품 색상 확인 함수
	function checkColor(color) {
	    return settings[color]; // 해당 색상이 settings 객체에 있는지 확인하고 결과 반환
	}


</script>


<%@ include file="../common/foot.jspf"%>