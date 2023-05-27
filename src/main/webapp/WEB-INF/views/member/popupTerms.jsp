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
		<style>
			.popup {
				background-color: #fff;
				padding: 20px;
				font-size: 16px;
				line-height: 1.5;
				text-align: justify;
			}
		</style>
	</head>

	<body>

		<h2 align="center">[필수] 웹사이트 이용약관 동의</h2>

		<hr/>

		<div class="popup">

      <p>1. 개인정보의 수집항목 및 수집방법  통계청 나라통계사이트에서는 기본적인 회원 서비스 제공을 위한 필수정보로 실명인증정보와 가입정보로 구분하여 다음의 정보를 수집하고 있습니다. 필수정보를 입력해주셔야 회원 서비스 이용이 가능합니다.</p>
      <p>가. 수집하는 개인정보의 항목  * 수집하는 필수항목 - 실명인증정보 : 이름, 휴대전화번호, 본인 인증 또는 I-PIN(개인식별번호), GPKI - 가입정보 : 아이디, 비밀번호, 성명, 이메일, 전화번호, 휴대전화번호, 기관명 * 선택항목 - 주소, 기관의 부서명</p>
      <p>[컴퓨터에 의해 자동으로 수집되는 정보] 인터넷 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다. - IP주소, 서비스 이용기록, 방문기록 등</p>
      <p>나. 개인정보 수집방법 홈페이지 회원가입을 통한 수집 </p>
      <p>2. 개인정보의 수집/이용 목적 및 보유/이용 기간 통계청 나라통계사이트에서는 정보주체의 회원 가입일로부터 서비스를 제공하는 기간 동안에 한하여 통계청 나라통계사이트 서비스를 이용하기 위한 최소한의 개인정보를 보유 및 이용 하게 됩니다. 회원가입 등을 통해 개인정보의 수집·이용, 제공 등에 대해 동의하신 내용은 언제든지 철회하실 수 있습니다. 회원 탈퇴를 요청하거나 수집/이용목적을 달성하거나 보유/이용기간이 종료한 경우, 사업 폐지 등의 사유발생시 개인 정보를 지체 없이 파기합니다.</p>
      <p>* 실명인증정보 - 개인정보 수집항목 : 이름, 휴대폰 본인 인증 또는 I-PIN(개인식별번호), GPKI - 개인정보의 수집·이용목적 : 홈페이지 이용에 따른 본인 식별/인증절차에 이용 - 개인정보의 보유 및 이용기간 : I-PIN / GPKI는 별도로 저장하지 않으며 실명인증용으로만 이용</p>
      <p>* 가입정보 - 개인정보 수집항목 : 아이디, 비밀번호, 성명, 이메일, 전화번호, 휴대전환번호, 기관명 - 개인정보의 수집·이용목적 : 홈페이지 서비스 이용 및 회원관리, 불량회원의 부정 이용방지, 민원신청 및 처리 등 - 개인정보의 보유 및 이용기간 : 2년 또는 회원탈퇴시</p>
      <p>정보주체는 개인정보의 수집·이용목적에 대한 동의를 거부할 수 있으며, 동의 거부시 통계청 나라통계사이트에 회원가입이 되지 않으며, 통계청 나라통계사이트에서 제공하는 서비스를 이용할 수 없습니다.</p>
      <p>3. 수집한 개인정보 제3자 제공 통계청 나라통계사이트에서는 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.</p>
      <p>4. 개인정보 처리업무 안내 통계청 나라통계사이트에서는 개인정보의 취급위탁은 하지 않고 있으며, 원활한 서비스 제공을 위해 아래의 기관을 통한 실명인증 및 공공 I-PIN, GPKI 인증을 하고 있습니다. </p>
      <p>* 수탁업체 - SCI서울신용평가정보(주) · 위탁업무 내용 : 실명확인 · 개인정보 보유 및 이용 기간 : 신용평가 기관에서는 이미 보유하고 있는 개인정보이기 때문에 별도로 저장하지 않음 - 행정자치부 · 위탁업무 내용 : 공공 I-PIN, GPKI 인증 · 개인정보 보유 및 이용 기간 : 행정자치부에서는 이미 보유하고 있는 개인정보이기 때문에 별도로 저장하지 않음</p>

		</div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

  </body>
</html>