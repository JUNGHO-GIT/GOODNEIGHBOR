// 1. memberCheck() ------------------------------------------------------------------------------->
function memberCheck() {
	if ($("#member_id").val() == "") {
		alert("아이디를 입력하시오.");
		return false;
	}
	if ($("#member_pw").val() == "") {
		alert("비밀번호를 입력하시오.");
		return false;
	}
	if ($("#member_pw2").val() == "") {
		alert("비밀번호를 다시 입력해 주세요.");
		$("#member_pw").value = "";
		$("#member_pw").focus();
		return false;
	}
	if ($("#member_name").val() == "") {
		alert("성함을 입력하시오.");
		return false;
	}
	if ($("#member_email").val() == "") {
		alert("이메일을 입력하시오.");
		return false;
	}
	if ($("#member_tel").val() == "") {
		alert("전화번호를 입력하시오.");
		return false;
	}
	if ($("#member_addr").val() == "") {
		alert("우편번호와 주소를 입력하시오.");
		$("#member_zipcode").focus();
		return false;
	}
	if ($("#member_addr2").val() == "") {
		alert("상세 주소를 입력하시오.");
		$("#member_addr2").focus();
		return false;
	}
	return true;
}

// 1. confirmIdCheck() ---------------------------------------------------------------------------->
function confirmIdCheck() {
	var id_validation = /^[a-zA-Z0-9]{6,12}$/;

	if ($("#member_id").val() == "") {
		$("#olmessage").text("아이디를 입력하세요.");
	}
  if (id_validation.test($("#member_id").val())) {
		$.ajax({
			type: "POST",
			url: "/member/idCheck.do",
			data: "member_id=" + $("#member_id").val(),
			dataType: "JSON",
			success: function (data) {
				if (data.check == -1) {
					$("#olmessage").text("이미 사용중인 아이디 입니다.");
					$("#olmessage").addClass("oldmessagef");
					$("#olmessage").removeClass("olmessaget");
					$("#member_id").value = "";
					$("#member_id").val("").focus();
				}
        else if (data.check == 1) {
					$("#olmessage").text("사용 가능한 아이디 입니다.");
					$("#olmessage").addClass("oldmessaget");
					$("#olmessage").removeClass("olmessagef");
					$("#member_pw").focus();
				}
			},
		});
	}
  if (!id_validation.test($("#member_id").val())) {
		$("#olmessage").text("6~12자리의 영문 대소문자, 숫자로 이루어진 아이디를 작성하시오.");
		$("#olmessage").addClass("olmessagef");
		$("#olmessage").removeClass("olmessaget");
		$("#member_id").value = "";
		$("#member_id").focus();

		return false;
	}
	$("#olmessage").text("");
	return true;
}

// 2. confirmPwCheck() ---------------------------------------------------------------------------->
function confirmPwCheck() {
	var pw_validation = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]/;

	if ($("#member_pw").val() == "") {
		$("#password-error").text("8~15자리의 영문 대소문자, 숫자, 특수문자가 포함된 암호를 작성하시오.");
		$("#password-error").removeClass("password-errorf");
		$("#password-error").addClass("password-errort");
		$("#member_pw").focus();
	}
  else if (pw_validation.test($("#member_pw").val())) {

		if ($("#member_pw").val() != $("#member_pw2").val()) {
			$("#password-error").text("비밀번호와 비밀번호확인이 다릅니다.");
			$("#password-error").addClass("password-errorf");
			$("#password-error").removeClass("password-errort");
			$("#member_pw").val("");
			$("#member_pw2").val("");
			$("#member_pw").val("").focus();
			return false;
		}
		$("#password-error").text("");
		return true;
	}
  else if (!pw_validation.test($("#member_pw").val())) {
		$("#password-error").text("8~15자리의 영문 대소문자, 숫자, 특수문자가 포함된 암호를 작성하시오.");
		$("#password-error").addClass("password-errorf");
		$("#password-error").removeClass("password-errort");
		$("member_#pw").val("");
		$("#member_pw2").val("");
		$("#member_pw").focus();
	}
}

