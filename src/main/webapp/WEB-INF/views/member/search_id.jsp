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
      <form name="id_search" id="id_search" action="${ctxPath}/member/search_id_pro" method="POST" onsubmit="return memberIdPwCheck()">

        <h1 class="text-center mb-4">아이디 찾기</h1>

        <div class="form-check form-check-inline mb-3">
          <input type="radio" name="for_search_id" id="search_tel" class="form-check-input" checked />
          <label for="search_tel" class="form-check-label">회원정보에 등록한 휴대전화 번호로 찾기</label>
        </div>

        <p class="mb-3">
          회원 정보에 등록한 휴대전화 번호와 입력하신 휴대전화 번호가 같아야 아이디를 찾을 수 있습니다.
        </p>

        <div class="mb-3">
          <label for="search_tel_name" class="form-label">이름</label>
          <input type="text" name="search_tel_name" id="search_tel_name" size="20" class="form-control" />
        </div>

        <div class="mb-3">
          <label for="search_tel_number" class="form-label">휴대전화</label>
          <input type="text" name="search_tel_number" id="search_tel_number" size="20" class="form-control" />
        </div>

        <hr class="mb-3" />

        <div class="form-check form-check-inline mb-3">
          <input type="radio" name="for_search_id" id="search_email" class="form-check-input" />
          <label for="search_email" class="form-check-label">이메일에 등록한 휴대전화 번호로 찾기</label>
        </div>

        <div class="text-center">
          <input type="submit" name="search" value="아이디 찾기" class="btn btn-primary btn-sm" />
        </div>

      </form>

    </main><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>