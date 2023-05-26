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

        <!-- row -->
        <div class="bold-jungho">
          <div class="row">

            <!-- col-5 with product details -->
            <div class="col-md-5">

              <!-- 이름 -->
              <div class="form-group">
                <label for="product_name">후원품 이름</label>
                <input type="text" class="form-control" id="product_name" name="product_name" placeholder="${productDTO.product_name}" value="${productDTO.product_name}" readonly="readonly">
              </div>

              <!-- 정보 -->
              <div class="form-group">
                <label for="product_detail">후원품 정보</label>
                <textarea class="form-control textarea" id="product_detail" name="product_detail"
                placeholder="${productDTO.product_detail}"
                oninput="this.scrollTop = 0;" readonly>${productDTO.product_detail}</textarea>
              </div>

              <!-- 가격 -->
              <div class="form-group">
                <label for="product_price">후원품 가격</label>
                <input type="text" class="form-control" id="product_price" name="product_price" value="${productDTO.product_price}" readonly>
              </div>


              <!-- 수량 -->
              <div class="form-group">
                <label for="product_stock">후원품 수량</label>
                <input type="text" class="form-control" id="product_stock" name="product_stock" value="${productDTO.product_stock}" readonly="readonly">
              </div>

              <!-- 제조사 -->
              <div class="form-group">
                <label for="product_company">후원품 제조사</label>
                <input type="text" class="form-control" id="product_company" name="product_company" value="${productDTO.product_company}" readonly="readonly">
              </div>
              <input type="hidden" name="product_id" value="${productDTO.product_id}" />
            </div>
            <!-- /col-5 -->

            <!-- col with the product image -->
            <div class="col-md-7">
              <!-- Add class 'product-image' to the div -->
              <div class="product-image">
                <!-- 이미지 O -->
                <c:if test="${productDTO.product_imageName != null}">
                  <img src="${resPath}/upload/${productDTO.product_imageName}" />
                </c:if>
                <!-- 이미지 X -->
                <c:if test="${productDTO.product_imageName == null}">
                  <img src="${srcPath}/imgs/etc/logo.jpg" />
                </c:if>
              </div>
              <!-- /product-image -->

              <!-- buttons -->
              <div class="row">
                <div class="right-jungho-2">
                  <button type="button" class="btn btn-primary" onclick="updateConfirmation('${proPath}', ${productDTO.product_id})">
                    수정하기
                  </button>&nbsp;&nbsp;&nbsp;&nbsp;

                  <button type="button" class="btn btn-primary" onclick="deleteConfirmation('${proPath}', ${productDTO.product_id})">
                    삭제하기
                  </button>&nbsp;&nbsp;&nbsp;&nbsp;

                  <button type="button" class="btn btn-primary" onclick="location.href='${proPath}/product/listProduct'">
                    목록보기
                  </button>&nbsp;&nbsp;&nbsp;&nbsp;

                  <button type="button" class="btn btn-primary" onclick="location.reload()">
                    새로고침
                  </button>
                </div>
              </div>

              <script>
              function deleteConfirmation(proPath, productId) {
                if (confirm("정말 삭제 하시겠습니까?")) {
                  location.href = `deleteProduct?product_id=${productDTO.product_id}`;
                }
                alert("삭제되었습니다.");
              }
              function updateConfirmation(proPath, productId) {
                if (confirm("정말 수정 하시겠습니까?")) {
                  location.href = `insertProduct?product_id=${productDTO.product_id}`;
                }
                alert("수정되었습니다.");
              }
              </script>

              <!-- /buttons -->

            </div>
            <!-- /col -->
          </div>
          <!-- /row -->
        </div>
        <!-- /bold-jungho -->
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