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
        <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
          <h2 class="text-center my-4 p">
            <i class="fas fa-question-circle" style="color: #32be85;"></i>
            <b class="ms-1">QnA</b>
          </h2>
        </div>
      </div><hr class="green-line"/>

      <!----------------------------------------------------------------------------------------->
      <div class="row d-flex justify-content-center text-center align-items-center">
        <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
          <div class="card">
            <div class="card-header">
              <span class="card-span">${dto.qna_title}</span>
            </div>
            <div class="card-body">
              <table class="table table-sm">
                <tbody>
                  <tr>
                    <td style="width:100px;">작성일</td>
                    <td>
                      <fmt:formatDate value="${dto.qna_regdate}" pattern="yyyy-MM-dd" />
                      <input type="hidden" id="qna_number" name="qna_number" value="${dto.qna_number}" />
                    </td>
                  </tr>
                  <tr>
                    <td style="width:100px;">작성자</td>
                    <td><c:out value="${dto.qna_writer}" /></td>
                  </tr>
                  <tr>
                    <td style="width:100px;">조회수</td>
                    <td><c:out value="${dto.qna_readcount}" /></td>
                  </tr>
                  <tr>
                    <td style="width:100px;">내용</td>
                    <td><c:out value="${dto.qna_content}" /></td>
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
          <button class="btn btn-primary btn-sm ms-2" onclick="return updateQnaCheck();">
          글수정</button>
          <button class="btn btn-primary btn-sm ms-2" onclick="return insertQnaCheck();">
          글작성</button>
          <button class="btn btn-primary btn-sm ms-2" onclick="window.location.href='${ctxPath}/qna/list.do?pageNum=${pageNum}'">리스트</button>
          <button class="btn btn-danger btn-sm ms-2" onclick="return deleteQnaCheck();">
          글삭제</button>
        </div>
      </div>

    </main><br /><br />

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>