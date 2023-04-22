<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}"/>
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources"/>

<!DOCTYPE html>
<html lang="en, ko">

	<head>
    <jsp:include page="/WEB-INF/views/common/head.jsp"/>
  </head>

  <body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/slider.jsp"/>

    <main class="main container-fluid w-50 mx-auto">


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


    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>