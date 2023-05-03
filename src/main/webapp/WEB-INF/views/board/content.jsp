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
      <h1 class="text-center">자유게시판</h1>

      <div class="table-responsive w-50 mx-auto">
        <table class="table table-bordered" id="content_table">
          <thead>
            <tr>
              <th class="td_subject">작성일</th>
              <td><fmt:formatDate value="${dto.board_regdate}" pattern="yyyy-MM-dd"/></td>
              <th class="td_subject">작성자</th>
              <td colspan="2">${dto.board_writer}</td>
              <th class="td_subject">조회수 </th>
              <td>${dto.board_readcount}</td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td colspan="7" class="text-center" id="content_subject">${dto.board_title}</td>
            </tr>
            <tr>
              <td colspan="7" id="subject" height="400px">
                <pre font-family="Pretendard-Regular">${dto.board_content}</pre>
              </td>
            </tr>
            <tr>
              <td colspan="7" align="right" id="buttons">
                <button class="btn btn-outline-secondary" onclick="location='${ctxPath}/board/updateForm.do?board_number=${dto.board_number}&pageNum=${pageNum}'">글수정</button>
                <button class="btn btn-outline-secondary" onclick="location='${ctxPath}/board/deletePro.do?board_number=${dto.board_number}&pageNum=${pageNum}'">글삭제</button>
                <button class="btn btn-outline-secondary" onclick="location='${ctxPath}/board/writeForm.do'">새글쓰기</button>
                <button class="btn btn-outline-secondary" onclick="location='${ctxPath}/board/writeForm.do?board_number=${dto.board_number}&board_ref=${dto.board_ref}&board_step=${dto.board_step}&board_level=${dto.board_level}'">답글쓰기</button>
                <button class="btn btn-outline-secondary" onclick="location='${ctxPath}/board/list.do?pageNum=${pageNum}'">리스트</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </main><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>