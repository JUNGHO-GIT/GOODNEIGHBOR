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

      <h2 class="text-center my-4">공지사항 수정</h2>
      <form name="editForm" method="POST" action="${ctxPath}/notice/editPro.do" onsubmit="return noticeCheck()">
        <table class="table table-bordered">
          <tr>
            <td class="text-center" width="150">글제목</td>
            <td>
              <input type="text" class="form-control" name="notice_title" id="title" value="${dto.notice_title}"/>
              <input type="hidden" name="notice_number" value="${dto.notice_number}"/>
              <c:if test="${dto.notice_fix == false}">
                <input type="hidden" name="pageNum" value="${pageNum}"/>
              </c:if>
            </td>
          </tr>
          <tr>
            <td class="text-center">글내용</td>
            <td>
              <textarea class="form-control" name="notice_content" id="content" rows="10">${dto.notice_content}</textarea>
            </td>
          </tr>
          <tr>
            <td colspan="2" class="text-center">
              <div class="form-check form-switch">
                <c:if test="${dto.notice_fix==true}">
                  <input type="checkbox" class="form-check-input" name="fixed" checked="checked" />
                </c:if>
                <c:if test="${dto.notice_fix==false}">
                  <input type="checkbox" class="form-check-input" name="fixed" checked="checked" />
                </c:if>
                <label class="form-check-label" for="fixed">게시물 상단고정</label>
              </div>
              <div class="mt-3">
                <input type="submit" class="btn btn-primary me-1" value="글수정"/>
                <input type="button" class="btn btn-primary" value="취소" onclick="location='${ctxPath}/notice/list.do'"/>
              </div>
            </td>
          </tr>
        </table>
      </form>

    </main><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>