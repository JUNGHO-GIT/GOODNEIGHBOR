<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources" />
<c:set var="member_id" value="${sessionScope.member_id}"/>
<c:set var="admin_id" value="${sessionScope.admin_id}"/>
<input type="hidden" id="member_id" name="member_id" value="${sessionScope.member_id}" />
<input type="hidden" id="admin_id" name="admin_id" value="${sessionScope.admin_id}" />
<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}" />

<!DOCTYPE html>
<html lang="en, ko">

  <!----------------------------------------------------------------------------------------------->
  <head>
    <jsp:include page="/WEB-INF/views/common/head.jsp" />
  </head>

  <!----------------------------------------------------------------------------------------------->
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <jsp:include page="/WEB-INF/views/common/slider.jsp" />

    <!--------------------------------------------------------------------------------------------->
    <main class="main container-fluid">
      <form name="updateForm" method="POST" action="${ctxPath}/product/updatePro.do">

        <!----------------------------------------------------------------------------------------->
        <input type="hidden" name="product_number" id="product_number" value="${dto.product_number}"/>
        <input type="hidden" name="product_group" id="product_group" value="${dto.product_group}"/>
        <input type="hidden" name="product_step" id="product_step" value="${dto.product_step}"/>
        <input type="hidden" name="product_level" id="product_level" value="${dto.product_level}"/>
        <input type="hidden" name="pageNum" id="pageNum" value="${pageNum}"/>

        <!---------------------------------------------------------------------------------------->
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <h2 class="text-center my-4 p">
              <i class="fas fa-dove"></i>
              <b class="ms-1">후원상품 수정</b>
            </h2>
          </div>
        </div>
        <hr class="green-line"/>

        <!---------------------------------------------------------------------------------------->
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <div class="mb-3 text-left">
              <label for="product_name" class="form-label">글제목</label>
              <input type="text" class="form-control" name="product_name" id="product_name" value="${dto.product_name}"/>
            </div>
            <div class="mb-3 text-left">
              <label for="product_company" class="form-label">작성자</label>
              <input type="text" class="form-control" name="product_company" id="product_company" value="${dto.product_company}" readonly="readonly"/>
            </div>
            <div class="mb-3 text-left">
              <label for="product_content" class="form-label">글내용</label>
              <textarea class="form-control" name="product_content" id="product_content" rows="10">${dto.product_content}</textarea>
            </div>
          </div>
        </div>
        <br/><br/>

        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <div class="mb-3 text-center">
              <button type="submit" class="btn btn-primary btn-sm ms-2" onsubmit="return productCheck()">글수정</button>
              <button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='${ctxPath}/product/list.do'">취소</button>
            </div>
          </div>
        </div>

        </form>
      </main><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>