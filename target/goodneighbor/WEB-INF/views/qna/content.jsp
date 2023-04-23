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

      <h1 class="text-center">QNA</h1>

      <div class="table-responsive">
        <table class="table table-bordered">
          <thead>
            <tr>
              <th colspan="2" class="text-center">${dto.qna_title}</th>
            </tr>
          </thead>
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
              <td><fmt:formatDate value="${dto.qna_regdate}" pattern="yyyy-MM-dd"/></td>
            </tr>
            <tr>
              <td colspan="2">
                <pre>${dto.qna_content}</pre>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="d-flex justify-content-end">
        <c:if test="${member_id  != null}">
          <input type="button" class="btn btn-primary me-2" value="글수정" onclick="location='${ctxPath}/qna/editForm.do?qna_number=${dto.qna_number}&pageNum=${pageNum}'"/>
          <input type="button" class="btn btn-danger me-2" value="글삭제" onclick="location='${ctxPath}/qna/deleteForm.do?qna_number=${dto.qna_number}&pageNum=${pageNum}'"/>
        </c:if>
        <input type="button" class="btn btn-success me-2" value="새글쓰기" onclick="location='${ctxPath}/qna/insertForm.do'"/>
        <c:if test="${admin_id != null}">
          <input type="button" class="btn btn-info me-2" value="답변작성" onclick="location='${ctxPath}/qna/insertForm.do?qna_number=${dto.qna_number}&qna_ref=${dto.qna_ref}&qna_step=${dto.qna_step}&qna_level=${dto.qna_level}&qna_pw=${dto.qna_pw}'"/>
        </c:if>
        <input type="button" class="btn btn-primary" value="리스트" onclick="location='${ctxPath}/qna/list.do?pageNum=${pageNum}'"/>
      </div>

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>