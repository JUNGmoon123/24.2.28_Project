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


//움직이는화면실행function init() {
 function init() {
  const slider = document.querySelector(".slider");
  const nextBtn = slider.querySelector(".nav .next");
  const prevBtn = slider.querySelector(".nav .prev");
  const items = slider.querySelectorAll(".item");

  let current = 0;

  items.forEach((item) => {
    const textWrapper = item.querySelector(".wrap");
    textWrapper.innerHTML = textWrapper.textContent.replace(
      /\S/g,
      "<span class='letter'>$&</span>"
    );
  });

  function anim(current, next, callback) {
    const currentImgs = current.querySelectorAll(".img");
    const currentText = current.querySelectorAll(".content .letter");
    const nextImgs = next.querySelectorAll(".img");
    const nextText = next.querySelectorAll(".content .letter");

    const t = 400;
    const offset = "-=" + t * 0.4;
    const imgOffset = t * 0.8;

    const tl = anime.timeline({
      easing: "easeInOutQuint",
      duration: t,
      complete: callback
    });

    // Add children
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

  let isPlaying = false;

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

  function next() {
    if (isPlaying) return;
    isPlaying = true;
    const newIndex = current === items.length - 1 ? 0 : current + 1;
    updateSlider(newIndex);
  }

  function prev() {
    if (isPlaying) return;
    isPlaying = true;
    const newIndex = current === 0 ? items.length - 1 : current - 1;
    updateSlider(newIndex);
  }

  nextBtn.addEventListener("click", next);
  prevBtn.addEventListener("click", prev);
}

document.addEventListener("DOMContentLoaded", init);
