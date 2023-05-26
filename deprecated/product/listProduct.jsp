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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script defer src="${srcPath}/js/popper.min.js"></script>
    <script defer src="${srcPath}/js/bootstrap.min.js"></script>
    <script defer src="${srcPath}/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script defer src="${srcPath}/plugins/slider/js/owl.carousel.min.js"></script>
    <script defer src="${srcPath}/js/daum.js" ></script>
    <script defer src="${srcPath}/js/product.js"></script>

  </head>
  <!-- /Head -->

  <!-- Body --------------------------------------------------------------------------------------->
  <body>


<!-- Support ---------------------------------------------------------------------------------->
<div id="portfolio" class="gallery">
<!-- container -->
<div class="container">
<div class="row">

<!-- button -->
<div class="gallery-filter d-none d-sm-block">
<form action="${proPath}/product/searchProduct" method="get" class="btn btn-default filter-button">
<input type="text" name="prouct_name" class="search-jungho"/>
<input type="submit" value="검색" class="search-jungho"/>
</form>
<button class="btn btn-default filter-button spacer1" data-filter="All"> All           </button>
<button class="btn btn-default filter-button" data-filter="1"> 1 </button>
<button class="btn btn-default filter-button" data-filter="2"> 2 </button>
<button class="btn btn-default filter-button spacer2" data-filter="3"> 3 </button>
<button class="btn btn-default filter-button spacer3" type="button" onclick="location.href='${proPath}/product/insertProduct'">
후원품 등록
</button>
<br><br>

</div>
<!-- /button -->

<!-- section -->
<section class="our-blog">
<div class="container">
<div class="blog-row row">

<!-- item card 1 -->
<input type="hidden" id="product_id" value="${productDTO.product_id}"/>
<div class="gallery_product col-auto filter 1">
<c:forEach var="productDTO" items="${productList}" begin="0" step="6" end="6">
<c:choose>
<c:when test="${not empty productDTO.product_imageName}">
<div class="single-blog">
<figure class="figure">
<img src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_imageName}"/>
</figure>
<div class="blog-detail">
<h4>${productDTO.product_name}</h4>
<div class="link">
<small>"${productDTO.product_date}"</small>
<div class="as">
<input type="button" value="상세보기" onclick="location.href='${proPath}/product/detailProduct?product_id=${productDTO.product_id}'" class="btn btn-default filter-button" style="padding=0px;"/>
</div>
</div>
</div>
</div>
</c:when>
<c:otherwise>
<div class="single-blog">
<figure class="figure">
<img src="${pageContext.request.contextPath}/imgs/etc/logo.jpg"/>
</figure>
<div class="blog-detail">
<h4>후원 준비중</h4>
<div class="link">
<small>당신은 사랑받기위해 태어난사람</small>
<a>상세 보기</a>
</div>
</div>
</div>
</c:otherwise>
</c:choose>
</c:forEach>
</div>

<!-- /item card 1 -->

<!-- item card 2 -->
<input type="hidden" id="product_id" value="${productDTO.product_id}"/>
<div class="gallery_product col-auto filter 1">
<c:forEach var="productDTO" items="${productList}" begin="1" step="6" end="6">
<c:choose>
<c:when test="${not empty productDTO.product_imageName}">
<div class="single-blog">
<figure class="figure">
<img src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_imageName}"/>
</figure>
<div class="blog-detail">
<h4>${productDTO.product_name}</h4>
<div class="link">
<small>"${productDTO.product_date}"</small>
<div class="as">
<input type="button" value="상세보기" onclick="location.href='${proPath}/product/detailProduct?product_id=${productDTO.product_id}'" class="btn btn-default filter-button" style="padding=0px;"/>
</div>
</div>
</div>
</div>
</c:when>
<c:otherwise>
<div class="single-blog">
<figure class="figure">
<img src="${pageContext.request.contextPath}/imgs/etc/logo.jpg"/>
</figure>
<div class="blog-detail">
<h4>후원 준비중</h4>
<div class="link">
<small>당신은 사랑받기위해 태어난사람</small>
<a>상세 보기</a>
</div>
</div>
</div>
</c:otherwise>
</c:choose>
</c:forEach>
</div>
<!-- /item card 2 -->

