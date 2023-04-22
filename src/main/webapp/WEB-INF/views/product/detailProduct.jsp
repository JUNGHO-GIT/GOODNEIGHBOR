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

    <!-- main ------------------------------------------------------------------------------------->
    <main class="main container-fluid w-50 mx-auto">

      <!-- section -------------------------------------------------------------------------------->
      <div id="portfolio" class="gallery">
        <div class="container">
          <div class="bold-jungho">
            <div class="row">
              <div class="col-md-5">

                <!-- 이름 -->
                <div class="form-group">
                  <label for="product_name">후원품 이름</label>
                  <input type="text" class="form-control" id="product_name" name="product_name" placeholder="${productDTO.product_name}" value="${productDTO.product_name}" readonly="readonly"/>
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
                  <input type="text" class="form-control" id="product_stock" name="product_stock" value="${productDTO.product_stock}" readonly="readonly"/>
                </div>

                <!-- 제조사 -->
                <div class="form-group">
                  <label for="product_company">후원품 제조사</label>
                  <input type="text" class="form-control" id="product_company" name="product_company" value="${productDTO.product_company}" readonly="readonly"/>
                </div>
                <input type="hidden" name="product_id" value="${productDTO.product_id}"/>
              </div>

              <div class="col-md-7">
                <div class="product-image">
                  <!-- 이미지 O -->
                  <c:if test="${productDTO.product_imageName != null}">
                    <img src="${resPath}/upload/${productDTO.product_imageName}"/>
                  </c:if>
                  <!-- 이미지 X -->
                  <c:if test="${productDTO.product_imageName == null}">
                    <img src="${srcPath}/imgs/etc/logo.jpg"/>
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

              </div>
            </div>
          </div>
        </div>
      </div>

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>