<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="술상품"></c:set>
<%@ include file="../common/head.jspf"%>
<style>

/* 상품설정 */
/* 사이드바 */
.side_bar {
	background-color: #ffffff; /* 흰색 배경색 */
	/* color: black; 텍스트 색상을 검은색으로 설정 */
	height: 100%; /* 높이 100% 설정 */
	width: 300px; /* 너비 300px 설정 */
	position: fixed; /* 화면에 고정된 위치로 설정 */
	top: 0; /* 상단에 위치하도록 설정 */
	left: 0; /* 왼쪽으로 숨겨진 상태로 초기 설정 */
	border-radius: 10px; /* 모서리를 둥글게 설정 */
	/* 클릭 가능한 영역을 넓히기 위해 패딩을 추가합니다. */
	padding: 10px 20px; /* 위아래 10px, 좌우 20px */
	/* 기타 스타일을 적용할 수 있습니다. */
	transition: left 0.3s, background-color 0.3s;
	/* 좌측 이동 및 배경색 전환에 대한 transition 효과 설정 */
}

/* 사이드바 호버 시 */
.side_bar:hover {
	color: #000000; /* 텍스트 색상을 검은색으로 변경 */
	color: black; /* 텍스트 색상 변경 */
	left: 0; /* 사이드바를 왼쪽으로 이동하여 보이도록 함 */
}

/* 사이드바 아이콘 */
.side_bar .status_icon {
	text-align: right; /* 우측 정렬 */
	padding: 8px; /* 안쪽 여백 설정 */
}

/* 사이드바 아이콘 - 기본 상태 */
.side_bar .status_icon>div:first-child {
	display: block; /* 첫 번째 아이콘은 기본적으로 표시함 */
}

/* 사이드바 호버 시 아이콘 변화 */
.side_bar:hover .status_icon>div:first-child {
	display: none; /* 호버 시 첫 번째 아이콘 숨김 */
}

.side_bar:hover .status_icon>div:last-child {
	display: block; /* 호버 시 두 번째 아이콘 표시 */
}

/* 왼쪽상품선택메뉴바.filter-column */
.filter-column {
	position: fixed; /* 화면에 고정된 위치로 설정 */
	left: -20px; /* 좌측 여백 0으로 설정 */
	top: 210px;
	bottom: 10px; /* 하단 여백 20px 설정 */
	width: auto; /* 가로 길이를 자동으로 설정하여 보이게 함 */
	padding: 30px; /* 내부 여백 설정 */
	height: 600px;
	border-radius: 10px; /* 모서리를 둥글게 설정 */
	border-right: 2px solid rgba(0, 0, 0, 0.2); /* 우측 테두리 색상 */
	border-top: 2px solid rgba(0, 0, 0, 0.2); /* 상단 테두리 색상 */
	border-bottom: 2px solid rgba(0, 0, 0, 0.2); /* 하단 테두리 색상 */
	overflow: hidden; /* 내부 요소가 넘치는 경우 숨김 처리 */
	transition: left 0.8s, background-color 0.5s; /* 트랜지션 효과 설정 */
	visibility: visible; /* 처음부터 보이도록 함 */
}

/* .filter-column 내부 요소 */
.filter-column * {
	visibility: visible; /* 내부 요소도 처음부터 보이도록 함 */
}
/* 상품 목록 보드 */
.product-main {
	margin-left: 400px; /* 사이드 바 필터 컬럼의 너비에 맞추어 여백 설정 */
	padding: 10px;
	border: 1px solid gold;
	min-height: 100vh; /* 뷰포트의 높이를 채우도록 설정 */
}

/* 상품 카드 */
.product-card {
	width: 20%; /* 너비 설정 */
	margin-right: 3%; /* 오른쪽 여백 설정 */
	text-align: center; /* 가운데 정렬 */
	min-height: 400px; /* 최소 높이 설정 */
	padding: 20px; /* 안쪽 여백 설정 */
	box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.1); /* 그림자 설정 */
	margin-bottom: 10px; /* 아래 여백 설정 */
	/* 	border: 1px solid green; 테두리 설정 */
	vertical-align: top; /* 상단 정렬 */
}

/* 체크박스 컨테이너 */
.checkboxes {
	width: 100%; /* 너비 100% 설정 */
}

.checkbox {
	width: 100px; /* 원하는 너비로 설정하세요. */
	height: 50px; /* 원하는 높이로 설정하세요. */
}

.checkboxes .label {
	display: flex; /* 플렉스 박스로 설정하여 내부 요소들을 가로로 배치합니다. */
	align-items: center; /* 수직 중앙 정렬을 수행합니다. */
}

/* 제목 */
.title {
	width: 68%; /* 너비 100% 설정 */
	font-weight: bold; /* 폰트 굵기 설정 */
	margin-bottom: 30px; /* 아래 여백 설정 */
	border: 1px solid green; /* 테두리 설정 */
}

