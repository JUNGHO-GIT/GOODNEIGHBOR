<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}"/>
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources"/>
<% @include file="../module/pathVariable.jsp" %>

<!DOCTYPE html>
<html lang="en, ko">

	<head>
    <jsp:include page="/WEB-INF/views/common/head.jsp"/>
  </head>

  <body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/slider.jsp"/>

    <main class="main container-fluid w-50 mx-auto">
      <div class="row justify-content-center">
        <div class="col-12 col-md-8">
          <h2 class="text-center">게시물 비밀번호를 입력해주세요</h2>
          <form method="post" action="${ctxpath}/qna/content.do" onsubmit="return pwcheck()">
            <div class="mb-3">
              <label for="pw" class="form-label">비밀번호</label>
              <input type="password" name="qna_pw" id="pw" class="form-control" size="30"/>
              <input type="hidden" name="qna_number" value="${dto.qna_number}"/>
              <input type="hidden" id="pw2" value="${dto.qna_pw}"/>
              <input type="hidden" name="pageNum" value="${pageNum}"/>
            </div>
            <div class="text-center">
              <input type="submit" value="입력" class="btn btn-primary"/>
              <input type="button" value="취소" onclick="location='${ctxpath}/qna/list.do?pageNum=${pageNum}'" class="btn btn-primary"/>
            </div>
          </form>
        </div>
      </div>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>