<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources"/>
<c:set var="member_id" value="${sessionScope.member_id}"/>
<c:set var="admin_id" value="${sessionScope.admin_id}"/>
<input type="hidden" id="member_id" value="${sessionScope.member_id}" />
<input type="hidden" id="admin_id" value="${sessionScope.admin_id}" />
<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}" />

<!-- Html ----------------------------------------------------------------------------------------->
<!doctype html>
<html lang="en, ko">

  <!-- Head --------------------------------------------------------------------------------------->
  <head>
    <jsp:include page="/WEB-INF/views/common/head.jsp"/>
	</head>

	<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/slider.jsp"/>

    <main class="main container-fluid">

      <!-- Contact -------------------------------------------------------------------------------->
      <div style="margin-top:0px;" class="row no-margin">
        <iframe style="width:100%"
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.8596255976184!2d126.9769430153173!3d37.56629597978841!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2f3176c9891%3A0x17c7136eaa0f8b83!2z7ISc7Jq47Yq567OE7IucIOyEseyjvOq1rCDslYrquLjsnZgg!5e0!3m2!1sen!2skr!4v1620059665300!5m2!1sen!2skr"
          height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
      </div>
      <div class="row contact-rooo no-margin">
        <div class="container">
          <div class="row">
            <div style="padding:20px" class="col-sm-7">
              <h2>Contact Form</h2> <br>
              <div class="row cont-row">
                <div class="col-sm-3">
                  <label>Name</label>
                  <span>:</span>
                </div>
                <div class="col-sm-8"> <input type="text" placeholder="en, koter Name" name="name"
                class="form-control input-sm">
                </div>
              </div>
              <div class="row cont-row">
                <div class="col-sm-3">
                  <label>Address</label>
                  <span>:</span>
                </div>
                <div class="col-sm-8">
                  <input type="text" name="name" placeholder="en, koter Email Address" class="form-control input-sm">
                </div>
              </div>
              <div class="row cont-row">
                <div class="col-sm-3">
                  <label>Number</label>
                  <span>:</span>
                </div>
                <div class="col-sm-8">
                  <input type="text" name="name" placeholder="en, koter Mobile Number" class="form-control input-sm">
                </div>
              </div>
              <div class="row cont-row">
                <div class="col-sm-3">
                  <label>Message</label>
                  <span>:</span>
                </div>
                <div class="col-sm-8">
                  <textarea rows="5" placeholder="en, koter Your Mi" class="form-control input-sm">
                  </textarea>
                </div>
              </div>
              <div style="margin-top:10px; margin-left:25px; align-items: center; justify-content: center;" class="row">
                <div class="col-sm-8">
                  <button class="btn btn-primary btn-sm" onclick="window.location.href='/GOODNEIGHBOR'"> Send Message </button>
                </div>
              </div>
            </div>
            <div style="padding:20px" class="col-sm-5">
              <div class="serv">
                <h2> Address </h2> <br>
                Antonya Street, <br/><br/>
                23/H-2, Building <br/><br/>
                TA, AUS District <br/><br/>
                Phone : +91 9159669599 <br/><br/>
                Email : support@smarteyeapps.com <br/><br/>
                Website : www.smarteyeapps.com.com <br/><br/>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- /.section -->

    </main><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>