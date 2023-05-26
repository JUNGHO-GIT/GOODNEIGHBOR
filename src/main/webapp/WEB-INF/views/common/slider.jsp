<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources" />

<div class="slider">
  <div class="owl-carousel">
    <c:forEach var="num" begin="1" end="4">
      <div class="item">
        <div class="slider-img">
          <img src="${srcPath}/imgs/slider/slider-${num}.png" />
        </div>
        <div class="container">
          <div class="row">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12">
              <div class="slider-captions">
                <h5 class="slider-title">Be Better</h5>
              </div>
            </div>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>
