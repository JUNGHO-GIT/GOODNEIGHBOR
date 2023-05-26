<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources" />

<!DOCTYPE html>
<html lang="en, ko">

<head>
  <jsp:include page="/WEB-INF/views/common/head.jsp" />
</head>

<body>

  <jsp:include page="/WEB-INF/views/common/header.jsp" />
  <jsp:include page="/WEB-INF/views/common/slider.jsp" />

  <main class="main container-fluid">
    <h2>Q&A 게시글 작성</h2>

    <form name="writeFrom" method="POST" action="${ctxPath}/qna/insertPro.do"
      onsubmit="return qnaCheck()">
      <input type="hidden" name="qna_number" value="${qna_number}">
      <input type="hidden" name="qna_step" value="${qna_step}">
      <input type="hidden" name="qna_level" value="${qna_level}">
      <input type="hidden" name="qna_group" value="${qna_group}">
      <div class="table-responsive">
        <table class="table table-bordered">
          <tbody>
            <tr>
              <td>글쓴이</td>
              <td>
                <input type="text" class="form-control" name="qna_writer" id="writer" size="30" />
              </td>
            </tr>
            <tr>
              <td>글제목</td>
              <td>
                <input type="text" class="form-control" name="qna_title" id="title" size="50" />
              </td>
            </tr>
            <tr>
              <td>글내용</td>
              <td>
                <textarea class="form-control" name="qna_content" id="content" rows="10"></textarea>
              </td>
            </tr>
            <tr>
              <td>암호</td>
              <td>
                <input type="password" class="form-control" name="qna_pw" id="pw" size="20" />
              </td>
            </tr>
            <tr>
              <td colspan="2" class="text-center">
                <input type="submit" class="btn btn-primary btn-sm me-2" value="작성하기" />
                <input type="button" class="btn btn-primary btn-sm" value="취소" onclick="window.location.href='${ctxPath}/qna/list.do'" />
              </td>
            </tr>
          </tbody>
        </table>

      </div>
    </form>

  </main><br /><br />

  <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>