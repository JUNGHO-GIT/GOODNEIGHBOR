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

  <main class="main container-fluid w-50 mx-auto">
    <div class="text-center my-4">
      <h1>Q&A 게시판</h1>
    </div>

    <c:if test="${member_id != null || admin_id  != null}">
      <div class="d-flex justify-content-end mb-3">
        <a href="${ctxPath}/qna/insertForm.do" class="btn btn-primary btn-sm">글쓰기</a>
      </div>
    </c:if>
    <c:if test="${pt.cnt==0}">
      <div class="alert alert-danger text-center" role="alert" id="no_search">
        게시된 글이 없습니다
      </div>
    </c:if>
    <c:if test="${pt.cnt > 0}">
      <div class="table-responsive">
        <table class="table table-bordered table-striped">
          <thead>
            <tr>
              <td style="width: 100px">번호</td>
              <td style="width: auto">글제목</td>
              <td style="width: 100px">작성자</td>
              <td style="width: 100px">작성일</td>
              <td style="width: 100px">조회수</td>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="dto" items="${list}">
              <tr>
                <td>${number}
                  <c:set var="number" value="${number-1}" />
                </td>
                <td>
                  <c:if test="${dto.qna_level>0}">
                    <img src="${ctxPath}/resources/imgs/etc/level.gif" width="${5*dto.qna_level}" height="16" />
                    <b>[답변]</b>
                  </c:if>
                  <c:if test="${dto.qna_level==0}">
                    <img src="${ctxPath}/resources/imgs/etc/level.gif" width="${5*dto.qna_level}" height="16" />
                  </c:if>
                  <c:if test="${admin_id != null}">
                    <a href="${ctxPath}/qna/content.do?qna_number=${dto.qna_number}&qna_pw=${dto.qna_pw}&pageNum=${pageNum}" class="text-decoration-none linkHover">${dto.qna_title}</a>
                  </c:if>
                  <c:if test="${admin_id == null}">
                    <a href="${ctxPath}/qna/secretForm.do?qna_number=${dto.qna_number}&qna_pw=${dto.qna_pw}&pageNum=${pageNum}" class="text-decoration-none linkHover">
                      <img src="${ctxPath}/resources/imgs/etc/lock.png" width="25" height="25" />
                      비밀글입니다.<br/>${dto.qna_title}
                      <input type="hidden" name="qna_title" value="${dto.qna_title}" />
                    </a>
                  </c:if>
                </td>
                <td>${dto.qna_writer}</td>
                <td>
                  <fmt:formatDate value="${dto.qna_regdate}" pattern="yyyy-MM-dd" />
                </td>
                <td>${dto.qna_readcount}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </c:if>

    <form name="searchForm" method="GET" action="${ctxPath}/qna/list.do" class="mb-4">
      <div class="input-group">
        <select name="keyField" class="form-select" id="select_option">
          <option value="qna_title">제목</option>
          <option value="qna_content">내용</option>
        </select>
        <input class="form-control" type="text" name="keyWord" placeholder="검색어를 입력하세요" />
        <input type="hidden" name="pageNum" value="1" />
        <button type="button" class="btn btn-primary btn-sm" onclick="return qnaSearchCheck()">검색</button>
      </div>
    </form>

    <div class="d-flex justify-content-center">
      <c:if test="${pt.cnt>0}">
        <nav aria-label="Page navigation">
          <ul class="pagination">
            <c:if test="${pt.startPage>10}">
              <li class="page-item"><a class="page-link"
                href="${ctxPath}/qna/list.do?pageNum=${pt.startPage-10}">이전블럭</a></li>
            </c:if>
            <c:forEach var="i" begin="${pt.startPage}" end="${pt.endPage}">
              <li class="page-item"><a class="page-link"
                href="${ctxPath}/qna/list.do?pageNum=${i}">${i}</a></li>
            </c:forEach>
            <c:if test="${pt.endPage<pt.pageCnt}">
              <li class="page-item"><a class="page-link"
                href="${ctxPath}/qna/list.do?pageNum=${pt.startPage+10}">다음블럭</a></li>
            </c:if>
          </ul>
        </nav>
      </c:if>
    </div>

  </main><br /><br />

  <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>