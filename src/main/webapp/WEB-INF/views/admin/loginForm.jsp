<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources"/>
<c:set var="member_id" value="${sessionScope.member_id}"/>
<c:set var="admin_id" value="${sessionScope.admin_id}"/>
<input type="hidden" id="member_id" name="member_id" value="${sessionScope.member_id}" />
<input type="hidden" id="admin_id" name="admin_id" value="${sessionScope.admin_id}" />
<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}" />
<c:remove var="member_id" scope="session"/>
<c:remove var="member_name" scope="session"/>

<!DOCTYPE html>
<html lang="en, ko">

  <head>
    <jsp:include page="/WEB-INF/views/common/head.jsp"/>
  </head>

  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/slider.jsp"/>

    <main class="main container-fluid">
      <form action="${ctxPath}/admin/loginPro.do" method="POST" name="adminlogin">
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-6 col-lg-6 col-md-6 col-sm-10 col-xs-10 col-10">
            <h2 class="text-center my-4 p">
              <i class="fas fa-user-edit" style="color: #32be85;"></i>
              <b class="ms-1">관리자 로그인</b>
            </h2>
          </div>
        </div>
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-6 col-lg-6 col-md-6 col-sm-10 col-xs-10 col-10">
            <div class="mb-3">
              <input type="text" name="admin_id" id="admin_id" class="form-control" placeholder="아이디 입력"/>
            </div>
            <div class="mb-3">
              <input type="password" name="admin_pw" id="admin_pw" class="form-control" placeholder="비밀번호 입력"/>
            </div>
          </div>
        </div>
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-6 col-lg-6 col-md-6 col-sm-10 col-xs-10 col-10">
            <div class="mb-3">
              <button type="submit" id="submit_button" class="btn btn-primary btn-sm"  onclick="return adminIdPwCheck()">로그인</button>
              <button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='${ctxPath}/admin/insertForm.do'">회원가입</button>
            </div>
          </div>
        </div>
      </form>

    </main><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>