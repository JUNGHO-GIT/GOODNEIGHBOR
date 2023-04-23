<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources"/>

<!DOCTYPE html>
<html lang="en, ko">

  <head>
    <jsp:include page="/WEB-INF/views/common/head.jsp"/>
  </head>

  <body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/slider.jsp"/>

    <main class="main container-fluid">

      <!-- Mission -------------------------------------------------------------------------------->
      <section class="container-fluid mission-vision">
        <div class="container">
          <div class="row mission">
            <div class="col-md-6 mv-det">
              <h1>Our Mission</h1>
              <p>
                안녕하세요 반갑습니다 안녕하세요 반갑습니다 안녕하세요
              </p>
            </div>
            <div class="col-md-6 mv-img">
              <img src="${srcPath}/imgs/etc/misin.jpg">
            </div>
          </div>
          <div class="row vision">
            <div class="col-md-6 mv-img">
              <img src="${srcPath}/imgs/etc/vision.jpg">
            </div>
            <div class="col-md-6 mv-det">
              <h1>Our Vision</h1>
              <p>
                안녕하세요 반갑습니다 안녕하세요 반갑습니다 안녕하세요
              </p>
            </div>
          </div>
        </div>
      </section>

      <!-- Section -------------------------------------------------------------------------------->
      <section class="events">
        <div class="container">
          <div class="session-title row">
            <h2>Popular Causes</h2>
            <p> 안녕하세요 반갑습니다 안녕하세요 반갑습니다 안녕하세요 반갑습니다 안녕하세요 </p>
          </div>
          <div class="event-ro row">
            <div class="col-md-4 col-sm-6">
              <div class="event-box">
                <img src="${srcPath}/imgs/events/image_08.jpg">
                <h4> Child Education in Africa </h4>
                <p class="raises">
                  <span>Raised : $34,425</span> / $500,000
                </p>
                <p class="desic">
                  안녕하세요 반갑습니다 안녕하세요 반갑습니다 안녕하세요
                </p>
              </div>
            </div>
            <div class="col-md-4 col-sm-6">
              <div class="event-box">
                <img src="${srcPath}/imgs/events/image_06.jpg">
                <h4> Child Education in Africa </h4>
                <p class="raises">
                  <span>Raised : $34,425</span> / $500,000
                </p>
                <p class="desic">
                  안녕하세요 반갑습니다 안녕하세요 반갑습니다 안녕하세요
                </p>
              </div>
            </div>
            <div class="col-md-4 col-sm-6">
              <div class="event-box">
                <img src="${srcPath}/imgs/events/image_04.jpg">
                <h4> Child Education in Africa </h4>
                <p class="raises">
                  <span>Raised : $34,425</span> / $500,000
                </p>
                <p class="desic">
                  안녕하세요 반갑습니다 안녕하세요 반갑습니다 안녕하세요
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>