/* 부제목 */
.subtitle {
	width: 60%; /* 너비 100% 설정 */
	font-size: 18px; /* 폰트 크기 설정 */
	margin: 10px 10px 15px 0; /* 여백 설정 */
	border: 1px solid green; /* 테두리 설정 */
}

/* 메인 상품 목록 */
.product_main {
	position: relative; /* 상대 위치 설정 */
	top: -400px; /* 위로 이동 */
}

/* 상품 목록 보드 */
.product-board {
	height: 500px; /* 높이 설정 */
	padding: 10px; /* 안쪽 여백 설정 */
	border: 1px solid gold; /* 테두리 설정 */
}

/* 상품 카드 */
.product-card {
	width: 20%; /* 너비 설정 */
	margin-right: 3%; /* 오른쪽 여백 설정 */
	text-align: center; /* 가운데 정렬 */
	min-height: 400px; /* 최소 높이 설정 */
	padding: 20px 20px; /* 안쪽 여백 설정 */
	box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.1); /* 그림자 설정 */
	float: left; /* 왼쪽으로 띄우기 */
	margin-bottom: 10px; /* 아래 여백 설정 */
	border: 1px solid green; /* 테두리 설정 */
}

/*상품리스트 이미지 */
.product-card img {
	width: 150px; /* 원하는 너비(px)로 설정 */
	height: 200px; /* 원하는 높이(px)로 설정 */
	display: block; /* 이미지를 블록 요소로 설정하여 수평 중앙 정렬 가능 */
	margin: 20px auto; /* 자동 마진을 통해 수평 가운데 정렬 */
}

/* 모델 */
.model {
	display: block; /* 블록 요소로 설정 */
	font-weight: bold; /* 폰트 굵기 설정 */
	width: 80%; /* 너비 설정 */
	margin-left: 30px;
	padding-bottom: 20px; /* 아래 여백 설정 */
	margin-bottom: 20px; /* 아래 여백 설정 */
	font-size: 15px; /* 폰트 크기 설정 */
	color: #163b77; /* 글자 색상 설정 */
	border-bottom: 2px solid #d1e2ff; /* 아래쪽 테두리 설정 */
}

/* 이미지 */
.image {
	width: 700%; /* 너비 설정 */
	border-bottom: 2px solid #d1e2ff; /* 아래쪽 테두리 설정 */
	padding: 10px; /* 안쪽 여백 설정 */
	margin-bottom: 25px; /* 아래 여백 설정 */
}

/* 상품 정보 */
.product-card p {
	font-size: 16px; /* 폰트 크기 설정 */
	font-weight: regular; /* 폰트 굵기 설정 */
}

/* 굵은 텍스트 */
.bold-text {
	font-weight: bold; /* 폰트 굵기 설정 */
}

/* 연도 */
.year {
	font-size: 18px; /* 폰트 크기 설정 */
}

/* 하위 요소 스타일 */
.subtitle label {
	display: inline-block;
	width: auto;
	height: auto;
}

.subtitle input[type="checkbox"] {
	display: inline-block;
	margin-right: 5px;
}

/* 레인지 입력 */
input[type=range] {
	margin-bottom: 40px; /* 아래 여백 설정 */
}

/* 라벨 */
label {
	width: 80%;
	font-size: 15px; /* 폰트 크기 설정 */
}

.page-btn {
	position: relative; /* 상대적 위치 설정 */
	left: 50px; /* 왼쪽으로 50px 이동 */
	top: -80px; /* 위로 20px 이동 */
}

/* 하단 바 */

    .bottom-bar {
        position: fixed;
        bottom: 0;
        left: 0;
        width: 100%;
        background-color: #fff; /* 배경색을 설정하고 필요에 따라 다른 스타일을 적용할 수 있습니다. */
        padding: 10px; /* 필요에 따라 여백을 조정하세요. */
        box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1); /* 하단에 그림자를 추가합니다. */
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

/* 기존 */
/* .bottom-bar { */
/* 	margin-top: 60px; */
/* 	text-align: center; */
/* } */

/* .page-bar a { */
/* 	text-decoration: none; /* 링크 밑줄 제거 */ */
/* } */

/* .page-bar button { */
/* 	background-color: #f9f9f9; /* 버튼 배경색 */ */
/* 	border: 1px solid #ccc; /* 테두리 */ */
/* 	color: #333; /* 글자 색상 */ */
/* 	padding: 8px 16px; /* 패딩 */ */
/* 	margin: 4px; /* 마진 */ */
/* 	border-radius: 4px; /* 모서리 둥글게 */ */
/* } */

.page-bar button:hover {
	background-color: #e9e9e9; /* 마우스 호버시 색상 변경 */
}
/*페이지네이션*/
.page-bar button.active {
	background-color: #007bff; /* 강조 색상 */
	color: #fff; /* 텍스트 색상 */
}
</style>

