<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <script defer src="${srcPath}/js/popper.min.js"></script>
    <script defer src="${srcPath}/js/bootstrap.min.js"></script>
    <script defer src="${srcPath}/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script defer src="${srcPath}/plugins/slider/js/owl.carousel.min.js"></script>
    <script defer src="${srcPath}/js/daum.js" ></script>
    <script defer src="${srcPath}/js/product.js"></script>
  </head>

  <!-- Body --------------------------------------------------------------------------------------->
  <body>

   

    <!-- Content ---------------------------------------------------------------------------------->
    <div id="portfolio" class="gallery">

      <!-- container -->
      <div class="container">
        <form action="${proPath}/product/insertProduct" method="post" enctype="multipart/form-data">

          <div class="bold-jungho">
            <div class="row">

              <div class="col-5">
                <div class="form-group">
                  <label for="product_name">후원품 이름</label>
                  <input type="text" class="form-control" id="product_name" name="product_name" placeholder="후원품 명을 입력해주세요.">
                </div>
                <div class="form-group">
                  <label for="product_detail">후원품 정보</label>
                  <textarea class="form-control" id="product_detail" name="product_detail"
                  class="textarea" placeholder="후원품 정보를 입력해주세요." oninput="this.scrollTop = 0;"></textarea>
                </div>
                <div class="form-group">
                  <label for="product_price">후원품 가격</label>
                  <input type="text" class="form-control" id="product_price" name="product_price" placeholder="후원품 가격을 입력해주세요.">
                </div>
                <div class="form-group">
                  <label for="product_stock">후원품 수량</label>
                  <input type="text" class="form-control" id="product_stock" name="product_stock" placeholder="후원품 수량을 입력해주세요.">
                </div>
                <div class="form-group">
                  <label for="product_company">후원품 제조사</label>
                  <input type="text" class="form-control" id="product_company" name="product_company" placeholder="후원품 제조사를 입력해주세요.">
                </div>
                <div class="form-group">
                  <label for="product_image">후원품 이미지</label>
                  <input type="file" class="form-control" id="product_image" name="multiFile"
                  onchange="setThumbnail(event)">
                  <input type="hidden" name="product_image" id="product_image"/>
                  <input type="hidden" name="product_imageName" id="product_imageName"/>
                </div>
              </div>

              <!-- 이미지 미리보기 -->
              <div class="image-jungho">
                <div class="col">
                  <div id="image_container" oninput="setThumbnail(event);" class="write_column_image">
                    <div class="write_column_image_preview">
                      <img id="thumbnail" src="${srcPath}/imgs/etc/logo.jpg" alt="image preview">
                    </div>
                  </div>
                </div>
              </div>

            </div>
            <!-- /row -->
          </div>
          <!-- /bold-jungho -->

          <div class="right-jungho">
            <div class="row">
              <button type="submit" class="btn btn-primary" onclick="return productCheck()">
                등록하기
              </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <button type="button" class="btn btn-primary" onclick="location.href='${srcPath}/product/listProduct'">
                목록보기
              </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <button type="button" class="btn btn-primary" onclick="location.reload()">
                새로고침
              </button>
            </div>
          </div>

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
<!-- /HTML -->