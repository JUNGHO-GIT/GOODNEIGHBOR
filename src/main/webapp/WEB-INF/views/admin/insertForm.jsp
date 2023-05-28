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
      <form method="POST" action="${ctxPath}/admin/insertPro.do">

        <!----------------------------------------------------------------------------------------->
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <h2 class="text-center my-4 p">
              <i class="fas fa-user-edit" style="color: #32be85;"></i>
              <b class="ms-1">관리자 회원가입</b>
            </h2>
          </div>
        </div>

        <!----------------------------------------------------------------------------------------->
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <div class="mb-3 text-left">
              <label for="admin_id" class="form-label">아이디</label>
              <div class="input-group">
                <input type="text" name="admin_id" id="admin_id" class="form-control" placeholder="6-12자의 영문 대소문자, 숫자" />
                <button type="button" class="btn btn-primary btn-sm" id="admin_id_button" onclick="return confirmAdminIdCheck();">ID중복 체크</button>
              </div>
              <div id="olmessage" class="form-text"></div>
            </div>
            <div class="mb-3 text-left">
              <label for="admin_pw" class="form-label">비밀번호</label>
              <input type="password" class="form-control" name="admin_pw" id="admin_pw" size="20" placeholder="8~15자리의 영문 대소문자, 숫자, 특수문자" />
              <div id="password-error" class="form-text" style="color:red;"></div>
            </div>
            <div class="mb-3 text-left">
              <label for="admin_pw2" class="form-label">비밀번호 재입력</label>
              <input type="password" class="form-control" name="admin_pw2" id="admin_pw2" size="20" onblur="return confirmAdminPwCheck();" />
            </div>
            <div class="mb-3 text-left">
              <label for="admin_name" class="form-label">이름</label>
              <input type="text" class="form-control" name="admin_name" id="admin_name" size="20" value="관리자" readonly />
            </div>
            <div class="mb-3 text-left">
              <label for="admin_tel" class="form-label">전화번호</label>
              <input type="text" class="form-control" name="admin_tel" id="admin_tel" size="30" placeholder="휴대폰 번호 입력('-'제외)" onblur="return confirmAdminTelCheck();" />
            </div>
          </div>
        </div>
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <div class="mb-3 text-center">
              <button type="submit" class="btn btn-primary btn-sm" onclick="return adminCheck()">가입하기</button>
            </div>
          </div>
        </div>
      </form>
    </main><br /><br />

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

  </body>
</html>
