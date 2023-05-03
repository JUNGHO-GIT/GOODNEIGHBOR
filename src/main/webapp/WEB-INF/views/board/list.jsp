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
    <%
      String keyField = "";
      String keyWord = "";

      if(request.getParameter("keyWord") != null) {
        keyField = request.getParameter("keyField");
        keyWord = request.getParameter("keyWord");
      }

      if(request.getParameter("reload") != null) {
        if(request.getParameter("reload").equals("true")) {
          keyWord = "";
          keyField = "";
        }
      }
    %>
  </head>

  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/slider.jsp"/>

    <main class="main container-fluid w-50 mx-auto">
      <h2 class="text-center">게시판</h2>

      <div class="d-flex justify-content-end mb-3">
        <c:if test="${member_id != null || admin_id != null}">
          <a href="${ctxPath}/board/writeForm.do" class="btn btn-primary">글쓰기</a>
        </c:if>
      </div>

      <div class="alert alert-danger text-center" role="alert" id="no_search">
        <c:if test="${pt.cnt == 0}">
          게시된 글이 없습니다.
        </c:if>
      </div>

      <c:if test="${pt.cnt > 0}">
        <table class="table table-striped table-hover" id="board">
          <thead>
            <tr>
              <th scope="col">글번호</th>
              <th scope="col">글제목</th>
              <th scope="col">작성자</th>
              <th scope="col">작성일</th>
              <th scope="col">조회수</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="dto" items="${list}">
              <tr>
                <td align="center" height="100px">${number}<c:set var="number" value="${number-1}"/>
                </td>
                <td align="left" class="d-flex">
                  <c:if test="${dto.board_level>0}">
                    <img src="../resources/imgs/level.gif" width="${5*dto.board_level}" class="me-2"/>
                    <img src="../resources/imgs/re.gif" class="me-2"/>
                  </c:if>
                  <a href="${ctxPath}/board/content.do?board_number=${dto.board_number}&pageNum=${pageNum}" height="16" id="none_color" class="text-decoration-none">${dto.board_title}
                  </a>
                  <c:if test="${dto.board_readcount>=10}">
                    <img src="../resources/imgs/hot.gif" class="ms-2"/>
                  </c:if>
                </td>
                <td align="center">${dto.board_writer}</td>
                <td align="center"><fmt:formatDate value="${dto.board_regdate}" pattern="yyyy/MM/dd"/>
                </td>
                <td align="center">${dto.board_readcount}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </c:if>

      <form name="searchForm" method="GET" action="list.do">
        <div class="input-group my-3">
          <select class="form-select" name="keyField" id="select_option">
            <option value="board_title">제목</option>
            <option value="board_writer">이름</option>
            <option value="board_content">내용</option>
          </select>
          <input class="form-control" type="text" name="keyWord" size="16" placeholder="검색어를 입력하세요."/>
          <button class="btn btn-primary" type="submit" onclick="return searchBoardCheck();">검색</button>
          <input type="hidden" name="page" value="0" />
        </div>
      </form>

      <form name="listForm" method="POST">
        <input type="hidden" name="reload" value="true"/>
        <input type="hidden" name="nowBlock" value="0"/>
      </form>

      <div class="d-flex justify-content-center mt-4">
        <c:if test="${pt.cnt > 0}">
          <div class="d-flex align-items-center">
            <c:if test="${pt.startPage > 10}">
              <a class="btn btn-outline-primary" href="${ctxPath}/board/list.do?pageNum=${pt.startPage-10}">이전블럭</a>
            </c:if>

            <c:forEach var="i" begin="${pt.startPage}" end="${pt.endPage}">
              <a class="btn btn-outline-primary mx-1" href="${ctxPath}/board/list.do?pageNum=[${i}]&keyWord=${keyWord}&keyField=${keyField}">[${i}]</a>
            </c:forEach>

            <c:if test="${pt.endPage < pt.pageCnt}">
              <a class="btn btn-outline-primary" href="${ctxPath}/board/list.do?pageNum=${pt.startPage+10}">다음블럭</a>
            </c:if>
          </div>
        </c:if>
      </div>

    </main><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>