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
      <form name="searchPw" action="${ctxPath}/member/searchPw1Form.do" method="POST">
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <h1 class="text-center my-4 p">비밀번호 찾기</h1>
          </div>
        </div>
        <hr class="mb-3" />

        <!----------------------------------------------------------------------------------------->
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <div class="ms-3 mb-3 text-left">
              <input type="text" class="form-control" name="searchPw1Form_id" id="searchPw1Form_id" placeholder="아이디를 입력하세요" />
            </div>
          </div>
        </div>

        <!----------------------------------------------------------------------------------------->
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12">
            <div class="mb-3 text-center">
              <button type="submit" name="search"class="btn btn-primary btn-sm" onclick="return findPwCheck();">다음</button>
            </div>
          </div>
        </div>
      </form>
    </main><br/><br/><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>