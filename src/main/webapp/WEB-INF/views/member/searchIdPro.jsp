<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources" />
<c:set var="member_id" value="${sessionScope.member_id}"/>
<c:set var="admin_id" value="${sessionScope.admin_id}"/>
<input type="hidden" id="member_id" value="${sessionScope.member_id}" />
<input type="hidden" id="admin_id" value="${sessionScope.admin_id}" />
<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}" />

<!DOCTYPE html>
<html lang="en, ko">

  <!----------------------------------------------------------------------------------------------->
  <head>
    <jsp:include page="/WEB-INF/views/common/head.jsp" />
  </head>

  <!----------------------------------------------------------------------------------------------->
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <jsp:include page="/WEB-INF/views/common/slider.jsp" />

    <!--------------------------------------------------------------------------------------------->
    <main class="main container-fluid">

      <!------------------------------------------------------------------------------------------->
      <div class="row d-flex justify-content-center text-center align-items-center">
        <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
          <h1 class="text-center my-4 p">아이디 찾기</h1>
        </div>
      </div>
      <hr />

      <!------------------------------------------------------------------------------------------->
      <div class="row d-flex justify-content-center text-center align-items-center">
        <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
          <div id="result" class="text-center my-4">
            <c:choose>
              <c:when test="${empty dto}">
                <h3>조회결과가 없습니다.</h3>
              </c:when>
              <c:otherwise>
                <h3><b>${dto.member_name}</b>님의 아이디는 <b>${dto.member_id}</b> 입니다.</h3>
              </c:otherwise>
            </c:choose>
          </div>
        </div>
      </div>
      <br /><br />

      <!------------------------------------------------------------------------------------------->
      <div class="row d-flex justify-content-center text-center align-items-center">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12">
          <div class="mb-3 text-center">
            <button type="button" class="btn btn-primary btn-sm me-2" onclick="window.location.href='${ctxPath}/member/loginForm.do'">로그인</button>
            &nbsp;&nbsp;
            <button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='${ctxPath}'">메인화면으로</button>
          </div>
        </div>
      </div>
    </main>
    <br /><br />

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

  </body>
</html>
