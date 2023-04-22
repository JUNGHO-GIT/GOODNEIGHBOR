<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}"/>
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
      <c:if test="${board_number==0}">
        <h2 class="mb-4">글쓰기</h2>
      </c:if>
      <c:if test="${board_number!=0}">
        <h2 class="mb-4">답글쓰기</h2>
      </c:if>

      <form method="post" name="writeForm" action="${ctxpath}/board/writePro.do" onsubmit="return writeSave()">
        <input type="hidden" name="board_number" value="${board_number}" />
        <input type="hidden" name="board_ref" value="${board_ref}" />
        <input type="hidden" name="board_re_step" value="${board_re_step}" />
        <input type="hidden" name="board_re_level" value="${board_re_level}" />

        <div class="row mb-3">
          <label for="board_writer" class="col-sm-2 col-form-label">글쓴이</label>
          <div class="col-sm-10">
            <input type="text" name="board_writer" id="board_writer" size="30" class="form-control" />
          </div>
        </div>

        <div class="row mb-3">
          <label for="board_subject" class="col-sm-2 col-form-label">글제목</label>
          <div class="col-sm-10">
            <!-- 원글 -->
            <c:if test="${board_number==0}">
              <input type="text" name="board_subject" id="board_subject" size="40" class="form-control" />
            </c:if>
            <!--  답글 -->
            <c:if test="${board_number!=0}">
              <input type="text" name="board_subject" id="board_subject" size="40" value="[답변]" class="form-control" />
            </c:if>
          </div>
        </div>

        <div class="row mb-3">
          <label for="board_content" class="col-sm-2 col-form-label">글내용</label>
          <div class="col-sm-10">
            <textarea name="board_content" id="board_content" rows="10" cols="40" class="form-control"></textarea>
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
            <input type="submit" value="글쓰기" class="btn btn-primary" />
            <input type="button" value="글목록" onclick="location='${ctxpath}/board/list.do'" class="btn btn-outline-primary" />
          </div>
        </div>
      </form>

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>
