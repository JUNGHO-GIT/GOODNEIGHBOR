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
      <form name="delForm" method="POST" action="${ctxPath}/qna/deletePro.do" onsubmit="return qnaPwCheck()">
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>비밀번호 입력</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>
                  <input type="password" class="form-control" name="qna_pw" id="pw" size="30"/>
                  <input type="hidden" id="pw2" value="${dto.qna_pw}"/>
                  <input type="hidden" name="qna_number" value="${dto.qna_number}"/>
                  <input type="hidden" name="pageNum" value="${pageNum}"/>
                </td>
              </tr>
              <tr>
                <td class="text-center">
                  <input type="submit" class="btn btn-primary btn-sm me-2" value="삭제"/>
                  <input type="button" class="btn btn-primary btn-sm" value="글목록" onclick="window.location.href='${ctxPath}/qna/list.do'"/>
                </td>
              </tr>
            </tbody>
            </table>
        </div>
      </form>

    </main><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>