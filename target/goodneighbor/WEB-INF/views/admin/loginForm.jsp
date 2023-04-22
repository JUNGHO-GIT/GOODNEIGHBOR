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
        <div class="col-12 col-md-6">
          <c:remove var="member_id" scope="session"/>
          <c:remove var="member_name" scope="session"/>

          <form action="${ctxpath}/admin/loginPro.do" method="post" name="adminlogin" onsubmit="return adminIdPwCheck()"  >
            <h2 class="text-center admin">관리자 로그인</h2>
            <div class="mb-3">
              <input type="text" name="admin_id" id="admin_id" class="form-control" placeholder="아이디 입력"/>
            </div>
            <div class="mb-3">
              <input type="password" name="admin_pw" id="admin_pw" class="form-control" placeholder="비밀번호 입력"/>
            </div>
            <div class="text-center mb-3">
              <input type="submit" id="submit_button" value="로그인" class="btn btn-primary"/>
            </div>
            <div class="text-center">
              <input type="button" value="관리자 회원가입" class="btn btn-primary" onclick="location='${ctxpath}/admin/insertForm.do'"/>
            </div>
          </form>

        </div>
      </div>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>