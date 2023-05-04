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
  <jsp:include page="/WEB-INF/views/common/header.jsp" />
  <jsp:include page="/WEB-INF/views/common/slider.jsp" />

  <main class="main container-fluid">
    <div class="row">
      <div class="col-12 col-md-8 col-lg-6 mx-auto">
        <div class="text-center my-4">
          <h1>게시판</h1>
        </div>
        <c:if test="${member_id != null || admin_id != null}">
          <div class="d-flex justify-content-end mb-3">
            <a href="${ctxPath}/board/insertForm.do" class="btn btn-primary btn-sm">글쓰기</a>
          </div>
        </c:if>
        <c:if test="${pt.cnt == 0}">
          <div class="alert alert-danger text-center" role="alert" id="no_search">
            게시된 글이 없습니다.
          </div>
        </c:if>
        <c:if test="${pt.cnt > 0}">
          <div class="table-responsive">
            <table class="table table-bordered table-striped">
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
                    <td>${number}
                      <c:set var="number" value="${number-1}" />
                    </td>
                    <td>
                      <c:if test="${dto.board_level>0}">
                        <img src="${ctxPath}/resources/imgs/etc/level.gif" height="50" width="70"
                          class="mb-2">
                        <b>[답글]</b>
                      </c:if>
                      <a href="${ctxPath}/board/content.do?board_number=${dto.board_number}&pageNum=${pageNum}"
                        height="16" id="none_color" class="text-decoration-none linkHover">
                        ${dto.board_title}
                      </a>
                      <c:if test="${dto.board_readcount>=10}">
                        <img src="${ctxPath}/resources/imgs/etc/hot.gif" class="ms-2" />
                      </c:if>
                    </td>
                    <td>${dto.board_writer}</td>
                    <td>
                      <fmt:formatDate value="${dto.board_regdate}" pattern="yyyy/MM/dd" />
                    </td>
                    <td>${dto.board_readcount}</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </c:if>

        <form name="searchForm" method="GET" action="${ctxPath}/board/list.do" class="mb-4">
          <div class="input-group">
            <select class="form-select" name="keyField" id="select_option">
              <option value="board_title">제목</option>
              <option value="board_writer">이름</option>
              <option value="board_content">내용</option>
            </select>
            <input class="form-control" type="text" name="keyWord" placeholder="검색어를 입력하세요." />
            <input type="hidden" name="pageNum" value="1" />
            <button class="btn btn-primary btn-sm" type="submit"
              onclick="return searchBoardCheck();">검색</button>
          </div>

          <input type="hidden" name="reload" value="true" />
          <input type="hidden" name="nowBlock" value="0" />
        </form>

        <div class="d-flex justify-content-center">
          <c:if test="${pt.cnt > 0}">
            <nav aria-label="Page navigation">
              <ul class="pagination">
                <c:if test="${pt.startPage>10}">
                  <li class="page-item"><a class="page-link"
                      href="${ctxPath}/board/list.do?pageNum=${pt.startPage-10}">이전블럭</a></li>
                </c:if>
                <c:forEach var="i" begin="${pt.startPage}" end="${pt.endPage}">
                  <li class="page-item"><a class="page-link"
                      href="${ctxPath}/board/list.do?pageNum=${i}">${i}</a></li>
                </c:forEach>
                <c:if test="${pt.endPage<pt.pageCnt}">
                  <li class="page-item"><a class="page-link"
                      href="${ctxPath}/board/list.do?pageNum=${pt.startPage+10}">다음블럭</a></li>
                </c:if>
              </ul>
            </nav>
          </c:if>
        </div>

      </div>
    </div>

  </main><br /><br />

  <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>