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

      <h2>Q&A 게시글 수정</h2>
      <form name="writeFrom" method="POST" action="${ctxPath}/qna/editPro.do" onsubmit="return qnaCheck()">
        <table border="1">
          <tr>
            <td>글쓴이</td>
            <td>
              <input type="text" name="qna_writer" id="writer" value="${dto.qna_writer}" size="30"/>
              <input type="hidden" name="qna_number" value="${dto.qna_number}"/>
              <input type="hidden" name="pageNum" value="${pageNum}"/>
            </td>
          </tr>
          <tr>
            <td>글제목</td>
            <td>
              <input type="text" name="qna_title" id="title" value="${dto.qna_title}" size="50"/>
            </td>
          </tr>
          <tr>
            <td>글내용</td>
            <td>
              <textarea name="qna_content" id="content" rows="10" cols="47">${dto.qna_content}
              </textarea>
            </td>
          </tr>
          <tr>
            <td>암호</td>
            <td>
              <input type="password" name="qna_pw" id="pw" size="20"/>
              <input type="hidden" id="pw2" value="${dto.qna_pw}"/>
            </td>
          </tr>
          <tr>
            <td colspan="2" align="center">
              <input type="submit" value="글수정" onclick="return qnaPwCheck()"/>
              <input type="button" value="취소" onclick="location='${ctxPath}/qna/list.do'"/>
            </td>
          </tr>
        </table>
      </form>

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>