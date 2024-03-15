$('select[data-value]').each(function(index, el) {
	const $el = $(el);

	defaultValue = $el.attr('data-value').trim();

	if (defaultValue.length > 0) {
		$el.val(defaultValue);
	}
});
// 헤더의 높이를 계산하여 본문의 여백을 설정합니다.
function setHeaderMargin() {
	var headerHeight = document.querySelector('.header').offsetHeight;
	document.querySelector('.content').style.marginTop = headerHeight + 'px';
}

// 페이지 로드 시 초기 설정을 수행합니다.
window.onload = function() {
	setHeaderMargin();
};

// 윈도우 크기가 변경될 때마다 헤더의 높이를 다시 계산하여 본문의 여백을 설정합니다.
window.onresize = function() {
	setHeaderMargin();
};
function TopBar__init() {
	$(".top_bar .menu_box_1 > ul > li").mouseover(function() {
		var $height = $(this).find("> ul").height();

		var height_plus = $height + 50;

		$(".bg").css("height", height_plus + "px");
	});

	$(".top_bar .menu_box_1 > ul > li").mouseleave(function() {
		$(".bg").css("height", "0px");
	});
}

TopBar__init();
$(document).ready(function() {
	// 드롭다운 메뉴 버튼을 클릭했을 때
	$('.dropdown-hover .btn').click(function() {
		// 클릭한 버튼의 형제 요소인 드롭다운 컨텐츠를 토글하여 나타내거나 감춤
		$(this).siblings('.dropdown-content').toggleClass('hidden');
	});

	// 드롭다운 메뉴 영역을 벗어났을 때
	$('.dropdown-hover').mouseleave(function() {
		// 모든 드롭다운 컨텐츠를 닫음
		$('.dropdown-content').addClass('hidden');
	});
});
//list에서 select의 data-value를 가져온다. form action=""에 PSOT/GET을 쓰지않고도 검색시 값을 유지할 수 있다.
// 예전에 function(form)했던거와 비슷.
// const $el 변수고 $(el)은 값이 되고  el.attr은 속성값을 가져와소 defaultValue로 전달해준다.


//카카오가져오기
console.clear();
function Mobile_TopBar__init() {
	$(".mobile_top_bar .btn_toggle").click(function() {
		$(this).toggleClass("active");
	});
}

function TopBar__init() {
	$(".top_bar .menu_box_1 > ul > li").mouseover(function() {
		var $height = $(this).find("> ul").height();

		var height_plus = $height + 50;

		$(".bg").css("height", height_plus + "px");
	});

	$(".top_bar .menu_box_1 > ul > li").mouseleave(function() {
		$(".bg").css("height", "0px");
	});
}

TopBar__init();
Mobile_TopBar__init();


