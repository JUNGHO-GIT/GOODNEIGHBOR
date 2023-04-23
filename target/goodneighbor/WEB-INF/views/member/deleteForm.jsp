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

      <p class="mb-4">
        회원 탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요. 탈퇴 후 회원정보 및 개인형 서비스 이용 기록은 모두 삭제됩니다. 회원정보 및 여러 개인형 서비스 이용기록이 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다. 삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업해주세요.
      </p>

      <div class="row mb-4">
        <div class="col-md-2">
          <h2>비밀번호 확인</h2>
        </div>
        <div class="col-md-10">
          <p>안전한 이웃사촌 탈퇴를 위해 비밀번호를 입력해 주세요.</p>
        </div>
      </div>

      <form name="delForm" method="POST" action="${ctxPath}/member/deletePro.do" onsubmit="return memberPwCheck()">
        <div class="mb-3">
          <label for="member_pw" class="form-label">비밀번호 입력</label>
          <input type="password" name="member_pw" id="member_pw" class="form-control" size="30" placeholder="암호를 입력해 주세요."/>
          <input type="hidden" name="member_id" id="member_id" value="${member_id}"/>
        </div>
        <div class="mb-3">
          <label for="member_pw2" class="form-label">비밀번호 확인</label>
          <input type="password" name="member_pw2" id="member_pw2" class="form-control" size="30" placeholder="암호를 다시 한번 입력해 주세요."/>
        </div>
        <div class="text-center">
          <input type="submit" value="회원탈퇴" class="btn btn-danger"/>
        </div>
      </form>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>