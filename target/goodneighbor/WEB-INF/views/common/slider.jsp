<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources"/>

<!-- Slider --------------------------------------------------------------------------------------->
<div class="slider">
  <div class="owl-carousel">
    <div class="slider-img">
      <div class="item">
        <div class="slider-img">
          <img src="${srcPath}/imgs/slider/slider-1.jpg"/>
        </div>
        <div class="container">
          <div class="row">
            <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
              <div class="animated bounceInDown slider-captions">
                <h3 class="slider-title">It's time for better</h3>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <c:forEach var="num" begin="2" end="4">
      <div class="item">
        <div class="slider-img"><img src="${srcPath}/imgs/slider/slider-${num}.jpg"/></div>
        <div class="container">
          <div class="row">
            <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
              <div class="slider-captions">
                <h3 class="slider-title">It's time for better</h3>
              </div>
            </div>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>
<!-- /.slider -->