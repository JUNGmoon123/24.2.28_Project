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
  $(".mobile_top_bar .btn_toggle").click(function () {
    $(this).toggleClass("active");
  });
}

function TopBar__init() {
  $(".top_bar .menu_box_1 > ul > li").mouseover(function () {
    var $height = $(this).find("> ul").height();

    var height_plus = $height + 50;

    $(".bg").css("height", height_plus + "px");
  });

  $(".top_bar .menu_box_1 > ul > li").mouseleave(function () {
    $(".bg").css("height", "0px");
  });
}

TopBar__init();
Mobile_TopBar__init();
