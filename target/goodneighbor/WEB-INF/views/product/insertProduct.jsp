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
                  <input type="text" class="form-control" id="product_name" name="product_name" placeholder="후원품 명을 입력해주세요."/>
                </div>
                <div class="form-group">
                  <label for="product_detail">후원품 정보</label>
                  <textarea class="form-control" id="product_detail" name="product_detail"
                  class="textarea" placeholder="후원품 정보를 입력해주세요." oninput="this.scrollTop = 0;"></textarea>
                </div>
                <div class="form-group">
                  <label for="product_price">후원품 가격</label>
                  <input type="text" class="form-control" id="product_price" name="product_price" placeholder="후원품 가격을 입력해주세요."/>
                </div>
                <div class="form-group">
                  <label for="product_stock">후원품 수량</label>
                  <input type="text" class="form-control" id="product_stock" name="product_stock" placeholder="후원품 수량을 입력해주세요."/>
                </div>
                <div class="form-group">
                  <label for="product_company">후원품 제조사</label>
                  <input type="text" class="form-control" id="product_company" name="product_company" placeholder="후원품 제조사를 입력해주세요."/>
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
                      <img id="thumbnail" src="${srcPath}/imgs/etc/logo.jpg" alt="image preview"/>
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
      </div>
    </div>

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>