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
		<% String cookie = ""; Cookie[] cookies = request.getCookies(); %>
	</head>

	<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/slider.jsp"/>

    <main class="main container-fluid">
      <form name="loginForm" method="POST" action="${ctxPath}/member/loginPro.do">
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <h2 class="text-center my-4 p">
              <i class="fas fa-user-edit" style="color: #32be85;"></i>
              <b class="ms-1">로그인</b>
            </h2>
          </div>
        </div>
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <div class="mb-3">
              <input type="text" id="member_id" name="member_id" class="form-control" size="30" value="<%=cookie%>" placeholder="아이디"/>
            </div>
            <div class="mb-3">
              <input type="password" id="member_pw" name="member_pw" class="form-control" size="30" placeholder="비밀번호"/>
            </div>
            <div class="mb-3 form-check">
              <input type="checkbox" name="rememberId" value="true" class="form-check-input"/>
              <label class="form-check-label" for="rememberId">아이디 저장</label>
            </div>
          </div>
        </div>
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <div class="mb-3 text-center">
              <button type="submit" id="submit_button" class="btn btn-primary btn-sm" onclick="return loginCheck()">로그인</button>
              &nbsp;&nbsp;
              <button type="button" onclick="window.location.href='${ctxPath}/member/searchIdForm.do'" class="btn btn-primary btn-sm">아이디 찾기</button>
              &nbsp;&nbsp;
              <button type="button" onclick="window.location.href='${ctxPath}/member/searchPwForm.do'" class="btn btn-primary btn-sm">비밀번호 찾기</button>
            </div>
          </div>
        </div>
      </form>

    </main><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>