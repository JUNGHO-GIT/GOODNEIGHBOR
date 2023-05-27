<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>
<c:set var="srcPath" value="${pageContext.request.contextPath}/resources"/>
<c:set var="member_id" value="${sessionScope.member_id}"/>

<!DOCTYPE html>
<html lang="en, ko">

	<head>
    <jsp:include page="/WEB-INF/views/common/head.jsp"/>
	</head>

	<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/slider.jsp"/>

    <main class="main container-fluid">
      <form name="delForm" method="POST" action="${ctxPath}/member/deletePro.do" onsubmit="return memberPwCheck()">
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <h1 class="text-center my-4 p">회원 탈퇴</h1>
            <h5 class="text-center my-4 p">회원 탈퇴를 신청하시면 회원님의 모든 정보가 삭제되며, 삭제된 정보는 복구되지 않습니다.</h5>
          </div>
        </div>
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <div class="mb-3 text-left">
              <label for="member_pw" class="form-label">비밀번호 입력</label>
              <input type="password" name="member_pw" id="member_pw" class="form-control" size="30" placeholder="암호를 입력해 주세요."/>
              <input type="hidden" name="member_id" id="member_id" value="${member_id}"/>
            </div>
            <div class="mb-3 text-left">
              <label for="member_pw2" class="form-label">비밀번호 확인</label>
              <input type="password" name="member_pw2" id="member_pw2" class="form-control" size="30" placeholder="암호를 다시 한번 입력해 주세요."/>
            </div>
          </div>
        </div>
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <div class="text-center">
              <input type="submit" value="회원탈퇴" class="btn btn-danger"/>
            </div>
          </div>
        </div>
      </form>

    </main><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>