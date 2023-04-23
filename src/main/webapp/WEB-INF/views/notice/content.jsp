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

      <div class="text-center my-4">
        <h1>공지사항</h1>
      </div>

      <table class="table table-bordered">
        <tr>
          <td colspan="7" class="fw-bold" style="background-color: #C8E6C9;">${dto.notice_title}</td>
        </tr>
        <tr>
          <td class="text-center" width="150">작성자</td>
          <td colspan="2" width="700">${dto.notice_writer}</td>
          <td colspan="3" class="text-end" width="150">조회수</td>
          <td width="200">${dto.notice_readcount}</td>
        </tr>
        <tr>
          <td colspan="7" class="pre-wrap">${dto.notice_content}</td>
        </tr>
      </table>

      <div class="d-flex justify-content-end">
        <c:if test="${admin_id  != null}">
          <a class="btn btn-primary me-1" href="${ctxPath}/notice/editForm.do?notice_number=${dto.notice_number}&pageNum=${pageNum}">글수정</a>
          <c:if test="${dto.notice_fix==false}">
            <a class="btn btn-danger me-1" href="${ctxPath}/notice/deletePro.do?notice_number=${dto.notice_number}&pageNum=${pageNum}">글삭제</a>
          </c:if>
          <c:if test="${dto.notice_fix==true}">
            <a class="btn btn-danger me-1" href="${ctxPath}/notice/deletePro.do?notice_number=${dto.notice_number}">글삭제</a>
          </c:if>
          <a class="btn btn-primary me-1" href="${ctxPath}/notice/insertForm.do">글쓰기</a>
        </c:if>
        <a class="btn btn-primary" href="${ctxPath}/notice/list.do">리스트</a>
      </div>

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>