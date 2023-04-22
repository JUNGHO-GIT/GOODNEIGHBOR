<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxpath" value="${pageContext.request.contextPath}"/>
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
      <h2 class="text-center my-4">공지사항</h2>

      <c:if test="${admin_id  != null}">
        <div class="d-flex justify-content-end mb-3">
          <a href="${ctxpath}/notice/insertForm.do" class="btn btn-primary">글쓰기</a>
        </div>
      </c:if>

      <div class="alert alert-danger text-center" role="alert" id="no_search">
        <c:if test="${pt.cnt==0}">게시된 글이 없습니다</c:if>
      </div>

      <c:if test="${pt.cnt>0}">
        <table class="table table-bordered">
          <thead>
            <tr>
              <th scope="col">글번호</th>
              <th scope="col">글제목</th>
              <th scope="col">작성자</th>
              <th scope="col">작성일</th>
              <th scope="col">조횟수</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="dto" items="${fixlist}">
              <c:if test="${dto.notice_fix == true}">
                <tr>
                  <td align="center">
                    <img alt="공지" src="${ctxpath}/resources/imgs/notice_icon.png" width="40" height="30"/>
                  </td>
                  <td align="left">
                    <a href="${ctxpath}/notice/content.do?notice_number=${dto.notice_number}">${dto.notice_title}</a>
                  </td>
                  <td align="center">${dto.notice_writer}</td>
                  <td align="center">
                    <fmt:formatDate value="${dto.notice_regdate}" pattern="yyyy/MM/dd"/>
                  </td>
                  <td align="center">${dto.notice_readcount}</td>
                </tr>
              </c:if>
            </c:forEach>
            <c:forEach var="dto" items="${list}">
              <c:if test="${dto.notice_fix==false}">
                <tr>
                  <td align="center">${number}
                    <c:set var="number" value="${number-1}"/>
                  </td>
                  <td align="left">
                    <a href="${ctxpath}/notice/content.do?notice_number=${dto.notice_number}&pageNum=${pageNum}">${dto.notice_title}</a>
                  </td>
                  <td align="center">${dto.notice_writer}</td>
                  <td align="center">
                    <fmt:formatDate value="${dto.notice_regdate}" pattern="yyyy/MM/dd"/>
                  </td>
                  <td align="center">${dto.notice_readcount}</td>
                </tr>
              </c:if>
            </c:forEach>
          </tbody>
        </table>
      </c:if>

      <form name="searchForm" method="post" action="${ctxpath}/notice/list.do" class="mb-4">
        <div class="input-group">
          <select name="keyField" class="form-select" id="select_option">
            <option value="notice_title">글제목</option>
            <option value="notice_content">글내용</option>
          </select>
          <input class="form-control" type="text" name="keyWord"/>
          <input type="hidden" name="pageNum" value="1"/>
          <button type="button" class="btn btn-primary" onclick="return check();">검색</button>
        </div>
      </form>

      <div class="d-flex justify-content-center">
        <c:if test="${pt.cnt>0}">
          <c:if test="${pt.startPage>10}">
            <a href="${ctxpath}/notice/list.do?pageNum=${pt.startPage-10}" class="btn btn-outline-secondary mx-1">이전블럭</a>
          </c:if>
          <c:forEach var="i" begin="${pt.startPage}" end="${pt.endPage}">
            <a href="${ctxpath}/notice/list.do?pageNum=[${i}]&keyField=${keyField}&keyWord=${keyWord}" class="btn btn-outline-primary mx-1">[${i}]</a>
          </c:forEach>
          <c:if test="${pt.endPage < pt.pageCnt}">
            <a href="${ctxpath}/notice/list.do?pageNum=${pt.startPage+10}" class="btn btn-outline-secondary mx-1">다음블럭</a>
          </c:if>
        </c:if>
      </div>

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>