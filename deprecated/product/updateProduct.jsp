<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="proPath" value="${pageContext.request.contextPath}"/>
<c:set var="resPath" value="${pageContext.request.contextPath}/resources"/>
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources/product/jungho"/>

<!-- Html ----------------------------------------------------------------------------------------->
<!doctype html>
<html lang="en, ko">

  <!-- Head --------------------------------------------------------------------------------------->
  <head>
    <!-- meta -->
    <title> productInsert </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- link -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@400;500&display=swap"/>
    <link rel="shortcut icon" href="${srcPath}/imgs/etc/fav.jpg"/>
    <link rel="stylesheet" href="${srcPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${srcPath}/css/all.min.css"/>
    <link rel="stylesheet" href="${srcPath}/css/animate.css"/>
    <link rel="stylesheet" href="${srcPath}/plugins/slider/css/owl.carousel.min.css"/>
    <link rel="stylesheet" href="${srcPath}/plugins/slider/css/owl.theme.default.css"/>
    <link rel="stylesheet" href="${srcPath}/css/style.css"/>
    <!-- script -->
    <script defer src="${srcPath}/js/jquery-3.2.1.min.js"></script>
    <!-- ajax cdn -->
    <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script defer src="${srcPath}/js/popper.min.js"></script>
    <script defer src="${srcPath}/js/bootstrap.min.js"></script>
    <script defer src="${srcPath}/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script defer src="${srcPath}/plugins/slider/js/owl.carousel.min.js"></script>
    <script defer src="${srcPath}/js/daum.js" ></script>
    <script defer src="${srcPath}/js/product.js"></script>
  </head>

  <!-- Body --------------------------------------------------------------------------------------->
  <body>

    <!-- Header ----------------------------------------------------------------------------------->
    <header class="container-fluid">
      <div class="header-top">
        <div class="container">
          <div class="row col-det">
            <div class="col-lg-6 d-none d-lg-block">
              <ul class="ulleft">
                <li>
                  <i class="far fa-envelope"></i> goodneighbor@naver.com <span>|</span>
                </li>
                <li>
                  <i class="fas fa-phone-volume"></i> 010-1234-5678
                </li>
              </ul>
            </div>
            <div class="col-lg-3 col-md-6 follows">
              <ul class="ulright">
                <li> <i class="fab fa-facebook-square"></i> </li>
                <li> <i class="fab fa-twitter-square"></i> </li>
                <li> <i class="fab fa-instagram"></i> </li>
                <li> <i class="fab fa-linkedin"></i> </li>
              </ul>
            </div>
            <div class="col-lg-3 d-none d-md-block col-md-6 btn-bhed">
              <button class="btn btn-sm btn-success">회원가입</button>
              <button class="btn btn-sm btn-default">후원하기</button>
            </div>
          </div>
        </div>
      </div>
      <div id="menu-jk" class="header-bottom">
        <div class="container">
          <div class="row nav-row">
            <div class="col-lg-3 col-md-12 logo">
              <a href="index.html">
                <img src="${srcPath}/imgs/etc/logo.jpg" >
                <a data-toggle="collapse" data-target="#menu" href="#menu">
                  <i class="fas d-block d-lg-none  small-menu fa-bars"></i>
                </a>
              </a>
            </div>
            <div id="menu" class="col-lg-9 col-md-12 d-none d-lg-block nav-col">
              <ul class="navbad">
                <li class="nav-item active">
                  <a class="nav-link" href="index.html"> Home </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="about.html"> About us </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="services.html">Services</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="gallery.html"> Gallery </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="support.html"> 후원 </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="contact.html"> Contact us </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </header>
    <!-- /Header -->

    <!-- Title ------------------------------------------------------------------------------------>
    <div class="slider">
      <div class="owl-carousel ">
        <div class="slider-img">
          <div class="item">
            <div class="slider-img">
              <img src="${srcPath}/imgs/slider/slider-3.jpg"/>
            </div>
            <div class="container">
              <div class="row">
                <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                  <div class="animated bounceInDown slider-captions">
                    <h1 class="slider-title">    Be Better Life </h1>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="item">
          <div class="slider-img"><img src="${srcPath}/imgs/slider/slider-1.jpg"/></div>
          <div class="container">
            <div class="row">
              <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                <div class="slider-captions ">
                  <h1 class="slider-title">    Be Better Life </h1>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="item">
        <div class="slider-img"><img src="${srcPath}/imgs/slider/slider-2.jpg"/></div>
          <div class="container">
            <div class="row">
              <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                <div class="slider-captions ">
                  <h1 class="slider-title">    Be Better Life </h1>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- /Title -->

    <!-- Content ---------------------------------------------------------------------------------->
    <div id="portfolio" class="gallery">

      <!-- container -->
      <div class="container">
        <form action="${proPath}/product/updateProduct" method="post" enctype="multipart/form-data">
          <!-- row -->
          <div class="bold-jungho">
            <div class="row">

              <!-- col-5 with product details -->
              <div class="col-md-5">
                <!-- 이름 -->
                <div class="form-group">
                  <label for="product_name">후원품 이름</label>
                  <input type="hidden" name="product_id" value="${productDTO.product_id}">
                  <input type="text" class="form-control" id="product_name" name="product_name" placeholder="${productDTO.product_name}">
                </div>

                <!-- 정보 -->
                <div class="form-group">
                  <label for="product_detail">후원품 정보</label>
                  <textarea class="form-control" id="product_detail" name="product_detail"
                    class="textarea" placeholder="${productDTO.product_detail}"
                    oninput="this.scrollTop = 0;"></textarea>
                </div>

                <!-- 가격 -->
                <div class="form-group">
                  <label for="product_price">후원품 가격</label>
                  <input type="text" class="form-control" id="product_price" name="product_price" placeholder="${productDTO.product_price}">
                </div>

                <!-- 수량 -->
                <div class="form-group">
                  <label for="product_stock">후원품 수량</label>
                  <input type="text" class="form-control" id="product_stock" name="product_stock" placeholder="${productDTO.product_stock}">
                </div>

                <!-- 제조사 -->
                <div class="form-group">
                  <label for="product_company">후원품 제조사</label>
                  <input type="text" class="form-control" id="product_company" name="product_company" placeholder="${productDTO.product_company}"/>
                </div>

               <div class="form-group">
                <label for="product_image">후원품 이미지</label>
                <!-- Input field to choose image file -->
                <input type="file" id="product_image" name="product_image" accept="image/*">
                <!-- Image preview area -->
                <img id="preview" src="${resPath}/product/upload/${productDTO.product_imageName}"/>


                  <script>
                  // Function to update image preview when a new image is selected
                  function imageCheck() {
                    $( document ).on( 'change', '#product_image', function () {
                      var input = this;
                      if ( input.files && input.files[ 0 ] ) {
                        var reader = new FileReader();
                        reader.onload = function ( e ) {
                          $( '#preview' ).attr( 'src', e.target.result );
                        }
                        reader.readAsDataURL( input.files[ 0 ] );
                      }
                    } );

                    // Function to submit form data via AJAX when the form is submitted
                    $( document ).on( 'submit', '#product-form', function ( event ) {
                      event.preventDefault();
                      var formData = new FormData( this );
                      $.ajax( {
                        url: '${resPath}/product/upload/${productDTO.product_imageName}',
                        type: 'POST',
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function ( data ) {
                          $('#product_imageName').val(data.imageUrl);
                          // 상품 업데이트가 성공적으로 완료됐을 때 실행할 코드
                        },
                        error: function ( xhr, status, error ) {
                          // 상품 업데이트가 실패했을 때 실행할 코드
                        }
                      } );
                    } );
                  }

                  // Call the imageCheck function on page load
                  $(document).ready(function() {
                    imageCheck();
                  });
                  </script>
                </div>
                <!-- row for buttons below the image -->
                <div class="row">
                  <div class="right-jungho-2">
                    <button type="submit" class="btn btn-primary" onclick="return productCheck()">
                      수정완료
                    </button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-primary" onclick="return deleteCheck('${productDTO.product_id}')">
                      삭제하기
                    </button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-primary" onclick="location.href='${proPath}/product/listProduct?pageNum=${pageNum}'">
                      목록보기
                    </button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-primary" onclick="location.reload()">
                      새로고침
                    </button>
                  </div>
                </div>
              </div>
              <!-- /col -->
            </div>
            <!-- /row -->
          </div>
          <!-- /bold-jungho -->
        </form>
        <!--- /form -->
      </div>
      <!-- /container -->
    </div>
    <!-- /Content -->

    <!-- Footer ----------------------------------------------------------------------------------->
    <footer class="footer">
      <div class="copy">
        <div class="container">
          <a href="https://www.smarteyeapps.com/">
            2015 &copy; All Rights Reserved | Designed and Developed by Smarteyeapps
          </a>
          <span>
            <a> <i class="fab fa-github"></i> </a>
            <a> <i class="fab fa-google-plus-g"></i> </a>
            <a> <i class="fab fa-pinterest-p"></i> </a>
            <a> <i class="fab fa-twitter"></i> </a>
            <a> <i class="fab fa-facebook-f"></i> </a>
          </span>
        </div>
      </div>
    </footer>
    <!-- /Footer -->

  </body>
  <!-- /Body -->
</html>
<!-- /HTML -->--%>