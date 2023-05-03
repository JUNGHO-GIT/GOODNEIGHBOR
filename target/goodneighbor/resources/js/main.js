// function scrollToFixed() ---------------------------------------------------------------------->
$(document).ready(function () {
	let w = window.innerWidth;

	if (w > 767) {
		$("#menu-jk").scrollToFixed();
	}
  else {
    $("#menu-jk").scrollToFixed({
      minWidth: 768,
      maxWidth: 991,
      marginTop: 50,
      limit: function () {
        let limit = $(".footer").offset().top - $("#menu-jk").outerHeight(true) - 10;
        return limit;
      },
    });
  }
});

// function owlCarousel() ------------------------------------------------------------------------>
$(document).ready(function () {
	$(".owl-carousel").owlCarousel({
		loop: true,
		margin: 0,
		nav: true,
		autoplay: true,
		dots: true,
		autoplayTimeout: 3000,
		navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
		responsive: {
			0: {
				items: 1,
			},
			600: {
				items: 1,
			},
			1000: {
				items: 1,
			},
		},
	});
});

// function animate() -------------------------------------------------------------------------->
$(document).ready(function () {
	$(".filter-button").click(function () {
		let value = $(this).attr("data-filter");

		if (value == "All") {
			$(".filter").show("1000");
		}
    else {
			$('.filter[filter-item="' + value + '"]').removeClass("hidden");
			$(".filter")
				.not('.filter[filter-item="' + value + '"]')
				.addClass("hidden");
			$(".filter")
				.not("." + value)
				.hide("3000");
			$(".filter")
				.filter("." + value)
				.show("3000");
		}
	});

	if ($(".filter-button").removeClass("active")) {
		$(this).removeClass("active");
	}
	$(this).addClass("active");
});

// function isotope() -------------------------------------------------------------------------->
const slides = document.querySelector(".slides"); //전체 슬라이드 컨테이너
const slideImg = document.querySelectorAll(".slides li"); //모든 슬라이드들
let currentIdx = 0; //현재 슬라이드 index
const slideCount = slideImg.length; // 슬라이드 개수
const prev = document.querySelector(".prev"); //이전 버튼
const next = document.querySelector(".next"); //다음 버튼
const slideWidth = 300; //한개의 슬라이드 넓이
const slideMargin = 100; //슬라이드간의 margin 값

//전체 슬라이드 컨테이너 넓이 설정
slides.style.width = (slideWidth + slideMargin) * slideCount + "px";

function moveSlide(num) {
	slides.style.left = -num * 400 + "px";
	currentIdx = num;
}

prev.addEventListener("click", function () {
	/*첫 번째 슬라이드로 표시 됐을때는
  이전 버튼 눌러도 아무런 반응 없게 하기 위해
  currentIdx !==0일때만 moveSlide 함수 불러옴 */

	if (currentIdx !== 0) moveSlide(currentIdx - 1);
});

next.addEventListener("click", function () {
	/* 마지막 슬라이드로 표시 됐을때는
  다음 버튼 눌러도 아무런 반응 없게 하기 위해
  currentIdx !==slideCount - 1 일때만
  moveSlide 함수 불러옴 */
	if (currentIdx !== slideCount - 1) {
		moveSlide(currentIdx + 1);
	}
});

$(".checkbox_group").on("click", "#check_all", function () {
	$(this).parents(".checkbox_group").find("input").prop("checked", $(this).is(":checked"));
});

$(".checkbox_group").on("click", ".normal", function () {
	let is_checked = true;

	$(".checkbox_group .normal").each(function () {
		is_checked = is_checked && $(this).is(":checked");
	});

	$("#check_all").prop("checked", is_checked);
});
