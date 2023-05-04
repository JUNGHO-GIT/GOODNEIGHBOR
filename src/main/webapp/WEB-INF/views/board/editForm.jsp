<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources"/>

<!DOCTYPE html>
<html lang="en, ko">

	<head>
    <jsp:include page="/WEB-INF/views/common/head.jsp"/>
  </head>

  <body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/slider.jsp"/>

    <main class="main container-fluid w-50 mx-auto">
      <h2 class="mb-4">글 수정 폼</h2>
      <form name="editForm" method="POST" action="${ctxPath}/board/editPro.do" onsubmit="return boardWriteSave();">
        <input type="hidden" name="board_pw1" id="board_pw1" value="${dto.board_pw}" />
        <div class="row mb-3">
          <label for="board_writer" class="col-sm-2 col-form-label">글쓴이</label>
          <div class="col-sm-10">
            <input type="text" name="board_writer" id="board_writer" value="${dto.board_writer}" class="form-control" />
            <input type="hidden" name="board_number" value="${dto.board_number}" />
          </div>
        </div>
        <div class="row mb-3">
          <label for="board_title" class="col-sm-2 col-form-label">글제목</label>
          <div class="col-sm-10">
            <input type="text" name="board_title" id="board_title" value="${dto.board_title}" class="form-control" />
          </div>
        </div>
        <div class="row mb-3">
          <label for="board_content" class="col-sm-2 col-form-label">글내용</label>
          <div class="col-sm-10">
            <textarea name="board_content" id="board_content" rows="10" cols="47" class="form-control">${dto.board_content}</textarea>
          </div>
        </div>
        <div class="row mb-3">
          <label for="board_pw" class="col-sm-2 col-form-label">암호</label>
          <div class="col-sm-10">
            <input type="password" name="board_pw" id="board_pw" size="20" class="form-control" />
            <span class="text-danger">*암호는 필수 입력</span>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-sm-10 offset-sm-2">
            <input type="submit" value="글수정" class="btn btn-primary btn-sm" />
            <input type="button" value="글목록" onclick="window.location.href='${ctxPath}/board/list.do'" class="btn btn-primary btn-sm" />
          </div>
        </div>
      </form>
    </main><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>