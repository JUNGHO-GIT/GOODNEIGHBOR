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

    <main class="main container-fluid">
      <form name="search_pwd_next" action="search_pwd_next" method="POST" onsubmit="return findPwCheck()" class="row g-3">
        <h1 class="text-center">비밀번호 찾기</h1>

        <div class="col-md-12">
          <div class="form-check form-check-inline">
            <input type="radio" class="form-check-input" name="for_search_id" id="search_tel" checked />
            <label class="form-check-label" for="search_tel">회원정보에 등록한 휴대전화 번호로 찾기</label>
          </div>
          <p>회원 정보에 등록한 휴대전화 번호와 입력하신 휴대전화 번호가 같아야 아이디를 찾을 수 있습니다.</p>
        </div>

        <div class="col-md-6">
          <label for="search_tel_name">이름</label>
          <input type="text" class="form-control" name="search_tel_name" id="search_tel_name" />
        </div>

        <div class="col-md-6">
          <label for="search_tel_number">휴대전화</label>
          <input type="text" class="form-control" name="search_tel_number" id="search_tel_number" />
        </div>

        <input type="hidden" name="search_tel_id" value="${dto.member_id}" />

        <div class="col-md-12 my-3">
          <hr />
        </div>

        <div class="col-md-12">
          <div class="form-check form-check-inline">
            <input type="radio" class="form-check-input" name="search_email" id="search_email" />
            <label class="form-check-label" for="search_email">이메일에 등록한 휴대전화 번호로 찾기</label>
          </div>
        </div>

        <div class="col-md-12 text-center">
          <input type="submit" name="search" value="아이디 찾기" class="btn btn-primary btn-sm" />
        </div>
      </form>

    </main><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>