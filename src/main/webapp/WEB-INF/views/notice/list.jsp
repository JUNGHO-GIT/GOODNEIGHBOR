<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources" />
<c:set var="member_id" value="${sessionScope.member_id}"/>
<c:set var="admin_id" value="${sessionScope.admin_id}"/>
<input type="hidden" id="member_id" value="${sessionScope.member_id}" />
<input type="hidden" id="admin_id" value="${sessionScope.admin_id}" />
<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}" />

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

    <div class="row d-flex justify-content-center text-center align-items-center">
      <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
        <c:if test="${pt.cnt==0}">
          <div class="alert alert-danger text-center" role="alert" id="no_search">
            게시된 글이 없습니다
          </div>
        </c:if>
        <c:if test="${pt.cnt > 0}">
          <div class="table-responsive mt-4">
            <table class="table table-hover table-bordered">
              <thead>
                <h1 class="p">공지사항</h1>
              </thead>
              <br/><br/>
              <tbody>
                <c:forEach var="dto" items="${list}">
                  <tr style="border-top: 2px solid #ddd;">
                    <td width="10%" align="left">
                      ${number}
                      <c:set var="number" value="${number-1}" />
                    </td>
                    <td width="60%" align="left">
                      <a href="${ctxPath}/notice/content.do?notice_number=${dto.notice_number}&pageNum=${pageNum}" class="text-decoration-none linkHover">
                        ${dto.notice_title}
                      </a>
                      <br/><br/>
                      <i class="fas fa-user"></i>
                      &nbsp;&nbsp;
                      <c:out value="${dto.notice_writer}" />
                    </td>
                    <td width="30%" align="left">
                      <i class="far fa-clock"></i>
                      &nbsp;&nbsp;
                      <fmt:formatDate value="${dto.notice_regdate}" pattern="MM-dd" />
                      <br/><br/>
                      <i class="fas fa-eye"></i>
                      &nbsp;&nbsp;
                      <c:out value="${dto.notice_readcount}" />
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </c:if>
      </div>
    </div>

    <div class="row d-flex justify-content-center text-center align-items-center mt-5">
      <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-xs-6 col-6">
        <form name="searchForm" method="GET" action="${ctxPath}/notice/list.do" class="mb-4">
          <div class="input-group">
            <select name="keyField" class="form-select" id="select_option">
              <option value="notice_title">제목</option>
              <option value="notice_content">내용</option>
            </select>
            <input class="form-control" type="text" name="keyWord" placeholder="검색어를 입력하세요" />
            <input type="hidden" name="pageNum" value="1" />
            <button type="button" class="btn btn-primary btn-sm" onclick="return noticeSearchCheck();">검색</button>
          </div>
        </form>
      </div>
    </div>

    <div class="row d-flex justify-content-center text-center align-items-center">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12">
        <c:if test="${admin_id != null}">
          <a href="${ctxPath}/notice/insertForm.do" class="btn btn-primary btn-sm">글쓰기</a>
        </c:if>
      </div>
    </div>

    <div class="row d-flex justify-content-center text-center align-items-center mt-5">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12">
        <c:if test="${pt.cnt>0}">
          <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">
              <c:if test="${pt.startPage>10}">
                <li>
                  <a class="btn btn-primary btn-sm me-1" href="${ctxPath}/notice/list.do?pageNum=${pt.startPage-10}">이전블럭</a>
                </li>
              </c:if>
              <c:forEach var="i" begin="${pt.startPage}" end="${pt.endPage}">
                <li>
                  <a class="btn btn-primary btn-sm me-1" href="${ctxPath}/notice/list.do?pageNum=${i}&keyField=${keyField}&keyWord=${keyWord}">${i}</a>
                </li>
              </c:forEach>
              <c:if test="${pt.endPage<pt.pageCnt}">
                <li>
                  <a class="btn btn-primary btn-sm me-1" href="${ctxPath}/notice/list.do?pageNum=${pt.startPage+10}">다음블럭</a>
                </li>
              </c:if>
            </ul>
          </nav>
        </c:if>
      </div>
    </div>

  </main><br /><br />

  <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>