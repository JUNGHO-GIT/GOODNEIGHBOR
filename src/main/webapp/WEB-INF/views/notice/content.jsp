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

  <main class="main container-fluid w-50 mx-auto">

    <div class="container mt-5">
      <div class="text-center my-4">
        <h1>공지사항</h1>
      </div>

      <div class="card">
        <div class="card-header text-center">
          ${dto.notice_title}
        </div>
        <div class="card-body">
          <table class="table table-sm">
            <tbody>
              <tr>
                <th scope="row">작성자</th>
                <td>${dto.notice_writer}</td>
              </tr>
              <tr>
                <th scope="row">조회수</th>
                <td>${dto.notice_readcount}</td>
              </tr>
              <tr>
                <th scope="row">내용</th>
                <td class="pre-wrap">${dto.notice_content}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div><br /><br />

    <div class="d-flex justify-content-center mt-5">
      <c:if test="${admin_id  != null}">
        <a class="btn btn-primary btn-sm me-2"
          href="${ctxPath}/notice/editForm.do?notice_number=${dto.notice_number}&pageNum=${pageNum}">글수정</a>
        <c:if test="${dto.notice_fix==false}">
          <a class="btn btn-danger me-1"
            href="${ctxPath}/notice/deletePro.do?notice_number=${dto.notice_number}&pageNum=${pageNum}">글삭제</a>
        </c:if>
        <c:if test="${dto.notice_fix==true}">
          <a class="btn btn-danger me-1"
            href="${ctxPath}/notice/deletePro.do?notice_number=${dto.notice_number}">글삭제</a>
        </c:if>
        <a class="btn btn-primary btn-sm me-2" href="${ctxPath}/notice/insertForm.do">글쓰기</a>
      </c:if>
      <a class="btn btn-primary btn-sm" href="${ctxPath}/notice/list.do">리스트</a>
    </div>

  </main><br /><br />

  <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>