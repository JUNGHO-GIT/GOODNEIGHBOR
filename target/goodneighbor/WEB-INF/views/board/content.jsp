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
      <div class="container mt-5">
        <div class="text-center mb-4">
          <h1>자유게시판</h1>
        </div>
        <div class="card">
          <div class="card-header text-center">
            ${dto.board_title}
          </div>
          <div class="card-body">
            <table class="table table-sm">
              <tbody>
                <tr>
                  <th scope="row">작성일</th>
                  <td>
                    <fmt:formatDate value="${dto.board_regdate}" pattern="yyyy-MM-dd" />
                    <input type="hidden" id="board_number" value="${dto.board_number}" />
                  </td>
                </tr>
                <tr>
                  <th scope="row">작성자</th>
                  <td>${dto.board_writer}</td>
                </tr>
                <tr>
                  <th scope="row">조회수</th>
                  <td>${dto.board_readcount}</td>
                </tr>
                <tr>
                  <th scope="row">내용</th>
                  <td class="pre-wrap">${dto.board_content}</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <div class="d-flex justify-content-center mt-5">
        <button class="btn btn btn-primary btn-sm me-2" onclick="window.location.href='${ctxPath}/board/editForm.do?board_number=${dto.board_number}&pageNum=${pageNum}'">글수정</button>
        <button class="btn btn btn-primary btn-sm me-2" onclick="return deleteCheck();">글삭제</button>
        <button class="btn btn btn-primary btn-sm me-2" onclick="window.location.href='${ctxPath}/board/insertForm.do'">새글쓰기</button>
        <button class="btn btn btn-primary btn-sm me-2" onclick="window.location.href='${ctxPath}/board/insertForm.do?board_number=${dto.board_number}&board_group=${dto.board_group}&board_step=${dto.board_step}&board_level=${dto.board_level}'">답글쓰기</button>
        <button class="btn btn btn-primary btn-sm me-2" onclick="window.location.href='${ctxPath}/board/list.do?pageNum=${pageNum}'">리스트</button>
      </div>
    </main><br /><br />

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>