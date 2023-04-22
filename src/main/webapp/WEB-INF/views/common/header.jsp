<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}"/>
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources"/>

<!-- Header --------------------------------------------------------------------------------------->
<header class="container-fluid">
  <div class="header-top">
    <div class="container">
      <div class="row col-det">

        <div class="col-lg-6 d-none d-lg-block">
          <ul class="ulleft">
            <li>
              <i class="far fa-envelope"></i> www.goodneighbor.com <span>|</span>
            </li>
            <li>
              <i class="fas fa-phone-volume"></i> 010-1234-5678
            </li>
          </ul>
        </div>

        <div class="col-lg-3 col-md-6 follows">
          <ul class="ulright">
            <form name="updateMember" method="post">
              <input type="hidden" name="member_id" value="${member_id}"/>
            </form>
            <li> <i class="fab fa-facebook-square" onclick="location.href='https://ko-kr.facebook.com'"></i> </li>
            <li> <i class="fab fa-twitter-square" onclick="location.href='https://twitter.com/?lang=ko'"></i> </li>
            <li> <i class="fab fa-instagram" onclick="location.href='https://www.instagram.com/'"></i> </li>
            <li> <i class="fab fa-linkedin"></i> </li>
          </ul>
        </div>

        <!-- 로그인 x -->
        <c:if test="${member_id == null && admin_id == null}">
          <div class="col-lg-3 d-none d-md-block col-md-6 btn-bhed">
            <button class="btn btn-sm btn-success" onclick="location.href='${ctxpath}/member/loginForm.do'">
              로그인
            </button>
            <button class="btn btn-sm btn-default" onclick="location.href='${ctxpath}/member/insertForm.do'">
              회원가입
            </button>
          </div>
        </c:if>

        <!-- 로그인 o -->
        <c:if test="${member_id != null}">
          <div class="col-lg-3 d-none d-md-block col-md-6 btn-bhed">
            <form method="post" action="${ctxpath}/member/updateMember.do">
              <input type="hidden" name="member_name" value="${member_name}"/>
              <button class="btn btn-sm btn-success" onclick="location.href='${ctxpath}/member/logOut.do'" type="button">로그아웃</button>
              <button class="btn btn-sm btn-default" type="submit">내정보 변경</button>
            </form>
          </div>
        </c:if>

        <!-- 관리자 로그인 o -->
        <c:if test="${admin_id != null}">
          <div class="col-lg-3 d-none d-md-block col-md-6 btn-bhed">
            ${admin_name}님 어서오세요&nbsp;
            <button class="btn btn-sm btn-success" onclick="location.href='${ctxpath}/admin/logOut.do'">
              로그아웃
            </button>
            <button class="btn btn-sm btn-default" onclick="location.href='${ctxpath}/product/listProduct'">
              상품관리
            </button>
          </div>
        </c:if>

      </div>
    </div>

  </div>
  <div id="menu-jk" class="header-bottom">
    <div class="container">
      <div class="row nav-row">
        <div class="col-lg-3 col-md-12 logo">
          <a href="${ctxpath}">
            <img src="${ctxpath}/resources/imgs/etc/main.png" height="60"/>
            <a data-toggle="collapse" data-target="#menu" href="#menu">
              <i class="fas d-block d-lg-none  small-menu fa-bars"></i>
            </a>
          </a>
        </div>
        <div id="menu" class="col-lg-9 col-md-12 d-none d-lg-block nav-col">
          <ul class="navbad">
            <li class="nav-item">
              <a class="nav-link" href="${ctxpath}">
                홈
              </a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="${ctxpath}/notice/list.do">
                공지사항
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${ctxpath}/board/list.do">
                블로그
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${ctxpath}/product/listProduct.do">
                후원하기
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${ctxpath}/qna/list.do">
                Q&A
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>

  </div>
</header>
<!-- /.header -->