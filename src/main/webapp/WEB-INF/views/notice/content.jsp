<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources" />
<c:set var="member_id" value="${sessionScope.member_id}"/>
<c:set var="admin_id" value="${sessionScope.admin_id}"/>
<input type="hidden" id="member_id" name="member_id" value="${sessionScope.member_id}" />
<input type="hidden" id="admin_id" name="admin_id" value="${sessionScope.admin_id}" />
<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}" />

<!DOCTYPE html>
<html lang="en, ko">

  <!----------------------------------------------------------------------------------------------->
  <head>
    <jsp:include page="/WEB-INF/views/common/head.jsp" />
  </head>

  <!----------------------------------------------------------------------------------------------->
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <jsp:include page="/WEB-INF/views/common/slider.jsp" />

    <!--------------------------------------------------------------------------------------------->
    <main class="main container-fluid">

      <!---------------------------------------------------------------------------------------->
      <div class="row d-flex justify-content-center text-center align-items-center">
        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-10 col-xs-10 col-10">
          <h2 class="text-center my-4 p">
            <i class="fas fa-exclamation-circle" style="color: #32be85;"></i>
            <b class="ms-1">공지사항</b>
          </h2>
        </div>
      </div>
      <hr class="green-line"/>

      <!----------------------------------------------------------------------------------------->
      <div class="row d-flex justify-content-center text-center align-items-center">
        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-10 col-xs-10 col-10">
          <div class="card">
            <div class="card-header">
              <span class="card-span">${dto.notice_title}</span>
            </div>
            <div class="card-body">
              <table class="table table-sm">
                <tbody>
                  <tr>
                    <td style="width:100px;">작성일</td>
                    <td>
                      <fmt:formatDate value="${dto.notice_regdate}" pattern="yyyy-MM-dd" />
                      <input type="hidden" id="notice_number" name="notice_number" value="${dto.notice_number}" />
                    </td>
                  </tr>
                  <tr>
                    <td style="width:100px;">작성자</td>
                    <td><c:out value="${dto.notice_writer}" /></td>
                  </tr>
                  <tr>
                    <td style="width:100px;">조회수</td>
                    <td><c:out value="${dto.notice_readcount}" /></td>
                  </tr>
                  <tr>
                    <td style="width:100px;">내용</td>
                    <td><c:out value="${dto.notice_content}" /></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <br/><br/>

      <!----------------------------------------------------------------------------------------->
      <div class="row d-flex justify-content-center text-center align-items-center">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12">
          <c:if test="${admin_id != null}">
            <button class="btn btn-primary ms-2" onclick="return insertNoticeCheck();">
            글쓰기</button>
            <button class="btn btn-primary ms-2" onclick="return updateNoticeCheck();">
            글수정</button>
            <button class="btn btn-danger ms-2" onclick="return deleteNoticeCheck();">
            글삭제</button>
          </c:if>
          <button class="btn btn-primary ms-2" onclick="window.location.href='${ctxPath}/notice/list.do?pageNum=${pageNum}'">리스트</button>
        </div>
      </div>

    </main><br /><br />

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>