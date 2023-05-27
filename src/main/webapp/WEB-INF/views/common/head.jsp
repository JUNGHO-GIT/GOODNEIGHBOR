<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources"/>
<c:set var="member_id" value="${sessionScope.member_id}"/>

<!-- meta -->
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

<!-- link 1 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.2/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"/>

<!-- link 2 -->
<link rel="shortcut icon" href="${srcPath}/imgs/etc/favicon.ico" type="image/x-icon"/>
<link rel="stylesheet" href="${srcPath}/css/style.css"/>
<link rel="stylesheet" href="${srcPath}/css/jungho.css"/>
<link rel="stylesheet" href="${srcPath}/css/media.css"/>

<!-- script 1 -->
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.7/umd/popper.min.js">
</script>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.2/js/bootstrap.min.js">
</script>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/ScrollToFixed/1.0.8/jquery-scrolltofixed-min.js"></script>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
</script>
<script defer src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- script 2 -->
<script defer src="${srcPath}/js/admin.js"></script>
<script defer src="${srcPath}/js/main.js"></script>
<script defer src="${srcPath}/js/qna.js"></script>
<script defer src="${srcPath}/js/notice.js"></script>
<script defer src="${srcPath}/js/member.js"></script>
<script defer src="${srcPath}/js/board.js"></script>

<!-- script 3 -->
<script>
  function hoverIn(event) {
    event.target.style.color = "#3cc88f";
    event.target.style.fontWeight = "800";
    event.target.style.cursor = "pointer";
  }

  function hoverOut(event) {
    event.target.style.color = "black";
    event.target.style.fontWeight = "normal";
    event.target.style.cursor = "auto";
  }

  function applyHoverEffect() {
    const elements = document.getElementsByClassName("linkHover");
    for (let i = 0; i < elements.length; i++) {
      elements[i].addEventListener("mouseover", hoverIn);
      elements[i].addEventListener("mouseout", hoverOut);
    }
  }
  document.addEventListener("DOMContentLoaded", applyHoverEffect);
</script>
