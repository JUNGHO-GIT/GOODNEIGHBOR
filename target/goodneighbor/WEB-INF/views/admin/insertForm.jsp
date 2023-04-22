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
      <div class="row justify-content-center">
        <div class="col-12 col-md-8">
          <h1 class="text-center">관리자 회원가입</h1>
          <form method="POST" action="${ctxpath}/admin/insertPro.do" onsubmit="return adminCheck()">
            <div class="mb-3">
              <label for="admin_id" class="form-label">아이디</label>
              <div class="input-group">
                <input type="text" name="admin_id" id="admin_id" class="form-control" placeholder="6-12자의 영문 대소문자, 숫자"/>
                <button type="button" class="btn btn-primary" id="admin_id_button" onclick="confirmAdminIdCheck(); return false;">ID중복 체크</button>
              </div>
              <div id="olmessage" class="form-text"></div>
            </div>
            <div class="mb-3">
              <label for="admin_pw" class="form-label">비밀번호</label>
              <input type="password" class="form-control" name="admin_pw" id="admin_pw" size="20" placeholder="8~15자리의 영문 대소문자, 숫자, 특수문자"/>
              <div id="password-error" class="form-text" style="color:red;"></div>
            </div>
            <div class="mb-3">
              <label for="admin_pw2" class="form-label">비밀번호 재입력</label>
              <input type="password" class="form-control" name="admin_pw2" id="admin_pw2" size="20" onblur="confirmAdminPwCheck(); return false;"/>
            </div>
            <div class="mb-3">
              <label for="admin_name" class="form-label">이름</label>
              <input type="text" class="form-control" name="admin_name" id="admin_name" size="20" value="관리자" readonly>
            </div>
            <div class="mb-3">
              <label for="admin_tel" class="form-label">전화번호</label>
              <input type="text" class="form-control" name="admin_tel" id="admin_tel" size="30" placeholder="휴대폰 번호 입력('-'제외)" onblur="confirmTelCheck(); return false;"/>
            </div>
            <div class="text-center">
              <input type="submit" value="가입하기" class="btn btn-primary"/>
            </div>
          </form>
        </div>
      </div>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>