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
      <form name="writeFrom" method="POST" action="${ctxPath}/qna/insertPro.do">

        <!----------------------------------------------------------------------------------------->
        <input type="hidden" name="qna_number" id="qna_number" value="${qna_number}">
        <input type="hidden" name="qna_step" id="qna_step" value="${qna_step}">
        <input type="hidden" name="qna_level" id="qna_level" value="${qna_level}">
        <input type="hidden" name="qna_group" id="qna_group" value="${qna_group}">

        <!---------------------------------------------------------------------------------------->
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <h2 class="text-center my-4 p">
              <i class="fas fa-question-circle" style="color: #32be85;"></i>
              <b class="ms-1">Q&A 작성</b>
            </h2>
          </div>
        </div><hr class="green-line"/>

        <!----------------------------------------------------------------------------------------->
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <div class="mb-3 text-left">
              <label for="qna_title" class="form-label">글제목</label>
              <!-- 원글 -->
              <c:if test="${qna_number==0}">
                <input type="text" name="qna_title" id="qna_title" size="40" class="form-control" />
              </c:if>
              <!--  답글 -->
              <c:if test="${qna_number!=0}">
                <input type="text" name="qna_title" id="qna_title" size="40" class="form-control" />
              </c:if>
            </div>
            <div class="mb-3 text-left">
              <label for="qna_writer" class="form-label">작성자</label>
              <input type="text" class="form-control" name="qna_writer" id="writer" size="30"  value="${member_id}" readonly/>
            </div>
            <div class="mb-3 text-left">
              <label for="qna_content" class="form-label">글내용</label>
              <textarea class="form-control" name="qna_content" id="qna_content" rows="10"></textarea>
            </div>
            <div class="mb-3 text-left">
              <label for="qna_pw" class="form-label">암호</label>
              <input type="password" class="form-control" name="qna_pw" id="qna_pw" size="20" />
              <span class="text-danger">*암호는 필수 입력</span>
            </div>
          </div>
        </div><br/>

        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <div class="mb-3 text-center">
              <button type="submit" class="btn btn-primary btn-sm ms-2" onclick="return qnaCheck()">작성하기</button>
              <button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='${ctxPath}/qna/list.do'">취소</button>
            </div>
          </div>
        </div><br/>

      </form>
    </main><br /><br />

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

  </body>

</html>