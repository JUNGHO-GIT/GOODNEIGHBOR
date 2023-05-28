<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources" />
<c:set var="member_id" value="${sessionScope.member_id}"/>
<c:set var="admin_id" value="${sessionScope.admin_id}"/>
<input type="hidden" id="member_id" name="member_id" value="${sessionScope.member_id}" />
<input type="hidden" id="admin_id" name="admin_id" value="${sessionScope.admin_id}" />
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
      <form name="updateForm" method="POST" action="${ctxPath}/notice/updatePro.do">

        <!----------------------------------------------------------------------------------------->
        <input type="hidden" name="notice_number" id="notice_number" value="${dto.notice_number}"/>
        <input type="hidden" name="notice_group" id="notice_group" value="${dto.notice_group}"/>
        <input type="hidden" name="notice_step" id="notice_step" value="${dto.notice_step}"/>
        <input type="hidden" name="notice_level" id="notice_level" value="${dto.notice_level}"/>
        <input type="hidden" name="pageNum" id="pageNum" value="${pageNum}"/>

        <!---------------------------------------------------------------------------------------->
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <h2 class="text-center my-4 p">
              <i class="fas fa-exclamation-circle"></i>
              <b class="ms-1">글 수정</b>
            </h2>
          </div>
        </div>
        <hr class="green-line"/>

        <!---------------------------------------------------------------------------------------->
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <div class="mb-3 text-left">
              <label for="notice_title" class="form-label">글제목</label>
              <input type="text" class="form-control" name="notice_title" id="notice_title" value="${dto.notice_title}"/>
            </div>
            <div class="mb-3 text-left">
              <label for="notice_writer" class="form-label">작성자</label>
              <input type="text" class="form-control" name="notice_writer" id="notice_writer" value="${dto.notice_writer}" readonly="readonly"/>
            </div>
            <div class="mb-3 text-left">
              <label for="notice_content" class="form-label">글내용</label>
              <textarea class="form-control" name="notice_content" id="notice_content" rows="10">${dto.notice_content}</textarea>
            </div>
          </div>
        </div>
        <br/><br/>

        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <div class="mb-3 text-center">
              <button type="submit" class="btn btn-primary btn-sm ms-2" onsubmit="return noticeCheck()">글수정</button>
              <button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='${ctxPath}/notice/list.do'">취소</button>
            </div>
          </div>
        </div>

        </form>
      </main><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>