<!-- item card 3 -->
<input type="hidden" id="product_id" value="${productDTO.product_id}"/>
<div class="gallery_product col-auto filter 3">
<c:forEach var="productDTO" items="${productList}" begin="2" step="6" end="6">
<c:choose>
<c:when test="${not empty productDTO.product_imageName}">
<div class="single-blog">
<figure class="figure">
<img src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_imageName}"/>
</figure>
<div class="blog-detail">
<h4>${productDTO.product_name}</h4>
<div class="link">
<small>"${productDTO.product_date}"</small>
<div class="as">
<input type="button" value="상세보기" onclick="location.href='${proPath}/product/detailProduct?product_id=${productDTO.product_id}'" class="btn btn-default filter-button" style="padding=0px;"/>
</div>
</div>
</div>
</div>
</c:when>
<c:otherwise>
<div class="single-blog">
<figure class="figure">
<img src="${pageContext.request.contextPath}/imgs/etc/logo.jpg"/>
</figure>
<div class="blog-detail">
<h4>후원 준비중</h4>
<div class="link">
<small>당신은 사랑받기위해 태어난사람</small>
<a>상세 보기</a>
</div>
</div>
</div>
</c:otherwise>
</c:choose>
</c:forEach>
</div>
<!-- /item card 3 -->

<!-- item card 4 -->
<input type="hidden" id="product_id" value="${productDTO.product_id}"/>
<div class="gallery_product col-auto filter 1">
<c:forEach var="productDTO" items="${productList}" begin="3" step="6" end="6">
<c:choose>
<c:when test="${not empty productDTO.product_imageName}">
<div class="single-blog">
<figure class="figure">
<img src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_imageName}"/>
</figure>
<div class="blog-detail">
<h4>${productDTO.product_name}</h4>
<div class="link">
<small>"${productDTO.product_date}"</small>
<div class="as">
<input type="button" value="상세보기" onclick="location.href='${proPath}/product/detailProduct?product_id=${productDTO.product_id}'" class="btn btn-default filter-button" style="padding=0px;"/>
</div>
</div>
</div>
</div>
</c:when>
<c:otherwise>
<div class="single-blog">
<figure class="figure">
<img src="${pageContext.request.contextPath}/imgs/etc/logo.jpg"/>
</figure>
<div class="blog-detail">
<h4>후원 준비중</h4>
<div class="link">
<small>당신은 사랑받기위해 태어난사람</small>
<a>상세 보기</a>
</div>
</div>
</div>
</c:otherwise>
</c:choose>
</c:forEach>
</div>
<!-- /item card 4 -->

<!-- item card 5 -->
<input type="hidden" id="product_id" value="${productDTO.product_id}"/>
<div class="gallery_product col-auto filter 2">
<c:forEach var="productDTO" items="${productList}" begin="4" step="6" end="6">
<c:choose>
<c:when test="${not empty productDTO.product_imageName}">
<div class="single-blog">
<figure class="figure">
<img src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_imageName}"/>
</figure>
<div class="blog-detail">
<h4>${productDTO.product_name}</h4>
<div class="link">
<small>"${productDTO.product_date}"</small>
<div class="as">
<input type="button" value="상세보기" onclick="location.href='${proPath}/product/detailProduct?product_id=${productDTO.product_id}'" class="btn btn-default filter-button" style="padding=0px;"/>
</div>
</div>
</div>
</div>
</c:when>
<c:otherwise>
<div class="single-blog">
<figure class="figure">
<img src="${pageContext.request.contextPath}/imgs/etc/logo.jpg"/>
</figure>
<div class="blog-detail">
<h4>후원 준비중</h4>
<div class="link">
<small>당신은 사랑받기위해 태어난사람</small>
<a>상세 보기</a>
</div>
</div>
</div>
</c:otherwise>
</c:choose>
</c:forEach>
</div>
<!-- /item card 5 -->

<!-- item card 6 -->
<input type="hidden" id="product_id" value="${productDTO.product_id}"/>
<div class="gallery_product col-auto filter 3">
<c:forEach var="productDTO" items="${productList}" begin="5" step="6" end="6">
<c:choose>
<c:when test="${not empty productDTO.product_imageName}">
<div class="single-blog">
<figure class="figure">
<img src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_imageName}"/>
</figure>
<div class="blog-detail">
<h4>${productDTO.product_name}</h4>
<div class="link">
<small>"${productDTO.product_date}"</small>
<input type="button" value="상세보기" onclick="location.href='${proPath}/product/detailProduct?product_id=${productDTO.product_id}'" class="btn btn-default filter-button" style="padding=0px;"/>
</div>
</div>
</div>
</c:when>
<c:otherwise>
<div class="single-blog">
<figure class="figure">
<img src="${pageContext.request.contextPath}/imgs/etc/logo.jpg"/>
</figure>
<div class="blog-detail">
<h4>후원 준비중</h4>
<div class="link">
<small>당신은 사랑받기위해 태어난사람</small>
<a>상세 보기</a>
</div>
</div>
</div>
</c:otherwise>
</c:choose>
</c:forEach>
</div>
<!-- /item card 6 -->
</div>
<!-- /row -->
</div>
<!-- /container -->
</section>
<!-- /section -->

</div>
<!-- /row -->
</div>
<!-- /container -->
</div>
<!-- /Support -->
</div>


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

  <!-- /Body -->
</html>
<!-- /HTML -->