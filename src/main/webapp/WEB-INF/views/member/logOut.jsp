<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources"/>

<c:remove var="member_id" scope="session"/>
<c:remove var="member_name" scope="session"/>

<script>
  function logoutSuccess(){
    alert("로그아웃 되었습니다.");
    window.location.href="${ctxPath}/";
  }
</script>