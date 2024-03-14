<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="술상품"></c:set>
<%@ include file="../common/head.jspf"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Beer Products</title>
<!-- 여기에 CSS 스타일을 추가하세요 -->
</head>
<section class="content mt-8 text-xl px-4">
	<div>흑맥주</div>
	<div class="container-fluid">
		<div class="row">
			<div class="container_side_bar col-md-4">
				<div class="filter-column side_bar">
					<h3 class="title">와인 선택</h3>
					<p class="subtitle">
						By type:
						<select id="myType" onchange="product_init()">
							<option>All</option>
							<option>red</option>
							<option>white</option>
						</select>
					</p>
					<p class="subtitle">
						By Price:
						<span class="bold-text" id="currentPrice"></span>
					</p>
					<input id="myRange" type="range" min="16000" max="100000" value="30000" onchange="product_init()">
					<p class="subtitle">Select</p>
					<div class="checkboxes clearfix">
						<div>
							<label for="white-color">
								<input type="checkbox" id="white-color" name="white" checked onchange="product_init()">
								White
							</label>
						</div>
						<div>
							<label for="craft-color">
								<input type="checkbox" id="craft-color" name="craft" checked onchange="product_init()">
								Craft
							</label>
						</div>
						<div>
							<label for="dark-color">
								<input type="checkbox" id="dark-color" name="dark" checked onchange="product_init()">
								Dark
							</label>
						</div>
						<div>
							<label for="red-color">
								<input type="checkbox" id="red-color" name="red" checked onchange="product_init()">
								Red
							</label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--         // 맥주 데이터 -->
<!-- //         var beers = [ -->
<!-- //             // Java에서 가져온 데이터를 기반으로 JavaScript 배열로 변환합니다. -->
<%-- //             <c:forEach var="beer" items="${beerList}" varStatus="loop"> --%>
<!-- //                 {  -->
<%-- //                     "type": "${beer.btype}",  --%>
<%-- //                     "model": "${beer.model}",  --%>
<%-- //                     "year": ${beer.byear},  --%>
<%-- //                     "color": "${beer.color}",  --%>
<%-- //                     "price": "${beer.price}",  --%>
<%-- //                     "src": "${beer.src}"  --%>
<%-- //                 }<c:if test="${!loop.last}">,</c:if> --%>
<%-- //             </c:forEach> --%>
<!-- //         ]; -->
<body>
	<div id="product" class="product_list">
		<!-- 맥주 데이터를 동적으로 추가할 곳입니다. -->
	</div>
	<script>
    // 맥주 데이터 배열을 초기화합니다.
    var beers = [
        // Java에서 가져온 데이터를 기반으로 JavaScript 배열로 변환합니다.
        <c:forEach var="beer" items="${beerList}" varStatus="loop">
            { 
                "type": "${beer.btype}", 
                "model": "${beer.model}", 
                "year": ${beer.byear}, 
                "color": "${beer.color}", 
                "price": "${beer.price}", 
                "src": "${beer.src}" 
            }<c:if test="${!loop.last}">,</c:if>
        </c:forEach>
    ];

    // 배열 확인을 위해 콘솔에 출력합니다.
    console.log(beers); // beers 배열 출력

    //settings 객체를 초기화합니다. 색상 설정을 포함합니다.
    var settings = {
        white: true,
        craft: true,
        dark: true,
        red: true
    };

    // 제품 표시 초기화 함수
    window.onload = function() {
        product_init();
    };

    // 초기화 함수
    function product_init() {
        // 색상 설정을 확인합니다.
        checkColors(); 
        // 가격 설정을 가져옵니다.
        var price = document.getElementById("myRange").value; 
        // 타입 설정을 가져옵니다.
        var type = document.getElementById("myType").value; 
        // 현재 가격을 HTML에 표시합니다.
        document.getElementById("currentPrice").innerHTML = price; 
        // 제품을 HTML로 표시합니다.
        document.getElementById("product").innerHTML = draw_products(price, type); 
    }

    // 가격과 타입을 기준으로 제품을 HTML로 표시하는 함수
    function draw_products(price, type) {
        var content = ""; // 표시할 HTML 내용을 초기화합니다.
        // 맥주 데이터 배열을 순회합니다.
        for (var i = 0; i < beers.length; i++) {
            var beer = beers[i]; // 현재 맥주 정보를 가져옵니다.
            // 설정된 가격, 타입, 색상에 따라 표시할 제품인지 확인합니다.
            if ((beer.price <= price && beer.type == type || beer.price <= price && type == "All") && checkColor(beer.color)) {
                content += draw_card(beer); // 해당하는 제품 카드를 생성하여 content에 추가합니다.
            }
        }
        return content; // 생성된 HTML을 반환합니다.
    }

    // 제품 카드를 생성하는 함수
    // 이쪽에서 제품정보를 HTML쪽으로 보내서 만들어짐,  id=product 인 영역에 return값으로 제품을 표기한다.
    function draw_card(product) {
        return '<div class="product-card"><h3 class="model">' + product.model + '</h3><img class="image" src="' + product.src + '" alt ="' + product.model + '"><p class="year">Year: <span class="bold-text">' + product.year + '</span></p><p class="color">Color: <span class="bold-text">' + product.color + '</span></p><p class="price">Price: <span class="bold-text">' + product.price + '</span></p></div>'; // 제품 카드 HTML 반환
    }

    // 색상 설정을 확인하여 settings 객체 업데이트하는 함수
    function checkColors() {
        // 각 색상 설정을 가져와서 settings 객체에 업데이트합니다.
        settings.white = document.getElementById("white-color").checked;
        settings.red = document.getElementById("red-color").checked;
        settings.craft = document.getElementById("craft-color").checked;
        settings.dark = document.getElementById("dark-color").checked;
    }

    // 제품의 색상이 설정된 색상 중 하나인지 확인하는 함수
    function checkColor(color) {
        return settings[color]; // 해당 색상이 settings 객체에 있는지 확인하고 그 결과를 반환합니다.
    }
    </script>
