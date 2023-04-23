<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources"/>

<!-- footer ----------------------------------------------------------------------------------->
<footer class="footer">
  <div class="copy">
    <div class="container">
      2023 &copy; All Rights Reserved | Designed and Developed by goodneighbor.
      <span>
        <a>
          <i class="fab fa-facebook-square" onclick="location.href='https://ko-kr.facebook.com'" style="cursor: pointer;"></i>
        </a>
        <a>
          <i class="fab fa-twitter-square" onclick="location.href='https://twitter.com/?lang=ko'" style="cursor: pointer;"></i>
        </a>
        <a>
          <i class="fab fa-instagram" onclick="location.href='https://www.instagram.com/'"  style="cursor: pointer;"></i>
        </a>
      </span>
    </div>
  </div>
</footer>
<!-- /.footer -->