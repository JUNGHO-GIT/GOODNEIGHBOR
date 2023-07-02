<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources" />
<c:set var="member_id" value="${sessionScope.member_id}"/>
<c:set var="admin_id" value="${sessionScope.admin_id}"/>

<!DOCTYPE html>
<html lang="en, ko">

  <head>
    <jsp:include page="/WEB-INF/views/common/head.jsp" />
  </head>

  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <jsp:include page="/WEB-INF/views/common/slider.jsp" />

    <main class="main container-fluid">

      <!------------------------------------------------------------------------------------------->
      <input type="hidden" id="member_id" name="member_id" value="${member_id}"/>
      <input type="hidden" id="product_name" name="product_name" value="${dto.product_name}"/>
      <input type="hidden" id="product_price" name="product_price" value="${dto.product_price}"/>
      <input type="hidden" id="product_image" name="product_image" value="${dto.product_image}"/>
      <input type="hidden" id="donation_amount" name="donation_amount" value="&#8361;<fmt:formatNumber value='${dto.product_price}' type='number' pattern='#,###'/>"/>
      <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}"/>

      <!------------------------------------------------------------------------------------------->
      <div class="row d-flex justify-content-center text-center align-items-center">
        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-10 col-xs-10 col-10">
          <h2 class="text-center mt-4 p">
            <i class="fas fa-dove" style="color: #32be85;"></i>
            <b class="ms-1">후원 하기</b>
          </h2>
        </div>
      </div>
      <div class="row d-flex justify-content-center align-items-start my-5">
        <div class="col-xl-5 col-lg-9 col-md-10 col-sm-10 col-xs-12 col-12">
          <div class="card shadow donation-card">
            <img src="${srcPath}/upload/${dto.product_image}" class="product-img rounded-top"/>
          </div>
        </div>
        <div class="col-xl-5 col-lg-9 col-md-10 col-sm-10 col-xs-12 col-12">
          <div class="card shadow donation-card">
            <div class="card-body">
              <h1 class="card-title text-center">${dto.product_name}</h1>
              <hr class="green-line2"/>
              <br/>
              <div class="d-flex justify-content-start align-items-center">
                <h4 class="card-text">후원금액&nbsp;:&nbsp;</h4>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <h5 class="card-text2 mb-1" id="donation_amount">&#8361;<fmt:formatNumber value='${dto.product_price}' type='number' pattern='#,###'/></h5>
                <span class="me-2">&nbsp;/&nbsp;</span>
                <h5 class="card-text2 mb-1" id="randomAmount"></h5>
              </div>
              <br/>
              <div class="d-flex justify-content-start align-items-center">
                <h4 class="card-text">후원자명&nbsp;:&nbsp;</h4>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <span class="me-2"><i class="fas fa-user"></i></span>
                <h5 class="card-text2 mb-1">${member_id}</h5>
              </div>
              <br/>
              <div class="d-flex justify-content-start align-items-center">
                <h4 class="card-text">후원시간&nbsp;:&nbsp;</h4>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <span class="me-2"><i class="fas fa-clock"></i></span>
                <h5 class="card-text2 mb-1" id="time"></h5>
              </div>
              <br/><br/>
              <div class="button-group d-flex justify-content-start inline-block">
                <button class="btn btn-primary w-40" onclick="return makeDonation();">
                  후원하기
                </button>
                &nbsp;&nbsp;
                <button class="btn btn-secondary w-40" onclick="window.location.href='${ctxPath}/product/list.do?pageNum=${pageNum}'">
                  목록
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>
