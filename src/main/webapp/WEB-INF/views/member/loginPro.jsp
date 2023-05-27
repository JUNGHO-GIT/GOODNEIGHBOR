<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources"/>
<c:set var="member_id" value="${sessionScope.member_id}"/>

<!DOCTYPE html>
<html lang="en, ko">

	<head>
    <jsp:include page="/WEB-INF/views/common/head.jsp"/>
	</head>

	<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/slider.jsp"/>

    <main class="main container">

      <c:set var="member_id" value="${dto.member_id}" scope="session"/>
      <c:set var="member_name" value="${dto.member_name}" scope="session"/>
      <script>
        alert("${member_name}님 환영합니다.");
      </script>
      <meta http-equiv="Refresh" content="0;url=${ctxPath}"/>

    </main><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>