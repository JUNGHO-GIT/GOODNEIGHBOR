<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources" />

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
      <form name="searchPw" id="searchPw" method="POST">
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-6 col-lg-6 col-md-6 col-sm-10 col-xs-10 col-10">
            <h2 class="text-center my-4 p">
              <i class="fas fa-user-edit" style="color: #32be85;"></i>
              <b class="ms-1">비밀번호 찾기</b>
            </h2>
          </div>
        </div>
        <hr class="green-line"/>

        <!----------------------------------------------------------------------------------------->
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-6 col-lg-6 col-md-6 col-sm-10 col-xs-10 col-10">
            <div class="ms-3 mb-3 text-left">
              <input type="radio" id="search_tel" class="form-check-input" name="search_method" onclick="setSearchMethod('tel');" />
              <label for="search_tel" class="form-check-label text-left p">
                휴대전화 번호로 비밀번호 찾기
              </label>
            </div>
            <div class="mb-3 text-left">
              <label for="search_tel_id" class="form-label">아이디</label>
              <input type="text" name="search_tel_id" id="search_tel_id" size="20" class="form-control" />
            </div>
            <div class="mb-3 text-left">
              <label for="search_tel_name" class="form-label">이름</label>
              <input type="text" name="search_tel_name" id="search_tel_name" size="20" class="form-control" />
            </div>
            <div class="mb-3 text-left">
              <label for="search_tel_number" class="form-label">휴대전화</label>
              <input type="text" name="search_tel_number" id="search_tel_number" size="20" class="form-control" />
            </div>
          </div>
        </div>

        <hr class="green-line"/>

        <!----------------------------------------------------------------------------------------->
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-6 col-lg-6 col-md-6 col-sm-10 col-xs-10 col-10">
           <div class="ms-3 mb-3 text-left">
              <input type="radio" id="search_email" class="form-check-input" name="search_method" onclick="setSearchMethod('email');" />
              <label for="search_email" class="form-check-label text-left p">
                이메일로 비밀번호 찾기
              </label>
            </div>
            <div class="mb-3 text-left">
              <label for="search_email_id" class="form-label">아이디</label>
              <input type="text" name="search_email_id" id="search_email_id" size="20" class="form-control" />
            </div>
            <div class="mb-3 text-left">
              <label for="search_email_name" class="form-label">이름</label>
              <input type="text" name="search_email_name" id="search_email_name" size="20" class="form-control" />
            </div>
            <div class="mb-3 text-left">
              <label for="search_email_domain" class="form-label">이메일</label>
              <input type="text" name="search_email_domain" id="search_email_domain" size="20" class="form-control" />
            </div>
          </div>
        </div>

        <!----------------------------------------------------------------------------------------->
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12">
            <div class="mb-3 text-center">
              <button type="button" name="search" class="btn btn-primary btn-sm"
              onclick="searchPwCheck();">비밀번호 찾기</button>
            </div>
          </div>
        </div>

      </form>
    </main><br /><br />

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

  </body>
</html>
