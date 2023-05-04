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

    <main class="main container-fluid w-50 mx-auto">

      <h1 class="text-center my-4">로그인</h1>
      <form name="loginForm" method="POST" action="${ctxPath}/member/loginPro.do" onsubmit="return memberIdPwCheck()">
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
        <div class="mb-3">
          <input type="button" onclick="window.location.href='${ctxPath}/member/search_id.do'" value="아이디 찾기" class="btn btn-primary btn-sm" />
          &nbsp;&nbsp;
          <input type="button" onclick="window.location.href='${ctxPath}/member/search_pwd.do'" value="비밀번호 찾기" class="btn btn-primary btn-sm" />
          &nbsp;&nbsp;
          <input type="submit" id="submit_button" class="btn btn-primary btn-sm" value="로그인"/>
        </div>
      </form>

    </main><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>