//움직이는화면실행
function main_init() {
 //슬라이더 요소와 버튼 요소, 슬라이드 항목들을 가져옵니다.
	const slider = document.querySelector(".slider");
	const nextBtn = slider.querySelector(".nav .next"); // 다음 버튼
	const prevBtn = slider.querySelector(".nav .prev"); // 이전 버튼
	const items = slider.querySelectorAll(".item"); // 슬라이드 항목들

	// 초기 슬라이드 인덱스 및 자동 넘김 상태 변수 설정
	let current = 0;
	let isPlaying = false;
	let intervalId;

	// 각 슬라이드 항목의 텍스트를 span 요소로 분할하여 애니메이션을 위한 준비를 합니다.
	items.forEach((item) => {
		const textWrapper = item.querySelector(".wrap");
		textWrapper.innerHTML = textWrapper.textContent.replace(
			/\S/g,
			"<span class='letter'>$&</span>"
		);
	});

	// 슬라이드 전환 애니메이션 함수
	function anim(current, next, callback) {
		const currentImgs = current.querySelectorAll(".img");
		const currentText = current.querySelectorAll(".content .letter");
		const nextImgs = next.querySelectorAll(".img");
		const nextText = next.querySelectorAll(".content .letter");

		const t = 400;
		const offset = "-=" + t * 0.4;

		const tl = anime.timeline({
			easing: "easeInOutQuint",
			duration: t,
			complete: callback
		});

		tl.add({
			targets: currentText,
			translateY: [0, "-.75em"],
			opacity: [1, 0],
			easing: "easeInQuint",
			duration: t,
			delay: (el, i) => 10 * (i + 1)
		})
			.add(
				{
					targets: currentImgs,
					translateY: -600,
					translateZ: 0,
					rotate: [0, "-15deg"],
					opacity: [1, 0],
					easing: "easeInCubic"
				},
				offset
			)
			.add({
				targets: current,
				opacity: 0,
				visibility: "hidden",
				duration: 10,
				easing: "easeInCubic"
			})
			.add(
				{
					targets: next,
					opacity: 1,
					visibility: "visible",
					duration: 10
				},
				offset
			)
			.add(
				{
					targets: nextImgs,
					translateY: [600, 0],
					translateZ: 0,
					rotate: ["15deg", 0],
					opacity: [0, 1],
					easing: "easeOutCubic"
				},
				offset
			)
			.add(
				{
					targets: nextText,
					translateY: [".75em", 0],
					translateZ: 0,
					opacity: [0, 1],
					easing: "easeOutQuint",
					duration: t * 1.5,
					delay: (el, i) => 10 * (i + 1)
				},
				offset
			);
	}

	// 슬라이드를 업데이트하는 함수
	function updateSlider(newIndex) {
		const currentItem = items[current];
		const newItem = items[newIndex];

		function callback() {
			currentItem.classList.remove("is-active");
			newItem.classList.add("is-active");
			current = newIndex;
			isPlaying = false;
		}

		anim(currentItem, newItem, callback);
	}

	// 다음 슬라이드로 이동하는 함수
	function next() {
		if (isPlaying) return;
		isPlaying = true;
		const newIndex = current === items.length - 1 ? 0 : current + 1;
		updateSlider(newIndex);
	}

	// 이전 슬라이드로 이동하는 함수
	function prev() {
		if (isPlaying) return;
		isPlaying = true;
		const newIndex = current === 0 ? items.length - 1 : current - 1;
		updateSlider(newIndex);
	}

	// 자동으로 슬라이드를 전환하는 함수
	function startAutoSlide() {
		intervalId = setInterval(() => {
			next();
		}, 3000); // 3초마다 전환
	}

	// 자동 슬라이드를 멈추는 함수
	function stopAutoSlide() {
		clearInterval(intervalId);
	}

	// 다음 버튼 클릭 시 자동 슬라이드 멈추고 다음 슬라이드로 이동
	nextBtn.addEventListener("click", () => {
		stopAutoSlide();
		next();
		startAutoSlide(); // 버튼 클릭 후 자동 슬라이드 재시작
	});

	// 이전 버튼 클릭 시 자동 슬라이드 멈추고 이전 슬라이드로 이동
	prevBtn.addEventListener("click", () => {
		stopAutoSlide();
		prev();
		startAutoSlide(); // 버튼 클릭 후 자동 슬라이드 재시작
	});

	// 페이지 로드 시 자동 슬라이드 시작
	startAutoSlide();
}

// DOMContentLoaded 이벤트가 발생하면 init 함수 실행
document.addEventListener("DOMContentLoaded", main_init);

//위의 자동슬라이드부분 설명.
//startAutoSlide() 함수를 통해 자동으로 슬라이드가 전환됩니다. 이 함수는 페이지 로드 시 자동으로 호출되며 4초마다 다음 슬라이드로 이동합니다.
//다음과 이전 버튼을 클릭하면 자동 슬라이드가 멈추고 해당 방향으로 슬라이드가 이동합니다.
//다음 버튼 클릭 시 stopAutoSlide() 함수를 호출하여 자동 슬라이드를 멈추고 next() 함수를 호출하여 다음 슬라이드로 이동합니다.
//이전 버튼 클릭 시도 마찬가지로 stopAutoSlide() 함수를 호출하여 자동 슬라이드를 멈추고 prev() 함수를 호출하여 이전 슬라이드로 이동합니다.
//마지막으로, 페이지 로드 시 DOMContentLoaded 이벤트가 발생하면 init() 함수를 호출하여 슬라이더를 초기화합니다.

