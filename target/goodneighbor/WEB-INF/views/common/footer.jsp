<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}"/>
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources"/>

<!-- footer ----------------------------------------------------------------------------------->
<footer class="footer">
  <div class="copy">
    <div class="container">
      <a href="${ctxpath}/admin/loginForm.do">관리자</a>
        2023 &copy; All Rights Reserved | Designed and Developed by Smarteyeapps
      <span>
        <a> <i class="fab fa-github"></i> </a>
        <a> <i class="fab fa-google-plus-g"></i> </a>
        <a> <i class="fab fa-pinterest-p"></i> </a>
        <a> <i class="fab fa-twitter"></i> </a>
        <a> <i class="fab fa-facebook-f"></i> </a>
      </span>
    </div>
  </div>
</footer>
<!-- /.footer -->