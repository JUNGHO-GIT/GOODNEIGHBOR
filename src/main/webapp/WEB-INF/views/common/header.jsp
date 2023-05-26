<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources" />

<!------------------------------------------------------------------------------------------------->
<header class="container-fluid">
  <div class="header-top">

    <!--------------------------------------------------------------------------------------------->
    <div class="row">
      <div class="col-xl-6 col-lg-6 d-lg-block d-none">
        <ul class="ulleft">
          <li><i class="far fa-envelope"></i> www.GOODNEIGHBOR.com <span>|</span></li>
          <li><i class="fas fa-phone-volume"></i> 010-1234-5678</li>
        </ul>
        <ul class="ulleft">
          <form name="getUpdate" method="POST">
            <input type="hidden" name="member_id" value="${member_id}" />
          </form>
        </ul>
      </div>
      <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-xs-12 col-12 btn-bhed">
        <c:if test="${member_id == null && admin_id == null}">
          <button class="btn btn-sm btn-success" onclick="window.location.href='${ctxPath}/member/loginForm.do'">로그인</button>
          <button class="btn btn-sm btn-success" onclick="window.location.href='${ctxPath}/member/insertForm.do'">회원가입</button>
          <button class="btn btn-sm btn-success" onclick="window.location.href='${ctxPath}/admin/loginForm.do'">관리자</button>
        </c:if>
        <c:if test="${member_id != null}">
          <form method="POST" action="${ctxPath}/member/getUpdate.do">
            <input type="hidden" name="member_name" value="${member_name}" />
            <button class="btn btn-sm btn-success" onclick="window.location.href='${ctxPath}/member/logout.do'" type="button">로그아웃</button>
            <button class="btn btn-sm btn-default" type="submit">내정보 변경</button>
          </form>
        </c:if>
        <c:if test="${admin_id != null}">
          <button class="btn btn-sm btn-success" onclick="window.location.href='${ctxPath}/admin/logout.do'">로그아웃</button>
          <button class="btn btn-sm btn-default" onclick="window.location.href='${ctxPath}/product/listProduct'">상품관리</button>
        </c:if>
      </div>
    </div>
  </div>

  <div class="header-bottom">
    <div class="container">
      <div class="row">
        <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12 col-12 logo-col">
          <a href="${ctxPath}">
            <img src="${ctxPath}/resources/imgs/etc/main.png" height="60" />
          </a>
          <a data-toggle="collapse" data-target="#menu" href="#menu">
            <i class="fas d-block d-lg-none small-menu fa-bars"></i>
          </a>
        </div>
        <div id="menu" class="col-lg-9 col-md-12 d-none d-lg-block nav-col">
          <ul class="navbad">
            <li class="nav-item">
              <a class="nav-link" href="${ctxPath}"> 홈 </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${ctxPath}/board/list.do"> 블로그 </a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="${ctxPath}/notice/list.do"> 공지사항 </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${ctxPath}/qna/list.do"> Q&A </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${ctxPath}/contact/contact"> Contact </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</header>