<!DOCTYPE html>
<html>



<section class="content mt-8 text-xl px-4">
	<div>술 메뉴</div>
	<div class="container-fluid">
		<div class="row">
			<div class="container_side_bar col-md-4">
				<div class="filter-column side_bar">
					<h3 class="title">술 종류,가격</h3>
					<p class="subtitle">
						By 종류: <select id="myType" onchange="product_init()">
							<option value="All">All</option>
							<option value="red">레드와인</option>
							<option value="white">화이트와인</option>
							<option value="craft">수제맥주</option>
							<option value="dark">흑맥주</option>
							<option value="makgeolli">막걸리</option>
							<option value="cheongju">청주</option>
							<option value="soju">소주</option>
						</select>
					</p>
					<p class="subtitle">
						By 가격: <span class="bold-text" id="currentPrice"></span>
					</p>
					<input id="myRange" type="range" min="3000" max="70000" value="70000" onchange="product_init()">
					<p class="subtitle">종류선택</p>
					<div class="checkboxes clearfix">
						<div>
							<label for="white-color"> <input type="checkbox" id="white-color" name="white" checked
								onchange="product_init()"> 화이트와인
							</label>
						</div>
						<div>
							<label for="craft-color"> <input type="checkbox" id="craft-color" name="craft" checked
								onchange="product_init()"> 수제맥주
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
		<!-- 맥주 데이터를 동적으로 추가할 곳입니다.-->
	</div>
	<div class="bottom-bar">
		<div class="page-bar">
			<c:if test="${currentPage > 1}">
				<a href="?page=${currentPage - 1}&limit=15">
					<button>이전</button>
				</a>
			</c:if>
			<c:forEach begin="1" end="${totalPages}" var="i">
				<a href="?page=${i}&limit=15">
					<button class="${i == currentPage ? 'active' : ''}">${i}</button>
				</a>
			</c:forEach>
			<c:if test="${currentPage < totalPages}">
				<a href="?page=${currentPage + 1}&limit=20">
					<button>다음</button>
				</a>
			</c:if>
		</div>
	</div>
</body>
</html>


<script>
	// 맥주 데이터 배열
	var beers = [
	    // Java에서 가져온 데이터를 JavaScript 배열로 변환
	    <c:forEach var="beer" items="${beerList}" varStatus="loop">
	        { 
	        	"id": ${beer.id},
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

	// 초기화 함수
	//이부분이 없으면 술 상품 사이드 메뉴 By price데이터를 받오지 못한다.
	function product_init() {
	    checkColors(); // 색상 설정 확인
	    var priceInput = document.getElementById("myRange");
	    var price = priceInput.value; // 가격 설정
	    var type = document.getElementById("myType").value; // 타입 설정
	    document.getElementById("currentPrice").innerHTML = price; // 현재 가격 표시
	    document.getElementById("product").innerHTML = draw_products(price, type); // 제품 표시
	}
	// 페이지 로드 시 초기화 함수 호출
	window.onload = function() {
	    product_init();
	};

	// 이벤트 핸들러 등록을 통해 초기값 설정
	//이부분을 추가했더니 초기값이 제대로 들어가기 시작함.
	//DOM이벤트가 스타일시트, 이미지 및 하위 프레임 로드가 완료되었지만 외부 리소스의 로딩이 완료되지 않았을 때 발생하는 문제를 해결
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

		// 제품 카드 클릭 이벤트 처리
	document.addEventListener("click", function(event) {
	    var target = event.target;
	    if (target.classList.contains("product-card")) {
	        // 클릭된 요소가 제품 카드인 경우 처리
	        var model = target.querySelector(".model").textContent; // 제품 모델 가져오기
	        var year = target.querySelector(".year .bold-text").textContent; // 제품 연도 가져오기
	        var link = "https://www.soolmarket.com/"; // 링크 생성
	        window.location.href = link; // 링크로 이동
	    }
	});
	// 제품 카드 생성 함수
	function draw_card(product) {
// 	    var productId = product.id; // 제품 ID 가져오기
// 	    var link = "https://www.soolmarket.com/product-details.html?id=" + productId; // 상세 페이지 링크 생성
	    var link = "../product/beerdetail?id="+product.id; // 상세 페이지 링크 생성
	    // 제품 카드 HTML 반환
	    return '<div class="product-card"><a href="' + link + '" class="product-link"><h3 class="model">' + product.model + '</h3><img class="image" src="' + product.src + '" alt ="' + product.model + '"><p class="year">Year: <span class="bold-text">' + product.year + '</span></p><p class="color">Color: <span class="bold-text">' + product.color + '</span></p><p class="price">Price: <span class="bold-text">' + product.price + '</span></p></a></div>';
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