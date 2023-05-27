<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources"/>
<c:set var="member_id" value="${sessionScope.member_id}"/>
<c:set var="admin_id" value="${sessionScope.admin_id}"/>
<input type="hidden" id="member_id" value="${sessionScope.member_id}" />
<input type="hidden" id="admin_id" value="${sessionScope.admin_id}" />
<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}" />

<!DOCTYPE html>
<html lang="en, ko">

	<head>
    <jsp:include page="/WEB-INF/views/common/head.jsp"/>
  </head>

  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/slider.jsp"/>

    <main class="main container-fluid">

      <h2 class="text-center my-4">공지사항</h2>
      <form name="insertForm" method="POST" action="${ctxPath}/notice/insertPro.do" onsubmit="return noticeCheck()">
        <table class="table table-bordered">
          <tr>
            <td class="text-center" width="150">작성자</td>
            <td><input type="text" class="form-control" name="notice_writer" id="writer" value="관리자" readonly /></td>
          </tr>
          <tr>
            <td class="text-center">글제목</td>
            <td><input type="text" class="form-control" name="notice_title" id="title"/></td>
          </tr>
          <tr>
            <td class="text-center">글내용</td>
            <td><textarea class="form-control" name="notice_content" id="content" rows="10"></textarea></td>
          </tr>
          <tr>
            <td colspan="2" class="text-center">
              <div class="form-check form-switch">
                <input type="checkbox" class="form-check-input" name="fixed" value="1"/>
                <label class="form-check-label" for="fixed">게시물 고정하기</label>
              </div>
              <div class="mt-3">
                <input type="submit" class="btn btn-primary btn-sm me-2" value="글쓰기"/>
                <input type="button" class="btn btn-primary btn-sm" value="취소" onclick="window.location.href='${ctxPath}/notice/list.do'"/>
              </div>
            </td>
          </tr>
        </table>
      </form>

    </main><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>