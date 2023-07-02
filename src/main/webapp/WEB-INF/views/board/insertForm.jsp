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
      <form method="POST" name="insertForm" action="${ctxPath}/board/insertPro.do">

        <!----------------------------------------------------------------------------------------->
        <input type="hidden" name="board_number" id="board_number" value="${board_number}" />
        <input type="hidden" name="board_group" id="board_group" value="${board_group}" />
        <input type="hidden" name="board_step" id="board_step" value="${board_step}" />
        <input type="hidden" name="board_level" id="board_level" value="${board_level}" />
        <input type="hidden" name="pageNum" id="pageNum" value="${pageNum}" />

        <!---------------------------------------------------------------------------------------->
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-6 col-lg-6 col-md-6 col-sm-10 col-xs-10 col-10">
            <c:if test="${board_number==0}">
              <h2 class="text-center my-4 p">
                <i class="fas fa-users" style="color: #32be85;"></i>
                <b class="ms-1">글쓰기</b>
              </h1>
            </c:if>
            <c:if test="${board_number!=0}">
              <h2 class="text-center my-4 p">
                <i class="fas fa-users" style="color: #32be85;"></i>
                <b class="ms-1">답글쓰기</b>
              </h1>
            </c:if>
          </div>
        </div>
        <hr class="green-line"/>

        <!----------------------------------------------------------------------------------------->
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-6 col-lg-6 col-md-6 col-sm-10 col-xs-10 col-10">
            <div class="mb-3 text-left">
              <label for="board_title" class="form-label">글제목</label>
              <!-- 원글 -->
              <c:if test="${board_number==0}">
                <input type="text" name="board_title" id="board_title" size="40" class="form-control" />
              </c:if>
              <!--  답글 -->
              <c:if test="${board_number!=0}">
                <input type="text" name="board_title" id="board_title" size="40" class="form-control" />
              </c:if>
            </div>
            <div class="mb-3 text-left">
              <label for="board_writer" class="form-label">글쓴이</label>
              <input type="text" name="board_writer" id="board_writer" size="30" class="form-control" value="${member_id}" readonly/>
            </div>
            <div class="mb-3 text-left">
              <label for="board_content"  class="form-label">글내용</label>
              <textarea name="board_content" id="board_content" rows="10" cols="40" class="form-control"></textarea>
            </div>
            <div class="mb-3 text-left">
              <label for="board_pw" class="form-label">암호</label>
              <input type="password" name="board_pw" id="board_pw" size="20" class="form-control" />
              <span class="text-danger">*암호는 필수 입력</span>
            </div>
          </div>
        </div>
        <br/><br/>

        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-6 col-lg-6 col-md-6 col-sm-10 col-xs-10 col-10">
            <div class="mb-3 text-center">
              <button type="submit" value="글쓰기" class="btn btn-primary btn-sm" onclick="return boardCheck();">글쓰기</button>
              <button type="button" value="글목록" onclick="window.location.href='${ctxPath}/board/list.do'" class="btn btn-primary btn-sm">글목록</button>
            </div>
          </div>
        </div>
      </form>

    </main><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>