//화면 자동없음, 클릭시 움직임만가능
//function init() {
//	const slider = document.querySelector(".slider");
//	const nextBtn = slider.querySelector(".nav .next");
//	const prevBtn = slider.querySelector(".nav .prev");
//	const items = slider.querySelectorAll(".item");
//
//	let current = 0;
//
//	items.forEach((item) => {
//		const textWrapper = item.querySelector(".wrap");
//		textWrapper.innerHTML = textWrapper.textContent.replace(
//			/\S/g,
//			"<span class='letter'>$&</span>"
//		);
//	});
//
//	function anim(current, next, callback) {
//		const currentImgs = current.querySelectorAll(".img");
//		const currentText = current.querySelectorAll(".content .letter");
//		const nextImgs = next.querySelectorAll(".img");
//		const nextText = next.querySelectorAll(".content .letter");
//
//		const t = 400;
//		const offset = "-=" + t * 0.4;
//		const imgOffset = t * 0.8;
//
//		const tl = anime.timeline({
//			easing: "easeInOutQuint",
//			duration: t,
//			complete: callback
//		});
//
//		// Add children
//		tl.add({
//			targets: currentText,
//			translateY: [0, "-.75em"],
//			opacity: [1, 0],
//			easing: "easeInQuint",
//			duration: t,
//			delay: (el, i) => 10 * (i + 1)
//		})
//			.add(
//				{
//					targets: currentImgs,
//					translateY: -600,
//					translateZ: 0,
//					rotate: [0, "-15deg"],
//					opacity: [1, 0],
//					easing: "easeInCubic"
//				},
//				offset
//			)
//			.add({
//				targets: current,
//				opacity: 0,
//				visibility: "hidden",
//				duration: 10,
//				easing: "easeInCubic"
//			})
//			.add(
//				{
//					targets: next,
//					opacity: 1,
//					visibility: "visible",
//					duration: 10
//				},
//				offset
//			)
//			.add(
//				{
//					targets: nextImgs,
//					translateY: [600, 0],
//					translateZ: 0,
//					rotate: ["15deg", 0],
//					opacity: [0, 1],
//					easing: "easeOutCubic"
//				},
//				offset
//			)
//			.add(
//				{
//					targets: nextText,
//					translateY: [".75em", 0],
//					translateZ: 0,
//					opacity: [0, 1],
//					easing: "easeOutQuint",
//					duration: t * 1.5,
//					delay: (el, i) => 10 * (i + 1)
//				},
//				offset
//			);
//	}
//
//	let isPlaying = false;
//
//	function updateSlider(newIndex) {
//		const currentItem = items[current];
//		const newItem = items[newIndex];
//
//		function callback() {
//			currentItem.classList.remove("is-active");
//			newItem.classList.add("is-active");
//			current = newIndex;
//			isPlaying = false;
//		}
//
//		anim(currentItem, newItem, callback);
//	}
//
//	function next() {
//		if (isPlaying) return;
//		isPlaying = true;
//		const newIndex = current === items.length - 1 ? 0 : current + 1;
//		updateSlider(newIndex);
//	}
//
//	function prev() {
//		if (isPlaying) return;
//		isPlaying = true;
//		const newIndex = current === 0 ? items.length - 1 : current - 1;
//		updateSlider(newIndex);
//	}
//
//	nextBtn.addEventListener("click", next);
//	prevBtn.addEventListener("click", prev);
//}
//
//document.addEventListener("DOMContentLoaded", init);

//로그인실행화면
//var design = anime({
//	targets: 'svg #XMLID5',
//	keyframes: [
//		{ translateX: -500 },
//		{ rotateY: 180 },
//		{ translateX: 920 },
//		{ rotateY: 0 },
//		{ translateX: -500 },
//		{ rotateY: 180 },
//		{ translateX: -500 },
//	],
//	easing: 'easeInOutSine',
//	duration: 60000,
//});
//
//anime({
//	targets: '#dust-paarticle path',
//	translateY: [10, -150],
//	direction: 'alternate',
//	loop: true,
//	delay: function(el, i, l) {
//		return i * 100;
//	},
//	endDelay: function(el, i, l) {
//		return (l - i) * 100;
//	}
//});


//메인상단 와인,맥주,전통주 버튼 클릭시 해당 url로 이동

var urls = [
	"../article/list?boardId=1&page=1",
	"../article/list?boardId=2&page=1",
	"../article/list?boardId=3&page=1"
];

function redirectToNextPage(index) {
	window.location.href = urls[index];
}

function changeUrl(index) {
	window.location.href = urls[index];
}

function changeUrl(index) {
	var exploreBtn = document.querySelector('.explore-btn');
	exploreBtn.setAttribute('onclick', 'redirectToNextPage(' + index + ')');
}