</body>
</html>
<!-- <body> -->
<!--     <h1>Beer List</h1> -->
<!--     <ul id="beerList"></ul> -->

<!--     <script> -->
<!--         // Spring으로부터 전달받은 데이터 -->
<%-- //         var beerList = ${beerList}; --%>

<!--         // JavaScript를 사용하여 데이터를 HTML에 표시 -->
<!-- //         var ul = document.getElementById('beerList'); -->
<!-- //         beerList.forEach(function(beer) { -->
<!-- //             var li = document.createElement('li'); -->
<!-- //             li.textContent = beer.name + ' - ' + beer.type; -->
<!-- //             ul.appendChild(li); -->
<!-- //         }); -->
<!--     </script> -->
<!-- </body> -->

<style>
/* 여기에 CSS 스타일을 추가하세요 */
</style>

<!-- <body> -->
<!-- 	<section class="content mt-8 text-xl px-4"> -->
<!-- 		<div>흑맥주</div> -->
<!-- 		<div class="container-fluid"> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="container_side_bar col-md-4"> -->
<!-- 					<div class="filter-column side_bar"> -->
<!-- 						<h3 class="title">와인 선택</h3> -->
<!-- 						<p class="subtitle"> -->
<!-- 							By type: -->
<!-- 							<select id="myType" onchange="product_init()"> -->
<!-- 								<option>All</option> -->
<!-- 								<option>red</option> -->
<!-- 								<option>white</option> -->
<!-- 							</select> -->
<!-- 						</p> -->
<!-- 						<p class="subtitle"> -->
<!-- 							By Price: -->
<!-- 							<span class="bold-text" id="currentPrice"></span> -->
<!-- 						</p> -->
<!-- 						<input id="myRange" type="range" min="16000" max="100000" value="30000" onchange="product_init()"> -->
<!-- 						<p class="subtitle">Select</p> -->
<!-- 						<div class="checkboxes clearfix"> -->
<!-- 							<div> -->
<!-- 								<label for="white-color"> -->
<!-- 									<input type="checkbox" id="white-color" name="white" checked onchange="product_init()"> -->
<!-- 									White -->
<!-- 								</label> -->
<!-- 							</div> -->
<!-- 							<div> -->
<!-- 								<label for="craft-color"> -->
<!-- 									<input type="checkbox" id="craft-color" name="craft" checked onchange="product_init()"> -->
<!-- 									Craft -->
<!-- 								</label> -->
<!-- 							</div> -->
<!-- 							<div> -->
<!-- 								<label for="dark-color"> -->
<!-- 									<input type="checkbox" id="dark-color" name="dark" checked onchange="product_init()"> -->
<!-- 									Dark -->
<!-- 								</label> -->
<!-- 							</div> -->
<!-- 							<div> -->
<!-- 								<label for="red-color"> -->
<!-- 									<input type="checkbox" id="red-color" name="red" checked onchange="product_init()"> -->
<!-- 									Red -->
<!-- 								</label> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="product-main col-md-8"> -->
<%-- 					<div class="badge badge-outline">${articlesCount }개</div> --%>
<!-- 					<div class="product-board" id="product"></div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->

<script>
    // 맥주 데이터
//     var beers = [
//         // Java에서 가져온 데이터를 기반으로 JavaScript 배열로 변환합니다.
//         <c:forEach var="beer" items="${BeerList}" varStatus="loop">
//             { 
//                 "type": "${beer.btype}", 
//                 "model": "${beer.model}", 
//                 "year": ${beer.byear}, 
//                 "color": "${beer.color}", 
//                 "price": "${beer.price}", 
//                 "src": "${beer.src}" 
//             }<c:if test="${!loop.last}">,</c:if>
//         </c:forEach>
//     ];
	
