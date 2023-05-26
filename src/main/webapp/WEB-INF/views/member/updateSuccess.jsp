<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources"/>

<c:set var="member_id" value="${dto.member_id}" scope="session"/>
<c:set var="member_name" value="${dto.member_name}" scope="session"/>

<script>
  function updateSuccess(){
    alert("회원정보가 수정되었습니다.");
    window.location.href="${ctxPath}/";
  }
</script>