//sparkling 설정
// sparkling 배열: 제품 데이터를 포함하는 배열
//var sparkling = [
//	{ "type": "sparkling", "model": "sparkling", "year": 2016, "color": "white", "price": 16000, "src": "https://오아크.com/web/product/medium/202211/42ae59aaa0b992e6b4de509c1e89f34c.jpg" },
//	{ "type": "sparkling", "model": "sparkling", "year": 2015, "color": "red", "price": 80000, "src": "https://오아크.com/web/product/medium/202211/f229d7a97041a31794ee25b213b88712.jpg" },
//	{ "type": "sparkling", "model": "sparkling", "year": 2022, "color": "white", "price": 50000, "src": "https://오아크.com/web/product/medium/202211/bf679203e1c07b565179d7ed927587cb.jpg" },
//	{ "type": "sparkling", "model": "sparkling", "year": 2023, "color": "red", "price": 90000, "src": "https://오아크.com/web/product/medium/202211/f229d7a97041a31794ee25b213b88712.jpg" },
//	{ "type": "craft", "model": "craft", "year": 2021, "color": "craft", "price": 5000, "src": "https://ojsfile.ohmynews.com/STD_IMG_FILE/2021/0310/IE002771543_STD.jpg" },
//	{ "type": "craft", "model": "craft", "year": 2022, "color": "craft", "price": 8000, "src": "https://blog.kakaocdn.net/dn/GPutK/btrHBBcHlfG/DdflRd2VHqDB2YslahdWoK/img.jpg" },
//	{ "type": "dark", "model": "dark", "year": 2020, "color": "dark", "price": 10000, "src": "https://gomean.co.kr/wp-content/uploads/2023/07/gm-dark-beer-main.jpg" }
//];
//
//// settings 객체: 색상 설정을 포함하는 객체
//var settings = {
//	white: true,
//	craft: true,
//	dark: true,
//	red: true
//};
//
//// 수정된 부분: 초기 설정 시 제품을 표시하는 함수
//window.onload = function() {
//    product_init();
//};
//
//// 초기화 함수
//function product_init() {
//	checkColors(); // 색상 설정 확인
//	var price = document.getElementById("myRange").value; // 가격 설정
//	var type = document.getElementById("myType").value; // 타입 설정
//	document.getElementById("currentPrice").innerHTML = price; // 현재 가격 표시
//	document.getElementById("product").innerHTML = draw_products(price, type); // 제품 표시
//}
//
//
//// 가격과 타입을 기준으로 제품을 표시하는 함수
//function draw_products(price, type) {
//	var content = "";
//	for (var i = 0; i < sparkling.length; i++) {
//		if ((sparkling[i].price <= price && sparkling[i].type == type || sparkling[i].price <= price && type == "All") && checkColor(sparkling[i].color)) {
//			content += draw_card(sparkling[i]); // 해당하는 제품 카드를 생성하여 content에 추가
//		}
//	}
//	return content; // content 반환
//};
//
//// 제품 카드를 생성하는 함수
//function draw_card(product) {
//	return '<div class="product-card"><h3 class="model">' + product.model + '</h3><img class="image" src="' + product.src + '" alt ="' + product.model + '"><p class="year">Year: <span class="bold-text">' + product.year + '</span></p><p class="color">Color: <span class="bold-text">' + product.color + '</span></p><p class="price">Price: <span class="bold-text">' + product.price + '</span></p></div>'; // 제품 카드 HTML 반환
//}
//
//// 색상 설정을 확인하여 settings 객체 업데이트하는 함수
//function checkColors() {
//	settings.white = document.getElementById("white-color").checked;
//	settings.red = document.getElementById("red-color").checked;
//	settings.craft = document.getElementById("craft-color").checked;
//	settings.dark = document.getElementById("dark-color").checked;
//}
//
//// 제품의 색상이 설정된 색상 중 하나인지 확인하는 함수
//function checkColor(Color) {
//	return settings[Color]; // 해당 색상이 settings 객체에 있는지 확인하고 그 결과 반환
//}

//// 맥주 데이터
//var beers = [
//	<c:forEach var="beer" items="${beers}" varStatus="loop">
//		{"type" : "${beer.btype}", "model": "${beer.model}", "year": ${beer.byear}, "color": "${beer.color}", "price": "${beer.price}", "src": "${beer.src}" }
//	</c:forEach>
//];
//
//// 제품 표시 초기화 함수
//window.onload = function() {
//	product_init();
//};
//
//// 초기화 함수
//function product_init() {
//	checkColors(); // 색상 설정 확인
//	var price = document.getElementById("myRange").value; // 가격 설정
//	var type = document.getElementById("myType").value; // 타입 설정
//	document.getElementById("currentPrice").innerHTML = price; // 현재 가격 표시
//	document.getElementById("product").innerHTML = draw_products(price, type); // 제품 표시
//}
//
//// 가격과 타입을 기준으로 제품을 표시하는 함수
//function draw_products(price, type) {
//	var content = "";
//	for (var i = 0; i < beers.length; i++) {
//		if ((beers[i].price <= price && beers[i].type == type || beers[i].price <= price && type == "All") && checkColor(beers[i].color)) {
//			content += draw_card(beers[i]); // 해당하는 제품 카드를 생성하여 content에 추가
//		}
//	}
//	return content; // content 반환
//};
//
//// 제품 카드를 생성하는 함수
//function draw_card(product) {
//	return '<div class="product-card"><h3 class="model">' + product.model + '</h3><img class="image" src="' + product.src + '" alt ="' + product.model + '"><p class="year">Year: <span class="bold-text">' + product.year + '</span></p><p class="color">Color: <span class="bold-text">' + product.color + '</span></p><p class="price">Price: <span class="bold-text">' + product.price + '</span></p></div>'; // 제품 카드 HTML 반환
//}
