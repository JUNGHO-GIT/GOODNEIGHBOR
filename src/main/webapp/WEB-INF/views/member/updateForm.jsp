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
      <form action="${ctxPath}/member/updatePro.do" method="POST">
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <h2 class="text-center my-4 p">
              <i class="fas fa-user-edit" style="color: #32be85;"></i>
              <b class="ms-1">내 정보 수정</b>
            </h2>
          </div>
        </div>
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <div class="mb-3 text-left">
              <label for="member_id" class="form-label">아이디</label>
              <div class="input-group">
                <input type="text" name="member_id" id="member_id" class="form-control" value="${dto.member_id}" size="30" readonly/>
              </div>
            </div>
            <div class="mb-3 text-left">
              <label for="member_name" class="form-label">이름</label>
              <input type="text" name="member_name" id="member_name" class="form-control" value="${dto.member_name}" size="30" readonly/>
              <input type="hidden" name="member_pw" id="member_pw" class="form-control" size="30" value="${dto.member_pw}" readonly/>
            </div>
            <div class="mb-3 text-left">
              <label for="member_tel" class="form-label">전화번호</label>
              <input type="text" name="member_tel" id="member_tel" class="form-control" value="${dto.member_tel}" size="30"/>
            </div>
            <div class="mb-3 text-left">
              <label for="member_email" class="form-label">이메일</label>
              <input type="text" name="member_email" id="member_email" class="form-control" value="${dto.member_email}" size="40"/>
            </div>
            <div class="mb-3 text-left">
              <label for="member_zipcode" class="form-label">우편번호</label>
              <div class="input-group">
                <input type="text" name="member_zipcode" id="member_zipcode" class="form-control" value="${dto.member_zipcode}"/>
                <button type="button" class="btn btn-primary btn-sm" onclick="openDaumPostcode()">주소찾기</button>
              </div>
            </div>
            <div class="mb-3 text-left">
              <label for="member_addr" class="form-label">주소</label>
              <input type="text" name="member_addr" id="member_addr" class="form-control" size="50" value="${dto.member_addr}" readonly/>
            </div>
            <div class="mb-3 text-left">
              <label for="member_addr2" class="form-label">상세주소</label>
              <input type="text" name="member_addr2" id="member_addr2" class="form-control" value="${dto.member_addr2}" size="40"/>
            </div>
          </div>
        </div>
        <div class="row d-flex justify-content-center text-center align-items-center">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10 col-xs-10 col-10">
            <div class="text-center mb-3">
              <button type="submit" class="btn btn-primary btn-sm" onclick="return updateMemberCheck();">수정하기</button>
              &nbsp;&nbsp;
              <button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='${ctxPath}'">메인으로</button>
              &nbsp;&nbsp;
              <button type="button" class="btn btn-danger btn-sm" onclick="window.location.href='${ctxPath}/member/deleteForm.do'">회원탈퇴</button>
            </div>
          </div>
        </div>
      </form>

      <form name="delForm" method="POST" class="d-none">
        <input type="hidden" name="member_id" value="${member_id}"/>
      </form>

    </main><br/><br/>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>