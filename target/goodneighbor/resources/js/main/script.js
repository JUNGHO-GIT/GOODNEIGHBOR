function writeSave() {
	if ($("#board_writer").val() == "") {
		alert("이름을 입력 하세요 ");
		$("#board_writer").focus();
		return false;
	}
	if ($("#board_subject").val() == "") {
		alert("글제목을 입력 하세요 ");
		$("#board_subject").focus();
		return false;
	}
	if ($("#board_content").val() == "") {
		alert("글내용을 입력 하세요 ");
		$("#board_content").focus();
		return false;
	}
	if ($("#board_pw").val() == "") {
		alert("암호을 입력 하세요 ");
		$("#board_pw").focus();
		return false;
	}

	return true;
}

function memberCheck() {
	if ($("#id").val() == "") {
		alert("ID를 입력 하세요");
		$("#id").focus();
		return false;
	}
	if ($("#name").val() == "") {
		alert("이름을 입력 하세요");
		$("#name").focus();
		return false;
	}
	if ($("#email").val() == "") {
		alert("이메일을 입력 하세요");
		$("#email").focus();
		return false;
	}
	if ($("#tel").val() == "" || $("#tel2").val() == "" || $("#tel3").val() == "") {
		alert("전화번호를 정확히 입력 하세요");
		$("#tel").focus();
		return false;
	}
	return true;
}

function pwCheck() {
	if ($("#board_pw").val() == "") {
		alert("암호를 입력 하세요");
		$("#board_pw").focus();
		return false;
	}

	if ($("#board_pw2").val() == "") {
		alert("암호를 입력 하세요");
		$("#board_pw2").focus();
		return false;
	}

	if ($("#board_pw").val() != $("#pw2").val()) {
		alert("암호와 암호확인이 다릅니다");
		$("#pw2").val("");
		$("#board_pw").val("").focus();
		return false;
	}
}
function pwCheck() {
	if ($("#board_pw").val() == "") {
		alert("암호는 필수 입력입니다.");
		$("#board_pw").focus();
		return false;
	}
}





// function scrollToFixed() ---------------------------------------------------------------------->
$( document ).ready( function () {
  var w = window.innerWidth;

  if ( w > 767 ) {
      $( '#menu-jk' ).scrollToFixed();
  }
  else {}
})


// function owlCarousel() ------------------------------------------------------------------------>
$(document).ready(function() {
  $('.owl-carousel').owlCarousel({
    loop:true,
    margin:0,
    nav:true,
    autoplay: true,
    dots: true,
    autoplayTimeout: 3000,
    navText:['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
    responsive:{
      0:{
          items:1
      },
      600:{
          items:1
      },
      1000:{
          items:1
      }
    }
  })
});



// function animate() -------------------------------------------------------------------------->
$(document).ready(function() {
  $(".filter-button").click(function(){
    var value = $(this).attr('data-filter');

    if(value == "All") {
      // $('.filter').removeClass('hidden');
      $('.filter').show('1000');
    }
    else {
        $('.filter[filter-item="'+value+'"]').removeClass('hidden');
        $(".filter").not('.filter[filter-item="'+value+'"]').addClass('hidden');
        $(".filter").not('.'+value).hide('3000');
        $('.filter').filter('.'+value).show('3000');

    }
  });

  if ($(".filter-button").removeClass("active")) {
      $(this).removeClass("active");
  }
  $(this).addClass("active");
} );


// findAddr() ------------------------------------------------------------------------------------->
function findAddr() {
  new daum.Postcode( {
      oncomplete: function ( data ) {
          document.getElementById( 'zipcode' ).value = data.zonecode;
          document.getElementById( 'addr' ).value = data.address;
      }
  } ).open();
}


// delpwcheck() ----------------------------------------------------------------------------------->
function delpwcheck() {
  if ( document.delForm.pw.value == null ) {
      alert( "암호는 필수입력" );
      document.delForm.pw.focus();
      return false;
  }
  return true;
}


// uppwcheck() ------------------------------------------------------------------------------------>
function uppwcheck() {
  if ( document.updateForm.pw.value == null ) {
      alert( "암호는 필수입력" );
      document.updateForm.pw.focus();
      return false;
  }
  return true;
}


//  productCheck --------------------------------------------------------------------------------->
function productCheck() {
  if ( $( '#product_name' ).val() == '' ) {
    alert( "후원품 이름을 입력 하세요" );
    $( '#product_name' ).focus();
    return false;
  }

  if ( $( '#product_detail' ).val() == '' ) {
    alert( "후원품 정보를 입력 하세요" );
    $( '#product_detail' ).focus();
    return false;
  }

  if ( $( '#product_price' ).val() == '' ) {
    alert( "후원품 가격을 입력 하세요" );
    $( '#product_price' ).focus();
    return false;
  }

  if ( $( '#product_stock' ).val() == '' ) {
    alert( "후원품 수량을 입력 하세요" );
    $( '#product_stock' ).focus();
    return false;
  }

  if ( $( '#product_company' ).val() == '' ) {
    alert( "후원품 제조회사를 입력하세요" );
    $( '#product_company' ).focus();
    return false;
  }

  if ( $( '#product_image' ).val() == '' ) {
    alert( "후원품 사진을 등록하세요" );
    $( '#product_image' ).focus();
    return false;
  }
  alert( "등록 완료 되었습니다." );
  return true;
}


// setThumbnail() --------------------------------------------------------------------------------->
function setThumbnail(event) {
  let reader = new FileReader();
  reader.onload = function(event) {
    let img = document.createElement("img");
    img.setAttribute( "src", event.target.result );
    img.setAttribute( "max-width", "400px" );
    img.setAttribute( "max-height", "400px" );
      let imageContainer = document.querySelector("div#image_container");
      while (imageContainer.firstChild) {
        imageContainer.removeChild(imageContainer.firstChild);
      }
    imageContainer.appendChild( img );
  };
  reader.readAsDataURL(event.target.files[0]);
}


// function deleteCheck() ------------------------------------------------------------------------>
function deleteCheck() {
  if ( confirm( "정말 삭제 하시겠습니까?" ) ) {
    alert( "삭제가 완료 되었습니다." );
    window.location.href = "/goodneighbor/product/empty.jsp";
    return true;
  }
  else {
    return false;
  }
}

// function updateCheck() ------------------------------------------------------------------------>
function updateCheck() {
  if ( confirm( "정말 수정 하시겠습니까?" ) ) {
    alert( "수정이 완료 되었습니다." );
    window.location.href = "/goodneighbor/product/listProduct";
    return true;
  }
  else {
    return false;
  }
}

function check() {
	if ($("#title").val() == "") {
		alert("글제목을 입력하세요");
		$("#title").focus();
		return false;
	}
	if ($("#content").val() == "") {
		alert("글내용을 입력하세요");
		$("#content").focus();
		return false;
	}
	if ($("#pw").val() == "") {
		alert("pw를 입력하세요");
		$("#pw").focus();
		return false;
	}
	if ($("#writer").val() == "") {
		alert("글쓴이를 입력하세요");
		$("#writer").focus();
		return false;
	}
	return true;
}

function pwcheck() {
	if ($("#pw").val() == "") {
		alert("비밀번호를 입력하세요");
		$("#pw").focus();
		return false;
	}
	if ($("#pw").val() != $("#pw2").val()) {
		alert("비밀번호가 다릅니다");
		$("#pw").focus();
		return false;
	}
	return true;
}