// 3. confirmEmailCheck() ------------------------------------------------------------------------->
function confirmEmailCheck() {
	var email_validation = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;

	if ($("#member_email").val() == "") {
		return false;
	}
  else if (email_validation.test($("#member_email").val())) {
		return true;
	}
  else if (!email_validation.test($("#member_email").val())) {
		alert("이메일을 올바르게 작성하였는지 확인해주세요.");
		$("#member_email").val("");
		$("#member_email").focus();
	}
}

// 4. confirmTelCheck() --------------------------------------------------------------------------->
function confirmTelCheck() {
	var tel_validation = /^01[0|1|6|7|8|9].?([0-9]{3,4}).?([0-9]{4})$/;

	if ($("#member_tel").val() == "") {
		return false;
	}
  else if (tel_validation.test($("#member_tel").val())) {
		console.log("정규표현식에 맞음 성공");
		return true;
	}
  else if (!tel_validation.test($("#member_tel").val())) {
		console.log("정규표현식에 맞지 않음 실패");
		alert("전화번호를 올바르게 작성하였는지 확인해주세요.");
		$("#member_tel").val("");
		$("#member_tel").focus();
		return false;
	}
}

// 5. viewTerms() -------------------------------------------------------------------------------->
function viewTerms(event) {
	event.preventDefault();
	window.open(event.target.href, "팝업", "width=500,height=700,left=100, top=50,scrollbars=no, resizable=no, toolbar=no, menubar=no");
}

// 6. agree_check() ------------------------------------------------------------------------------->
function agree_check() {
	if (!document.getElementById("check_all").checked) {
		$("#agreeMessage").text("이용 약관에 동의해주세요.");
		$("#agreeMessage").addClass("agreeMessagef");
		return false;
	}
	$("#agreeMessage").text("");
	return true;
}

// 7. memberIdPwCheck() --------------------------------------------------------------------------->
function memberIdPwCheck() {
	if (document.loginForm.member_id.value == "") {
		alert("아이디를 입력하세요.");
		document.loginForm.member_id.focus();
		return false;
	}
	if (document.loginForm.member_pw.value == "") {
		alert("비밀번호를 입력하세요.");
		document.loginForm.member_pw.focus();
		return false;
	}
	if (document.id_search.search_tel_name.value == "") {
		alert("이름을 입력해 주세요.");
		document.id_search.search_tel_name.focus();
		return false;
	}
	if (document.id_search.search_tel_number.value == "") {
		alert("전화번호를 입력해 주세요.");
		document.id_search.search_tel_number.focus();
		return false;
	}
	if (confirm("아이디를 찾으시겠습니까?")) {
		$("#id_search").submit();

		return false;
	}
}

// 8. memberPwCheck() ----------------------------------------------------------------------------->
function memberPwCheck() {
	if (document.delForm.member_pw.value == "" || document.delForm.member_pw2.value == "") {
		alert("암호는 필수 입력입니다.");
		document.delForm.member_pw.focus();
	}
  else {
		if (document.getElementById("member_pw").value != document.getElementById("member_pw2").value) {
			alert("비밀번호와 비밀번호확인이 다릅니다.");
			document.getElementById("member_pw").value = "";
			document.getElementById("member_pw2").value = "";
			document.delForm.member_pw.focus();
			return false;
		}
		return true;
	}
}

// 9. findPwCheck() ------------------------------------------------------------------------------>
function findPwCheck() {
	if (document.search_pwd_next.search_tel_name.value == "") {
		alert("이름을 입력해 주세요.");
		document.pw_search.writeID_search_pw.focus();
		return false;
	}
	if (document.search_pwd_next.search_tel_number.value == "") {
		alert("전화번호를 입력해 주세요.");
		document.pw_search.search_tel_number.focus();
		return false;
	}
	if (confirm("비밀번호를 찾으시겠습니까?")) {
		$("#search_pwd_next").submit();

		return false;
	}
}

// 0. openDaumPostcode() -------------------------------------------------------------------------->
function openDaumPostcode() {
	new daum.Postcode({
		oncomplete: function (data) {
			document.getElementById("member_zipcode").value = data.zonecode;
			document.getElementById("member_addr").value = data.address;
		},
	}).open();
}