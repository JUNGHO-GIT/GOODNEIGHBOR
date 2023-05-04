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

    <main class="main container-fluid w-50 mx-auto">

      <div id="result" class="text-center my-4">
        <c:choose>
          <c:when test="${empty dto}">
            <h1>조회결과가 없습니다.</h1>
          </c:when>
          <c:otherwise>
            <h1>${dto.member_name}님이 설정하신 비밀번호는 ${dto.member_pw} 입니다.</h1>
          </c:otherwise>
        </c:choose>
      </div>

      <div class="d-flex justify-content-center">
        <input type="button" class="btn btn-primary btn-sm me-2" value="로그인" onclick="window.location.href='${ctxPath}/member/loginForm.do'" />
        &nbsp;&nbsp;
        <input type="button" class="btn btn-primary btn-sm" value="메인화면으로" onclick="window.location.href='${ctxPath}'" />
      </div>

    </main><br/><br/><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>