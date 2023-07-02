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
      <form action="${ctxPath}/qna/updatePro.do" method="POST">

        <!----------------------------------------------------------------------------------------->
        <input type="hidden" name="qna_number" id="qna_number" value="${dto.qna_number}" />
        <input type="hidden" name="qna_group" id="qna_group" value="${dto.qna_group}" />
        <input type="hidden" name="qna_step" id="qna_step" value="${dto.qna_step}" />
        <input type="hidden" name="qna_level" id="qna_level" value="${dto.qna_level}" />
        <input type="hidden" name="pageNum" id="pageNum" value="${pageNum}" />

        <!---------------------------------------------------------------------------------------->
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-6 col-lg-6 col-md-6 col-sm-10 col-xs-10 col-10">
            <h2 class="text-center my-4 p">
              <i class="fas fa-question-circle" style="color: #32be85;"></i>
              <b class="ms-1">QnA 수정</b>
            </h2>
          </div>
        </div>
        <hr class="green-line"/>

        <!---------------------------------------------------------------------------------------->
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-6 col-lg-6 col-md-6 col-sm-10 col-xs-10 col-10">
            <div class="mb-3 text-left">
              <label for="board_title" class="form-label">글제목</label>
              <input type="text" class="form-control" id="board_title" name="qna_title" value="${dto.qna_title}" size="50" />
            </div>
            <div class="mb-3 text-left">
              <label for="board_writer" class="form-label">글쓴이</label>
              <input type="text" class="form-control" id="board_writer" name="qna_writer" value="${dto.qna_writer}" size="30" readonly />
              <input type="hidden" name="qna_number" value="${dto.qna_number}" />
            </div>
            <div class="mb-3 text-left">
              <label for="board_content" class="form-label">글내용</label>
              <textarea class="form-control" id="board_content" name="qna_content" rows="10" cols="47">${dto.qna_content}</textarea>
            </div>
          </div>
        </div>
        <br/><br/>

        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-6 col-lg-6 col-md-6 col-sm-10 col-xs-10 col-10">
            <div class="mb-3 text-center">
              <button type="submit" class="btn btn-primary btn-sm" onclick="return qnaCheck()">글수정</button>
              <button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='${ctxPath}/qna/list.do'">취소</button>
            </div>
          </div>
        </div>

      </form>
    </main><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>