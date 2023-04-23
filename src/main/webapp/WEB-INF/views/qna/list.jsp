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

    <main class="main container-fluid w-50 mx-auto mb-10">

      <h2 class="text-center my-4">Q&A 게시판</h2>

      <c:if test="${member_id != null || admin_id  != null}">
        <div class="d-flex justify-content-end mb-3">
          <a href="${ctxPath}/qna/insertForm.do" class="btn btn-primary">글쓰기</a>
        </div>
      </c:if>

      <div class="alert alert-danger text-center" role="alert" id="no_search">
        <c:if test="${pt.cnt==0}">게시된 글이 없습니다</c:if>
      </div>

      <c:if test="${pt.cnt>0}">
        <div class="table-responsive">
          <table class="table table-bordered table-striped">
            <thead>
              <tr>
                <th scope="col">글번호</th>
                <th scope="col">글제목</th>
                <th scope="col">작성자</th>
                <th scope="col">작성일</th>
                <th scope="col">조회수</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="dto" items="${list}">
                <tr>
                  <td>${number}<c:set var="number" value="${number-1}"/></td>
                  <td>
                    <c:if test="${dto.qna_level>0}">
                      <img src="../resources/imgs/level.gif" width="${5*dto.qna_level}" height="16"/>
                      <b>[답변]</b>
                    </c:if>
                    <c:if test="${dto.qna_level==0}">
                      <img src="../resources/imgs/level.gif" width="${5*dto.qna_level}" height="16"/>
                    </c:if>
                    <c:if test="${admin_id != null}">
                      <a href="${ctxPath}/qna/content.do?qna_number=${dto.qna_number}&qna_pw=${dto.qna_pw}&pageNum=${pageNum}" class="text-decoration-none">${dto.qna_title}</a>
                    </c:if>
                    <c:if test="${admin_id == null}">
                      <a href="${ctxPath}/qna/secretForm.do?qna_number=${dto.qna_number}&qna_pw=${dto.qna_pw}&pageNum=${pageNum}" class="text-decoration-none">
                        <img src="${ctxPath}/resources/imgs/lock.png" width="25" height="25"/> 비밀글입니다
                        <input type="hidden" name="qna_title" value="${dto.qna_title}"/>
                      </a>
                    </c:if>
                  </td>
                  <td>${dto.qna_writer}</td>
                  <td><fmt:formatDate value="${dto.qna_regdate}" pattern="yyyy-MM-dd"/></td>
                  <td>${dto.qna_readcount}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </c:if>

      <div class="d-flex justify-content-center">
        <c:if test="${pt.cnt>0}">
          <nav aria-label="Page navigation">
            <ul class="pagination">
              <c:if test="${pt.startPage>10}">
                <li class="page-item"><a class="page-link" href="${ctxPath}/qna/list.do?pageNum=${pt.startPage-10}">이전블럭</a></li>
              </c:if>
              <c:forEach var="i" begin="${pt.startPage}" end="${pt.endPage}">
                <li class="page-item"><a class="page-link" href="${ctxPath}/qna/list.do?pageNum=${i}">${i}</a></li>
              </c:forEach>
              <c:if test="${pt.endPage<pt.pageCnt}">
                <li class="page-item"><a class="page-link" href="${ctxPath}/qna/list.do?pageNum=${pt.startPage+10}">다음블럭</a></li>
              </c:if>
            </ul>
          </nav>
        </c:if>
      </div>

    </main><br/><br/><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>