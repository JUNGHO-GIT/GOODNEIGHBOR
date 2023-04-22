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
          <form action="${proPath}/product/updateProduct" method="post" enctype="multipart/form-data">
            <!-- row -->
            <div class="bold-jungho">
              <div class="row">

                <!-- col-5 with product details -->
                <div class="col-md-5">
                  <!-- 이름 -->
                  <div class="form-group">
                    <label for="product_name">후원품 이름</label>
                    <input type="hidden" name="product_id" value="${productDTO.product_id}"/>
                    <input type="text" class="form-control" id="product_name" name="product_name" placeholder="${productDTO.product_name}"/>
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
                    <input type="text" class="form-control" id="product_price" name="product_price" placeholder="${productDTO.product_price}"/>
                  </div>

                  <!-- 수량 -->
                  <div class="form-group">
                    <label for="product_stock">후원품 수량</label>
                    <input type="text" class="form-control" id="product_stock" name="product_stock" placeholder="${productDTO.product_stock}"/>
                  </div>

                  <!-- 제조사 -->
                  <div class="form-group">
                    <label for="product_company">후원품 제조사</label>
                    <input type="text" class="form-control" id="product_company" name="product_company" placeholder="${productDTO.product_company}"/>
                  </div>

                <div class="form-group">
                  <label for="product_image">후원품 이미지</label>
                  <!-- Input field to choose image file -->
                  <input type="file" id="product_image" name="product_image" accept="image/*"/>
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

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>