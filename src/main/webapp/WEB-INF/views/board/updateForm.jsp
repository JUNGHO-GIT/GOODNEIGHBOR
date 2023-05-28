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
       <form name="updateForm" method="POST" action="${ctxPath}/board/updatePro.do">

        <!----------------------------------------------------------------------------------------->
        <input type="hidden" name="board_number" id="board_number" value="${dto.board_number}" />
        <input type="hidden" name="board_group" id="board_group" value="${dto.board_group}" />
        <input type="hidden" name="board_step" id="board_step" value="${dto.board_step}" />
        <input type="hidden" name="board_level" id="board_level" value="${dto.board_level}" />
        <input type="hidden" name="pageNum" id="pageNum" value="${pageNum}" />
        <input type="hidden" name="board_pw1" id="board_pw1" value="${dto.board_pw}" />

        <!---------------------------------------------------------------------------------------->
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <h2 class="text-center my-4 p">
              <i class="fas fa-users" style="color: #32be85;"></i>
              <b class="ms-1">글 수정 하기</b>
            </h2>
          </div>
        </div>
        <hr class="green-line"/>

        <!---------------------------------------------------------------------------------------->
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
           <div class="mb-3 text-left">
              <label for="board_title" class="form-label">글제목</label>
              <input type="text" name="board_title" id="board_title" value="${dto.board_title}" class="form-control" />
            </div>
            <div class="mb-3 text-left">
              <label for="board_writer" class="form-label">글쓴이</label>
              <input type="text" name="board_writer" id="board_writer" value="${dto.board_writer}" class="form-control" readonly/>
              <input type="hidden" name="board_number" value="${dto.board_number}" />
            </div>
            <div class="mb-3 text-left">
              <label for="board_content" class="form-label">글내용</label>
              <textarea name="board_content" id="board_content" rows="10" cols="47" class="form-control">${dto.board_content}</textarea>
            </div>
          </div>
        </div>
        <br/><br/>

        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <div class="mb-3 text-center">
              <button type="submit" class="btn btn-primary btn-sm" onclick="return boardCheck();">글수정</button>
              <button type="button" onclick="window.location.href='${ctxPath}/board/list.do'" class="btn btn-primary btn-sm">글목록</button>
            </div>
          </div>
        </div>

      </form>
    </main><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>