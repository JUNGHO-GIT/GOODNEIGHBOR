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
      <div class="text-center mb-4">
        <h1>QNA</h1>
      </div>
      <div class="card">
        <div class="card-header" align="center">
          ${dto.qna_title}
        </div>
        <div class="card-body">
          <table class="table table-sm">
            <tbody>
              <tr>
                <th scope="row">작성자</th>
                <td>${dto.qna_writer}</td>
              </tr>
              <tr>
                <th scope="row">조회수</th>
                <td>${dto.qna_readcount}</td>
              </tr>
              <tr>
                <th scope="row">작성일</th>
                <td>
                  <fmt:formatDate value="${dto.qna_regdate}" pattern="yyyy-MM-dd" />
                </td>
              </tr>
              <tr>
                <th scope="row">내용</th>
                <td>${dto.qna_content}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div><br/><br/>

    <div class="d-flex justify-content-center mt-5">
      <c:if test="${member_id  != null}">
        <input type="button" class="btn btn-primary btn-sm me-2" value="글수정"
          onclick="window.location.href='${ctxPath}/qna/editForm.do?qna_number=${dto.qna_number}&pageNum=${pageNum}'" />
        <input type="button" class="btn btn-danger btn-sm me-2" value="글삭제"
          onclick="window.location.href='${ctxPath}/qna/deleteForm.do?qna_number=${dto.qna_number}&pageNum=${pageNum}'" />
      </c:if>
      &nbsp;&nbsp;
      <input type="button" class="btn btn-primary btn-sm me-2" value="새글쓰기"
        onclick="window.location.href='${ctxPath}/qna/insertForm.do'" />
      &nbsp;&nbsp;
      <c:if test="${admin_id != null}">
        <input type="button" class="btn btn-primary btn-sm me-2" value="답변작성"
          onclick="window.location.href='${ctxPath}/qna/insertForm.do?qna_number=${dto.qna_number}&qna_group=${dto.qna_group}&qna_step=${dto.qna_step}&qna_level=${dto.qna_level}&qna_pw=${dto.qna_pw}'" />
      </c:if>
      <input type="button" class="btn btn-primary btn-sm" value="리스트"
        onclick="window.location.href='${ctxPath}/qna/list.do?pageNum=${pageNum}'" />
      &nbsp;&nbsp;
    </div>

  </main><br /><br />

  <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>