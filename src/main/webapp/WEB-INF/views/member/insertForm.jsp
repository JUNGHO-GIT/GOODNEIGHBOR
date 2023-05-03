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

      <h1 class="text-center my-4">회원가입</h1>
      <form action="${ctxPath}/member/insertPro.do" method="POST" onsubmit="return memberCheck();">

        <div class="mb-3">
          <label for="member_id" class="form-label">아이디</label>
          <div class="input-group">
            <input type="text" class="form-control" name="member_id" id="member_id" placeholder="6-12자의 영문 대소문자, 숫자">
            <button class="btn btn-primary" type="button" id="dupcheck" onclick="return confirmIdCheck();">ID중복 체크</button>
          </div>
          <span id="olmessage" class="form-text text-danger"></span>
        </div>

        <div class="mb-3">
          <label for="member_pw" class="form-label">비밀번호</label>
          <input type="password" class="form-control" name="member_pw" id="member_pw" placeholder="8~15자리의 영문 대소문자, 숫자, 특수문자">
          <span id="password-error" class="form-text text-danger"></span>
        </div>

        <div class="mb-3">
          <label for="member_pw2" class="form-label">비밀번호 확인</label>
          <input type="password" class="form-control" name="member_pw2" id="member_pw2" placeholder="8~15자리의 영문 대소문자, 숫자, 특수문자" onblur="return confirmPwCheck();">
        </div>

        <div class="mb-3">
          <label for="member_name" class="form-label">성명, 단체명</label>
          <input type="text" class="form-control" name="member_name" id="member_name" placeholder="성명·단체명 입력">
        </div>
        <div class="mb-3">
          <label for="member_email" class="form-label">이메일 주소</label>
          <input type="text" class="form-control" name="member_email" id="member_email" placeholder="이메일 주소 입력" onblur="return confirmEmailCheck();">
        </div>

        <div class="mb-3">
          <label for="member_tel" class="form-label">휴대폰 번호</label>
          <input type="text" class="form-control" name="member_tel" id="member_tel" placeholder="휴대폰 번호 입력('-'제외)" onblur="return confirmTelCheck();">
        </div>

        <div class="mb-3">
          <label for="member_zipcode" class="form-label">주소</label>
          <div class="input-group">
          <input type="text" class="form-control" name="member_zipcode" id="member_zipcode" placeholder="우편번호 입력" readonly>
          <button class="btn btn-outline-secondary" type="button" onclick="openDaumPostcode()">주소찾기</button>
          </div>
          <input type="text" class="form-control my-2" name="member_addr" id="member_addr" placeholder="기본주소" readonly>
          <input type="text" class="form-control" name="member_addr2" id="member_addr2" placeholder="상세주소">
        </div>

        <h2 class="text-center my-4" id="agree_willU">약관 및 개인정보 수집·이용 동의</h2>
        <div class="mb-3 form-check">
          <input type="checkbox" class="form-check-input" id="check_all">
          <label class="form-check-label" for="check_all">모두 동의합니다.</label>
        </div>
        <hr/>

        <div class="mb-3 form-check">
          <input type="checkbox" class="form-check-input normal" id="agree_TermsofUse">
          <label class="form-check-label" for="agree_TermsofUse">[필수] 웹사이트 이용약관 동의</label>
          <a href="agree_TemsofUse.do" onclick="viewTerms(event)">보기</a>
        </div>

        <div class="mb-3 form-check">
          <input type="checkbox" class="form-check-input normal" id="agree_Privacy">
          <label class="form-check-label" for="agree_Privacy">[필수] 개인정보 수집 ∙ 이용 동의</label>
          <a href="agree_Privacy_popup.do" onclick="viewTerms(event)">보기</a>
        </div>

        <div class="text-center mb-3" style="color: red">
          <span id="agreeMessage"></span>
        </div>

        <div class="text-center">
          <button type="submit" class="btn btn-primary" onclick="return agree_check();">가입하기</button>
        </div>

      </form>

    </main><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>