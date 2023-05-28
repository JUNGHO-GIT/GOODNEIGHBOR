$(document).ready(function  ()  {
  let w = window.innerWidth;
  if (w > 767) {
    $("#menu-jk").scrollToFixed();
  }
  else {
    $("#menu-jk").scrollToFixed({
      minWidth: 768,
      maxWidth: 991,
      marginTop: 50,
      limit: function  ()  {
        let limit = $(".footer").offset().top - $("#menu-jk").outerHeight(true) - 10;

        return limit;
      },
    });
  }
});
$(document).ready(function  ()  {
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
$(document).ready(function  ()  {
  $(".filter-button").click(function  ()  {
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
const slides = document.querySelector(".slides");
const slideImg = document.querySelectorAll(".slides li");
let currentIdx = 0;
const slideCount = slideImg.length;
const prev = document.querySelector(".prev");
const next = document.querySelector(".next");
const slideWidth = 300;
const slideMargin = 100;
slides.style.width = (slideWidth + slideMargin) * slideCount + "px";

// ------------------------------------------------------------------------------------------------>
function moveSlide (num)  {
  slides.style.left = -num * 400 + "px";
  currentIdx = num;
}

prev.addEventListener("click", function  ()  {
  if (currentIdx !== 0) moveSlide(currentIdx - 1);
});
next.addEventListener("click", function  ()  {
  if (currentIdx !== slideCount - 1) {
    moveSlide(currentIdx + 1);
  }
});
$(".checkbox_group").on("click", "#check_all", function  ()  {
  $(this).parents(".checkbox_group").find("input").prop("checked", $(this).is(":checked"));
});
$(".checkbox_group").on("click", ".normal", function  ()  {
  let is_checked = true;
  $(".checkbox_group .normal").each(function  ()  {
    is_checked = is_checked && $(this).is(":checked");
  });
  $("#check_all").prop("checked", is_checked);
});