// 	//settings 객체: 색상 설정을 포함하는 객체
//     var settings = {
//     	white: true,
//     	craft: true,
//     	dark: true,
//     	red: true
//     };
    
//     // 제품 표시 초기화 함수
//     window.onload = function() {
//         product_init();
//     };

//     // 초기화 함수
//     function product_init() {
//         checkColors(); // 색상 설정 확인
//         var price = document.getElementById("myRange").value; // 가격 설정
//         var type = document.getElementById("myType").value; // 타입 설정
//         document.getElementById("currentPrice").innerHTML = price; // 현재 가격 표시
//         document.getElementById("product").innerHTML = draw_products(price, type); // 제품 표시
//     }

//     // 가격과 타입을 기준으로 제품을 표시하는 함수
// function draw_products(price, type) {
//     var content = "";
//     console.log(beers); // beers 배열 출력
//     for (var i = 0; i < beers.length; i++) {
//         if ((beers[i].price <= price && beers[i].type == type || beers[i].price <= price && type == "All") && checkColor(beers[i].color)) {
//             content += draw_card(beers[i]); // 해당하는 제품 카드를 생성하여 content에 추가
//         }
//     }
//     return content; // content 반환
// };

//     // 제품 카드를 생성하는 함수
//     function draw_card(product) {
//         return '<div class="product-card"><h3 class="model">' + product.btype + '</h3><img class="image" src="' + product.src + '" alt ="' + product.model + '"><p class="year">Year: <span class="bold-text">' + product.byear + '</span></p><p class="color">Color: <span class="bold-text">' + product.color + '</span></p><p class="price">Price: <span class="bold-text">' + product.price + '</span></p></div>'; // 제품 카드 HTML 반환
//     }

//     // 색상 설정을 확인하여 settings 객체 업데이트하는 함수
//     function checkColors() {
//         settings.white = document.getElementById("white-color").checked;
//         settings.red = document.getElementById("red-color").checked;
//         settings.craft = document.getElementById("craft-color").checked;
//         settings.dark = document.getElementById("dark-color").checked;
//     }

//     // 제품의 색상이 설정된 색상 중 하나인지 확인하는 함수
//     function checkColor(color) {
//         return settings[color]; // 해당 색상이 settings 객체에 있는지 확인하고 그 결과 반환
//     }
    
    
</script>
</body>


<!-- <section class="content mt-8 text-xl px-4"> -->
<!--     <div>흑맥주</div> -->
<!--     <div class="container-fluid"> -->
<!--         <div class="row"> -->
<!--             <div class="container_side_bar "> -->
<!--                 <div class="filter-column side_bar"> -->
<!--                     <h3 class="title">와인 선택</h3> -->
<!--                     <p class="subtitle"> -->
<!--                         By type: -->
<!--                         <select id="myType" onchange="product_init()"> -->
<!--                             <option>All</option> -->
<!--                             <option>red</option> -->
<!--                             <option>white</option> -->
<!--                         </select> -->
<!--                     </p> -->
<!--                     <p class="subtitle"> -->
<!--                         By Price: -->
<!--                         <span class="bold-text" id="currentPrice"></span> -->
<!--                     </p> -->
<!--                     <input id="myRange" type="range" min="16000" max="100000" value="30000" onchange="product_init()"> -->
<!--                     <p class="subtitle">Select</p> -->
<!--                     <div class="checkboxes clearfix"> -->
<!--                         <div class=""> -->
<!--                             <label for="white-color"> -->
<!--                                 <input type="checkbox" id="white-color" name="white" checked onchange="product_init()"> -->
<!--                                 White -->
<!--                             </label> -->
<!--                         </div> -->
<!--                         <div class=""> -->
<!--                             <label for="craft-color"> -->
<!--                                 <input type="checkbox" id="craft-color" name="craft" checked onchange="product_init()"> -->
<!--                                 Craft -->
<!--                             </label> -->
<!--                         </div> -->
<!--                         <div class=""> -->
<!--                             <label for="dark-color"> -->
<!--                                 <input type="checkbox" id="dark-color" name="dark" checked onchange="product_init()"> -->
<!--                                 dark -->
<!--                             </label> -->
<!--                         </div> -->
<!--                         <div class=""> -->
<!--                             <label for="red-color"> -->
<!--                                 <input type="checkbox" id="red-color" name="red" checked onchange="product_init()"> -->
<!--                                 Red -->
<!--                             </label> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="product-main col-md-8"> -->
<!--                 <div class="product-board" id="product"></div> -->
<!--             </div> -->
<%--             <div class="badge badge-outline">${articlesCount }개</div> --%>
<!--         </div> -->
<!--     </div> -->
<!-- </section> -->


<%@ include file="../common/foot.jspf"%>