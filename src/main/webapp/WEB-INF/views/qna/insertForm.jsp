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
      <h2>Q&A 게시글 수정</h2>

      <form name="writeFrom" method="post" action="${ctxpath}/qna/editPro.do" onsubmit="return check()">
        <div class="table-responsive">

          <table class="table table-bordered">
            <tbody>
              <tr>
                <th>글쓴이</th>
                <td>
                  <input type="text" class="form-control" name="qna_writer" id="writer" value="${dto.qna_writer}" size="30"/>
                  <input type="hidden" name="qna_number" value="${dto.qna_number}"/>
                  <input type="hidden" name="pageNum" value="${pageNum}"/>
                </td>
              </tr>
              <tr>
                <th>글제목</th>
                <td>
                  <input type="text" class="form-control" name="qna_title" id="title" value="${dto.qna_title}" size="50"/>
                </td>
              </tr>
              <tr>
                <th>글내용</th>
                <td>
                  <textarea class="form-control" name="qna_content" id="content" rows="10">${dto.qna_content}</textarea>
                </td>
              </tr>
              <tr>
                <th>암호</th>
                <td>
                  <input type="password" class="form-control" name="qna_pw" id="pw" size="20"/>
                  <input type="hidden" id="pw2" value="${dto.qna_pw}"/>
                </td>
              </tr>
              <tr>
                <td colspan="2" class="text-center">
                  <input type="submit" class="btn btn-primary me-2" value="글수정" onclick="return pwcheck()"/>
                  <input type="button" class="btn btn-primary" value="취소" onclick="location='${ctxpath}/qna/list.do'"/>
                </td>
              </tr>
            </tbody>
          </table>

        </div>
      </form>

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>