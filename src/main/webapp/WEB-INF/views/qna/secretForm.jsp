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
      <div class="row justify-content-center">
        <div class="col-12 col-md-8">
          <h2 class="text-center">비밀번호를 입력해주세요</h2>
          <form method="GET" action="${ctxPath}/qna/content.do" onsubmit="return qnaPwCheck();">
            <div class="mb-3">
              <label for="pw" class="form-label">비밀번호</label>
              <input type="password" name="qna_pw" id="pw" class="form-control" size="30"/>
              <input type="hidden" name="qna_number" value="${dto.qna_number}"/>
              <input type="hidden" id="pw2" value="${dto.qna_pw}"/>
              <input type="hidden" name="pageNum" value="${pageNum}"/>
            </div>
            <div class="text-center">
              <input type="submit" value="입력" class="btn btn-primary btn-sm"/>
              <input type="button" value="취소" onclick="window.location.href='${ctxPath}/qna/list.do?pageNum=${pageNum}'" class="btn btn-primary btn-sm"/>
            </div>
          </form>
        </div>
      </div>
    </main><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>