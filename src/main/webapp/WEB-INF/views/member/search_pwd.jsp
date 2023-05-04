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

    <main class="main container-fluid w-50 mx-auto mb-10">

      <form name="pw_search" action="${ctxPath}/member/search_pwd.do" method="POST" onsubmit="return findPwCheck()" class="row g-3 d-flex justify-content-center">

        <div class="col-md-12 text-center" id="write">
          <h1>아이디를 입력하세요</h1>
        </div><br/><br/>

        <div class="col-md-6 text-center">
          <input type="text" class="form-control" name="writeID_search_pw" id="writeID_search_pw" placeholder="아이디를 입력하세요" />
        </div>

        <div class="col-md-12 text-center">
          <input type="submit" name="search" value="다음" class="btn btn-primary btn-sm" />
        </div>

      </form>
    </main><br/><br/><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>