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

      <!------------------------------------------------------------------------------------------->
      <section class="container-fluid mission-vision">
        <div class="container">

          <!--------------------------------------------------------------------------------------->
          <div class="row mission">
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 mv-det">
              <h2 class="p">Our Mission</h2>
              <p>
                GoodNeighbor는 전 세계의 어려운 이웃들에게 도움의 손길을 내밀며, 지속 가능한 발전과 평화로운 세상을 꿈꿉니다. 이를 위해 우리는 교육, 건강, 환경 보호 등 다양한 분야에서 지원과 협력을 이어갑니다.
              </p>
            </div>
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 mv-img">
              <img src="${srcPath}/imgs/etc/misin.png" />
            </div>
          </div>

          <!--------------------------------------------------------------------------------------->
          <div class="row vision">
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 mv-det">
              <h2 class="p">Our Vision</h2>
              <p>
                끊임없는 변화와 성장을 통해 지속 가능한 미래를 만들어 가는 세상을 상상합니다. 우리는 모든 사람들이 함께 번영하고, 평등한 기회를 누리며, 환경 친화적인 삶을 살 수 있는 세상을 지향합니다.
              </p>
            </div>
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 mv-img">
              <img src="${srcPath}/imgs/etc/vision.png" />
            </div>
          </div>

        </div>
      </section>

      <!------------------------------------------------------------------------------------------->
      <section class="events">
        <div class="container">
          <div class="row session-title">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12">
              <h2 class="p">Our Events</h2>
            </div>
          </div>
          <div class="row event-ro">
            <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12">
              <div class="event-box">
                <img src="${srcPath}/imgs/events/1.png" />
                <h4 class="p">
                  아이들을 위한 교육 지원
                </h4>
                <p class="raises">
                  <span>
                    Raised :
                    <i class="fas fa-won-sign"></i> 34,425 /
                    <i class="fas fa-won-sign"></i> 500,000
                  </span>
                </p>
                <p class="desic">
                  아이들의 미래를 밝게 할 수 있는 교육 기회를 제공하고, 빈곤 지역의 교육 인프라를 개선하기 위해 노력합니다.
                </p>
              </div>
            </div>
            <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12">
              <div class="event-box">
                <img src="${srcPath}/imgs/events/2.png" />
                <h4 class="p">
                  환경 보호와 지구를 위한 노력
                </h4>
                <p class="raises">
                  <span>
                    Raised :
                    <i class="fas fa-won-sign"></i> 52,425 /
                    <i class="fas fa-won-sign"></i> 1,000,000
                  </span>
                </p>
                <p class="desic">
                  지구의 자원과 환경을 보호하며, 지속 가능한 에너지와 산업 발전을 추구합니다.
                </p>
              </div>
            </div>
            <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12">
              <div class="event-box">
                <img src="${srcPath}/imgs/events/3.png" />
                <h4 class="p">
                  건강한 삶을 지원하는 의료 발전
                </h4>
                <p class="raises">
                  <span>
                    Raised :
                    <i class="fas fa-won-sign"></i> 2,425 /
                    <i class="fas fa-won-sign"></i> 50,000
                  </span>
                </p>
                <p class="desic">
                  건강한 삶을 누리기 위해 의료 시설과 기술의 개선, 그리고 의료 서비스에 대한 접근성을 확대하는데 기여합니다.
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>
    <br /><br />

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

  </body>
</html>
